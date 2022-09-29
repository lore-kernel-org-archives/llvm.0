Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB1B53A5
	for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 18:17:53 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 78so2128274pgb.13
        for <llvm@lists.linux.dev>; Thu, 29 Sep 2022 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nLT1oM8QWicP3ioul090HC9HcqJUN2HR9/MOAI6jcjw=;
        b=PyxKzwY3Vk3cc+OoJNLY60fNm4G3oIvAzdZrg5zVSCSu9dJnpznTMv65rbq0o7bUs0
         aftRtgYyKLbKbW1jsThHQvsCzscd4nmC6CpORmJ11/rWWk5Z0XXcjfbhiIRvlPBTYtTu
         gfqnSfNydnHSwkxQCQv2yAcY6+mgM0PBw2YvUcZuI/+FLtAh6yUoYphJrSoporHYMaBF
         3DoYLd05iu9KcIWKevhJhxS8DIynAEjsb4U6HeL1SNOtYXEIgY3Qijlx0977uB3GAT7V
         EJ46jHXtSxVp5ByJoL+ioZ9j9X9NqrBWPyqMMVqXaztBO8N9fd4SXySfUo1erlfkBdAw
         B4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nLT1oM8QWicP3ioul090HC9HcqJUN2HR9/MOAI6jcjw=;
        b=ksP9sehe66wqjK4ovM+Cd0JPxuBk0z6sJPt1K12E9cXyqSA/nBw4Hb9bOhQFUcat09
         JZ56+HoS8iURUKFMr+0a2jIE7qCGY52S0v8BHtixID2TYecpqfiDe1AQoMbjkYFP0CSB
         PAVM08KV8LIUDsyBcBFcz9Ga1chdsvW39GQer8VX0mpzfaRg1GG0qB+NJwbrfVj32LDq
         8Xz0E93ol3GfJRjj3OB1Q1rgp6zlbAt6SLNwzyK5KUnkE1lMViDCiUlhklu77zNvCnPI
         ML0Gy0HcQt4C2rbdjoTZmcr/rx/t5Z/1FM0Thmmljr07NH1/2KqjdavFjOoSgacXyCsk
         Z24Q==
X-Gm-Message-State: ACrzQf1JmkL+gXIbCDmuIVtyHJMaqOUjsne4u3aDEont6xWbk2/NWD3E
	q3jw7Mp+rIf9JByRIof6v2QDIEYTGOe2i6idkMd/Ow==
X-Google-Smtp-Source: AMsMyM7Htg0TT1qjR6Zvm2wA+9REqCpnz2fgFHOVlNGiiiHdLp5ohVQXYYynbLE39Hk59fQajP+3G5cCM7ueJSrtW8Y=
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id
 b9-20020a63e709000000b0043898e80d1cmr4077179pgi.403.1664475472752; Thu, 29
 Sep 2022 11:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929181223.2502994-1-masahiroy@kernel.org>
In-Reply-To: <20220929181223.2502994-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 29 Sep 2022 11:17:41 -0700
Message-ID: <CAKwvOdkTSns1oWzb9QG7_=DaNF2_QstdsJeKCgAEWVMmth0XWw@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: Check if linker supports the -X option"
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Marek <michal.lkml@markovi.net>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 11:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This reverts commit d79a27195a33f4b5e591de5536799ad874ea6cf5.
>
> According to the commit description, this ld-option test was added for
> the gold linker at that time.
>
> Commit 75959d44f9dc ("kbuild: Fail if gold linker is detected") gave
> up the gold linker support after all.
>
> I tested the BFD linker from binutils 2.23 and LLD from LLVM 11.0.0.
> Both of them support the -X option.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 49dcae886c48..d7c85ec79000 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1037,7 +1037,7 @@ KBUILD_LDFLAGS    += $(call ld-option,--no-warn-rwx-segments)
>  endif
>
>  ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
> -LDFLAGS_vmlinux        += $(call ld-option, -X,)
> +LDFLAGS_vmlinux        += -X
>  endif
>
>  ifeq ($(CONFIG_RELR),y)
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
