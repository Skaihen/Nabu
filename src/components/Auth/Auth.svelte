<!-- <script lang="ts">
  import { supabase } from "../../lib/supabaseClient"
  import EmailConfirm from "./EmailConfirm.svelte"
  import EmailDeny from "./EmailDeny.svelte"

  let loading = false
  let email = ""
  let hideEmailDeny = true
  let hideEmailConfirm = true

  const handleLogin = async () => {
    try {
      loading = true
      const { error } = await supabase.auth.signInWithOtp({ email })
      if (error) throw error
      hideEmailConfirm = false
      setTimeout(() => {
        hideEmailConfirm = true
      }, 4000)
    } catch (error) {
      if (error instanceof Error) {
        hideEmailDeny = false
        setTimeout(() => {
          hideEmailDeny = true
        }, 4000)
      }
    } finally {
      loading = false
    }
  }
</script>
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
            name="email"
            type="email"
            class="input input-bordered w-full p-4 pe-12 text-sm shadow-sm"
            placeholder="Enter email"
            autocomplete="on"
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
 -->

<script lang="ts">
  import type { Provider } from "@supabase/supabase-js"
  import { supabase } from "../../lib/supabaseClient"

  interface HelperText {
    error: boolean
    text: string | null
  }

  let email: string = ""
  let password: string = ""
  let helperText: HelperText = { error: false, text: null }

  const handleLogin = async (type: string) => {
    const {
      data: { user },
      error
    } =
      type === "LOGIN"
        ? await supabase.auth.signInWithPassword({ email, password })
        : await supabase.auth.signUp({ email, password })

    if (error) {
      helperText = { error: true, text: error.message }
    } else if (!user && !error) {
      helperText = {
        error: false,
        text: "An email has been sent to you for verification!"
      }
    }
  }

  const handleOAuthLogin = async (provider: Provider) => {
    // You need to enable the third party auth you want in Authentication > Settings
    // Read more on: https://supabase.com/docs/guides/auth#third-party-logins
    let { error } = await supabase.auth.signInWithOAuth({ provider })
    if (error) console.log("Error: ", error.message)
  }
</script>

<div class="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
  <div class="mx-auto max-w-lg">
    <h1 class="text-center text-2xl font-bold text-primary sm:text-3xl">
      Get started with Nabu
    </h1>

    <p class="mx-auto mt-4 max-w-md text-center text-gray-500">
      Nabu is a scrum-like ToDo app for managing your projects, tasks, or
      whatever you need!!
    </p>

    <form
      action=""
      class="mb-0 mt-6 space-y-4 rounded-lg p-4 shadow-lg sm:p-6 lg:p-8"
    >
      <p class="text-center text-lg font-medium">Sign in to your account</p>

      <div>
        <label for="email" class="sr-only">Email</label>

        <div class="relative">
          <input
            bind:value={email}
            id="email"
            type="email"
            name="email"
            class="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-sm"
            placeholder="Enter email"
            required
          />

          <span class="absolute inset-y-0 end-0 grid place-content-center px-4">
            <ion-icon
              name="at-outline"
              class="pointer-events-none w-4 h-4 text-gray-400"
            />
          </span>
        </div>
      </div>

      <div>
        <label for="password" class="sr-only">Password</label>

        <div class="relative">
          <input
            bind:value={password}
            id="password"
            type="password"
            name="password"
            class="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-sm"
            placeholder="Enter password"
            required
          />

          <span class="absolute inset-y-0 end-0 grid place-content-center px-4">
            <ion-icon
              name="eye-outline"
              class="pointer-events-none w-4 h-4 text-gray-400"
            />
          </span>
        </div>
      </div>

      {#if !!helperText.text}
        <div
          class="border px-1 py-2 my-2 text-center text-sm {helperText.error
            ? 'bg-red-100 border-red-300 text-red-400'
            : 'bg-green-100 border-green-300 text-green-500'}"
        >
          {helperText.text}
        </div>
      {/if}

      <div class="mt-2 flex gap-3">
        <span class="block w-full">
          <button
            type="submit"
            on:click={() => handleLogin("REGISTER")}
            class="btn btn-block btn-primary btn-outline shadow btn-sm"
          >
            Sign Up
          </button>
        </span>
        <span class="block w-full">
          <button
            on:click={() => handleLogin("LOGIN")}
            type="submit"
            class="btn btn-block btn-primary shadow btn-sm"
          >
            Sign In
          </button>
        </span>
      </div>

      <div class="mt-3">
        <div class="relative">
          <div class="absolute inset-0 flex items-center">
            <div class="w-full mx-1.5 border-t border-gray-300" />
          </div>
          <div class="relative flex justify-center text-sm leading-5">
            <span class="px-2 bg-white text-gray-500"> Or continue with </span>
          </div>
        </div>

        <div>
          <div class="mt-3">
            <span class="block rounded-md shadow-sm">
              <button
                on:click={() => handleOAuthLogin("github")}
                type="button"
                class="w-3/4 mx-auto flex justify-center btn btn-primary shadow btn-sm btn-disabled"
              >
                GitHub
              </button>
            </span>
          </div>
          <div class="mt-3">
            <span class="block rounded-md shadow-sm">
              <button
                on:click={() => handleOAuthLogin("google")}
                type="button"
                class="w-3/4 mx-auto flex justify-center btn btn-primary shadow btn-sm btn-disabled"
              >
                Google
              </button>
            </span>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>
