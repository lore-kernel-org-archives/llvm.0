Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84CD33CC
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 17:03:52 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id z20so10898437plb.10
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uVVF0ywPHnxCaOhihQyyrYzXw/M4LRseJx/a5/YCvC8=;
        b=o1Ommk3uYo/CbyxjxhXIMbXpBvdodAlxFK6fxvbvvuBXf49xEXHZcZfCfK4zdEQm/D
         OwJaxylMlO3IN+8OHrebs6c+iYstHRuKU3Tlxf8CWx/uuj9FD7ZcOScErKlDkoKaiWca
         ZvV5JR8A6yJXZLwEwPG07Wt8VJeTsSsn7yukvuXy1pag4LC4VwUZJZopr9nm5CtHOykC
         yu4vi465kmGt6siZv749t3greEQwcXnOEms8Uw6iGnXohqRCDl/pDbLV1HKtbvO1GNix
         28RAvp1gXAwdZAaR1eFRcUUrs1/QRYYKfDkuJj8jOOjXMfYXnAawHiJ6bwvHO+IqdhfM
         nL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVVF0ywPHnxCaOhihQyyrYzXw/M4LRseJx/a5/YCvC8=;
        b=FIvXQvz405xCWO4U5GM6/Nx9T/6xnJj+oPlFL6EtZKoFLDofbNEpP6dZJUkD4wgVSX
         IvrwktaIfic1VKWA9CTKd2ntL+pglPy2tzmGkm+29zZSV1jl+1K9iWn7gzmJ3m3ez3eU
         C8XQ2zkU3GSU/O8ZUXjZvkNkxW9Ry1xHTP3FmvYNHandgmg9GM8mIwPsu9/kNNFnC9A9
         QUJiRJkIVTpakr+nIY28Bxbq6QxXUt1D7ffTfFB61CKSkZgC5MzzpCFcWDNK5tjCV0Is
         2ZJjNgF0HPl9mYydV7u02mHZdIWOGgkhrfunvo70x3mHo6SPJi0LGK0I9cyaISibCtb4
         jz3A==
X-Gm-Message-State: ACrzQf2oMx1Sn9NNiMNrXyR3g+YhoCzAOzbT5bVCya9RN29S3C/AoFqx
	E3DHNV16SEqNJx/rgDY26VJcL28Oxb+g0xroK6cOkMp7YOFsQw==
X-Google-Smtp-Source: AMsMyM5+7xDw0rqy938s2uCrs/AGRNsrVizRXzya0pre6w6guJSTEhqwaHnRr7ZV7/z3I2EtqL3Txe42qpuucrpBhY0=
X-Received: by 2002:a17:90b:3a88:b0:209:f35d:ad53 with SMTP id
 om8-20020a17090b3a8800b00209f35dad53mr32872220pjb.102.1665421431985; Mon, 10
 Oct 2022 10:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210072120.V1O2SuKY-lkp@intel.com>
In-Reply-To: <202210072120.V1O2SuKY-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Oct 2022 10:03:40 -0700
Message-ID: <CAKwvOd=CgD0xaUA4sUqbofJjA2x_peOuVh=YTV_GuiUNNTjACA@mail.gmail.com>
Subject: Re: arch/arm/include/asm/xor.h:60:3: error: write to reserved
 register 'R7'
To: kernel test robot <lkp@intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, "Steven Rostedt (Google)" <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 7, 2022 at 6:16 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Ard,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

Thanks for the report. Filed
https://github.com/ClangBuiltLinux/linux/issues/1732
to follow up on this.

