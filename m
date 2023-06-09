Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179D71800E
	for <llvm@lists.linux.dev>; Fri,  9 Jun 2023 19:45:17 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-786d74c317eso795975241.0
        for <llvm@lists.linux.dev>; Fri, 09 Jun 2023 12:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686339917; x=1688931917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85bTuSWiyHjKxAhfdvtzqeLdAW05vfW46WEl40BOct8=;
        b=RWQt0Zs330gMzU/XJRpu/ZT2nqWWPXm5GPcG6EsmhmHTJmNk75jNKDQzjCERhlh8qA
         OcIvGcNJtMmYnvdPcdlt58oafnA99Q+q39av86k5lXaWdipxp0hEpf5FrqvCOFFEFpoV
         OmOb01HcpJNC4IQOk0roth6yNJMf/DfjAEMWL23P+X5UJhn9igkhkPqbtkN/4/B8Kbzk
         eKjafJdZBTbqFDjOWZisZhvsdc1K3MTNSqw/Xl6pa76yvlti6PATKNztrhk8OVLbF1Pv
         IPMjEthtRRed5XG8F5uxEzR1bLSU7T6IiNh9kmxn+Hjpop1e5CLb6uMsV1YgM2/ABcmu
         iNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339917; x=1688931917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85bTuSWiyHjKxAhfdvtzqeLdAW05vfW46WEl40BOct8=;
        b=CWDq2vhyi3/zpIlshzlqrcG3SHtrLp1cbmpncJ1IYF9ohICfy0WG82UAZMYkAbaWJr
         /NgkRNCNEwbl7HZhyrm7fso5Sed2NhSTVIxRM6g2/tjnLvkbpERo0VUrvHhaaaayXUpQ
         h1BSPTw//3mQTkFe2W2WbV9YTSw/XdKbWdq1lOVa7/bESDeyad7We09O5khrJupsfVZ6
         lNxMWi2fcu8ffEF16hAokIFN7SMDMR48eZJNe68tCKdxeJSFXimiiDIcHbMWqdGqI4gE
         wQaUNe1YovJxCSQ/FmTGKk1281zM2WwonwtwE/jZC99sePyA7EuB/oJeCG9z1ZddAofd
         FK5Q==
X-Gm-Message-State: AC+VfDxIP41Hl3A2EvT0bxKPMqzo83R+tza+6RpE1vUc9Ya9gT3/GY9I
	rnhzrC+SPDat+AJHDRhgtFhPRBz9dxarOr2RYTkHwafjdIUPT08aK9yQFg==
X-Google-Smtp-Source: ACHHUZ6AePrOZMaTcA9MZgMRFQSWi7dmRNPnXVxlhTXch5hfqZy3wLZHuNcjJElugjwkfVmddujmNwflG79f4KvUXns=
X-Received: by 2002:a67:b441:0:b0:43b:46b0:988d with SMTP id
 c1-20020a67b441000000b0043b46b0988dmr1877466vsm.29.1686339916691; Fri, 09 Jun
 2023 12:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230609034501.407971-1-naveen@kernel.org>
In-Reply-To: <20230609034501.407971-1-naveen@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 9 Jun 2023 12:45:05 -0700
Message-ID: <CAKwvOd=ZbKCtfC+pb4h3yJuZ5TMTWgR0nJ65V4161zHEY3e9EA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/ftrace: Disable ftrace on ppc32 if using clang
To: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 8, 2023 at 8:47=E2=80=AFPM Naveen N Rao <naveen@kernel.org> wro=
te:
>
> Ftrace on ppc32 expects a three instruction sequence at the beginning of
> each function when specifying -pg:
>         mflr    r0
>         stw     r0,4(r1)
>         bl      _mcount
>
> This is the case with all supported versions of gcc. Clang however emits
> a branch to _mcount after the function prologue, similar to the pre
> -mprofile-kernel ABI on ppc64. This is not supported.
>
> Disable ftrace on ppc32 if using clang for now. This can be re-enabled
> later if clang picks up support for -fpatchable-function-entry on ppc32.
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>

Thanks for the patch! I've filed the below bug, a link to whom I'd
like to see retained in the commit message. In the future, please file
bugs against the compiler vendors first, then include the relevant
link.

Link: https://github.com/llvm/llvm-project/issues/63220
Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/powerpc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index bff5820b7cda14..d85e3cf4016d90 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -236,7 +236,7 @@ config PPC
>         select HAVE_FUNCTION_DESCRIPTORS        if PPC64_ELF_ABI_V1
>         select HAVE_FUNCTION_ERROR_INJECTION
>         select HAVE_FUNCTION_GRAPH_TRACER
> -       select HAVE_FUNCTION_TRACER
> +       select HAVE_FUNCTION_TRACER             if PPC64 || (PPC32 && CC_=
IS_GCC)
>         select HAVE_GCC_PLUGINS                 if GCC_VERSION >=3D 50200=
   # plugin support on gcc <=3D 5.1 is buggy on PPC
>         select HAVE_GENERIC_VDSO
>         select HAVE_HARDLOCKUP_DETECTOR_ARCH    if PPC_BOOK3S_64 && SMP
>
> base-commit: bd517a8442b6c6646a136421cd4c1b95bf4ce32b
> --
> 2.40.1
>


--=20
Thanks,
~Nick Desaulniers
