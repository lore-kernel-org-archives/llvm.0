Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA017CA
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x5P03qCj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-32487efc319so2440196f8f.1
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696624766; x=1697229566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vBnY223+UcCK7rzFoc5ulYVlozys8xUWOd34LCUCsy4=;
        b=x5P03qCjzlTWnfgohnIBriAy1b5/Yr6cD1aKSCtzMJQuTQfwOhumY4BOgrgO/EV2+S
         6u+vgBXmURollnEw+Lw0nUPTGgJlZ4aULyouzrGG78B5rjadftkEdR7Z1X2wvudXpQde
         vBcFvRL2MxkPy7qxxUBNqH9e2d7JWGfD+bypj/XuVPxuZbUVRnRCNVbWGRaHzc/67XVT
         7V/YNbAHxtXhteDXDT9LvltOq33IMO0C2xl2u6LH+O1UbobgMt/GsV5Mu7jx27+dxniH
         +FeJ93bfZAJ1zSrRDDaFkmLMw0gG3bRgWiuhtmBOD76/Bl0nMb3iz3RmxdqRSnQVpsy1
         XVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696624766; x=1697229566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vBnY223+UcCK7rzFoc5ulYVlozys8xUWOd34LCUCsy4=;
        b=IA9VreotpwfLRbgryoWWgJ8Csa6Ydvq+EIUGjECJxo7M+mNHsYacGrat62DH/61dTs
         0h3O8SLDxVu8lkn4YPOYcLxg1Z2EUY6DahWtXC/+yUm364R+aFkYAzsyAGqws0wawH+k
         bXHeP177WmYTLW2j0jSShXnz9ZeYusBaOy45d19U210HBa/+JV6G8nlpcXhadFi6QNuJ
         pRO70c+vPrzM36YN8iT2wNtG3O5bHEgh5xC8HiTGAALMHlBKYJ4QKskw31FBY7H7z49L
         ObjA2YqKu5VTokqlWhar95F8nDUeu5r8UChHP+F6RdPwVNJSrmXCaYPhDMRDgsTv5jS0
         jvyA==
X-Gm-Message-State: AOJu0Yyff1yl1sdrKczmPTG71PEf/JnfkV6H+h+fmfybxXcHyP8d6IhR
	AA2MKumwYyfi/nxycQMFY8FuuNb7R9H3lY1hsDGY0w==
X-Google-Smtp-Source: AGHT+IHzDNuNkLetmngGytv8DBCjIwTFYkdYhI5xAmjMNGnAyOVLiTphU/0Zdm665xGK7Wdop5gObd6L4XgXt6BqlkA=
X-Received: by 2002:a5d:58f2:0:b0:31f:f326:766b with SMTP id
 f18-20020a5d58f2000000b0031ff326766bmr7910442wrd.6.1696624765796; Fri, 06 Oct
 2023 13:39:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005214057.759089-1-mmaurer@google.com>
In-Reply-To: <20231005214057.759089-1-mmaurer@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Oct 2023 13:39:11 -0700
Message-ID: <CAKwvOdnWc6b9-XwC56ADXx6K2XCzrUPc_VMsAt=syKsp_b6ZSg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Respect HOSTCC when linking for host
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 2:41=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
>
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly. The linker-flavor selects both which linker to search
> for if the linker is unset, and which kind of linker flags to pass.
> Without this flag, `rustc` would attempt to determine which flags to
> pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> name of the linker-flavor used by `rustc` for all C compilers, including
> both `gcc` and `clang`.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>
> Edited to use escsq in both Makefiles, as per Masahiro Yamada's
> suggestion.

That looks better; thanks Matthew!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
>  rust/Makefile         | 2 ++
>  scripts/Makefile.host | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 87958e864be0..2ddd821d9435 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FO=
RCE
>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro =3D \
>         $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> +               -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +               -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                 --emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --exter=
n proc_macro \
>                 --crate-type proc-macro \
>                 --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 8f7f842b54f9..08d83d9db31a 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -91,6 +91,8 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
>  # current working directory, which may be not accessible in the out-of-t=
ree
>  # modules case.
>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) \
> +                -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> +                -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
>                   $(HOSTRUSTFLAGS_$(target-stem))
>
> --
> 2.42.0.609.gbb76f46606-goog
>


--=20
Thanks,
~Nick Desaulniers
