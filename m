Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F0E2586C1
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014122; cv=none; b=UzqAt8vEmXv4Hpl5eguUqKgyXty8f6y38o2JPAN5T30ZoJlSXWsyNg5/f9Nb1ThbktK0wfOF5lFU1ilI+DjL0PT1zARfBghBeB9bwhoOM0dnv09qYKcyyPkHrn1DIBxsn19DkI6dT0SCgjSIc0kT7YUS/PnBP9X6Aq7uKECVr80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014122; c=relaxed/simple;
	bh=cEafmn+CQvRdDtyXdQjjjTvqE/nBCdUlVRZYmX2VXog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXg4TqjA9HbWFcae+ygMNZQ+3G+sxewuvRrJ+cnN00a5kA2oqeMiDAswmdaQjHF+wlPKpQoSO4mgfjGuAgk5tCtLcV6UtxUbW8v0iXc25sJqJUpLM7TKK3RIjz/YaxlGSwHtKwgHJcEuld5RX2I3qc+YnRJSezOalA+w0YnqhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P32G77QL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P32G77QL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30a0c05e2c6so4156087a91.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746014120; x=1746618920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuyGNzxgDiOkjQwKgLR+DPXNIJCg0WiL8KUtY79VEQs=;
        b=P32G77QLfPtTbpefNohI0kxjW9DyB9VDeF060qkT1YeKhxholHBPB697kkSsevnYFG
         iacU1XM3shKoNlRtUNBNBsPRw8GE4NdfZuj+GHOhhc6FjvpA4Ol8f9UxAVo8owHkw/fK
         tq07yGIt/sxZfOvP2alEq6lbSoTnzao/Fc5ph7D0eT4ZL1DuE3FL1N+kZUGyJeFETPC2
         RZrmm/ZDEsYWboF0pVHyGa+juVLoU3WLu9qlx5XkwzgNZ/UoLwL0/KhHIyvxY0mlsRlM
         Qd2bDzihzwZq+zGAWY3egE0KPTtn17xQCBj6frE4pQ+NO0y4qXalaSlhrpR2BLHZGHKM
         xtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014120; x=1746618920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuyGNzxgDiOkjQwKgLR+DPXNIJCg0WiL8KUtY79VEQs=;
        b=hDK5aX206E18wlZ9OOKxOoH94+H6ZVT87hJC4Erw/LNxPJLQD1UvEkQsZiyQT8Lxz5
         kxN/POba5uCuw53bd86p67DcQZ/shO0jb4S3nHSGO4LxYguo2tHBHxakFZ39BV00RUAQ
         ozh3yjntT6OAxA5+BpSG4doj1P8o9IIzOcdi3iRLynYJ/3cfHpH4fsclrhIMXoaRlCQI
         XaGo8N/vL8lLzwJBg341ZkIZsAMN3PKk1Uv0BsR+O/kWn7dVyO3a/OLCIWB2mOFlS57Z
         BhKhQ0pvFIQzbhd3UE0DLSzVzHnrUdXwtNkYeDhXyhrxl/gMQeo8RahXENAEVcNuWhAJ
         evnw==
X-Forwarded-Encrypted: i=1; AJvYcCXk10pBytTSm8Yc+hDbnYPN+WNNNINN5sK/0lDhpXQFdx+DAeIKtP5ftCOVtBvLjwfjmZHd@lists.linux.dev
X-Gm-Message-State: AOJu0YyRrplu0iiXdqvpqlZw9VF+PKcyC04ZFx7qhcXn2VdjPIwNZfvg
	0sgJfse1SoRyU4zFHVr6GZCDZjeRhIrdpXHAIG09o9NYGw3LCYsxxbKxOpl/N63NA04DWSyui6S
	RzAkuYifj0dhz9YwV2cqWyEVGS7fH6NGN7WdE
X-Gm-Gg: ASbGnctqS1K9P8mNUEX2A8yBVS+T6mFVnBHy9FwDajqkJih7HqEMJ9hFzS0FeiZaObB
	/7YH8VYC41uuH6mNXbITGzmhMzAsrD26IbgM6znCkRNzj0Wr0K70Aj9qaxMViyT7lRP5v0M+97u
	rn7Scf2be1KDhd46J5AUcsomNSCn3ztM2TPAQlBB110sAPGua9ZNrz
X-Google-Smtp-Source: AGHT+IGwJXAzQrRYamfgcjkePkCyZD/+tcwqKUOPh3vaz9WJg9ywHz6ypW3p7A0p0mLXG8BPw3/UYz781u1FtNYWFzs=
X-Received: by 2002:a17:90a:da83:b0:305:2d27:7c9f with SMTP id
 98e67ed59e1d1-30a3331eebbmr4689528a91.16.1746014119912; Wed, 30 Apr 2025
 04:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
In-Reply-To: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 30 Apr 2025 13:55:06 +0200
X-Gm-Features: ATxdqUGMpC2B1RGjyZnHvqdqDFG5FAFUqW_p8EIC04ZX-V4PP8t0Bammv6S-GJE
Message-ID: <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:04=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection.
>
> The coverage level is set to 3, as that is the level needed by trace-pc.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Thanks!

I've run syzkaller against a kernel built with the patch applied and
the tool was able to successfully obtain coverage feedback from the
Rust code, so
Tested-by: Aleksandr Nogikh <nogikh@google.com>

As a side note, in the resulting code coverage I also see a lot of PCs
from rustlib, which isn't the primary target when fuzzing the kernel.
Do you find it reasonable not to instrument rustlib with coverage
callbacks? For C code, there do exist some exceptions for KCOV, see
e.g. lib/Makefile.

> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 3 +++
>  2 files changed, 9 insertions(+)
>
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07b8=
efa106e8dffa640 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    +=3D -fsa=
nitize-coverage=3Dtrace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverage=
=3Dtrace-cmp
>  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         +=3D -fplugin=3D$(objtree=
)/scripts/gcc-plugins/sancov_plugin.so
>
> +kcov-rflags-y                                  +=3D -Cpasses=3Dsancov-mo=
dule
> +kcov-rflags-y                                  +=3D -Cllvm-args=3D-sanit=
izer-coverage-level=3D3
> +kcov-rflags-y                                  +=3D -Cllvm-args=3D-sanit=
izer-coverage-trace-pc
> +kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  +=3D -Cllvm-args=3D-sanit=
izer-coverage-trace-compares
> +
>  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> +export RUSTFLAGS_KCOV :=3D $(kcov-rflags-y)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb5e=
129effb8846d5b8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>         $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-ke=
rnel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
>         $(CFLAGS_KCOV))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +       $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-ke=
rnel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> +       $(RUSTFLAGS_KCOV))
>  endif
>
>  #
>
> ---
> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> change-id: 20250430-rust-kcov-6c74fd0f1f06
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
