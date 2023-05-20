import { Redirect, Route } from "react-router-dom";
import { IonApp, IonRouterOutlet, setupIonicReact } from "@ionic/react";
import { IonReactRouter } from "@ionic/react-router";
import Home from "./pages/Home";

/* Core CSS required for Ionic components to work properly */
import "@ionic/react/css/core.css";

/* Basic CSS for apps built with Ionic */
import "@ionic/react/css/normalize.css";
import "@ionic/react/css/structure.css";
import "@ionic/react/css/typography.css";

/* Optional CSS utils that can be commented out */
import "@ionic/react/css/padding.css";
import "@ionic/react/css/float-elements.css";
import "@ionic/react/css/text-alignment.css";
import "@ionic/react/css/text-transformation.css";
import "@ionic/react/css/flex-utils.css";
import "@ionic/react/css/display.css";

/* Theme variables */
import "./theme/variables.css";

setupIonicReact();

const App: React.FC = () => (
  <IonApp>
    <IonReactRouter>
      <IonRouterOutlet>
        <Route exact path="/home">
          <Home />
        </Route>
        <Route exact path="/">
          <Redirect to="/home" />
        </Route>
      </IonRouterOutlet>
    </IonReactRouter>
  </IonApp>
);

export default App;

// import { Redirect, Route } from "react-router-dom";
// import { IonApp, IonRouterOutlet, setupIonicReact } from "@ionic/react";
// import { IonReactRouter } from "@ionic/react-router";

// import "@ionic/react/css/ionic.bundle.css";

// /* Theme variables */
// import "./theme/variables.css";
// import { LoginPage } from "./pages/Login";
// import { AccountPage } from "./pages/Account";
// import { useEffect, useState } from "react";
// import { Session } from "@supabase/supabase-js";
// import { supabase } from "./lib/SupabaseConfig";

// setupIonicReact();

// const App: React.FC = () => {
//   const [session, setSession] = useState<Session | null>(null);

//   useEffect(() => {
//     supabase.auth.getSession().then(({ data: { session } }) => {
//       setSession(session);
//     });

//     supabase.auth.onAuthStateChange((_event, session) => {
//       setSession(session);
//     });
//   }, []);

//   return (
//     <IonApp>
//       <IonReactRouter>
//         <IonRouterOutlet>
//           <Route
//             exact
//             path="/"
//             render={() => {
//               return session && session.user ? (
//                 <Redirect to="/account" />
//               ) : (
//                 <LoginPage />
//               );
//             }}
//           />
//           <Route exact path="/account">
//             <AccountPage key={session!.user.id} session={session!} />
//           </Route>
//         </IonRouterOutlet>
//       </IonReactRouter>
//     </IonApp>
//   );
// };

// export default App;
