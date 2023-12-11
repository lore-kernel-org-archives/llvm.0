Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216AF53E36
	for <llvm@lists.linux.dev>; Mon, 11 Dec 2023 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nByBboe4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3362216835eso1066274f8f.3
        for <llvm@lists.linux.dev>; Mon, 11 Dec 2023 13:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702330597; x=1702935397; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vppo7NU6Ebv3ckyFDeCWLvuP+8JGYLLMsJt0+DiFg4=;
        b=nByBboe46dS040G42BDnpVRQxQfa/cVVc9mBlRUaGLbb0rc+Gijum9wp5V7AsZ8omd
         uZ+Cp24YuFZeryrzp9E6/TNnpeGsBk9kMCKOLOwo9TO8Z+TmV93PIiIs77ddjqUHi4Xh
         qm3UmpoufB0ZniSBELurnIcvmibYJjSEG540vLfI5lHWeGRrGAfvQHNGBCqaBjoO8k3R
         3b1azflqkUaK88Zqm7MnWBssDAtE4uWk0iRXh0xgJbhlQ0LHwqZcaRNCtQIi4CoJstlz
         KmdPMUHiGMO3yhMo+llflwskszwSZonyPnojfQP6q7XNt/9ZbfJ9T/OXqcJj4vV8QWCz
         HGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702330597; x=1702935397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Vppo7NU6Ebv3ckyFDeCWLvuP+8JGYLLMsJt0+DiFg4=;
        b=Q73R6hf9tKV1VrATh2L952FO8vZvPAn7reXdtN8FeL6DeXMx/lbc4S40f5Din9C1LO
         DfzBBDZ2cFZ/U7V/qUbmlXu+q7ng5/gj35PnjYgpeDlBo+qR/pLHCtxuyz6blcNHJEZt
         BWAq8iP66ze6D5lOSOSstuVRaJiVPpiWy63AZrO7GZyu7kMbO7LP8keFwZUZKGHCrakB
         +e0g3jHflwcybXXwPjsfo7VTZQS5KEyr7zgas3mLQww7Eh4GCcEucme+WlQFBbeGU5sC
         Oxz5zB/vYzoRgQP5t6Tq4gONTYa21lGTVFTesOjqmsS3hOhnOSYLqf03NJOAG6Gv8RmK
         /89A==
X-Gm-Message-State: AOJu0YyEAqvvvmRGe+pO3OIW3Xr4CWux7IJTYT+xysiWd9NPc+0ZukqS
	dC4zdr6JW2dv+xIkhKtK+60gMuYe/8e+k7nBzlfKJ0G8j3b/Qs7qP0vPiA==
X-Google-Smtp-Source: AGHT+IFUuTHQMfY1vC2ANr/q6GuCdL0vi+i/MuA/El7BUOtHVuk8oqmOKJ1YMKuhUCkiYpQTE6InNJ0NS0A8ml7jGCo=
X-Received: by 2002:a5d:510e:0:b0:333:55da:62b4 with SMTP id
 s14-20020a5d510e000000b0033355da62b4mr2424433wrt.111.1702330596929; Mon, 11
 Dec 2023 13:36:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312120116.CP1IYKWT-lkp@intel.com>
In-Reply-To: <202312120116.CP1IYKWT-lkp@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Dec 2023 13:36:22 -0800
Message-ID: <CAKwvOdk-f2CzzeKjEWyBi9MNM4spo9o90J_rsqtdNBy15GZ+Qw@mail.gmail.com>
Subject: Re: arch/mips/include/asm/mipsregs.h:2791:3: error: instruction
 requires a CPU feature not currently enabled
