<script lang="ts">
  import { supabase } from "../../lib/supabaseClient"
  import EmailConfirm from "./EmailConfirm.svelte"
  import EmailDeny from "./EmailDeny.svelte"

  let loading = false
  let email = ""
  let hideEmailConfirm = true
  let hideEmailDeny = false

  const handleLogin = async () => {
    try {
      loading = true
      const { error } = await supabase.auth.signInWithOtp({ email })
      if (error) throw error
      alert("Check your email for login link!")
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message)
      }
    } finally {
      loading = false
    }
  }
</script>

<div aria-live="polite" class="px-4 py-16 sm:px-6 lg:px-8">
  <div class="">
    <h1 class="text-center text-2xl font-bold text-primary-content sm:text-3xl">
      Get started with Nabu
    </h1>

    <p class="  text-center text-gray-500">
      Nabu is a scrum-like ToDo app for managing your projects, tasks, or
      what-ever you need!!
    </p>

    <form
      on:submit|preventDefault={handleLogin}
      class="mt-6 space-y-4 rounded-lg p-4 shadow-lg sm:p-6 lg:p-8"
    >
      <p class="text-center text-lg font-medium">
        Sign in via magic link with your email below
      </p>

      <div>
        <label for="email" class="sr-only">Email</label>

        <div class="relative">
          <input
            id="email"
            type="email"
            class="input input-bordered w-full p-4 pe-12 text-sm shadow-sm"
            placeholder="Enter email"
            bind:value={email}
          />

          <span class="absolute inset-y-0 end-0 grid place-content-center px-4">
            <ion-icon name="at-outline" class="pointer-events-none w-4 h-4" />
          </span>
        </div>
      </div>

      <button
        type="submit"
        class="btn btn-primary btn-block"
        aria-live="polite"
        disabled={loading}
      >
        {loading ? "Loading" : "Send magic link"}
      </button>
    </form>
  </div>
</div>

<EmailConfirm hidden={hideEmailConfirm} />
<EmailDeny hidden={hideEmailDeny} />
