Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B43242B0
	for <llvm@lists.linux.dev>; Wed,  7 Jan 2026 13:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793362; cv=none; b=rDhLR5WAoMNBP+uxuS8OaLbR+h1ZoBB6BqVjW/kaEAIJf8Wg6CXXuxHwEUM7q9jEx1TQThd1T8Zv6zB2KC3CuZYFi1Y0WwbhQhkjo/pwDYFCBHdvUs9hcN0zS/8az8sp0BjA8mGMlj5YAILFOJNEy/maWrgE/3bll4keJEefNA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793362; c=relaxed/simple;
	bh=iXZwlopuNJRJwpn4lKa2cESnuSuulNoWC+xhEaqaBVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMUtc9/1GIf2P+v5fbAB/H+873SV2LDHaXLOTr9f453yTVfD4PqQUAE6G4KjPwfy9L3ZjCCFLhYxhnlVJzpAL5CUWmF4ifuUZW9mCaBpoumY9VtBnkhQ1f4Lpv95Q9pERDDM+FdRez/kYlfsvxX+G3knVAWr4IDBVf9l/qI6xUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mIkQT3bz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mIkQT3bz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4327778df7fso1211823f8f.3
        for <llvm@lists.linux.dev>; Wed, 07 Jan 2026 05:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767793359; x=1768398159; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuezIgzsAyyNB5F641/r8/tOCfKBUN9xZVmivfP98JU=;
        b=mIkQT3bzSRMk0krBvrffhD/An7lOjD9MbpilhxOqLMYJXYZjRnlW4UpquOSJJFzGIE
         NOjv4Iq8RSwMEN1Cc3Gi7OZlHdDRu0zpg4J7PYBTuWaLKLPDvOdRibfTUUlvSE6m/SoL
         pZvnFSCj8lCgh1WChpYMESBH0c/hcYbHZS+BnSaLscrhkg5DtUmwDZRwDwsEFHYLXHAt
         JH5QCNWZ2g3Bd/NkdPmUK+qH/W4vFcAHckC0rXErLRPUgIa/QhzWNvcsHwxIZ6Er+E5A
         zYs2HcnklqnFlZoU0w4kTOMQ91qiY6ORhpyoTU2xL7G2TRRBkc3C5mM/+zpKu1bDzgeI
         iduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793359; x=1768398159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VuezIgzsAyyNB5F641/r8/tOCfKBUN9xZVmivfP98JU=;
        b=WAaUcVebhT4Nbe7vfwi4BUBuQPymeBFPWKBDTGxAwhUWFraC/hyCGzbljVv5LWwJ9V
         Cd91zn0rHDK7Ihq3cYDSmivhSgj4OfqKdeFOKUKt8oXgzE5Oyi2fqrPS4oE3WL7yKOad
         U7zC6fMwgj91IfNRE5DBmkO/r8J57QeYalzQANp28g0DSiR9ExeJrF652N0vfAUJUJcf
         OMFXVIV6RIoUIfp6Kaz5oWLSrkZGb64bGdbwDBamIBL1RY20BVeWJRWp5N5dxfA0SS4g
         tjSncJ60zV3hAtH531ks/V3CHXQrECH00dT9xZ1sahzdo1D/rdXHXtWa9ZNDUfBqfGGc
         YhIg==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZlVCzfeTibKCwQtBoaB2bgkXi7gHQT9TdmMOJT8CBvR6NtqgZfKeL4hNvKFClrTtGO+F@lists.linux.dev
X-Gm-Message-State: AOJu0YwLowzkhQK/zWLgf7hQKu5szvrubYd2EIYKcjuDkyW4EfnsUEyQ
	WI7PnwPWHkEyF5Ea9ripjAWaiTVxv5s3f8QbB4QgIRknmkyilk6qtRqVi1dLjEe+VrKsEE167qn
	lJjlzQvzG+OlQUktc2NcbbnoXBSSrHGL/wnVx3nwe
X-Gm-Gg: AY/fxX5cnSwZidc43uMVK3+WfFVzuI0Rak9PR7iHvMVRVC8T+XTZ7pltr4re9n+5u78
	86/q7LC/HPTyTg35S9X0SZhQ0+ehBvkG5cTmIPe79gRXQ9gVWh0uPjKfE430XJbGYwr1Be/zxAS
	/2fwNRNZ3Okv9anlrjvd5OZpYYzTtzeYly7DhCpJhBDWWanIFFF2XDsWnurc+KamgnfQZ/h66e6
	4Cz2BXSmeAIG7WlSEXCVMAHjRebwknD/oZFJ9nTpaYAeNN8PR/Oo0erdHaLtE5PPEHNBdeNNp3p
	0gc4qhhHoG+2ZJmIXDmYD69ucQEhYi8NvY+uaQ9s/5CJRKL79fwRDOhsKQ==
