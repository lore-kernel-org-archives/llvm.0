Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF4129B2;
	Fri, 10 Feb 2023 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676040399; x=1707576399;
  h=date:from:cc:subject:message-id:mime-version;
  bh=X3xev8+tskKaG0Dy2mAgphq3OnYsBs3TUzAemdfTQzk=;
  b=J6m3hcPJjFGkVHgo9whHSe6vdytCRLxIOOfu66X3f1I5TiZXq4CNGeJb
   +Wjhq+ooIl6DUG9sof6dr9gLPA3z+9lUfkVRQSvGBpnzyWxqdST6Bnhk6
   B58qHU/bJOhAsWb76EjDR9S98fxoXVe+FDQGZdFU6pb94O5bsvLGLVpiP
   SngalpK+VH+BiQ0NmvtUd3ZoMJ9fbFEFi7bgUsjlK7ClPOOikmI1KVrUe
   fP4PXaUk01tu0CPfintNEBQQwlSSHo+R1lBZbzXPIWAD3oPJKFS3axsQm
   6uBagRsq0/nx0pXIsy0THd++nYQZRI6J4SV08dQBRNsuFHpHglJdaEa8A
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="328122444"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="328122444"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 06:46:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="756808500"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="756808500"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2023 06:46:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQUfd-0005qb-0Y;
	Fri, 10 Feb 2023 14:46:37 +0000
Date: Fri, 10 Feb 2023 22:46:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] vmlinux.o: warning: objtool:
 __switch_to_asm+0x22: stack layout conflict in alternatives
Message-ID: <202302102228.sghZkWJW-lkp@intel.com>
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
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230210/202302102228.sghZkWJW-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302102228.sghZkWJW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: __switch_to_asm+0x22: stack layout conflict in alternatives
   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x76: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x4b: call to __kasan_check_write() leaves .noinstr.text section


objdump-func vmlinux.o __switch_to_asm:
0000 0000000000002910 <__switch_to_asm>:
0000     2910:	f3 0f 1e fa          	endbr64
0004     2914:	55                   	push   %rbp
0005     2915:	53                   	push   %rbx
0006     2916:	41 54                	push   %r12
0008     2918:	41 55                	push   %r13
000a     291a:	41 56                	push   %r14
000c     291c:	41 57                	push   %r15
000e     291e:	48 89 a7 d8 23 00 00 	mov    %rsp,0x23d8(%rdi)
0015     2925:	48 8b a6 d8 23 00 00 	mov    0x23d8(%rsi),%rsp
001c     292c:	90                   	nop
001d     292d:	90                   	nop
001e     292e:	90                   	nop
001f     292f:	90                   	nop
0020     2930:	90                   	nop
0021     2931:	90                   	nop
0022     2932:	90                   	nop
0023     2933:	90                   	nop
0024     2934:	90                   	nop
0025     2935:	90                   	nop
0026     2936:	90                   	nop
0027     2937:	90                   	nop
0028     2938:	90                   	nop
0029     2939:	90                   	nop
002a     293a:	90                   	nop
002b     293b:	90                   	nop
002c     293c:	90                   	nop
002d     293d:	90                   	nop
002e     293e:	90                   	nop
002f     293f:	90                   	nop
0030     2940:	90                   	nop
0031     2941:	90                   	nop
0032     2942:	90                   	nop
0033     2943:	90                   	nop
0034     2944:	90                   	nop
0035     2945:	90                   	nop
0036     2946:	90                   	nop
0037     2947:	90                   	nop
0038     2948:	90                   	nop
0039     2949:	90                   	nop
003a     294a:	90                   	nop
003b     294b:	41 5f                	pop    %r15
003d     294d:	41 5e                	pop    %r14
003f     294f:	41 5d                	pop    %r13
0041     2951:	41 5c                	pop    %r12
0043     2953:	5b                   	pop    %rbx
0044     2954:	5d                   	pop    %rbp
0045     2955:	e9 00 00 00 00       	jmp    295a <__switch_to_asm+0x4a>	2956: R_X86_64_PLT32	__switch_to-0x4
004a     295a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
