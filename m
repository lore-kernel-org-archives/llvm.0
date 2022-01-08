Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA31168
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 11:49:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id f189-20020a1c1fc6000000b00347ac5ccf6cso2311818wmf.3
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 03:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TIQPStEwHsYCQix6ClSHzAfuLTp+Laib4nyBu+e0kwM=;
        b=LSeS14TMVX4vfr4DuRUTZEycyI9rRYiH46AnKHYBgHQqEbdLU00IMiSMoBNwEsSg+C
         SGzLOLMFRbEsGV4jCQow2e31qtbVlDLf27GP+uBERq/wNFbx4LJPWvfKlcy8iiHunbMZ
         u4qIzoWsACdjGvpCXtcWsdymXZFnQZvy+g5U616PxD9aujqHl1/YSXlx0kEA6HHp30I2
         LabgIZs2/5SfsRP0PodzOwFGdOyeQ7uqV48HX+xmSusij0Gb5Nbi/92u1ncKQFcCOxMS
         8Qxsrch0kXzSSY/KUyJeQ19yRlT5zAQxoulnEY0blpv8C/CSf4Zcm9uJktLhOfJ3+LPm
         EZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=TIQPStEwHsYCQix6ClSHzAfuLTp+Laib4nyBu+e0kwM=;
        b=Mch1fE0JKe1KsLd7S1ymPib6PbpDcBNUIsVY9TlgljbIrvqV9NdiM76q7/v18HTIKi
         OJSunT6DCPNyWfGnd7AV6rHUqC655hD0/ZQJEni5ZsIiTsylxD2fPrfWLHkKhI6ZN6EE
         awxW96j4wKg0+u+XeHzD3m8xaL1+SLS5mBgFr2hRcq8iPhTXjqJydZHiT6DkGGe21DaN
         x9ALAPhCwgPgrIz89ASV9Xk7BxxxLFqAw19y1Y20Ya+5PDJ7qe4KcSnND+wgOmRpu931
         Wrf9RU8YBsrMwo9m824TiXA6kxi61uNTquWxPIFcbjr9AP0dzB1PSJjDQNegfc3ZJ5hl
         EYkQ==
X-Gm-Message-State: AOAM533Vs2tRhPFRzWxQxHoIqjIKcTpBxQ+cJPvbO+n74k9Ax3CpD0IG
	98bFYl1GDcBg9QRklXYFRzY=
X-Google-Smtp-Source: ABdhPJxUlMOsDAYXYEahBIXZcX6MtCXb4bcH54TkG8AmFEtTZQ37zGFOVW5YumZ4MBcke35vZiVx6w==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr14392156wmc.140.1641642546676;
        Sat, 08 Jan 2022 03:49:06 -0800 (PST)
Received: from gmail.com (84-236-113-171.pool.digikabel.hu. [84.236.113.171])
        by smtp.gmail.com with ESMTPSA id r19sm532925wmh.42.2022.01.08.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 03:49:06 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sat, 8 Jan 2022 12:49:04 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Al Viro <viro@zeniv.linux.org.uk>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0000/2297] [ANNOUNCE, RFC] "Fast Kernel Headers" Tree
 -v1: Eliminate the Linux kernel's "Dependency Hell"
Message-ID: <Ydl6MATrfA1GA0G+@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
 <YdSI9LmZE+FZAi1K@archlinux-ax161>
 <YdTpAJxgI+s9Wwgi@gmail.com>
 <YdTvXkKFzA0pOjFf@gmail.com>
 <YdYQu9YxNw0CxJRn@archlinux-ax161>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdYQu9YxNw0CxJRn@archlinux-ax161>


* Nathan Chancellor <nathan@kernel.org> wrote:

> 5. Build error in arch/arm64/kvm/hyp/nvhe with LTO
> 
> With arm64 + CONFIG_LTO_CLANG_THIN=y, I see:
> 
> $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 defconfig
> 
> $ scripts/config -e LTO_CLANG_THIN
> 
> $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 olddefconfig arch/arm64/kvm/hyp/nvhe/
> ld.lld: error: arch/arm64/kvm/hyp/nvhe/hyp.lds:2: unknown directive: .macro
> >>> .macro __put, val, name
> >>> ^
> make[5]: *** [arch/arm64/kvm/hyp/nvhe/Makefile:51: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o] Error 1
> 
> I was not able to figure out the exact include chain but CONFIG_LTO
> causes asm/alternative-macros.h to be included in asm/rwonce.h, which
> eventually gets included in either asm/cache.h or asm/memory.h.
> 
> I managed to solve this with the following diff but I am not sure if
> there is a better or cleaner way to do that.
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 1bce62fa908a..e19572a205d0 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -5,7 +5,7 @@
>  #ifndef __ASM_RWONCE_H
>  #define __ASM_RWONCE_H
>  
> -#ifdef CONFIG_LTO
> +#if defined(CONFIG_LTO) && !defined(LINKER_SCRIPT)
>  
>  #include <linux/compiler_types.h>
>  #include <asm/alternative-macros.h>
> @@ -66,7 +66,7 @@
>  })
>  
>  #endif	/* !BUILD_VDSO */
> -#endif	/* CONFIG_LTO */
> +#endif	/* CONFIG_LTO && !LINKER_SCRIPT */

So the error message suggests that the linker script somehow ends up 
including asm-generic/export.h:

  kepler:~/mingo.tip.git> git grep 'macro __put'
  include/asm-generic/export.h:.macro __put, val, name

?

But I'd guess that similar to the __ASSEMBLY__ patterns we have in headers, 
not including the rwonce.h bits if LINKER_SCRIPT is defined is probably 
close to the right solution - but it would also know how such a low level 
header ended up in a linker script. Might have been to pick up some offset 
or size definition somewhere?

I.e. how did the build end up including asm/rwonce.h?

You can generally debug such weird dependency chains by putting a
debug #warning into the affected header - such as the patch below.

This prints a stack of the header dependencies:

    CC      kernel/sched/core.o
  In file included from ./include/linux/compiler.h:263,
                 from ./include/linux/static_call_types.h:7,
                 from ./include/linux/kernel.h:6,
                 from ./include/linux/highmem.h:5,
                 from kernel/sched/core.c:9:
  ./arch/arm64/include/asm/rwonce.h:8:2: warning: #warning debug [-Wcpp]
      8 | #warning debug

... and should in principle also work in the linker script context.

Thanks,

	Ingo

===============>
 arch/arm64/include/asm/rwonce.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 1bce62fa908a..5b3305381481 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -5,6 +5,8 @@
 #ifndef __ASM_RWONCE_H
 #define __ASM_RWONCE_H
 
+#warning debug
+
 #ifdef CONFIG_LTO
 
 #include <linux/compiler_types.h>
