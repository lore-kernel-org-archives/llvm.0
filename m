Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36119441A
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 14:27:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u13so3075271lfn.5
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vVPqdnUfLoXatTXc15bcg0nhUyjA2e3G5yJNqLlYJCQ=;
        b=MqOKGHlFubPD3KsBefcVz9F6wXbCvDSAEF4Ezkx7YkU9R3TQO9bDXREtmH/oGHtvod
         1giSYYH2lrsBuxeDOpfOc/PuuswDwFjosAOjvqaVqV46inoMMJ6HhqErhxWOjX7KS9+A
         r3bKAxeW9OA98aKOYKGKqim9/qyxfpMD2AqFMv01kFdT/5NqXpdcpj54E8z1e//nEWBu
         F6fEUywVgpya+D0TvVmnOyrdQHUx/Gd+0BIrhgu/YS1dkFY3ozbr7NxIXE6/GZqbahlX
         iyouIzFROTE+w99RDbQqdA2PGYvvjDZXwFuLYZW/GUVMXVzXunnU042ha9wxUnRaxQUl
         01ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVPqdnUfLoXatTXc15bcg0nhUyjA2e3G5yJNqLlYJCQ=;
        b=Fot2miMtEas2bJyZ6XguhHoHFGHu1gM3zWnJjxidHvvmHalEMhpTL1rd7imNc+kCr0
         Pv5IYwsG/dv1r6SBxtoDAmI0/aE5mCwVjgeJZggVSztpdX/XEHkCdTyZnz2ZTI9M2cxC
         u/bPtwFEI41x1i/bjZIncaJgrQW/QaA6f8fwQJuI0/stGIVrXpBdNbyo2Fouu2yWADUR
         /93El8/o73gUecaw5a9+TQEG/iJzZ6eKFBiMMHQSH6dRdrxs1biNVqmXhy0xJpL8o6Kq
         0CNnEkSKc3JhE7GISyAL3uJdqjqTVQx7q2Rv0y/19yzKP1E5Su+yu/fafQ75JgczbEA2
         ZEpg==
X-Gm-Message-State: AJIora/la9+j6tCcD/UQoWhziStnUfVKOmI2Nx1Opvg4ynnCxff8Wtxa
	h5oWxfz2W43UrQrWGFdZfxEJO+Kyb8W0ihCH10yvGw==
X-Google-Smtp-Source: AGRyM1udVa2irl52OVMBnbqGFxA+aMG+iMRiI2R2lJXR6gMSb6uY94C6ywicucAlyyZxSxAiMOnEbLUPonXlaBWfboM=
X-Received: by 2002:a19:7902:0:b0:48a:6872:68ab with SMTP id
 u2-20020a197902000000b0048a687268abmr1918109lfc.626.1658413665896; Thu, 21
 Jul 2022 07:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220720232332.2720091-1-justinstitt@google.com>
In-Reply-To: <20220720232332.2720091-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 21 Jul 2022 07:27:34 -0700
Message-ID: <CAKwvOdnSjyOdCZZ9AegCyfns3bvH3fbtbVgdThO2+rJAE=1bag@mail.gmail.com>
Subject: Re: [PATCH] Makefile.extrawarn: re-enable -Wformat for clang
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 20, 2022 at 4:23 PM Justin Stitt <justinstitt@google.com> wrote:
>
> There's been an ongoing mission to re-enable the -Wformat warning for
> Clang. A previous attempt at enabling the warning showed that there were
> many instances of this warning throughout the codebase. The sheer amount
> of these warnings really polluted builds and thus -Wno-format was added
> to _temporarily_ toggle them off.
>
> After many patches the warning has largely been eradicated for x86,
> x86_64, arm, and arm64 on a variety of configs. The time to enable the
> warning has never been better as it seems for the first time we are
> ahead of them and can now solve them as they appear rather than tackling
> from a backlog.
>
> As to the root cause of this large backlog of warnings, Clang seems to
> pickup on some more nuanced cases of format warnings caused by implicit
> integer conversion as well as default argument promotions from
> printf-like functions.
>
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Previous attempt: (https://patchwork.kernel.org/project/linux-kbuild/patch/20190201210853.244043-1-jflat@chromium.org/)
>
> Note:
> For this patch to land on its feet, the plethora of supporting patches that
> fixed various -Wformat warnings need to be picked up. Thanfully, a lot
> of them have!
>
> Here are the patches still waiting to be picked up:
> * https://lore.kernel.org/all/20220718230626.1029318-1-justinstitt@google.com/
> * https://lore.kernel.org/all/20220711222919.2043613-1-justinstitt@google.com/

Hi Masahiro, Nathan, and Tom,
What are your thoughts for _when_ in the release cycle this should be
picked up?  I worry that if we don't remove this soon, we will
backslide, and more -Wformat issues will crop up making removing this
in the future like digging in sand.  Justin has chased down many
instances of this warning, and I'm happy to help clean up fallout from
landing this.

>
>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index f5f0d6f09053..9bbaf7112a9b 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -47,7 +47,6 @@ else
>
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-initializer-overrides
> -KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
>  KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
> --
> 2.37.0.170.g444d1eabd0-goog
>


-- 
Thanks,
~Nick Desaulniers
