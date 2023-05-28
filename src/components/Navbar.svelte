<script lang="ts">
  import { supabase } from "../lib/supabaseClient"
</script>

<nav class="navbar sticky top-0 z-10 px-4 bg-base-300">
  <div class="navbar-start">
    <p class="normal-case text-xl">Nabu</p>
  </div>
  <div class="flex-none navbar-end">
    <div class="dropdown dropdown-end">
      <div tabindex="-1" class="btn btn-ghost btn-circle avatar">
        <ion-icon name="person-circle-outline" class="w-8 h-8" />
      </div>
      <ul
        tabindex="-1"
        class="menu menu-compact dropdown-content mt-2 p-2 bg-base-100 rounded-md w-48 shadow-xl"
      >
        <li>
          <button
            type="button"
            class="btn-ghost btn-block"
            on:click={() =>
              supabase.auth.signOut().then(() => window.location.reload())}
          >
            Sign Out
          </button>
        </li>
      </ul>
    </div>
  </div>
</nav>
