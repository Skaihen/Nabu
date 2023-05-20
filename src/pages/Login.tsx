import { useState } from "react";
import {
  IonButton,
  IonContent,
  IonHeader,
  IonInput,
  IonItem,
  IonLabel,
  IonList,
  IonPage,
  IonTitle,
  IonToolbar,
  useIonToast,
  useIonLoading,
} from "@ionic/react";
import { supabase } from "../lib/SupabaseConfig";

const Login: React.FC = () => {
  const [email, setEmail] = useState("");

  const [showLoading, hideLoading] = useIonLoading();
  const [showToast] = useIonToast();
  const handleLogin = async (e: React.FormEvent<HTMLFormElement>) => {
    console.log("enter");
    e.preventDefault();
    await showLoading();
    try {
      await supabase.auth.signInWithOtp({ email });
      await showToast({ message: "Check your email for the login link!" });
    } catch (e: any) {
      await showToast({
        message: e.error_description || e.message,
        duration: 5000,
      });
    } finally {
      await hideLoading();
    }
  };
  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Login</IonTitle>
        </IonToolbar>
      </IonHeader>

      <IonContent>
        <div className="ion-padding">
          <h1>Supabase + Ionic React</h1>
          <p>Sign in via magic link with your email below</p>
        </div>
        <IonList inset={true}>
          <form onSubmit={handleLogin}>
            <IonItem>
              <IonInput
                value={email}
                name="email"
                onIonChange={(e) => setEmail(e.detail.value ?? "")}
                type="email"
                label="Email"
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
};

export default Login;
