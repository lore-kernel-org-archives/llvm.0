Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0FA1FB5E
	for <llvm@lists.linux.dev>; Wed, 19 Jul 2023 18:06:20 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-63719ad32e7so42843766d6.1
        for <llvm@lists.linux.dev>; Wed, 19 Jul 2023 11:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689789980; x=1692381980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q8C9QUl9c024VdDM4U2qSt+ZkIzjIMLrLNe0pZ5n4E=;
        b=MsuBgeLACJ6N4ubJggHSBIiXd8DlImplahregFFg+jh127qgD0yy8SfKvOk1bUxxEj
         zcSL9hXvJi96OHneAydcCrrnR/KCI79XRl276s0e5ibNfu22dT4ZNEiNetgFXmVlQrsi
         rBhkDfObbVnCCIQfLZMiT/79TIzd+zcui4F1r0wmDsLdAVtUP3e4rSbbg1e9hWkK36oR
         YFuStHwRtybupndHDXS6I38G8Zj00A0+0Wpc/P2ery4DhX7ucNyoQ+IfMLyC2PkLsZf6
         dH/Rbqsn6nJGlyvl7LoQOHVN9rkOHeXMu6tDBElGRIu8AXDSH0a5R7pnrsLTQJwLPFDl
         rWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689789980; x=1692381980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/q8C9QUl9c024VdDM4U2qSt+ZkIzjIMLrLNe0pZ5n4E=;
        b=FnbBIr3QqV8E8qTRERvtl2+Rlx1/FLWciV5FmIGsSp91FqBXlAs3lrnG4yI8+iO+uC
         JgTV72esjzfZlp0kMSJhd1ZAb+KYvVcFpOCoGnKp2k2D+6m2IZ+Nz1tAsmIKLok5CEy4
         vpiE/fqejiYykF/Pr4YXirT8kgpKES47bO3TRFR4a361VtxRweJtWPMUk2H3tHjHoHqt
         jMLj8tZQ6z1vanKw5it8kuDRgAOW04EabUGYr1OvvgvtGyUDgy/8gCtS0tx+8Ux9hgTr
         bnoX2tdENjIVRSDVDFKjOd3jpK7nirBcxn3Nyj5Hdq3e1gPyTAtt4e0sG2AjRe3p2quZ
         Ggsw==
X-Gm-Message-State: ABy/qLZSDvYpI/KhPxmcJ+VY9LEr2+Dp91Jt+B1nlb9Yqng1adtKdkhZ
	ZxU8JapYXYPkqku1c/z06j9KVpxcjMUDsZqIzkye5G+f/Td066ItltFJTQ==
X-Google-Smtp-Source: APBJJlE7nViBT6f/zxrl/dr31wzjer7QTF6XLcz5nEXCf2nO6NMvpOyXtT1bDTC/ewipu9B3dteZLC0N2tvvBlNaK/Q=
X-Received: by 2002:a0c:e3d4:0:b0:631:fa2e:249f with SMTP id
 e20-20020a0ce3d4000000b00631fa2e249fmr16560164qvl.61.1689789979787; Wed, 19
 Jul 2023 11:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230719031912.224843-1-bgray@linux.ibm.com>
In-Reply-To: <20230719031912.224843-1-bgray@linux.ibm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Jul 2023 11:06:09 -0700
Message-ID: <CAKwvOd=fjtmoonc8CoJwuvogYCCPHu9s_sMRB5P+B4whaCovEg@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: add assembly files to compilation database
To: Benjamin Gray <bgray@linux.ibm.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2023 at 8:19=E2=80=AFPM Benjamin Gray <bgray@linux.ibm.com>=
 wrote:
>
> Like C source files, tooling can find it useful to have the assembly
> source file compilation recorded.
>
> The .S extension appears to used across all architectures.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
> ---
>
> For example, I'm prototyping adding ASM support to clangd. It can use
> this information to determine the architecture, macros definitions,
> include paths, etc. on a per-file basis. I can capture this during
> compilation with tools like bear, but given this script exists and the
> change is trivial it seems like a good idea to adjust this script too.

Sounds cool, thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Feel free to subscribe us to the clangd patches; we might have
bandwidth to help review, or can at least follow along on progress.

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
>


--=20
Thanks,
~Nick Desaulniers