To: llvm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 9:48=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Nick,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
> commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14 scripts/Makefile.clang: =
default to LLVM_IAS=3D1
> date:   2 years, 4 months ago
> config: mips-malta_kvm_defconfig (https://download.01.org/0day-ci/archive=
/20231212/202312120116.CP1IYKWT-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231212/202312120116.CP1IYKWT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312120116.CP1IYKWT-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/mips/kvm/tlb.c:13:
>    In file included from include/linux/sched.h:12:
>    In file included from ./arch/mips/include/generated/asm/current.h:1:
>    In file included from include/asm-generic/current.h:5:
>    In file included from include/linux/thread_info.h:14:
>    In file included from include/linux/restart_block.h:10:
>    In file included from include/linux/time64.h:5:
>    In file included from include/linux/math64.h:6:
>    In file included from include/linux/math.h:5:
>    In file included from arch/mips/include/asm/div64.h:89:
>    In file included from include/asm-generic/div64.h:55:
>    In file included from include/linux/log2.h:12:
>    In file included from include/linux/bitops.h:32:
>    In file included from arch/mips/include/asm/bitops.h:19:
>    In file included from arch/mips/include/asm/barrier.h:11:
>    In file included from arch/mips/include/asm/addrspace.h:13:
>    In file included from arch/mips/include/asm/mach-malta/spaces.h:44:
>    In file included from arch/mips/include/asm/mach-generic/spaces.h:15:
> >> arch/mips/include/asm/mipsregs.h:2791:3: error: instruction requires a=
 CPU feature not currently enabled
>                    _ASM_SET_VIRT
>                    ^
>    arch/mips/include/asm/mipsregs.h:2073:36: note: expanded from macro '_=
ASM_SET_VIRT'
>    #define _ASM_SET_VIRT ".set\tvirt\n\t"
>                                       ^
>    <inline asm>:4:2: note: instantiated into assembly here
>            tlbgp
>            ^

https://github.com/ClangBuiltLinux/linux/issues/1532

>    In file included from arch/mips/kvm/tlb.c:13:
>    In file included from include/linux/sched.h:12:
>    In file included from ./arch/mips/include/generated/asm/current.h:1:
>    In file included from include/asm-generic/current.h:5:
>    In file included from include/linux/thread_info.h:14:
>    In file included from include/linux/restart_block.h:10:
>    In file included from include/linux/time64.h:5:
>    In file included from include/linux/math64.h:6:
>    In file included from include/linux/math.h:5:
>    In file included from arch/mips/include/asm/div64.h:89:
>    In file included from include/asm-generic/div64.h:55:
>    In file included from include/linux/log2.h:12:
>    In file included from include/linux/bitops.h:32:
>    In file included from arch/mips/include/asm/bitops.h:19:
>    In file included from arch/mips/include/asm/barrier.h:11:
>    In file included from arch/mips/include/asm/addrspace.h:13:
>    In file included from arch/mips/include/asm/mach-malta/spaces.h:44:
>    In file included from arch/mips/include/asm/mach-generic/spaces.h:15:
>    arch/mips/include/asm/mipsregs.h:2801:3: error: instruction requires a=
 CPU feature not currently enabled
>                    _ASM_SET_VIRT
>                    ^
>    arch/mips/include/asm/mipsregs.h:2073:36: note: expanded from macro '_=
ASM_SET_VIRT'
>    #define _ASM_SET_VIRT ".set\tvirt\n\t"
>                                       ^
>    <inline asm>:4:2: note: instantiated into assembly here
>            tlbgr
>            ^
>    In file included from arch/mips/kvm/tlb.c:13:
>    In file included from include/linux/sched.h:12:
>    In file included from ./arch/mips/include/generated/asm/current.h:1:
>    In file included from include/asm-generic/current.h:5:
>    In file included from include/linux/thread_info.h:14:
>    In file included from include/linux/restart_block.h:10:
>    In file included from include/linux/time64.h:5:
>    In file included from include/linux/math64.h:6:
>    In file included from include/linux/math.h:5:
>    In file included from arch/mips/include/asm/div64.h:89:
>    In file included from include/asm-generic/div64.h:55:
>    In file included from include/linux/log2.h:12:
>    In file included from include/linux/bitops.h:32:
>    In file included from arch/mips/include/asm/bitops.h:19:
>    In file included from arch/mips/include/asm/barrier.h:11:
>    In file included from arch/mips/include/asm/addrspace.h:13:
>    In file included from arch/mips/include/asm/mach-malta/spaces.h:44:
>    In file included from arch/mips/include/asm/mach-generic/spaces.h:15:
>    arch/mips/include/asm/mipsregs.h:2811:3: error: instruction requires a=
 CPU feature not currently enabled
>                    _ASM_SET_VIRT
>                    ^
>    arch/mips/include/asm/mipsregs.h:2073:36: note: expanded from macro '_=
ASM_SET_VIRT'
>    #define _ASM_SET_VIRT ".set\tvirt\n\t"
>                                       ^
>    <inline asm>:4:2: note: instantiated into assembly here
>            tlbgwi
>            ^
>    In file included from arch/mips/kvm/tlb.c:13:
>    In file included from include/linux/sched.h:12:
>    In file included from ./arch/mips/include/generated/asm/current.h:1:
>    In file included from include/asm-generic/current.h:5:
>    In file included from include/linux/thread_info.h:14:
>    In file included from include/linux/restart_block.h:10:
>    In file included from include/linux/time64.h:5:
>    In file included from include/linux/math64.h:6:
>    In file included from include/linux/math.h:5:
>    In file included from arch/mips/include/asm/div64.h:89:
>    In file included from include/asm-generic/div64.h:55:
>    In file included from include/linux/log2.h:12:
>    In file included from include/linux/bitops.h:32:
>    In file included from arch/mips/include/asm/bitops.h:19:
>    In file included from arch/mips/include/asm/barrier.h:11:
>    In file included from arch/mips/include/asm/addrspace.h:13:
>    In file included from arch/mips/include/asm/mach-malta/spaces.h:44:
>    In file included from arch/mips/include/asm/mach-generic/spaces.h:15:
>    arch/mips/include/asm/mipsregs.h:2801:3: error: instruction requires a=
 CPU feature not currently enabled
>                    _ASM_SET_VIRT
>                    ^
>    arch/mips/include/asm/mipsregs.h:2073:36: note: expanded from macro '_=
ASM_SET_VIRT'
>    #define _ASM_SET_VIRT ".set\tvirt\n\t"
>                                       ^
>    <inline asm>:4:2: note: instantiated into assembly here
>            tlbgr
>            ^
>    In file included from arch/mips/kvm/tlb.c:13:
>    In file included from include/linux/sched.h:12:
>    In file included from ./arch/mips/include/generated/asm/current.h:1:
>    In file included from include/asm-generic/current.h:5:
>    In file included from include/linux/thread_info.h:14:
>    In file included from include/linux/restart_block.h:10:
>    In file included from include/linux/time64.h:5:
>    In file included from include/linux/math64.h:6:
>    In file included from include/linux/math.h:5:
>    In file included from arch/mips/include/asm/div64.h:89:
>    In file included from include/asm-generic/div64.h:55:
>
>
> vim +2791 arch/mips/include/asm/mipsregs.h
>
> ^1da177e4c3f41 include/asm-mips/mipsregs.h      Linus Torvalds 2005-04-16=
  2780
> ^1da177e4c3f41 include/asm-mips/mipsregs.h      Linus Torvalds 2005-04-16=
  2781  /*
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2782   * Guest TLB operations.
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2783   *
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2784   * It is responsibility of the caller to take care of any TLB hazar=
ds.
> ^1da177e4c3f41 include/asm-mips/mipsregs.h      Linus Torvalds 2005-04-16=
  2785   */
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2786  static inline void guest_tlb_probe(void)
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2787  {
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2788         __asm__ __volatile__(
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2789                 ".set push\n\t"
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2790                 ".set noreorder\n\t"
> 00b4eb408aaff2 arch/mips/include/asm/mipsregs.h James Hogan    2017-11-22=
 @2791                 _ASM_SET_VIRT
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2792                 "tlbgp\n\t"
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2793                 ".set pop");
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2794  }
> 7eb91118227d71 arch/mips/include/asm/mipsregs.h James Hogan    2016-05-11=
  2795
>
> :::::: The code at line 2791 was first introduced by commit
> :::::: 00b4eb408aaff21aeb806de24c5ff25b398083a4 MIPS: VZ: Update helpers =
to use new asm macros
>
> :::::: TO: James Hogan <jhogan@kernel.org>
> :::::: CC: James Hogan <jhogan@kernel.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Thanks,
~Nick Desaulniers
