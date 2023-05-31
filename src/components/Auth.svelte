<script lang="ts">
  import type { Provider } from "@supabase/supabase-js"
  import { supabase } from "../lib/supabaseClient"

  interface HelperText {
    error: boolean
    text: string | null
  }

  let email: string = ""
  let password: string = ""
  let loading: boolean = false
  let helperText: HelperText = { error: false, text: null }

  const handleLogin = async (type: string) => {
    try {
      loading = true
      const {
        data: { user },
        error
      } =
        type === "LOGIN"
          ? await supabase.auth.signInWithPassword({ email, password })
          : await supabase.auth.signUp({ email, password })
      if (error) {
        throw error
      } else if (user && !error) {
        helperText = {
          error: false,
          text: "An email has been sent to you for verification!"
        }
      }
    } catch (error) {
      if (error instanceof Error) {
        helperText = { error: true, text: error.message }
      }
    } finally {
      loading = false
    }
  }

  const handleOAuthLogin = async (provider: Provider) => {
    // You need to enable the third party auth you want in Authentication > Settings
    // Read more on: https://supabase.com/docs/guides/auth#third-party-logins
    let { error } = await supabase.auth.signInWithOAuth({ provider })
    if (error) console.log("Error: ", error.message)
  }
</script>

<div class="mx-auto max-w-screen-xl px-4 py-9 sm:px-6 lg:px-8">
  <div class="mx-auto max-w-lg">
    <h1 class="text-center text-3xl font-bold text-primary">
      Get started with Nabu
    </h1>

    <p class="mx-auto mt-4 max-w-md text-center text-gray-500">
      Nabu is a scrum-like ToDo app for managing your projects, tasks, or
      whatever you need!!
    </p>

    <!-- on:submit|preventDefault={handleLogin} -->
    <div class="mb-0 mt-6 space-y-4 rounded-lg p-4 shadow-lg sm:p-6 lg:p-8">
      <p class="text-center text-lg font-medium">Sign in to your account</p>

      <div>
        <label for="email" class="sr-only">Email</label>

        <div class="relative">
          <input
            bind:value={email}
            id="email"
            type="email"
            name="email"
            class="input input-bordered w-full p-4 pe-12 text-sm shadow-sm"
            placeholder="Enter email"
            autocomplete="email"
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
            class="input input-bordered w-full p-4 pe-12 text-sm shadow-sm"
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

      {#if helperText.text}
        <div
          class="border px-1 py-2 my-2 text-center text-sm rounded-lg shadow-sm {helperText.error
            ? 'bg-red-100 border-red-300 text-red-400'
            : 'bg-green-100 border-green-300 text-green-500'}"
        >
          <div class="flex items-center">
            <ion-icon
              name={helperText.error
                ? "close-circle-outline"
                : "checkmark-circle-outline"}
              class="stroke-current flex-shrink-0 h-5 w-5"
            />
            <span>
              {helperText.text}
            </span>
          </div>
        </div>
      {/if}

      <div class="mt-2 flex gap-3">
        <span class="block w-full">
          <button
            on:click={() => handleLogin("REGISTER")}
            type="submit"
            class:loading
            class="btn btn-block btn-primary btn-outline shadow-sm btn-sm"
            aria-live="polite"
          >
            {loading ? "Loading" : "Sign Up"}
          </button>
        </span>
        <span class="block w-full">
          <button
            on:click={() => handleLogin("LOGIN")}
            type="submit"
            class:loading
            class="btn btn-block btn-primary shadow-sm btn-sm"
            aria-live="polite"
          >
            {loading ? "Loading" : "Sign In"}
          </button>
        </span>
      </div>

      <div class="mt-3">
        <div class="divider text-sm text-gray-500">Or continue with</div>
        <div class="mt-3">
          <span class="block">
            <button
              on:click={() => handleOAuthLogin("github")}
              type="button"
              class="w-3/4 mx-auto flex justify-center btn btn-primary shadow-sm btn-sm btn-disabled"
            >
              GitHub
            </button>
          </span>
        </div>
        <div class="mt-3">
          <span class="block">
            <button
              on:click={() => handleOAuthLogin("google")}
              type="button"
              class="w-3/4 mx-auto flex justify-center btn btn-primary shadow-sm btn-sm btn-disabled"
            >
              Google
            </button>
          </span>
        </div>
      </div>
    </div>
  </div>
</div>
