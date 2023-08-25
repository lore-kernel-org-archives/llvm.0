Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD6518003
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 17:52:10 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-64f387094ddso7191536d6.3
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692985929; x=1693590729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2roYvGxddDhT2UnVE3yi26VcxSvjVBTKoMdz+KfeoM=;
        b=u6S8b9ReK2LOZLdgpJ2ui9fQ4UUxRl/5YculNXNvH96bZ1j3Eh8ILvqjDSCO9ROhEa
         TmftEGGI1D5qJHyaULPQY4lPWkrxf+gdurlVWJvLizBgqaG1LfFCHpICpuGhKF3iVoEi
         U9YUe1PzB6x8nogtFlQYRICCxMBnBAiDSJZ6cpLvYUxmCOhqTpqHQPGK+v2N6mTDbEuu
         PShEVQVqehxgBDYsUcVr1i6zJy9XEBH/PTeTpDOOwswzTDSVuWaU/2ZNzu/mVCeL7RyZ
         s5TtkNthg6PCjfkKdRkLL5RXOUwA36L9EBKhViLm1BD9ZNZXaNqQLWKiWM8s+HBocIku
         3JWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692985929; x=1693590729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2roYvGxddDhT2UnVE3yi26VcxSvjVBTKoMdz+KfeoM=;
        b=GhnyBzq4Fz82BR5c1zC0r7UfguvI3++cWjgFc/y3aAQGz6WU9GoSzTjcBNjQxr9v/O
         bWBDSegeje8aDqs/L3ujyitVeyXMEPu4SvDU3CV2GY5aomfuY8FuxZAseSj5/Sqt24+T
         1pDZhcMAZUUBOpT3iOrxJOAvWj9vYsxmAkyvqjlDAQDi4gJYUi5JknFXKFBeSR8YHB44
         kyAhGbq9uiCRBFrHSGD3YaTAhPgM7BTFbOQhjpOP40d48QyAiFm0pa3WJcVEyMtRk2UE
         CEBkjd/2VPpDgWjensuK+cHWNTMG5p5rhN6uurpNtzBVlX23z/v0RYvJTwuVfKEZ9Sqf
         uBKw==
X-Gm-Message-State: AOJu0YxY25v1nRx9LOgoSMmupDIWISQvuZj+ootsX5VAP/dPWnWiQivQ
	YVWlcimCYsLHARjIAxY7LZ4JdYsJPoTreJJLZ9fHHg==
X-Google-Smtp-Source: AGHT+IGUxNKEZlVXzuLwuAUA/0vZPZltHUF7Znf/9B7x6MsQzluJZzXU6UEqyQjqgMC4h2WrFMhoLuuzJI8xFeZWE8c=
X-Received: by 2002:a0c:8c8a:0:b0:63d:6138:1027 with SMTP id
 p10-20020a0c8c8a000000b0063d61381027mr17142838qvb.42.1692985929325; Fri, 25
 Aug 2023 10:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230825034659.1037627-1-yonghong.song@linux.dev>
In-Reply-To: <20230825034659.1037627-1-yonghong.song@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Aug 2023 10:51:58 -0700
Message-ID: <CAKwvOdk7knYxOzaeq4gWjTiy=zRk4wc1jgq0d6fyFS5x43Cv9g@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: Fix kallsyms_selftest failure
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>, Song Liu <song@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Fangrui Song <maskray@google.com>, kernel-team@fb.com, 
	Leizhen <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 8:49=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 016d997131d4..e12d26c10dba 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -188,16 +188,13 @@ static bool cleanup_symbol_name(char *s)
>
>  static int compare_symbol_name(const char *name, char *namebuf)
>  {
> -       int ret;
> -
> -       ret =3D strcmp(name, namebuf);
> -       if (!ret)
> -               return ret;
> -
> -       if (cleanup_symbol_name(namebuf) && !strcmp(name, namebuf))
> -               return 0;
> -
> -       return ret;
> +       /* The kallsyms_seqs_of_names is sorted based on names after
> +        * cleanup_symbol_name() (see scripts/kallsyms.c) if clang lto is=
 enabled.
> +        * To ensure correct bisection in kallsyms_lookup_names(), do
> +        * cleanup_symbol_name(namebuf) before comparing name and namebuf=
.
> +        */
> +       cleanup_symbol_name(namebuf);

Hi Yonghong,
Thanks for your work on this patch.
So if this change is removing the last place where the return value of
cleanup_symbol_name is checked, then perhaps this commit should
additionally change the function signature of cleanup_symbol_name to
have `void` return type.

--=20
Thanks,
~Nick Desaulniers
