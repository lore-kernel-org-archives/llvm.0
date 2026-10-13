Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA23F54AA
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887543; cv=pass; b=bwEbGNWZRpWXsTyh4VdNXovjDWErfnQCx9ZFXfuuESCpnwhqvVZpejow2i3NSA0o96W3wVKL7XZzGKP1Cw9HA9F8ot7DDL9sIn5Jo9Be/cEtfSNymvVztx68xIuA7iefngRINJy1yZepkOFPYtWzXI/r5T7ryBYPXkQ44BrsxW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887543; c=relaxed/simple;
	bh=IAfkKA0U+QL1NU6vVqFogpbTbIovJwScmPrSbAdsIoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFikFp3gGAXvQmvdxOOI60BnDxx7yeKhyvEtRivJi0MQoXGn3l/tVZA2Fa59NiI+dZtOY/kOLAqLcEPhbwx1K4YrOJ++N1hpIKotphmfHKqKLFTdm8Vu9yIaeTUZHDewBuTD9rXMq9sPaGgYsV3LAQei0PrPLvb0N/VujohOM/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjXRNzeW; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjXRNzeW"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33c10faf6easo276992eec.0
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 03:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887540; cv=none;
        d=google.com; s=arc-20260327;
        b=TiediguV8Rq0Lt91BSF482CgxaUrWtkb641s6iOCKfcgL6siA1GKpOhVlhnw4xBX6N
         eLn+Y48J9VV41dTNcbwvrhgS12+C5Kf5b2m1O/TY7188JS3SzKFcT/s1GWrlvIiTqUcg
         p6UIxx0LJ+9DbjX01r5rtOtv8Vt+y2vz/00cTq/4iKu4sPPJjfUNyTp5CFrd/W+kTuv8
         oVBxXhYtAB0Lzuf+DaOSOXyeX5Hpn+AoLg2HLkobhiD8smJH5PcbH5z5YLM7eOqKAgbW
         v3Ee79VdUDMboxfBopYO/+TF6BDh3C1WBgiVSy2b2Sl8wVqYwjTyGaaqYTG6HY/v+iJd
         ecEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        fh=aH8rmnjS4x3vJkESmNtFdTJspJ6b78rj60fJOCgPvUg=;
        b=KPAVGrYESgZnAQQgHj7XyKVC5eNIjRPzDfpTkeaKRVq94cUM0YUNMCVdHtJWBWp/6d
         uWwNCp0ogLv9OCFTnu2krDIwo/7nJmCvrrQSc0hKrZesgybwqSSPCtW4KHn25meePbvj
         qp2tmWIfbac6xMNdGjheOdZ9WwJAHbjnfIRLng6f1iQGXRnMOmuZ2gKeaAwV7uqpmwX3
         yGxZGwxRS4svzTnh0rqIM1K1IxZ9yYUdEjk1COFN+PLyF2UaqIi6SBt2m8mG7GKTJv33
         vca2KbuBp50DHoJ3o4AHaTlF5RwwC3Mgwv++SwVbrIFn2ujh7hSQnl7zMvRuNEKQUDw/
         HneQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887540; x=1792492340; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        b=fjXRNzeW242OFWreHdKDb31mo9LEwQVROhVvpzV84vemsVboOLsg1239wfj8gOdG/0
         6nLWKmfpTS7wwYtMpvP1FDh4w1cbhbU+lf1/VsvoxPncZODvog4eOouxce/ZtOlHaKxD
         YSJpS+/7iV7N89tJ4OI7sSkSe6ctL+YOpihuZ0Er7cZUclH9Rna+yhcoUVzr+lBRl1uA
         boIoCoGghYf8KBOecNkZnJTeawutQl64PWMQ7d2bD2xEKLbsBPyglqoNAl5GQM2T4sTq
         +PMH1EDG8i/1qCiJ8f/1mXX8NSfIJjQVHvfxeIBzTC2UFHZJ8Erc4hW2Yq15ps3Ou8xS
         xrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887540; x=1792492340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        b=H6S6nDm4TfyKshkIyJ77cMeT2sZ+AnLxL+EGZTiPH4+AqfJRON+VPt2H6F0b2RACWf
         BAFRMajmPnVl3d/+AbKJI3z3WvUQDAxvCnpduGHCCH3m/ie4tJ0TOrhjqrUeTCiaH6qD
         7FlSZq+7lqk7Nyi9oLJ3AXeg5PZWVHbCrX6jevLb0mdq9U3tp44OczEGaK7BLc+3ONgG
         oniwTJREUKXyUAX4JkJ1hqM8tXeXkfparRBxCQyohJer20eVfgKh3UEOKA/bGOhR7P/V
         6rlEzJPZHdkLmJuPNbuxKEnvHz+9v28xuvWlczfmmOJEcTdn1WUIYnGLiPZNtE8wkjrU
         9pEQ==
