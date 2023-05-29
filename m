Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396FD7C
	for <llvm@lists.linux.dev>; Mon, 29 May 2023 10:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E401EC4339C
	for <llvm@lists.linux.dev>; Mon, 29 May 2023 10:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685355263;
	bh=lFADNYKkbWj0shwnbHBkVzpXd5KWwGFsFd1Wv3SDaa8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jS0HhFamicitfEXhwm96fveg14nyYnuHawqKJMxJSQKoeUjxmKo7+Q9OIJz//eQtW
	 Qu6hWYv7jjxzMJ5/reAQEex7zv1QeNiq09ZwWuTwUynVmtxOkCWVm0WK+SnkX4JkiR
	 9LQMKDyYwlrBwWymVU06zLNaNhAZPn6hdaZ3IL/gAoFH/eHc/bHPKoZoxzk3Fk5of2
	 IGh2E4ecDMrXL8FbADfxZbXDIxbTZqOgpbPl0eoJfQ5UVxCyhr4PDwDEeWw19xFFxi
	 yr/N7LI7aPjMidIv51OFEdzmIAe+lRbwouEXOq7Z2ExJ4+l/JQrIrwTp+JQ1hir45J
	 tlbEHnS/YW8ww==
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-556d7ac7c7eso691971eaf.0
        for <llvm@lists.linux.dev>; Mon, 29 May 2023 03:14:23 -0700 (PDT)
X-Gm-Message-State: AC+VfDyLqGhcfi2xgFjXdVKtmZeMvEWUVEppTNFzycTZwtQgPumvVgdj
	ER6+A03bIG1ipEJAMIixBRNgZ91rmy9ni6BR+U4=
X-Google-Smtp-Source: ACHHUZ7gAElbn2rPz8Q6ZZWixuxKJxoOpCne/kbQHulPb3hRSAQzCL3AGhw3cZLXiNrcSaAVidz9Fxerq3jVdOPOB/0=
X-Received: by 2002:a05:6808:b0a:b0:398:587c:835a with SMTP id
 s10-20020a0568080b0a00b00398587c835amr4741453oij.10.1685355263137; Mon, 29
 May 2023 03:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
 <OSZP286MB20611C35BF36F4EB69FD3DF6C0469@OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <OSZP286MB20611C35BF36F4EB69FD3DF6C0469@OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 29 May 2023 19:13:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATz8xDmf5SuApGnrbkxvWPJNG1HTuQSrw2v_Ox5sXQO2A@mail.gmail.com>
Message-ID: <CAK7LNATz8xDmf5SuApGnrbkxvWPJNG1HTuQSrw2v_Ox5sXQO2A@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: include targets not ending with .o
To: Hu Weiwen <huww98@outlook.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 9:21=E2=80=AFPM Hu Weiwen <huww98@outlook.com> wrot=
e:
>
> Currently, we only extract commands for targets ending with '.o'. But we
> also have many standalone executables built in-tree.
>
> Remove this restriction. And to avoid some false matching, exclude
> targets end with '.c' or '.h' when directly walking the directory.


Can you give me some examples of false matching?



Also, this patch would pick up *.i, *.s, *.lst, etc.

Does it make sense to parse cmd files for those?
I guess the answer is no.



>
> To really generate compile_commands.json that includes such target, call
> this script directly with no arguments.  `make compile_commands.json`
> will not include them.
>
> Signed-off-by: Hu Weiwen <huww98@outlook.com>
> ---
> Since V1: Only commit message is updated.
>
>  scripts/clang-tools/gen_compile_commands.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 15ba56527acd..6e88c7e166fc 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -18,8 +18,8 @@ import sys
>  _DEFAULT_OUTPUT =3D 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL =3D 'WARNING'
>
> -_FILENAME_PATTERN =3D r'^\..*\.cmd$'
> -_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.c) *(;|$)'
> +_FILENAME_PATTERN =3D r'^\..*(?<!\.(c|h))\.cmd$'
> +_LINE_PATTERN =3D r'^savedcmd_[^ ]* :=3D (.* )([^ ]*\.c) *(;|$)'
>  _VALID_LOG_LEVELS =3D ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  # The tools/ directory adopts a different build system, and produces .cm=
d
>  # files in a different format. Do not support it.
> --
> 2.25.1
>


--=20
Best Regards
Masahiro Yamada
