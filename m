Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8C17C
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 10:09:46 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id c137so10657313qkg.5
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 03:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kx69JRXRHaP9bPHWeCJjLQ/KjVRjWJF5OqT3P9q0cBs=;
        b=cN+PTUc1vBsKMPiJWtCXGX+p7d16+K/IdLRsQMRQ4S0EmYNg4OYYM1vYO41oTppJkA
         Dtvg3BusJhAY9Q1dZDNcqnvEmxOw51jH6qX4bfiQFAurQXc0J/6OwfxT6kneTT0eLNvF
         +mIIl9F3BUo+/LOGjZEDq2rc/KSkh1myRAzZ5OInrR1EsexjEcs1Xi6arNllgOrHVe6a
         +D9oI3eKbpNmIhTmKgXkujs1Ynk4DJyL6VS4om8jzqbSdexv5y49ZP3Yjln46kNe58kC
         F9D1SWhIfh2c4dWfHuXnJKttsues9uOdEzGaDj7pceemt7UFpf/srKib5c9Yoge8Wruj
         Czsw==
X-Gm-Message-State: AJIora9uaKXxvDE81oikz3zu6fxpz5JKKVHn5xiLvPIvDr4iIpXSst+Y
	3XsQheI932JTVExaGLopH4tu4Zc2Uw32PDTT
X-Google-Smtp-Source: AGRyM1vc16cg9Vrm35VcC/LmyEohvEjabEuy79EcYEsP4sGHWhb8VNKolCLY9D1UhVwd2YQrGkC7Gw==
X-Received: by 2002:a05:620a:1b83:b0:6af:483d:aed4 with SMTP id dv3-20020a05620a1b8300b006af483daed4mr26860955qkb.5.1657102185143;
        Wed, 06 Jul 2022 03:09:45 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id v123-20020a379381000000b006a6c230f5e0sm21234359qkd.31.2022.07.06.03.09.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:09:44 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31bf3656517so134420977b3.12
        for <llvm@lists.linux.dev>; Wed, 06 Jul 2022 03:09:44 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr10209449ywb.502.1657102184115; Wed, 06
 Jul 2022 03:09:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220624121313.2382500-1-alexandr.lobakin@intel.com> <20220624121313.2382500-4-alexandr.lobakin@intel.com>
In-Reply-To: <20220624121313.2382500-4-alexandr.lobakin@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 12:09:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWB8CjbOarttKSaY2=kASbqU2UBCe9bpU17=MdZP_rGUA@mail.gmail.com>
Message-ID: <CAMuHMdWB8CjbOarttKSaY2=kASbqU2UBCe9bpU17=MdZP_rGUA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] bitops: unify non-atomic bitops prototypes across architectures
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Matt Turner <mattst88@gmail.com>, Brian Cain <bcain@quicinc.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	"David S. Miller" <davem@davemloft.net>, Kees Cook <keescook@chromium.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Marco Elver <elver@google.com>, Borislav Petkov <bp@suse.de>, 
	Tony Luck <tony.luck@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	kernel test robot <lkp@intel.com>, alpha <linux-alpha@vger.kernel.org>, 
	"open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 24, 2022 at 2:13 PM Alexander Lobakin
<alexandr.lobakin@intel.com> wrote:
> Currently, there is a mess with the prototypes of the non-atomic
> bitops across the different architectures:
>
> ret     bool, int, unsigned long
> nr      int, long, unsigned int, unsigned long
> addr    volatile unsigned long *, volatile void *
>
> Thankfully, it doesn't provoke any bugs, but can sometimes make
> the compiler angry when it's not handy at all.
> Adjust all the prototypes to the following standard:
>
> ret     bool                            retval can be only 0 or 1
> nr      unsigned long                   native; signed makes no sense
> addr    volatile unsigned long *        bitmaps are arrays of ulongs
>
> Next, some architectures don't define 'arch_' versions as they don't
> support instrumentation, others do. To make sure there is always the
> same set of callables present and to ease any potential future
> changes, make them all follow the rule:
>  * architecture-specific files define only 'arch_' versions;
>  * non-prefixed versions can be defined only in asm-generic files;
> and place the non-prefixed definitions into a new file in
> asm-generic to be included by non-instrumented architectures.
>
> Finally, add some static assertions in order to prevent people from
> making a mess in this room again.
> I also used the %__always_inline attribute consistently, so that
> they always get resolved to the actual operations.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Yury Norov <yury.norov@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  arch/m68k/include/asm/bitops.h                | 49 ++++++++++-----

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
