Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C94A12B7F
	for <llvm@lists.linux.dev>; Tue, 16 Jul 2024 00:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721090773; cv=none; b=d7UBPURdiBQULCNRzz4OpYs4NYkN6H0C65Tdpl2OFBPEYnXmKvsJHaTKeQDUY4A/clP4uHv4JOCS0YYBcVyjtK3jN0pycljMeJzlbvrYQ/6oR/LTLRkzAkAuiOaDcDF22LXfadNNA+jnhXTC5Q7amLofAwA2dp7Hq3VXFBCEx5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721090773; c=relaxed/simple;
	bh=4uM0FvLy5udE+HfWQP/w0Px9dpx3wbZvNKZHLMQ7a2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dto+8JstTbKbVJV0RtqtCcpWbu0TpLz3B3ihK+eJfaDzA4BwzRzfiEoW7SsfpzeCHHR6aoFRAvckP2XDuU3BIkCABHPE1mWQMfmE+Ybs7F4TETOYCeoLchnOjbu30zGZYpeNRcGlRsR6399xZnGY4vVYw+SwJHntVeO9fHXJY+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=flhmv0o8; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="flhmv0o8"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-651da7c1531so45069907b3.0
        for <llvm@lists.linux.dev>; Mon, 15 Jul 2024 17:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1721090770; x=1721695570; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TD66OtDeh2iGxjhj1zv4qHDsUsV2aL1QtkjuvW+JSWU=;
        b=flhmv0o8O1n2lQCXzsuliCsNP6vBYm3O8YmzDsqiWgUokb5vZoLPK/NZ3Pj6egNMzT
         +bJVLV9khj8F1czlE321A5IUmtKL5zjdsNnau0cpwCLK+qUV7OOFfxgDX4nfWtp3F1mE
         x9AmIyc2No8wqPWOTNWgu0dPcSboijsb1MKUnC93JZ2GUqV5wEeYoXR9JJX1uyWGqpbt
         KdEYUxOsS5P0mhzn2lYk/eY4x1aTTuc+QZIPHlpm2XYeZ4LGnqJee2GfWxoKwJ+PtMy+
         i4Y6ZMTCEqxJuKVRXPmRzl1Ih2/sWEVrZVye98yrag3IozBsLfIvCiJ1VCcR85vlTPtY
         wyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721090770; x=1721695570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TD66OtDeh2iGxjhj1zv4qHDsUsV2aL1QtkjuvW+JSWU=;
        b=e2r9FInaipmTSTRmsVtIvtTXDFrWZUn4bAhLdDbAKou6QSiJzxawsg06czkkSCZmMm
         bYOQqtUb7cDQOS8JbOdkuXrVwviDHzNYV3bteEv6f9C4blktKgqjPkbuZRMOHk1Ntl8k
         rb5iF9eRniKBdQn0UQlqvJ6bH/DHQpo4DlFAGiScIRvU9f59D+JZwKM7VDuhaHm7jEwY
         OcFGInjjHMN3A7ZseLBfg7IQXrvNobfWuqHT5V2n0vaZ5fJWT5niD5SzxGBtu/VG8+j1
         U+fXL7dcnrvjXJl3rgDkW35vOGWPjnQGRRpq2DIwOTDBscsuozySc6CFy5E1qsH/n7IV
         CUPg==
X-Forwarded-Encrypted: i=1; AJvYcCWRzdHn7cB9VHjaMATZSKHqR9NIbTRSurt3BXEPGYW4pDyOrNqJsA7AR8CiFHwvcxUFB+3lwNkw6P+h0Q3SS9Y5lnzAPw==
X-Gm-Message-State: AOJu0Yzcy59pFgxRqOmEaH69M1305Psg8j3DJ4ohe2kmxkBflHIIk2X0
	EoYwqbH9wGc5c9QGq5HZT09eIiPS+NuPfP+zGotU5zzSwtFWWJjWFjI32QJ4OtmiTUcuPc8lKX8
	LVzGTBzNatrRKWhcsg/jBwhy+NCfHCTa5JsV1Jg==
X-Google-Smtp-Source: AGHT+IH2/Rko98brgCuBjHJl2Gx5ElpjIF+OOpCL1/BI2lJd+gA1z6MJ0fwOhu2NUVrUxOY5J6MQlr1Xw34lVNgzmNs=
X-Received: by 2002:a81:7c06:0:b0:64a:5f5a:b38c with SMTP id
 00721157ae682-66381bbc211mr7303107b3.26.1721090770201; Mon, 15 Jul 2024
 17:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240715221126.487345-2-vadorovsky@gmail.com>
