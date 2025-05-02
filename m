Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B43248F4E
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 12:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189374; cv=none; b=EhuRK2srhbnvuZ6ja1hr1WoLA9b++l1ZdQHdo5M49tqkFICYAw6m5s++npxBw1noi6ONLwxxgqFUwflzlZ2AeFnYop65dXd9PfVGAeplTEpWSkyVKy1RACWx4TlnNtWG1XKWfBALbJt5eDaiYCyVisg1BwIr0nqgnPQ5ZXhXinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189374; c=relaxed/simple;
	bh=JT+qr01uZcVOJZP4RQusBZiCCpnCtGRxDlD4tTq126I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=juu45RBeqOMAa6vExwaLnElJVJ9eNpAEbZ7nToqFmB4NF+ULYt3pdIYxKX7dRyXTJpd5CZYDTPeeE8zxETwzBku8qK4L56AjhqDalzZ9cYBCg7FEQRJaBjHFHG7gJ6//17TDtSmulN61VPD+u57Ngb/vh0LA0FGQHgiMoTK1LqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i07aYiJI; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i07aYiJI"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so1885776a12.1
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 05:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746189372; x=1746794172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bWVNZpDPjN8he9HssEtQl6bUgAXH/F4pjykOH4GCkk=;
        b=i07aYiJIw3JLzvzYrPTwBiDn+NY8PbMLKzf2cFgNSB7EjLu1Odg2QZDwmVgTYE9mMP
         Hek/oesLkaGICv5nAD9f6G5gyIpeBBHI4bOtnzDJjzdvRcZi/vCBMiH3ZNffx4giItPK
         9nXFs+Jxi4Kuvl3PfpCkkE0Z5i1BbsjoH1S6iC2UnWyNhj8Ziew+bUFauHUbNFNThXb5
         SUTpYpBiAXvzXkfMrVf6sPdQ7WxPQK4uxmbvu7yxu2cFhvql9CAqpE5NaWrhkDWCiAaw
         r6nS2mLowYQ8KzHQMt/Xw+G7kocGWv1OGQvNGzKOxNIHIwuHMtn2IW0jxea9sEj7QYD7
         CHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746189372; x=1746794172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bWVNZpDPjN8he9HssEtQl6bUgAXH/F4pjykOH4GCkk=;
        b=O/EkYGQyXNDRCfEpRzG4ovHvL2fZDfELUeGHjoZ0RkC3rPoLXB5ml+wlqHrmiRkTxM
         8ZzXNwpbP0UeNL34TalnhM2E+/s2oJPNDClqjPvl/lZbafZskelzZP0v6ktsHYaJcCfz
         91WYHogumHLUI9WCog3yaz06wVLTcJPodYYdmW09guqC+AnWzEnOB/qfArswSqYy0wta
         SGA8KPMrj99wpkXCrBslrr6sTwrd0atAxQfpMSQI6dLUazp5K1msnlRCKv1+LXMGa8uG
         ktBuXKHJ/wMUJqBZ1C9SsXbyGFcu0sHFAxAgf+gHjN/UFp38UDhc9c+oh1mMHSnzS/Zx
         zu7w==
X-Forwarded-Encrypted: i=1; AJvYcCV57291mt00oF5UCB5jMQHs2G+tO3Mozv19cIau1j8mB2T9zIjvn0/MGw9wEetn0FDhsuKz@lists.linux.dev
X-Gm-Message-State: AOJu0YyVSMz8jWOs5+N1+v20vnPh9WK5QmL/tN9MunvtdPyN/PA846Pw
	gmQtVMWFtJr1KgZVdtsrlQd25f8EwgmV61bqCqeEGFeUeyBRSjcjcBV1DiT6i3v3LYmNu4qQROM
	Gfz35msu5mo9MxFEDWko4d1lwBOvnRChsIEDE
X-Gm-Gg: ASbGnctzOBTMgMSyv+qZ+i57gf4sltj7Upze3P45dDMGXTVaRY6gpoemYvPtz5WXkXY
	4F2L7G8iAUjumOPCEyK0+JAmb3XwVf01uL+lH4V6cIxhQzNTHYdBUc8cP5mDhWadO54kBk4jGPa
	9mJ8lhQKrbk6uFCrftAWKQY076lesOUW8uNRooqnLVf6EYcWGARFE=
X-Google-Smtp-Source: AGHT+IF2hAF0/clS4lwwEOMq806j1cV+S29WAOdC4HnfL8cwFDY1AIdDC0g10UG7zShMqw7pJ2uU170Vz680MxOUfJs=
X-Received: by 2002:a17:90b:544c:b0:2fe:a79e:f56f with SMTP id
 98e67ed59e1d1-30a4e5aa034mr3940014a91.13.1746189371395; Fri, 02 May 2025
 05:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
In-Reply-To: <20250501-rust-kcov-v2-1-b71e83e9779f@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 2 May 2025 14:36:00 +0200
X-Gm-Features: ATxdqUEo80l6Wmog53pGJlK7MMSvohTGvruUy1uyoixwHojHfstDErpJeGH-R1I
Message-ID: <CANp29Y41LKZg-kSP+j5hjUKMNeWnPsVd8VvDnOpN8+4WHHjEgQ@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: rust: add flags for KCOV with Rust
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
	Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 2:16=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection. The coverage level is set to 3,
> as that is the level needed by trace-pc.
>
> We do not instrument `core` since when we fuzz the kernel, we are
> looking for bugs in the kernel, not the Rust stdlib.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Reviewed-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> I did not pick up the Tested-by due to the changes. I verified that it
> looks right under objdump, but I don't have a syzkaller setup I can try
> it with.

Thanks for incorporating the core.o change!
I've tested the v2 patch on my local setup and it works well.

Tested-by: Aleksandr Nogikh <nogikh@google.com>

> ---
> Changes in v2:
> - Ignore `core` in KCOV.
> - Link to v1: https://lore.kernel.org/r/20250430-rust-kcov-v1-1-b9ae94148=
175@google.com
> ---
>  rust/Makefile         | 1 +
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 3 +++
>  3 files changed, 10 insertions(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 3aca903a7d08cfbf4d4e0f172dab66e9115001e3..80c84749d734842774a3ac2aa=
bbc944a68d02484 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -492,6 +492,7 @@ $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
>  ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
>  $(obj)/core.o: scripts/target.json
>  endif
> +KCOV_INSTRUMENT_core.o :=3D n
>
>  $(obj)/compiler_builtins.o: private skip_gendwarfksyms =3D 1
>  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
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
