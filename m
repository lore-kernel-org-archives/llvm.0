Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575F7C
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 19:57:54 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id s25so23333060lji.5
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 11:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bzivBYAw3ljLJy8xZdeQDlrkgf1wuIGHlMk0BwA07c0=;
        b=KEQ5BRHLV5QEz4CDHLQQB/SplTyDRt7A4lHNfxFHFB/hJZlUmDi2+nTSlwz/H2F/dx
         eimLKy1g993y+H0uoNs1fYev40Npxz0jCvsONiiotxfIzDl0yiFXH8E66Kww8Zi5JVt1
         riAOs1Ia1BdYL6FWl6MAGMOBI9gg8XlLRFJZCnfpCL7TGTzdoG2bEaWS8N8eSDGVV/ej
         Zd9+RTVAnK61wC4eiSnP3FMVMeXlnBN2TncLzIAxZ+y2DFpGcp9fepASwO8v+UbdT79E
         bzpFk/XEUzmbP+XJ8l47hH02UpAK4H+KPvM6mPZ5mdbg8zT4ERWVjVqIaDSA/SmcWYmz
         FUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bzivBYAw3ljLJy8xZdeQDlrkgf1wuIGHlMk0BwA07c0=;
        b=BNX0bi9h2wiqppQwMLQvRLvw/uLWtV5lrORZUa87jF8m39DAkNZ1FkF3YJroA8LF3G
         6FJFY3xnis/IZoCTGcHQ5u6yaUW0s67HuDFCCAvNhzsea0+N5vxQ72uZlczm4C06B7tA
         i4F/vzk9RjKIPljgldiLbhD0YRe9r+Lz71ZwLDRlp1J/P2++tJucI7eP0hgDX4jpEg7+
         /sTXUZP+7pKYP/aKZE+zFU3bcYIVhjBb+NNLVm6ig71rJOyhPqxjunm0SgtNy6VUvVDx
         iJuqxc4RtLTZyAxboOdgSNdRx0crVUU7q477vp+Cq+j3Y5I69qeX5pymlDf7aRd/6GoW
         9sBQ==
X-Gm-Message-State: AOAM532mc53BPL+Vwj7ML7FZqrwAfY4tDsz7zcFt4caoLBwHWtMJLHBM
	6DZQtLr9fn8EjD5fYCfNdA2upxED1XNrxN5prl5HRQ==
X-Google-Smtp-Source: ABdhPJzbNisdyIa1wPYSz5jbLW4IKbU4cXZL3Jq42bKSP244kPlasEustkjm9b56aAk8bR8evyfq6NCB36MTaBtFvM0=
X-Received: by 2002:a2e:871a:0:b0:246:ee2:1109 with SMTP id
 m26-20020a2e871a000000b002460ee21109mr17904085lji.165.1646164672468; Tue, 01
 Mar 2022 11:57:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301145233.3689119-1-arnd@kernel.org> <20220301145233.3689119-2-arnd@kernel.org>
In-Reply-To: <20220301145233.3689119-2-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Mar 2022 11:57:41 -0800
Message-ID: <CAKwvOdnkfuT_w_0RNCb+WTKJ+282zLKmhB9UNG=D-UFz9VkUng@mail.gmail.com>
Subject: Re: [PATCH 2/3] treewide: use -Wdeclaration-after-statement
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jani Nikula <jani.nikula@intel.com>, David Sterba <dsterba@suse.com>, Alex Shi <alexs@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2022 at 6:52 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Mark Rutland <mark.rutland@arm.com>
>
> In a subsequent patch we'll move the kernel from using `-std=3Dgnu89` to
> `-std=3Dgnu11`, permitting the use of additional C11 features such as
> for-loop initial declarations.
>
> One contentious aspect of C99 is that it permits mixed declarations and
> code, and for now at least, it seems preferable to enforce that
> declarations must come first.
>
> These warnings were already disabled in the kernel itself, but not
> for KBUILD_USERCFLAGS or the compat VDSO on arch/arm64, which uses
> a separate set of CFLAGS.
>
> This patch fixes an existing violation in modpost.c, which is not
> reported because of the missing flag in KBUILD_USERCFLAGS:
>
> | scripts/mod/modpost.c: In function =E2=80=98match=E2=80=99:
> | scripts/mod/modpost.c:837:3: warning: ISO C90 forbids mixed declaration=
s and code [-Wdeclaration-after-statement]
> |   837 |   const char *endp =3D p + strlen(p) - 1;
> |       |   ^~~~~
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> [arnd: don't add a duplicate flag to the default set, update changelog]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patches!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Makefile                          | 3 ++-
>  arch/arm64/kernel/vdso32/Makefile | 1 +
>  scripts/mod/modpost.c             | 4 +++-
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 94fa9a849a7a..37ef6a555dcd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -432,7 +432,8 @@ HOSTCXX     =3D g++
>  endif
>
>  export KBUILD_USERCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-protot=
ypes \
> -                             -O2 -fomit-frame-pointer -std=3Dgnu89
> +                           -O2 -fomit-frame-pointer -std=3Dgnu89 \
> +                           -Wdeclaration-after-statement
>  export KBUILD_USERLDFLAGS :=3D
>
>  KBUILD_HOSTCFLAGS   :=3D $(KBUILD_USERCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTC=
FLAGS)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32=
/Makefile
> index 9378ea055bf2..ed181bedbffc 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -68,6 +68,7 @@ VDSO_CFLAGS +=3D -Wall -Wundef -Wstrict-prototypes -Wno=
-trigraphs \
>                 -fno-strict-aliasing -fno-common \
>                 -Werror-implicit-function-declaration \
>                 -Wno-format-security \
> +               -Wdeclaration-after-statement \
>                 -std=3Dgnu11
>  VDSO_CFLAGS  +=3D -O2
>  # Some useful compiler-dependent flags from top-level Makefile
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6bfa33217914..fe693304b120 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -833,8 +833,10 @@ static int match(const char *sym, const char * const=
 pat[])
>  {
>         const char *p;
>         while (*pat) {
> +               const char *endp;
> +
>                 p =3D *pat++;
> -               const char *endp =3D p + strlen(p) - 1;
> +               endp =3D p + strlen(p) - 1;
>
>                 /* "*foo*" */
>                 if (*p =3D=3D '*' && *endp =3D=3D '*') {
> --
> 2.29.2
>


--=20
Thanks,
~Nick Desaulniers
