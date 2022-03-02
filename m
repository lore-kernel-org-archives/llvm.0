Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC472564
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 06:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD20C340F2
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 06:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646201739;
	bh=YSp9hoCF2BX+aImKFz88Lgvf7Tt4P6Rr3M01HPcXDho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nm3sFSyFkBAhCCXs61lgzUFsZFgPUFeMKWGuJEFdSldBjeB4BFKBpc8NGVqIlhoIj
	 XXRyehGHTvYS9Rannih/NGsfKONxS+XHZjkmDKXWs0elMXiOWo6YHMyEneEPgLp8Gm
	 TEeOvelgwWxFqfTOig4i5gl/Ir2pYMOdHyknq31G8nwckgYyiHhE4S7oYKLnJpcKBQ
	 oX7PVLWXuH0NtqR9zyKtBOk2PtvmDzNCOgYBfGHtAg63wfD1S/Ye2GzOlEtecFBJpF
	 QDADSzP7Rb4rDUmUH8NEJcOVzd547pZWhj2kBdJ6lOGMWcY74rgzugfIP/9Oqg1y2h
	 cfXVAeErCyrTg==
Received: by mail-yb1-f172.google.com with SMTP id j12so1271606ybh.8
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 22:15:39 -0800 (PST)
X-Gm-Message-State: AOAM532adkf93hP1OkI3NKrRvo//Hwr/WwqLnl6+oVeiRzlssiN9Mimu
	X8jlDUfxOtB6MOAO9SsRtBSBkeWCwc7B9AaIdK0=
X-Google-Smtp-Source: ABdhPJxG2+G97JEa3a+WZVo4ANpZ0XFRJyjYtaK1sQVx552uvcWlu9xKFz6oLzwpZVximM32OCyfi66CAcvCd212UhI=
X-Received: by 2002:a25:9d81:0:b0:622:7df3:ff6c with SMTP id
 v1-20020a259d81000000b006227df3ff6cmr27300977ybp.617.1646201738359; Tue, 01
 Mar 2022 22:15:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203020913.I6LbmH7l-lkp@intel.com>
In-Reply-To: <202203020913.I6LbmH7l-lkp@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 2 Mar 2022 07:15:27 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEhEUbiS1QcbAd2+6vg2gWoqYwoDhmxPb1r1GVerjTOTA@mail.gmail.com>
Message-ID: <CAMj1kXEhEUbiS1QcbAd2+6vg2gWoqYwoDhmxPb1r1GVerjTOTA@mail.gmail.com>
Subject: Re: [linux-next:master 4044/9592] arch/arm/kernel/ftrace.c:229:6:
 warning: no previous prototype for function 'prepare_ftrace_return'
To: kernel test robot <lkp@intel.com>, Rong Chen <rong.a.chen@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Memory Management List <linux-mm@kvack.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>
Content-Type: text/plain; charset="UTF-8"

(cc Rong Chen)

On Wed, 2 Mar 2022 at 03:52, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e6ada6df471f847da3b09b357e246c62335bc0bb
> commit: 41918ec82eb6f80c8b401422f27ca76c85aa0cb7 [4044/9592] ARM: ftrace: enable the graph tracer with the EABI unwinder
> config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20220302/202203020913.I6LbmH7l-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=41918ec82eb6f80c8b401422f27ca76c85aa0cb7
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 41918ec82eb6f80c8b401422f27ca76c85aa0cb7
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/kernel/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> arch/arm/kernel/ftrace.c:229:6: warning: no previous prototype for function 'prepare_ftrace_return' [-Wmissing-prototypes]
>    void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
>         ^
>    arch/arm/kernel/ftrace.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
>    ^
>    static
>    1 warning generated.
>

This function is asmlinkage so why is this still being reported?


>
> vim +/prepare_ftrace_return +229 arch/arm/kernel/ftrace.c
>
> 376cfa8730c08c0 Tim Bird                2010-10-09  226
> 376cfa8730c08c0 Tim Bird                2010-10-09  227  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  228  asmlinkage
> 376cfa8730c08c0 Tim Bird                2010-10-09 @229  void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  230                            unsigned long frame_pointer,
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  231                            unsigned long stack_pointer)
> 376cfa8730c08c0 Tim Bird                2010-10-09  232  {
> 376cfa8730c08c0 Tim Bird                2010-10-09  233         unsigned long return_hooker = (unsigned long) &return_to_handler;
> 376cfa8730c08c0 Tim Bird                2010-10-09  234         unsigned long old;
> 376cfa8730c08c0 Tim Bird                2010-10-09  235
> 376cfa8730c08c0 Tim Bird                2010-10-09  236         if (unlikely(atomic_read(&current->tracing_graph_pause)))
> 376cfa8730c08c0 Tim Bird                2010-10-09  237                 return;
> 376cfa8730c08c0 Tim Bird                2010-10-09  238
> 953f534a7ed6b72 Ard Biesheuvel          2022-01-25  239         if (IS_ENABLED(CONFIG_UNWINDER_FRAME_POINTER)) {
> 953f534a7ed6b72 Ard Biesheuvel          2022-01-25  240                 /* FP points one word below parent's top of stack */
> 953f534a7ed6b72 Ard Biesheuvel          2022-01-25  241                 frame_pointer += 4;
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  242         } else {
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  243                 struct stackframe frame = {
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  244                         .fp = frame_pointer,
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  245                         .sp = stack_pointer,
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  246                         .lr = self_addr,
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  247                         .pc = self_addr,
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  248                 };
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  249                 if (unwind_frame(&frame) < 0)
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  250                         return;
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  251                 if (frame.lr != self_addr)
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  252                         parent = frame.lr_addr;
> 41918ec82eb6f80 Ard Biesheuvel          2022-01-25  253                 frame_pointer = frame.sp;
> 953f534a7ed6b72 Ard Biesheuvel          2022-01-25  254         }
> 953f534a7ed6b72 Ard Biesheuvel          2022-01-25  255
> 376cfa8730c08c0 Tim Bird                2010-10-09  256         old = *parent;
> 376cfa8730c08c0 Tim Bird                2010-10-09  257         *parent = return_hooker;
> 376cfa8730c08c0 Tim Bird                2010-10-09  258
> f1f5b14afd7cce3 Steven Rostedt (VMware  2018-11-18  259)        if (function_graph_enter(old, self_addr, frame_pointer, NULL))
> 376cfa8730c08c0 Tim Bird                2010-10-09  260                 *parent = old;
> 376cfa8730c08c0 Tim Bird                2010-10-09  261  }
> dd686eb13959e49 Rabin Vincent           2010-11-06  262
>
> :::::: The code at line 229 was first introduced by commit
> :::::: 376cfa8730c08c0394d0aa1d4a80fd8c9971f323 ARM: ftrace: function graph tracer support
>
> :::::: TO: Tim Bird <tim.bird@am.sony.com>
> :::::: CC: Rabin Vincent <rabin@rab.in>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
