Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CEF63E
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 17:51:43 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id bn33so20944799ljb.6
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l7hXKhWGjeEcs+khpwcGCmvFoDcx/GKGrlZ2jh0BxlI=;
        b=sk+tKRXHM2IngLuoMXbMO5D38y7nm/248UDBbwtMyxArJUXf+mlKvqiFHiVt4ZTDXS
         XseMc+bCUW1A4/PpVfEcGmTob9SjNAEG+Siy2anofSZJzgzDGcjIR1eOTW61J8MVQdql
         W+cVKOunhCc1qG2s8VO6JSV3wu7/jCaA2KhKuRKhMDKMZTDOFHPztOvsllMG1YS4RtDX
         Vl/LjZSEv89CmBiXKrslGApiy0qrp/WlsN4dI0HE3WDhO1K+4b+Ok7uid7Hiw9h3GeOA
         IWWA7qcZbvpO3oiKz8uHh0c9YeAJzs9HiS2eN0OIPlogqVyt2JtO0MwCZvhXAjt4GpYK
         wScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7hXKhWGjeEcs+khpwcGCmvFoDcx/GKGrlZ2jh0BxlI=;
        b=dDep4GqVv4LStcAx9RD6GSPYSEew1dJteId+8JIJMK+LjJa3K4SofD4C2dQ7ygr4Ac
         i8iZsXOpDVT8B2Pp8VeoUksduSfzUfFEUMKywtt5Bctcbx18Xy50Z8WBDs+dXIT7e4p+
         JTOdpITUVqjDuCxAmh+xjezrfmuqr243k4EPrZzCVpgTB18CPQqPSh4tcJ62FgckgO8g
         hh/UdTn2w4XYCLjir1wlHYqK/Ovli1R5cTwdpsc5dcear5ZVPwIDXDnrlfLnQ7vjd+aL
         h+46C59prClR+1mR7L4TWVRJfCpVEzvT3UryhzxMTxDhNp3SMwI4yN4RO+Mek/xrqZqV
         35wQ==
X-Gm-Message-State: AOAM533W2YsIMbV7QWqFpsxnZMyf4PKr0hYg7dasHjrkWCjTh47opXxM
	+okQT+fOTRB5CHyHNkDC54NRmVGn3j3bHP7iVD/Y4Q==
X-Google-Smtp-Source: ABdhPJwc4g1+tnNgptkpnh7MDkBXPuU8MLqJs8gmUyYZJKI5J8K5reugeGbV1rdIbF/ovznFDHZzxwctW+/8mjNcfvM=
X-Received: by 2002:a2e:3004:0:b0:223:c126:5d1a with SMTP id
 w4-20020a2e3004000000b00223c1265d1amr15912234ljw.408.1647885101104; Mon, 21
 Mar 2022 10:51:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203191213.tC0sjaY7-lkp@intel.com>
In-Reply-To: <202203191213.tC0sjaY7-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 21 Mar 2022 10:51:29 -0700
Message-ID: <CAKwvOdnEyGLi14b0qsc2=aSRafCrQD-Zyh+Oq+E-vx+c1viErg@mail.gmail.com>
Subject: Re: [peterz-queue:locking/core 17/19] arch/x86/kvm/x86.h:29:30:
 error: too many arguments to function call, expected 0, have 1
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 9:10 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> head:   200a79c670d24d4d9a75a6a9cbfd14af2f5d0ad9
> commit: 5c9f3806a4400c2957abeea9419547f856457a20 [17/19] lockdep: Fix -Wunused-parameter for _THIS_IP_
> config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220319/202203191213.tC0sjaY7-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=5c9f3806a4400c2957abeea9419547f856457a20
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue locking/core
>         git checkout 5c9f3806a4400c2957abeea9419547f856457a20
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/kvm/x86.c:22:
>    In file included from arch/x86/kvm/mmu.h:7:
>    In file included from arch/x86/kvm/cpuid.h:5:
> >> arch/x86/kvm/x86.h:29:30: error: too many arguments to function call, expected 0, have 1
>            lockdep_hardirqs_on_prepare(CALLER_ADDR0);
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~

Peter, I think you dropped the hunk to include/linux/kvm_host.h when
applying this patch?

Compare:
https://lore.kernel.org/lkml/20220314221909.2027027-1-ndesaulniers@google.com/
vs
https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/patch/?id=1923a1429507b15b2061968614a6943365159738

