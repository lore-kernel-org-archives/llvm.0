Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF446BC
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 18:46:08 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id q7so3519249lfu.5
        for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=jK40RXGDRPOTytfHjHl5rauDT3xxxYnRso/4al/XGPU=;
        b=T9DCS3cTH/nuB+1YeHhuvdjoHJ20yGJASVAmlYK1a2NT+2JtnuVb5zZd8NB6JQyOIB
         pviTc4Am0++P1lWZBkAqxmj32emKAVZa5V5ET50kE/fgsLMgTKxbQwnHrQjX6neu7A3S
         GgkAejd5H5Bp2cRPRJ/hsgo5yAXTjuXTyzTT6kSbcs5IWeOQzBtpGIfjxWgoDy8+7hMN
         RbSZ4yUVPvHm5yMosjsHxmQH39BVMSY/fAptFkb4WnwIkHGdXX9NcMXd1nfRKMnvB/RL
         9Nyd1UdEYFexM4rTVDXmKiJdAn7QfRjyb9xJ+wQFcPRl0AQtsiwZPS8zN299tdnf+e80
         czgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=jK40RXGDRPOTytfHjHl5rauDT3xxxYnRso/4al/XGPU=;
        b=MPxSxk+HI64JXPH22i32WFG1eJ6ePmAe0uwQKrft9xyKpVNJDqjuxtW6eMTDBa4oJp
         IVaOrwlXrY3Cq+fjfrnGLecD+A/L4tKkgkjrKmE9bt9S0qZIQ711HI4nfeB3WCzY3IDT
         pkEWGmIm2xV7C18WFmsnhe34ZibSTdgBDqOCYxdCZoQ5p7/gOVQt8MJEKrhymvrMFCgf
         zxD+VKqY2oYhsf5CDFkunpEfi2DTBTqsa0iftzln9di72VbmPwsa6aJBdQLbSE0afKc+
         TpeoAc7XFGbcDKza8JcV6v1/V5ieqw5gG4e8+BO9k7KAYCq9UTiVYd5KxEH9ssWdZUtg
         yieg==
X-Gm-Message-State: ACgBeo0Up5N7jshJ8V2F5VKIhWof8/9QTjyUtAN4LWnd+1jdRLYnwUmi
	4PhTlZJDzA8kOtIrsOTODOiGIsNGMid2MmSqSusWBQ==
X-Google-Smtp-Source: AA6agR4KumF285qiswcOzjSXUb8EYq6mkaWU+FOOy10Y2YwtDP8AXxfnFuUHUpAcljWMs+qp107a7uNYbeeSFqPzU7o=
X-Received: by 2002:a05:6512:b01:b0:48b:a065:2a8b with SMTP id
 w1-20020a0565120b0100b0048ba0652a8bmr2719340lfu.401.1660934766166; Fri, 19
 Aug 2022 11:46:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819170053.2686006-1-ndesaulniers@google.com>
In-Reply-To: <20220819170053.2686006-1-ndesaulniers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 19 Aug 2022 11:45:54 -0700
Message-ID: <CAKwvOd=sDbV-aKvroQTdOvW6C32TW20fr4xT0S4-E=fKeS=aWg@mail.gmail.com>
Subject: Re: [PATCH] Kconfig: eradicate CC_HAS_ASM_GOTO
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, kvm@vger.kernel.org, llvm@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 19, 2022 at 10:01 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> diff --git a/arch/x86/include/asm/rmwcc.h b/arch/x86/include/asm/rmwcc.h
> index 8a9eba191516..c82f1b334207 100644
> --- a/arch/x86/include/asm/rmwcc.h
> +++ b/arch/x86/include/asm/rmwcc.h
> @@ -11,9 +11,7 @@
>
>  #define __CLOBBERS_MEM(clb...) "memory", ## clb
>
> -#if !defined(__GCC_ASM_FLAG_OUTPUTS__) && defined(CONFIG_CC_HAS_ASM_GOTO)
> -
> -/* Use asm goto */
> +#ifndef __GCC_ASM_FLAG_OUTPUTS__
>
>  #define __GEN_RMWcc(fullop, _var, cc, clobbers, ...)                   \
>  ({                                                                     \
> @@ -27,21 +25,6 @@ cc_label:    c = true;                                               \
>         c;                                                              \
>  })
>
> -#else /* defined(__GCC_ASM_FLAG_OUTPUTS__) || !defined(CONFIG_CC_HAS_ASM_GOTO) */
> -
> -/* Use flags output or a set instruction */
> -
> -#define __GEN_RMWcc(fullop, _var, cc, clobbers, ...)                   \
> -({                                                                     \
> -       bool c;                                                         \
> -       asm volatile (fullop CC_SET(cc)                                 \
> -                       : [var] "+m" (_var), CC_OUT(cc) (c)             \
> -                       : __VA_ARGS__ : clobbers);                      \
> -       c;                                                              \
> -})
> -
> -#endif /* defined(__GCC_ASM_FLAG_OUTPUTS__) || !defined(CONFIG_CC_HAS_ASM_GOTO) */
> -

^ probably don't want to remove the terminal endif. Will respin based
on feedback from Masahiro + Alexei.


-- 
Thanks,
~Nick Desaulniers
