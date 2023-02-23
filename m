Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A51C26
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 05:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE2BC433A4
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 05:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677130347;
	bh=tZWvuFXOQ4HwnaliWoOMC+207at9HmW9RXIymVau3A4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E0dB585LAZLCX8ruBHtIf+NtLVABjw/UDMACwB8krHa2waxmtdBimKuK7FU1c9vOs
	 zhKmbQTZw+6MSsxeqBYk/xN66IXjPnFnlF503tLXDFrwlkdwFvvnC9UYZ5f+vJ8SNK
	 5Z4jrS5lVWzWNTDpTLioIck6EKsY/s8fSt0wNDenL0siGW2Bxw/lYwkwsegBt8eMeu
	 gF0tshBVpBXMUcqUE59bLjQE6LxZSp41mSVmklHaJZHEBwdUnEQJljwGj0zKfcXB4/
	 Kual9bWMqtlEVvWqY6etRfc4lcPRpQgvpRvmqupiUmAz4D+4qi2DOv1bfBxV+QEM84
	 4ivZeTDkCqZAw==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1722c48a773so10214380fac.2
        for <llvm@lists.linux.dev>; Wed, 22 Feb 2023 21:32:27 -0800 (PST)
X-Gm-Message-State: AO0yUKWlsb5V2OPdpLlX0hWQkfln+rgN/bjc8xRFVvvZ8D764WNdLBU/
	ZDqsZy+SIAILKNU4SeAPH5s+BbLcujVqzWYe6oE=
X-Google-Smtp-Source: AK7set+JB77wQ5G/FBB0pH45ZewGFfkSLhtrofRqARHBfcEbCECO742zGSvt2l5pqjgTieH+tNqylMJOGX5Vo6DqUjY=
X-Received: by 2002:a05:6870:65a4:b0:163:a45a:9e41 with SMTP id
 fp36-20020a05687065a400b00163a45a9e41mr1075917oab.194.1677130346275; Wed, 22
 Feb 2023 21:32:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net> <63c2936e-6bc7-67e3-eaf3-0123333381f8@landley.net>
In-Reply-To: <63c2936e-6bc7-67e3-eaf3-0123333381f8@landley.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 23 Feb 2023 14:31:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNASA+Dpe9nv4afnueFeRj4BZDUccOFGJRPr7_rZQ7ZZKaA@mail.gmail.com>
Message-ID: <CAK7LNASA+Dpe9nv4afnueFeRj4BZDUccOFGJRPr7_rZQ7ZZKaA@mail.gmail.com>
Subject: Re: [PATCH 1/5] try generic compiler name "cc" before falling back to "gcc".
To: Rob Landley <rob@landley.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 22, 2023 at 5:41 AM Rob Landley <rob@landley.net> wrote:
>
> Distros like debian install the generic "cc" name for both gcc and clang,
> and the plumbing already does CC_VERSION_TEXT to include Makefile.clang.
>
> Previously: https://lkml.iu.edu/hypermail/linux/kernel/2202.0/01505.html
> Signed-off-by: Rob Landley <rob@landley.net>
> ---
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 3f6628780eb2..0ac57ae3b45f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -456,7 +456,7 @@ endif
>  HOSTCC = $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
>  HOSTCXX        = $(LLVM_PREFIX)clang++$(LLVM_SUFFIX)
>  else
> -HOSTCC = gcc
> +HOSTCC := $(shell cc --version >/dev/null 2>&1 && echo cc || echo gcc)



'cc' only makes sense for the host compiler,
which is configured by 'update-alternative'.

I tried it before, but LLVM folks preferred
using $(LLVM) to choose clang/gcc.






>  HOSTCXX        = g++
>  endif
>  HOSTRUSTC = rustc
> @@ -503,7 +503,8 @@ OBJDUMP             = $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF                = $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP          = $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
>  else
> -CC             = $(CROSS_COMPILE)gcc
> +CC             := $(CROSS_COMPILE)$(shell $(CROSS_COMPILE)cc --version \
> +                       >/dev/null 2>&1 && echo cc || echo gcc)

This hunk sets up GCC/binutils.
So, cc does not make sense.  NACK.






>  LD             = $(CROSS_COMPILE)ld
>  AR             = $(CROSS_COMPILE)ar
>  NM             = $(CROSS_COMPILE)nm



-- 
Best Regards
Masahiro Yamada