In-Reply-To: <20240715221126.487345-2-vadorovsky@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 15 Jul 2024 19:45:59 -0500
Message-ID: <CALNs47t=YQX+UP_ekq_Ue=BrA4JscDbU1qNDoKFar3yUbOSZ5g@mail.gmail.com>
Subject: Re: [PATCH v3] rust: str: Use `core::CStr`, remove the custom `CStr` implementation
To: Michal Rostecki <vadorovsky@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Manmohan Shukla <manmshuk@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	Asahi Lina <lina@asahilina.net>, Yutaro Ohno <yutaro.ono.418@gmail.com>, 
	Danilo Krummrich <dakr@redhat.com>, Charalampos Mitrodimas <charmitro@posteo.net>, 
	Ben Gooding <ben.gooding.dev@gmail.com>, Tejun Heo <tj@kernel.org>, 
	Roland Xu <mu001999@outlook.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 5:14=E2=80=AFPM Michal Rostecki <vadorovsky@gmail.c=
om> wrote:

> diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
> index 0ba77276ae7e..c08f9dddaa6f 100644
> --- a/rust/kernel/kunit.rs
> +++ b/rust/kernel/kunit.rs
> [...]
>              // SAFETY: FFI call without safety requirements.
>              let kunit_test =3D unsafe { $crate::bindings::kunit_get_curr=
ent_test() };
> @@ -71,11 +71,11 @@ macro_rules! kunit_assert {
>                  //
>                  // This mimics KUnit's failed assertion format.
>                  $crate::kunit::err(format_args!(
> -                    "    # {}: ASSERTION FAILED at {FILE}:{LINE}\n",
> +                    "    # {:?}: ASSERTION FAILED at {FILE:?}:{LINE:?}\n=
",
>                      $name
>                  ));
>                  $crate::kunit::err(format_args!(
> -                    "    Expected {CONDITION} to be true, but is false\n=
"
> +                    "    Expected {CONDITION:?} to be true, but is false=
\n"
>                  ));

These aren't exactly the same: the existing `Display` impl will print
the string (hexifying invalid characters), but this will add `" ... "`
around it.

In Rust's libraries, string `Path` and `OsStr` both have a
`.display()` method that returns a wrapper type that does implement
`fmt::Display`, which can then be printed (see [1]). We could do
something similar here, via a `CStrExt` trait that goes in the prelude
and provides `.display(&self)`.

Rust itself could actually use something here too - if you're up for
it, feel free to propose an implementation via ACP (that's just an
issue template at [2]). It would probably be pretty similar to the
recent `OsStr` one. Of course it will be a while before we can use it
in the kernel, but it wouldn't hurt to get the ball rolling.

[1]: https://doc.rust-lang.org/std/path/struct.Path.html#method.display
[2]: https://github.com/rust-lang/libs-team/issues

>  /// Creates a new [`CStr`] from a string literal.
>  ///
> -/// The string literal should not contain any `NUL` bytes.
> +/// Usually, defining C-string literals directly should be preffered, bu=
t this
> +/// macro is helpful in situations when C-string literals are hard or
> +/// impossible to use, for example:
> +///
> +/// - When working with macros, which already return a Rust string liter=
al
> +///   (e.g. `stringify!`).
> +/// - When building macros, where we want to take a Rust string literal =
as an
> +///   argument (for caller's convenience), but still use it as a C-strin=
g
> +///   internally.
> +///

s/preffered/prefered

"when C-string literals are hard or impossible to use" doesn't sound
quite right - I think it is more common that you're just hiding an
implementation detail (string type) from the user of a macro. Maybe
something like:

    This isn't needed when C-string literals (`c"hello"` syntax) can be
    used directly, but can be used when a C-string version of a standard st=
ring
    literal is required (often when working with macros).

> +/// The string should not contain any `NUL` bytes.
>  ///
>  /// # Examples
>  ///
>  /// ```
> +/// # use core::ffi::CStr;
>  /// # use kernel::c_str;
> -/// # use kernel::str::CStr;
> -/// const MY_CSTR: &CStr =3D c_str!("My awesome CStr!");
> +/// const MY_CSTR: &CStr =3D c_str!(stringify!(5));
>  /// ```
>  #[macro_export]
>  macro_rules! c_str {
>      ($str:expr) =3D> {{
>          const S: &str =3D concat!($str, "\0");
> -        const C: &$crate::str::CStr =3D match $crate::str::CStr::from_by=
tes_with_nul(S.as_bytes()) {
> +        const C: &core::ffi::CStr =3D match core::ffi::CStr::from_bytes_=
with_nul(S.as_bytes()) {
>              Ok(v) =3D> v,
>              Err(_) =3D> panic!("string contains interior NUL"),
>          };

Thanks for this, will be a nice bit of code cleanup.

- Trevor

(also, v2 and v3 are appearing in different threads on lore (as they
should), but they're in the same thread as v1 in my email client - any
idea if there is a reason for this?)
