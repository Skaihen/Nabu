import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'me.skaihen.nabu',
  appName: 'Nabu',
  webDir: 'dist',
  server: {
    androidScheme: 'https'
  }
};

export default config;
