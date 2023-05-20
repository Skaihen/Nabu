import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NABU_SUPABASE_URL as string;
const supabaseAnonKey = process.env.NABU_SUPABASE_ANON_KEY as string;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
