Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2656C6AB3
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 21:42:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id r14so3379243ljp.2
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wRbqgW25Md992aZiFQNaLfMNuOXLSkIclPSTYF16KUU=;
        b=kI3RWq6qU86SvhXJ+n4czGx32GlH4FX7gQPfGn/pCa+Z8RzNmoP1Z6qIBESW7Kr+25
         SpDwme5otXH0/kXwSzId0A2MvBEcMqpD9IN/UpRs+w+9oUS5SEBn9eNYe2plOp0AynYL
         OjltcH/TTdeL+Bi5wTm9B4D5uh0aZTVp1qKCIbMpti2LAAcCtpT8e/xe9P0SyX/lCH+b
         X2FSuTg87lwBMuJ4h27KrXBbdJt4kZdMJOHFAQXnY233rTuuM+lNnHTusvpbUicBjdNZ
         eJzxUSUosPMukXDVLdoGfH2HmvzJkiIwGKydvsOh5RJY5jNHpA4ry1QVsHjXwwMoyOG/
         uZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wRbqgW25Md992aZiFQNaLfMNuOXLSkIclPSTYF16KUU=;
        b=VC5ZJ4gzNLIgVCI6hhrU0cpkfBv7aSjb8gz4Cmwc29LUeHpjoWaMivE9B9rRNAgh5R
         Nxput76J2OdqpvTpyM2H+ky9Ses7z40bGKMqezSdHdOznQDUOlgHWV+QZTgRoCPXtrtM
         fa5Sq+qA2blLDSzzh4GyxXCaJ5K3Yv8NDJwsWN4UZJvmGQTIqh3NfrxnXpxkr87R4XDD
         B6yoeMYVRXhbfjTveovNezEx+hH5M+cnwB3rdhCnfn+r05Y5TEAbK7zY2CxnFVAeicYF
         roO1j3ar/HR3vomGOwKwCSl/OCcBnCM8H58Vbe5OY6Q8rsvUkrF5ft6TwjRkGk1a+Gp3
         3W5w==
X-Gm-Message-State: AJIora+HBdMESkILEu7bH1VgeRBDL1fd/JnvtAh2mZfcoEhM5ZMhhTwo
	xe0x2ShJTbalKcr1HY+ThPt7+j0e9vRZYitc1PfmLw==
X-Google-Smtp-Source: AGRyM1vOumvDj2RLhisOcU/m0l4DiaopArK0kFTBoJQSufKneeNaEsTSPD2PHZBdOJhBe2j7q/PVSkIkkssHHXRraU4=
X-Received: by 2002:a2e:3109:0:b0:25a:8a0c:40e2 with SMTP id
 x9-20020a2e3109000000b0025a8a0c40e2mr120698ljx.26.1658439741750; Thu, 21 Jul
 2022 14:42:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220721212012.4060328-1-justinstitt@google.com>
In-Reply-To: <20220721212012.4060328-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 21 Jul 2022 14:42:10 -0700
Message-ID: <CAKwvOd=wn=tbX7ixs9a=4zoVSbAU1qP-6NE04hGG9dzvo0zFJw@mail.gmail.com>
Subject: Re: [PATCH] drivers: lkdtm: fix clang -Wformat warning
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 21, 2022 at 2:20 PM Justin Stitt <justinstitt@google.com> wrote:
>
> When building with Clang we encounter the following warning
> (ARCH=hexagon + CONFIG_FRAME_WARN=0):
> | ../drivers/misc/lkdtm/bugs.c:107:3: error: format specifies type
> | 'unsigned long' but the argument has type 'int' [-Werror,-Wformat]
> |                 REC_STACK_SIZE, recur_count);
> |                 ^~~~~~~~~~~~~~
>
> Cast REC_STACK_SIZE to `unsigned long` to match format specifier `%lu`.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Reported by Nathan here:
> https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/
>
>  drivers/misc/lkdtm/bugs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index 009239ad1d8a..6381255aaecc 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -29,7 +29,7 @@ struct lkdtm_list {
>  #if defined(CONFIG_FRAME_WARN) && (CONFIG_FRAME_WARN > 0)
>  #define REC_STACK_SIZE (_AC(CONFIG_FRAME_WARN, UL) / 2)
>  #else
> -#define REC_STACK_SIZE (THREAD_SIZE / 8)
> +#define REC_STACK_SIZE ((unsigned long)(THREAD_SIZE / 8))

`THREAD_SIZE / 8UL` might be more concise.

>  #endif
>  #define REC_NUM_DEFAULT ((THREAD_SIZE / REC_STACK_SIZE) * 2)
>
> --
> 2.37.1.359.gd136c6c3e2-goog
>


-- 
Thanks,
~Nick Desaulniers
