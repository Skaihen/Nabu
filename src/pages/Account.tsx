import {
  IonButton,
  IonContent,
  IonHeader,
  IonInput,
  IonItem,
  IonLabel,
  IonPage,
  IonTitle,
  IonToolbar,
  useIonLoading,
  useIonToast,
  useIonRouter,
} from "@ionic/react";
import { useEffect, useState } from "react";
import { supabase } from "../lib/SupabaseConfig";
import { Session } from "@supabase/supabase-js";

export default function Account({ session }: { session: Session }) {
  const [showLoading, hideLoading] = useIonLoading();
  const [showToast] = useIonToast();
  const router = useIonRouter();
  const [profile, setProfile] = useState({
    username: "",
    website: "",
    avatar_url: "",
  });
  useEffect(() => {
    if (session) getProfile();
  }, [session]);

  async function getProfile() {
    await showLoading();
    try {
      if (!session?.user) throw new Error("No user on the session");

      let { data, error, status } = await supabase
        .from("profiles")
        .select(`username, website, avatar_url`)
        .eq("id", session?.user!.id)
        .single();
      if (error && status !== 406) {
        throw error;
      }

      if (data) {
        setProfile({
          username: data.username,
          website: data.website,
          avatar_url: data.avatar_url,
        });
      }
    } catch (error: any) {
      showToast({ message: error.message, duration: 5000 });
    } finally {
      await hideLoading();
    }
  }
  async function signOut() {
    await supabase.auth.signOut();
    router.push("/", "forward", "replace");
  }
  async function updateProfile(e?: any, avatar_url: string = "") {
    e?.preventDefault();
    await showLoading();

    try {
      if (!session?.user) throw new Error("No user on the session!");

      const updates = {
        id: session?.user.id,
        ...profile,
        avatar_url: avatar_url,
        updated_at: new Date(),
      };

      let { error } = await supabase.from("profiles").upsert(updates);

      if (error) {
        throw error;
      }
    } catch (error: any) {
      showToast({ message: error.message, duration: 5000 });
    } finally {
      await hideLoading();
    }
  }
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Account</IonTitle>
        </IonToolbar>
      </IonHeader>

      <IonContent>
        <form onSubmit={updateProfile}>
          <IonItem>
            <IonLabel>
              <p>Email</p>
              <p>{session?.user?.email}</p>
            </IonLabel>
          </IonItem>

          <IonItem>
            <IonLabel position="stacked">Name</IonLabel>
            <IonInput
              type="text"
              name="username"
              value={profile.username}
              onIonChange={(e) =>
                setProfile({ ...profile, username: e.detail.value ?? "" })
              }
            ></IonInput>
          </IonItem>

          <IonItem>
            <IonLabel position="stacked">Website</IonLabel>
            <IonInput
              type="url"
              name="website"
              value={profile.website}
              onIonChange={(e) =>
                setProfile({ ...profile, website: e.detail.value ?? "" })
              }
            ></IonInput>
          </IonItem>
          <div className="ion-text-center">
            <IonButton fill="clear" type="submit">
              Update Profile
            </IonButton>
          </div>
        </form>

        <div className="ion-text-center">
          <IonButton fill="clear" onClick={signOut}>
            Log Out
          </IonButton>
        </div>
      </IonContent>
    </IonPage>
  );
}
