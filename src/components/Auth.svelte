<script lang="ts">
  import { supabase } from "../lib/supabaseClient"

  let loading = false
  let email = ""

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

<div
  class="flex w-screen h-screen align-middle content-center justify-center items-center"
>
  <div aria-live="polite" class="card w-96 bg-base-100 shadow-xl">
    <div class="card-body">
      <h2 class="card-title text-3xl">Nabu</h2>
      <p>Sign in via magic link with your email below</p>
      <form
        on:submit|preventDefault={handleLogin}
        class="
      form-control card-actions"
      >
        <div>
          <label for="email" class="label">Email</label>
          <input
            id="email"
            type="email"
            placeholder="Your email"
            class="input input-bordered"
            bind:value={email}
          />
        </div>
        <div>
          <button
            type="submit"
            class="btn btn-accent btn-block"
            aria-live="polite"
            disabled={loading}
          >
            <span>{loading ? "Loading" : "Send magic link"}</span>
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