>    include/linux/ftrace.h:879:22: note: expanded from macro 'CALLER_ADDR0'
>    #define CALLER_ADDR0 ((unsigned long)ftrace_return_address0)
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/irqflags.h:23:15: note: 'lockdep_hardirqs_on_prepare' declared here
>      extern void lockdep_hardirqs_on_prepare(void);
>                  ^
>    In file included from arch/x86/kvm/x86.c:41:
>    include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
>                   _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
>       : ((x) & (bit1)) / ((bit1) / (bit2))))
>                        ^ ~~~~~~~~~~~~~~~~~
>    1 warning and 1 error generated.
> --
>    In file included from arch/x86/kvm/emulate.c:28:
> >> arch/x86/kvm/x86.h:29:30: error: too many arguments to function call, expected 0, have 1
>            lockdep_hardirqs_on_prepare(CALLER_ADDR0);
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~
>    include/linux/ftrace.h:879:22: note: expanded from macro 'CALLER_ADDR0'
>    #define CALLER_ADDR0 ((unsigned long)ftrace_return_address0)
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/irqflags.h:23:15: note: 'lockdep_hardirqs_on_prepare' declared here
>      extern void lockdep_hardirqs_on_prepare(void);
>                  ^
>    1 error generated.
>
>
> vim +29 arch/x86/kvm/x86.h
>
> 65297341d8e15b Uros Bizjak         2021-08-09  12
> bc908e091b3264 Sean Christopherson 2021-05-04  13  static __always_inline void kvm_guest_enter_irqoff(void)
> bc908e091b3264 Sean Christopherson 2021-05-04  14  {
> bc908e091b3264 Sean Christopherson 2021-05-04  15       /*
> bc908e091b3264 Sean Christopherson 2021-05-04  16        * VMENTER enables interrupts (host state), but the kernel state is
> bc908e091b3264 Sean Christopherson 2021-05-04  17        * interrupts disabled when this is invoked. Also tell RCU about
> bc908e091b3264 Sean Christopherson 2021-05-04  18        * it. This is the same logic as for exit_to_user_mode().
> bc908e091b3264 Sean Christopherson 2021-05-04  19        *
> bc908e091b3264 Sean Christopherson 2021-05-04  20        * This ensures that e.g. latency analysis on the host observes
> bc908e091b3264 Sean Christopherson 2021-05-04  21        * guest mode as interrupt enabled.
> bc908e091b3264 Sean Christopherson 2021-05-04  22        *
> bc908e091b3264 Sean Christopherson 2021-05-04  23        * guest_enter_irqoff() informs context tracking about the
> bc908e091b3264 Sean Christopherson 2021-05-04  24        * transition to guest mode and if enabled adjusts RCU state
> bc908e091b3264 Sean Christopherson 2021-05-04  25        * accordingly.
> bc908e091b3264 Sean Christopherson 2021-05-04  26        */
> bc908e091b3264 Sean Christopherson 2021-05-04  27       instrumentation_begin();
> bc908e091b3264 Sean Christopherson 2021-05-04  28       trace_hardirqs_on_prepare();
> bc908e091b3264 Sean Christopherson 2021-05-04 @29       lockdep_hardirqs_on_prepare(CALLER_ADDR0);
> bc908e091b3264 Sean Christopherson 2021-05-04  30       instrumentation_end();
> bc908e091b3264 Sean Christopherson 2021-05-04  31
> bc908e091b3264 Sean Christopherson 2021-05-04  32       guest_enter_irqoff();
> bc908e091b3264 Sean Christopherson 2021-05-04  33       lockdep_hardirqs_on(CALLER_ADDR0);
> bc908e091b3264 Sean Christopherson 2021-05-04  34  }
> bc908e091b3264 Sean Christopherson 2021-05-04  35
>
> :::::: The code at line 29 was first introduced by commit
> :::::: bc908e091b3264672889162733020048901021fb KVM: x86: Consolidate guest enter/exit logic to common helpers
>
> :::::: TO: Sean Christopherson <seanjc@google.com>
> :::::: CC: Thomas Gleixner <tglx@linutronix.de>
>
> ---
> 0-DAY CI Kernel Test Service
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Thanks,
~Nick Desaulniers