X-Forwarded-Encrypted: i=1; AKwUvBymhKeuZCvH+oGhoXWlyOm52pu6vWmnzRCQgPe2WHMBeOkzQn1bKbegXfFQE24kPOWmtZV5@lists.linux.dev
X-Gm-Message-State: AFq9FYKm+fWAFaXXcgIU89jOxyVpWITdcKLIGrNZTpJeUlUM0u22iPm9
	MpNQSfnu5CD/4hZgI+ILq0bDgW5Mjs5TG13MgIkbO5idw4kxjlq2sOi5Xi4YhV7dzVxB3g2gQct
	lO8vqJVd9R0If/4ldM8DT8Q4on9C1qxo=
X-Gm-Gg: AYBFou2yvLq8SwFpuzQCDJdG4Ix3AzTImLRSlSzennZ1DoQ+ww9wKNoqd+dGgBu87o6
	kJ3Hguwtupz1SAZQAf9tCuRsai2+97q3qin69bR65Z2yqdcVbX2TMfDkW/0nwd4rNsynWf5g3Sq
	Cjjd+OQEKci3LQl+DWDPuiiO1lUG23+KFqmcMWTwdLrvdn6v16j/sR7m2G4yVhxhx/1nWso9QGU
	srehUbeQKZHllquLCdO6Ei2qq5FjJMm3/4hK4yslQ+cwNz25l/1A1Ybm1s6gYi4YIzSvZ930cOJ
	6qPpw+zvEBHvQfIuP4zUPAabgRFW7Hb3E4DzxsqBEjOXNcuIw7fycM8du4PlAb83Naos4bLK6fs
	NYZ1fW+025yxe5GnhluaJpYRB5TEUFOZ26E1zByu9hZn9McGojt8Zk0IOH+maP7kBImFmLNBH7h
	FoQoveV5cEHUAJtxndAVggJyH0rtB42x+IGvEbem+aN8NLC3BpMHDYk3h80p7FnQ==
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr25702764eec.0.1791887539654; Tue, 13 Oct 2026
 03:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com> <as4DdRqFKxuJNDnS@elver.google.com>
In-Reply-To: <as4DdRqFKxuJNDnS@elver.google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 12:32:07 +0200
X-Gm-Features: AclHuK-e9pojF-4-sUhcctzSu2Lj9dg88Qjibnm7E2u4bDLqEx7YvHBlJNvxTnE
Message-ID: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Looks like it, and we need this patch to use system_dfl_wq:
>
>
> From: Marco Elver <elver@google.com>
> Date: Tue, 13 Oct 2026 10:05:52 +0000
> Subject: [PATCH] rust: workqueue: add system_dfl()
>
> The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> system_{unbound}_wq is used")).
>
> Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  rust/kernel/workqueue.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..e46d3acf903d 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
>      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
>  }
>
> +/// Returns the system default work queue (`system_dfl_wq`).
> +///
> +/// Workers are not bound to any specific CPU, not concurrency managed, =
and all queued work items
> +/// are executed immediately as long as `max_active` limit is not reache=
d and resources are
> +/// available.
> +pub fn system_dfl() -> &'static Queue {
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> +}
> +
>  /// Returns the system freezable work queue (`system_freezable_wq`).
>  ///
>  /// It is equivalent to the one returned by [`system`] except that it's =
freezable.
> --
> 2.56.0.385.gd3acb90ef8-goog

This is:

  https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@kern=
el.org/

i.e. we have had a warning like that in one of our current tests for a
while, it would be nice to clean it up:

    workqueue: work func
    _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtNtN=
tBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
    enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Cc'ing workqueue: Tejun and Lai.

Cheers,
Miguel
