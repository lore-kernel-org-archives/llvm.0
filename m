Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB52B1378
	for <llvm@lists.linux.dev>; Sun, 23 Jul 2023 13:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE4FC433C9
	for <llvm@lists.linux.dev>; Sun, 23 Jul 2023 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690119436;
	bh=hkegC/pm/U6y6rTQ6gC3ikzEDnFe+0wtwbqPQYCaapo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uNb7I8U45mg/t0l7lp8ajG0hb+/g87cq0T0RwMYZad6jnHEsL4a/BmPXyXRHHyPh+
	 0b8rpDcvlUgnpJzXH2+jA07Jf2FeFvBRhsG5UzWTYFZ7T9uakQIDILvpfIEv26xQ4c
	 QPw4iQBWPRgCdPIrY3TFMKcfvGaCj9LtMYS6VkaZy1Tfc8Iw9ii6wCBUS97jciJLVc
	 iM/wSKZwfK0cYVsYmi3enufYolKHgLj3ggdaag+XTuOqZDRRsYUfFKY1zT5wn5ttoN
	 cLeeqId2VKLf/FMhmfQ1IbD8oWUxze2OwaDPVzFAIhW3VE9Rq3u5wiuG2XldJuDIND
	 4zEPRufmKvVmw==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5634db21a58so2556128eaf.0
        for <llvm@lists.linux.dev>; Sun, 23 Jul 2023 06:37:16 -0700 (PDT)
X-Gm-Message-State: ABy/qLb6dE80VQP2Sk4K+dARLAmMI4lCzFbdlr7VjQaPMtBBioc9LEgp
	2uLgtAh4/ddAq4lhZGsX1aOeGH9ztXCBF8c6qFA=
X-Google-Smtp-Source: APBJJlGHlBxYPeb2vHODzptW5nMX7jLJWm4zfnHjqDrUgNx+n3qL1XNVFkr2XjfFPATIgbrhPz+1eFGTpY9tUGVpneM=
X-Received: by 2002:a4a:8501:0:b0:569:e93d:1660 with SMTP id
 k1-20020a4a8501000000b00569e93d1660mr111532ooh.9.1690119436088; Sun, 23 Jul
 2023 06:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719031912.224843-1-bgray@linux.ibm.com>
In-Reply-To: <20230719031912.224843-1-bgray@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 23 Jul 2023 22:36:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS8+Mn1VQUCqkeh0=K2qgoYKstw20C0KWrd1yq_XoBpgg@mail.gmail.com>
Message-ID: <CAK7LNAS8+Mn1VQUCqkeh0=K2qgoYKstw20C0KWrd1yq_XoBpgg@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: add assembly files to compilation database
To: Benjamin Gray <bgray@linux.ibm.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 12:19=E2=80=AFPM Benjamin Gray <bgray@linux.ibm.com=
> wrote:
>
> Like C source files, tooling can find it useful to have the assembly
> source file compilation recorded.
>
> The .S extension appears to used across all architectures.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
> ---

Applied to linux-kbuild.
Thanks.


>
> For example, I'm prototyping adding ASM support to clangd. It can use
> this information to determine the architecture, macros definitions,
> include paths, etc. on a per-file basis. I can capture this during
> compilation with tools like bear, but given this script exists and the
> change is trivial it seems like a good idea to adjust this script too.
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 15ba56527acd..a84cc5737c2c 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -19,7 +19,7 @@ _DEFAULT_OUTPUT =3D 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL =3D 'WARNING'
>
>  _FILENAME_PATTERN =3D r'^\..*\.cmd$'
> -_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.c) *(;|$)'
> +_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.[cS]) *(;|$)'
>  _VALID_LOG_LEVELS =3D ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  # The tools/ directory adopts a different build system, and produces .cm=
d
>  # files in a different format. Do not support it.
> --
> 2.41.0
>


--=20
Best Regards
Masahiro Yamada