X-Google-Smtp-Source: AGHT+IEAUc1mXQn7QPlaWNlhB+oC5uC/VKZi1CsDAujRYSITqdy4Y0I5rdAfjg0XLN3IVv+rgZqfa1hd3+1gv9RykyI=
X-Received: by 2002:a05:6000:4301:b0:42b:5592:ebe6 with SMTP id
 ffacd0b85a97d-432c32f701cmr2574852f8f.0.1767793358358; Wed, 07 Jan 2026
 05:42:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set> <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set> <un386uEr3TEFzLpGCdZg_Tzm63zO7Ze6IZN16Cz79EfWmEI_hZXbBvhG2enZmUXJ6DUnCMNm7QIz-agEYIDr9A==@protonmail.internalid>
 <20260107131822.GD3707837@noisy.programming.kicks-ass.net> <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Jan 2026 14:42:25 +0100
X-Gm-Features: AQt7F2pAZcR9-cuXntjPdly3bLnSH5zqd4_0Qf_i4GvgVh-5nOmI2NH4hmtXZLU
Message-ID: <CAH5fLgjmjjroRf-eU+4UrTPeq3HJ7QoWoCimBW-Occf_f22ARw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 2:40=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Peter Zijlstra" <peterz@infradead.org> writes:
>
> > On Wed, Jan 07, 2026 at 02:12:10PM +0100, Andreas Hindborg wrote:
> >> "Peter Zijlstra" <peterz@infradead.org> writes:
> >>
> >> > On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
> >> >> Hi Alice,
> >> >>
> >> >> Alice Ryhl <aliceryhl@google.com> writes:
> >> >>
> >> >> > Currently the only way for Rust code to call a static inline func=
tion is
> >> >> > to go through a helper in rust/helpers/. This introduces performa=
nce
> >> >> > costs due to additional function calls and also clutters backtrac=
es and
> >> >> > flame graphs with helper symbols.
> >> >> >
> >> >> > To get rid of these helper symbols, provide functionality to inli=
ne
> >> >> > helpers into Rust using llvm-link. This option complements full L=
TO, by
> >> >> > being much cheaper and avoiding incompatibility with BTF.
> >> >> >
> >> >> > I ran a microbenchmark showing the benefit of this. All the bench=
mark
> >> >> > does is call refcount_inc() in a loop. This was chosen since refc=
ounting
> >> >> > is quite hot in Binder. The results are that Rust spends 6.35 ns =
per
> >> >> > call vs 5.73 ns per call in C. When enabling this option, the two
> >> >> > languages become equally fast, and disassembly confirms the exact=
 same
> >> >> > machine code is used (in particular there is no call to
> >> >> > rust_helper_refcount_inc). Benchmarking Binder also results in an
> >> >> > improvement from this change.
> >> >> >
> >> >> > This patch is complementary to:
> >> >> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e1=
3cbc17a6@google.com/
> >> >> >
> >> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> >>
> >> >> I get the following modpost errors when building with this applied =
on top
> >> >> of v6.19-rc4:
> >> >>
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] u=
ndefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core=
.ko] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.k=
o] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] u=
ndefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.k=
o] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] und=
efined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undef=
ined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko=
] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platfo=
rm.ko] undefined!
> >> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.k=
o] undefined!
> >> >
> >> > Looks like it used the wrong static_call_mod() version, was MODULE
> >> > defined?
> >>
> >> CONFIG_MODULES=3Dy, yes
> >>
> >> I built without the patch first, then applied the series, enabled the
> >> option via menuconfig and ran the build. I thought maybe some dependen=
cy
> >> check is messed up so I retried the build from a clean state. Same
> >> result.
> >
> > No, I mean -DMODULE. Note how the quiet_cmd_bindgen target has -DMODULE=
,
> > but the new quiet_cmd_rust_helper target does not.
>
> Ah, that did the trick, thanks!
>
>   diff --git a/rust/Makefile b/rust/Makefile
>   index 5365d53b6cf96..08d3dc1038cf5 100644
>   --- a/rust/Makefile
>   +++ b/rust/Makefile
>   @@ -483,7 +483,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(sr=
c)/helpers/helpers.c FORCE
>
>   quiet_cmd_rust_helper =3D HELPER  $@
>         cmd_rust_helper =3D \
>   -     $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -c -g0 $< -emit-llvm -o $@
>   +     $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -DMODULE -c -g0 $< -emit-llvm -o $@
>
>   $(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
>     +$(call if_changed_dep,rust_helper)
>
> Is -DMOUDLE always appropriate to pass to the helpers? The helpers are
> also inlined into non module code.

With this option, helpers.bc gets linked into every Rust object file
separately (and symbols are internalized). We might want a separate
.bc file depending on whether the Rust object files is part of the
core kernel or a .ko file.

Alice
