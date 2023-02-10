Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05C433C0;
	Fri, 10 Feb 2023 15:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676044780; x=1707580780;
  h=date:from:cc:subject:message-id:mime-version;
  bh=c1c1OibmwmGzwzf2Uo1gMoX7bROgHnvoQ9L0quL4gEM=;
  b=IoeHKyvK2fN3JkTiqCBGi8tMfTtt1PaUiKrmggz8ce0H22lIwGiJtg59
   VgxpKAIM+fWK9SAIW2zZmSB4nj0Eq01wPI4jmabTlUbJ3OkAGA78lA8yt
   Zo0JeqtjoHQtG5s2sOWXZWWzmlUPCt0esbJGGBXmrgcEUzNdGiUwOsnw7
   E3r1V3wXAZ82LpTO95CGXxVKgjGV78bsBJLBkRump7lNX3LFzcZ5SOOTB
   20DRdAWyVaPAUEnysY/p2gZpx+Hio6Xlp56yGu5WZqjwhu+OD+eMa46gC
   zM2mXINNvCF0vYPrGb9gSCNUoQPiL9Jyci+6rFSmpB5sZH3n1t5j0Vk9d
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="332589132"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="332589132"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="698457543"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="698457543"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Feb 2023 07:59:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQVoI-0005sX-1q;
	Fri, 10 Feb 2023 15:59:38 +0000
Date: Fri, 10 Feb 2023 23:59:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] vmlinux.o: warning: objtool:
 __vmx_vcpu_run+0x108: stack layout conflict in alternatives
Message-ID: <202302102350.fZr3u4Ca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   cc1feb4e38be192cd99f7598777ff691f8a8a20e
commit: cc1feb4e38be192cd99f7598777ff691f8a8a20e [6/6] x86: Tweak FILL_RETURN_BUFFER some more
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230210/202302102350.fZr3u4Ca-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=cc1feb4e38be192cd99f7598777ff691f8a8a20e
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/core
        git checkout cc1feb4e38be192cd99f7598777ff691f8a8a20e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302102350.fZr3u4Ca-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __switch_to_asm+0x32: stack layout conflict in alternatives
>> vmlinux.o: warning: objtool: __vmx_vcpu_run+0x108: stack layout conflict in alternatives
   vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x33: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0xa7: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x71: call to __kasan_check_write() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __vmx_vcpu_run+0x97: objtool isn't smart enough to handle this CFI save/restore combo


objdump-func vmlinux.o __vmx_vcpu_run:
0000 00000000000003b0 <__vmx_vcpu_run>:
0000      3b0:	f3 0f 1e fa          	endbr64
0004      3b4:	55                   	push   %rbp
0005      3b5:	48 89 e5             	mov    %rsp,%rbp
0008      3b8:	41 57                	push   %r15
000a      3ba:	41 56                	push   %r14
000c      3bc:	41 55                	push   %r13
000e      3be:	41 54                	push   %r12
0010      3c0:	53                   	push   %rbx
0011      3c1:	57                   	push   %rdi
0012      3c2:	52                   	push   %rdx
0013      3c3:	56                   	push   %rsi
0014      3c4:	88 d3                	mov    %dl,%bl
0016      3c6:	48 8d 34 24          	lea    (%rsp),%rsi
001a      3ca:	e8 00 00 00 00       	call   3cf <__vmx_vcpu_run+0x1f>	3cb: R_X86_64_PLT32	vmx_update_host_rsp-0x4
001f      3cf:	eb 22                	jmp    3f3 <__vmx_vcpu_run+0x43>
0021      3d1:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0026      3d6:	8b bf b0 1f 00 00    	mov    0x1fb0(%rdi),%edi
002c      3dc:	65 8b 34 25 00 00 00 00 	mov    %gs:0x0,%esi	3e0: R_X86_64_32S	x86_spec_ctrl_current
0034      3e4:	39 fe                	cmp    %edi,%esi
0036      3e6:	74 0b                	je     3f3 <__vmx_vcpu_run+0x43>
0038      3e8:	b9 48 00 00 00       	mov    $0x48,%ecx
003d      3ed:	31 d2                	xor    %edx,%edx
003f      3ef:	89 f8                	mov    %edi,%eax
0041      3f1:	0f 30                	wrmsr
0043      3f3:	48 8b 04 24          	mov    (%rsp),%rax
0047      3f7:	f6 c3 01             	test   $0x1,%bl
004a      3fa:	48 8b 48 08          	mov    0x8(%rax),%rcx
004e      3fe:	48 8b 50 10          	mov    0x10(%rax),%rdx
0052      402:	48 8b 58 18          	mov    0x18(%rax),%rbx
0056      406:	48 8b 68 28          	mov    0x28(%rax),%rbp
005a      40a:	48 8b 70 30          	mov    0x30(%rax),%rsi
005e      40e:	48 8b 78 38          	mov    0x38(%rax),%rdi
0062      412:	4c 8b 40 40          	mov    0x40(%rax),%r8
0066      416:	4c 8b 48 48          	mov    0x48(%rax),%r9
006a      41a:	4c 8b 50 50          	mov    0x50(%rax),%r10
006e      41e:	4c 8b 58 58          	mov    0x58(%rax),%r11
0072      422:	4c 8b 60 60          	mov    0x60(%rax),%r12
0076      426:	4c 8b 68 68          	mov    0x68(%rax),%r13
007a      42a:	4c 8b 70 70          	mov    0x70(%rax),%r14
007e      42e:	4c 8b 78 78          	mov    0x78(%rax),%r15
0082      432:	48 8b 00             	mov    (%rax),%rax
0085      435:	74 08                	je     43f <__vmx_vcpu_run+0x8f>
0087      437:	0f 01 c3             	vmresume
008a      43a:	e9 b3 00 00 00       	jmp    4f2 <vmx_vmexit+0xab>
008f      43f:	0f 01 c2             	vmlaunch
0092      442:	e9 ab 00 00 00       	jmp    4f2 <vmx_vmexit+0xab>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
