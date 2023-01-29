Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AF8BD03;
	Sun, 29 Jan 2023 01:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674956885; x=1706492885;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IfwC1uDezLs5r3oeEaBU+BWXPbPb1AaUTM0P8REO6Kw=;
  b=fq3c4/JXP/RWHARk3UyDE0me/TLsmszkA35ltOSwnxTNHv9XRWSigDam
   gI6jzJs24fwiiG4YTV9nK0nJ5NXSDtcMrMY/YR7DBuThOEuzyKPr8P/ty
   KK25PmG9483WKJh40XIxVIPv4gdb4MEtC7hrXjVRrhk031q1Z3DXypX9G
   1NEmd6o7So8aV54ZHiNONhYuwvGX4z20trjbOBWjwQQ74a5YuBFmuLlKD
   cO/O3FqLav4tf3e+RimCsmafhWEsVxNvOOv0ElaKMC7rESv2uHO8fMFI5
   JN4tAAIZs1K46pghZv8GkD2QUylNJdbJ+o6H8ATB/3J9LaCple8xsMRhp
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="391911442"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="391911442"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 17:48:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="752398158"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="752398158"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2023 17:48:02 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLwna-0001Ka-0T;
	Sun, 29 Jan 2023 01:48:02 +0000
Date: Sun, 29 Jan 2023 09:47:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:paulmck/linux-rcu/peterz.2023.01.26a 67/68]
 vmlinux.o: warning: objtool: sched_clock+0x4: call to
 __SCT__pv_sched_clock() leaves .noinstr.text section
Message-ID: <202301290940.V1kdUGkz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: Peter Zijlstra <peterz@infradead.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/peterz.2023.01.26a
head:   f9588508f16615daf50ae4e3e16f40b6be874154
commit: a154b2be84be9d2bb446f91236b690de7ebcc401 [67/68] x86: Mark sched_clock() noinstr
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230129/202301290940.V1kdUGkz-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/a154b2be84be9d2bb446f91236b690de7ebcc401
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/peterz.2023.01.26a
        git checkout a154b2be84be9d2bb446f91236b690de7ebcc401
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: sched_clock+0x4: call to __SCT__pv_sched_clock() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_enter+0x76: call to __kasan_check_write() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __ct_user_exit+0x4b: call to __kasan_check_write() leaves .noinstr.text section


objdump-func vmlinux.o sched_clock:
0000 0000000000001a80 <sched_clock>:
0000     1a80:	f3 0f 1e fa          	endbr64
0004     1a84:	e9 00 00 00 00       	jmp    1a89 <sched_clock+0x9>	1a85: R_X86_64_PLT32	__SCT__pv_sched_clock-0x4
0009     1a89:	cc                   	int3
000a     1a8a:	cc                   	int3
000b     1a8b:	cc                   	int3
000c     1a8c:	cc                   	int3
000d     1a8d:	cc                   	int3
000e     1a8e:	cc                   	int3
000f     1a8f:	cc                   	int3

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
