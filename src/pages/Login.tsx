import { useState } from "react";
import {
  IonButton,
  IonContent,
  IonHeader,
  IonInput,
  IonItem,
  IonList,
  IonPage,
  IonTitle,
  IonToolbar,
  useIonToast,
  useIonLoading,
} from "@ionic/react";
import { supabase } from "../lib/SupabaseConfig";

export default function Login() {
  const [email, setEmail] = useState("");
  const [showLoading, hideLoading] = useIonLoading();
  const [showToast] = useIonToast();

  const handleLogin = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    await showLoading();
    const { error } = await supabase.auth.signInWithOtp({ email });

    if (error) {
      await showToast({
        message: error.message,
        duration: 5000,
      });
    } else {
      await showToast({
        message: "Check your email for the login link!",
      });
    }
    await hideLoading();
  };

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Nabu</IonTitle>
        </IonToolbar>
      </IonHeader>

      <IonContent>
        <div className="ion-padding">
          <p>Sign in via magic link with your email below</p>
        </div>
        <IonList inset={true}>
          <form onSubmit={handleLogin}>
            <IonItem>
              <IonInput
                type="email"
                value={email}
                name="email"
                label="Email"
                required
                onIonChange={(e) => setEmail(e.target.value as string)}
              ></IonInput>
            </IonItem>
            <div className="ion-text-center">
              <IonButton type="submit" fill="clear">
                Login
              </IonButton>
            </div>
          </form>
        </IonList>
      </IonContent>
    </IonPage>
  );
}
