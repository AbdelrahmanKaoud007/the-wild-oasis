import { createClient } from "@supabase/supabase-js";
export const supabaseUrl = "https://tysnaepbteysciqwkqke.supabase.co";
const supabaseKey = "sb_publishable_MHt2CBwSTdW0CyYPPIqL5g_oMxGgq1l";
const supabase = createClient(supabaseUrl, supabaseKey);
export default supabase;