>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   4c86114194e644b6da9107d75910635c9e87179e
> commit: d6800ca73a7d325627c045c16d7cfdc7465f4333 Revert "ARM: 9144/1: forbid ftrace with clang and thumb2_kernel"
> date:   8 months ago
> config: arm-randconfig-r013-20221007
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d6800ca73a7d325627c045c16d7cfdc7465f4333
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout d6800ca73a7d325627c045c16d7cfdc7465f4333
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from crypto/xor.c:17:
> >> arch/arm/include/asm/xor.h:60:3: error: write to reserved register 'R7'
>                    GET_BLOCK_4(p1);
>                    ^
>    arch/arm/include/asm/xor.h:20:10: note: expanded from macro 'GET_BLOCK_4'
>            __asm__("ldmia  %0, {%1, %2, %3, %4}" \
>                    ^
>    arch/arm/include/asm/xor.h:62:3: error: write to reserved register 'R7'
>                    PUT_BLOCK_4(p1);
>                    ^
>    arch/arm/include/asm/xor.h:42:23: note: expanded from macro 'PUT_BLOCK_4'
>            __asm__ __volatile__("stmia     %0!, {%2, %3, %4, %5}" \
>                                 ^
>    arch/arm/include/asm/xor.h:81:3: error: write to reserved register 'R7'
>                    GET_BLOCK_4(p1);
>                    ^
>    arch/arm/include/asm/xor.h:20:10: note: expanded from macro 'GET_BLOCK_4'
>            __asm__("ldmia  %0, {%1, %2, %3, %4}" \
>                    ^
>    arch/arm/include/asm/xor.h:84:3: error: write to reserved register 'R7'
>                    PUT_BLOCK_4(p1);
>                    ^
>    arch/arm/include/asm/xor.h:42:23: note: expanded from macro 'PUT_BLOCK_4'
>            __asm__ __volatile__("stmia     %0!, {%2, %3, %4, %5}" \
>                                 ^
>    4 errors generated.
>
>
> vim +/R7 +60 arch/arm/include/asm/xor.h
>
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  13
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  14  #define GET_BLOCK_2(dst) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  15      __asm__("ldmia  %0, {%1, %2}" \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  16              : "=r" (dst), "=r" (a1), "=r" (a2) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  17              : "0" (dst))
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  18
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  19  #define GET_BLOCK_4(dst) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  20      __asm__("ldmia  %0, {%1, %2, %3, %4}" \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  21              : "=r" (dst), "=r" (a1), "=r" (a2), "=r" (a3), "=r" (a4) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  22              : "0" (dst))
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  23
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  24  #define XOR_BLOCK_2(src) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  25      __asm__("ldmia  %0!, {%1, %2}" \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  26              : "=r" (src), "=r" (b1), "=r" (b2) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  27              : "0" (src)); \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  28      __XOR(a1, b1); __XOR(a2, b2);
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  29
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  30  #define XOR_BLOCK_4(src) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  31      __asm__("ldmia  %0!, {%1, %2, %3, %4}" \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  32              : "=r" (src), "=r" (b1), "=r" (b2), "=r" (b3), "=r" (b4) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  33              : "0" (src)); \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  34      __XOR(a1, b1); __XOR(a2, b2); __XOR(a3, b3); __XOR(a4, b4)
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  35
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  36  #define PUT_BLOCK_2(dst) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  37      __asm__ __volatile__("stmia     %0!, {%2, %3}" \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  38              : "=r" (dst) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  39              : "0" (dst), "r" (a1), "r" (a2))
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  40
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  41  #define PUT_BLOCK_4(dst) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  42      __asm__ __volatile__("stmia     %0!, {%2, %3, %4, %5}" \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  43              : "=r" (dst) \
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  44              : "0" (dst), "r" (a1), "r" (a2), "r" (a3), "r" (a4))
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  45
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  46  static void
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  47  xor_arm4regs_2(unsigned long bytes, unsigned long *p1, unsigned long *p2)
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  48  {
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  49      unsigned int lines = bytes / sizeof(unsigned long) / 4;
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  50      register unsigned int a1 __asm__("r4");
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  51      register unsigned int a2 __asm__("r5");
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  52      register unsigned int a3 __asm__("r6");
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  53      register unsigned int a4 __asm__("r7");
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  54      register unsigned int b1 __asm__("r8");
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  55      register unsigned int b2 __asm__("r9");
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  56      register unsigned int b3 __asm__("ip");
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  57      register unsigned int b4 __asm__("lr");
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  58
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  59      do {
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16 @60              GET_BLOCK_4(p1);
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  61              XOR_BLOCK_4(p2);
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  62              PUT_BLOCK_4(p1);
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  63      } while (--lines);
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  64  }
> ^1da177e4c3f41 include/asm-arm/xor.h Linus Torvalds 2005-04-16  65
>
> :::::: The code at line 60 was first introduced by commit
> :::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2
>
> :::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp



-- 
Thanks,
~Nick Desaulniers
