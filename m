Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F332337C;
	Thu, 16 Mar 2023 02:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678933459; x=1710469459;
  h=date:from:cc:subject:message-id:mime-version;
  bh=D0nY6BATEh+ajtPGqyCpQvrGLnMjiNv+AVMvsl1etDw=;
  b=WOKzrLZ47pi59i/+srQc2Ru67SRShch/+vjOlUojMi0cVCTFibes2mHu
   cyjj3mo2erYhImCVVQ0MheRCx1Mt71JQ228WkqJe9thWa/1uOsP2PDH9s
   jvpI46CEl9r9T4Myfm7L1Q+JBOYJ3ThurMmFk1eKXDgbU8/u/ll8lAzJA
   TjAIgvbZQGYxzQKahuNe5wfgThZ2R4cB1d+k9Om4flRqNVjSRC9uGGvH3
   i7sYraUB1uiW1qZOXgq8SSG8YhW+shDMQv5QZNKTqN61s22QGebd1ZuIn
   H4htVRpzjocqnxcOyj0rynEPPYVk+pvOfAv9SZcs8GikeVQE5ap22yFRs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="400446508"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="400446508"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 19:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743932031"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="743932031"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 19:24:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcdHt-0008FX-27;
	Thu, 16 Mar 2023 02:24:17 +0000
Date: Thu, 16 Mar 2023 10:23:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 9399/9999] arch/x86/kernel/smp.o: warning:
 objtool: sysvec_reboot()+0x43: unreachable instruction
Message-ID: <202303161024.sBg5z9uA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   2ddbd0f967b34872290e0f98fae32b91b4de7b87
commit: 54aa76ad5f0148ad54fc7ad42ad5a079bc12efee [9399/9999] x86: Mark stop_this_cpu() __noreturn
config: x86_64-randconfig-a014-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161024.sBg5z9uA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=54aa76ad5f0148ad54fc7ad42ad5a079bc12efee
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 54aa76ad5f0148ad54fc7ad42ad5a079bc12efee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161024.sBg5z9uA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/smp.o: warning: objtool: sysvec_reboot()+0x43: unreachable instruction


objdump-func vmlinux.o sysvec_reboot:
0000 0000000000001f7f <sysvec_reboot>:
0000     1f7f:	55                   	push   %rbp
0001     1f80:	53                   	push   %rbx
0002     1f81:	48 89 fb             	mov    %rdi,%rbx
0005     1f84:	e8 00 00 00 00       	call   1f89 <sysvec_reboot+0xa>	1f85: R_X86_64_PLT32	irqentry_enter-0x4
000a     1f89:	f6 83 88 00 00 00 03 	testb  $0x3,0x88(%rbx)
0011     1f90:	75 4c                	jne    1fde <sysvec_reboot+0x5f>
0013     1f92:	89 c5                	mov    %eax,%ebp
0015     1f94:	65 8a 05 00 00 00 00 	mov    %gs:0x0(%rip),%al        # 1f9b <sysvec_reboot+0x1c>	1f97: R_X86_64_PC32	hardirq_stack_inuse-0x4
001c     1f9b:	84 c0                	test   %al,%al
001e     1f9d:	75 3f                	jne    1fde <sysvec_reboot+0x5f>
0020     1f9f:	65 c6 05 00 00 00 00 01 	movb   $0x1,%gs:0x0(%rip)        # 1fa7 <sysvec_reboot+0x28>	1fa2: R_X86_64_PC32	hardirq_stack_inuse-0x5
0028     1fa7:	65 4c 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%r11        # 1faf <sysvec_reboot+0x30>	1fab: R_X86_64_PC32	hardirq_stack_ptr-0x4
0030     1faf:	49 89 23             	mov    %rsp,(%r11)
0033     1fb2:	4c 89 dc             	mov    %r11,%rsp
0036     1fb5:	e8 00 00 00 00       	call   1fba <sysvec_reboot+0x3b>	1fb6: R_X86_64_PLT32	irq_enter_rcu-0x4
003b     1fba:	48 89 df             	mov    %rbx,%rdi
003e     1fbd:	e8 00 00 00 00       	call   1fc2 <sysvec_reboot+0x43>	1fbe: R_X86_64_PLT32	.text+0xb0154
0043     1fc2:	e8 00 00 00 00       	call   1fc7 <sysvec_reboot+0x48>	1fc3: R_X86_64_PLT32	irq_exit_rcu-0x4
0048     1fc7:	5c                   	pop    %rsp
0049     1fc8:	65 c6 05 00 00 00 00 00 	movb   $0x0,%gs:0x0(%rip)        # 1fd0 <sysvec_reboot+0x51>	1fcb: R_X86_64_PC32	hardirq_stack_inuse-0x5
0051     1fd0:	40 0f b6 f5          	movzbl %bpl,%esi
0055     1fd4:	48 89 df             	mov    %rbx,%rdi
0058     1fd7:	5b                   	pop    %rbx
0059     1fd8:	5d                   	pop    %rbp
005a     1fd9:	e9 00 00 00 00       	jmp    1fde <sysvec_reboot+0x5f>	1fda: R_X86_64_PLT32	irqentry_exit-0x4
005f     1fde:	e8 00 00 00 00       	call   1fe3 <sysvec_reboot+0x64>	1fdf: R_X86_64_PLT32	irq_enter_rcu-0x4
0064     1fe3:	48 89 df             	mov    %rbx,%rdi
0067     1fe6:	e8 00 00 00 00       	call   1feb <sysvec_reschedule_ipi>	1fe7: R_X86_64_PLT32	.text+0xb0154

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
