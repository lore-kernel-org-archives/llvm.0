Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A355634CE9
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 21:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GOpRB8Gr"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-536ef8a7dcdso4679a12.0
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 14:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696541791; x=1697146591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWddOZrmmasiWu5O0KWGa9lmgFQoWcrVlIGB6YyWgVs=;
        b=GOpRB8Grb7Gzm1D9f1E2gyDFLm1dfFJhOXUHrYjhI+BhLvjIw1jF4ihvjunXnS4a0T
         lRdwDBpTIjOEvHJ69go3bszEMp1jA1dXP6mBNaa4+JZW6m/x0h07P6ZmyFcINXMZ8pQ8
         gtxgYkDxNZYhIxj1U7NmQoef5QKrxadlQXFfq1Rwt94rrQEUEyJt1zhXW0WAtMOZ4/UX
         TqRo2vO62efsNa/jtns16FUQZ3CO6w8B9afE9OUjT9EghFNbkZstfOk0vRvNJhrf0Mf2
         nqnOsHFlp837ZUNCvLQAxP9MHUIfG7NYsHIRBWfm+BQoIniJUXCelCmPK8ce+o+0P8qr
         kWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696541791; x=1697146591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWddOZrmmasiWu5O0KWGa9lmgFQoWcrVlIGB6YyWgVs=;
        b=ohIFFD7BSqaMhWrQnl2dl6k5cHhphbE47YwiiSpcBWmVNGsNohDh90AIH+IuioP6yu
         SOnTJYwlAWPKGKzOEKaepMXu+7/kNzWsd5ow0hMXXukcrVWPHgIaAc2JDht6wgVui0yH
         +perNaAIWlbhejpjnBhUzBZ78n3FmESGhXChaS0ntCGGa0uN0hQ/GPwg5iujAdmJHvEd
         h+Ebi/lwfi1nLJclfC7VqoE/zRcsSPR0kR+srplgcx3BrqgVDMyG5KixQcK+6R7Crrr/
         HsFHWy5SC6h6CxnFud4Te7y7eJ1zEPb3Vya4HNG5w1Ye3UMKu/xskEFkJAAgf9EAah17
         gcUg==
X-Gm-Message-State: AOJu0YzncJnvY0n5/JexBqlwK8p9e6lejNMChtbux8qzqA4HiVMInETA
	jhZbcUfM1uOducmpBkiX1tEJsOJ41DFr4f8q6juTVg==
X-Google-Smtp-Source: AGHT+IGlPnoq0UGE7DkoUzQp1yA5leDO8Cu3vmPbEmr9NZ49zBh/WWSakqyb4sccb/9wcCnTmo4j2D3js6AfFSbidkA=
X-Received: by 2002:a50:9f67:0:b0:522:4741:d992 with SMTP id
 b94-20020a509f67000000b005224741d992mr121564edf.4.1696541790666; Thu, 05 Oct
 2023 14:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230928194801.2278999-1-mmaurer@google.com> <CAK7LNAQP9FVCArnw=JDBbtbu-3bxx162kqT24bUbffPtwE18uA@mail.gmail.com>
In-Reply-To: <CAK7LNAQP9FVCArnw=JDBbtbu-3bxx162kqT24bUbffPtwE18uA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 5 Oct 2023 14:36:19 -0700
Message-ID: <CAGSQo01=UxFmPRo6OTU1443izumvF+Z0fevgdWVdHK6DGTehCQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Respect HOSTCC when linking for host
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 10:59=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Fri, Sep 29, 2023 at 4:48=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined=
,
> > resulting in build failures in hermetic environments where `cc` does no=
t
> > exist. This includes both hostprogs and proc-macros.
> >
> > Since we are setting the linker to `HOSTCC`, we set the linker flavor t=
o
> > `gcc` explicitly. The linker-flavor selects both which linker to search
> > for if the linker is unset, and which kind of linker flags to pass.
> > Without this flag, `rustc` would attempt to determine which flags to
> > pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> > name of the linker-flavor used by `rustc` for all C compilers, includin=
g
> > both `gcc` and `clang`.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  rust/Makefile         | 2 ++
> >  scripts/Makefile.host | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 87958e864be0..da664d7aed51 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o =
FORCE
> >  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
> >        cmd_rustc_procmacro =3D \
> >         $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> > +               -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> > +               -Clink-args=3D'$(subst ','\'',$(KBUILD_HOSTLDFLAGS))' \
>
>
>
> Why not consistently use the escsq macro here too ?
>
>
I didn't use it in rust/Makefile because that makefile doesn't
directly import scripts/Kbuild.include, and I was under the mistaken
impression that scripts/ was supposed to be its own namespace, even if
Make wasn't enforcing it. Inspecting other functions in
scripts/Kbuild.include though, it's clear they're called elsewhere, so
I'll upload another version of the patch using escsq here as well.
>
>
>
>
> >                 --emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --ext=
ern proc_macro \
> >                 --crate-type proc-macro \
> >                 --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> > diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> > index 8f7f842b54f9..08d83d9db31a 100644
> > --- a/scripts/Makefile.host
> > +++ b/scripts/Makefile.host
> > @@ -91,6 +91,8 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
> >  # current working directory, which may be not accessible in the out-of=
-tree
> >  # modules case.
> >  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) =
\
> > +                -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> > +                -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
> >                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
> >                   $(HOSTRUSTFLAGS_$(target-stem))
> >
> > --
> > 2.42.0.582.g8ccd20d70d-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada
