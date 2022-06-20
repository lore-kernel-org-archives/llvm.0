Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1913D6E
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 20:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655755736; x=1687291736;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Rw/YyR8KzMNSjksmV6Tzc+8yzOKGmflI9bnBoEpcFSk=;
  b=EgtpoCnzdIhvg3BVZKHdFjALf5m2xd5bzhRmAQAtzDpAMwFxQczLYK9l
   MD6970Irh2q/UaMbBZmEQq78EI26362Ro9xJs546839u262MZBxYPXMXe
   gmlLqqz1hGI2fJLyhjiSlOGwOuHZOSzmMvSCd8kIxRcf5KM9mOSy35HX3
   I9nk+ciNh4ptbYjjhgizhrPurmr+VTqsww46iaAJB8CBzo9FsBzaru67X
   uVtCmNgkFyYWrFIWCwODkslbz49DCpNs/3/cusEb8FnwhTmzVMos9Yy9O
   ukCnlLlGSZxTl3M1ML5AgskeI10alIaArD8z1PCy5E3gsmn4l88D5wt3b
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="268688248"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="268688248"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2022 13:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="591317230"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2022 13:08:55 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o3Nhe-000VnT-S0;
	Mon, 20 Jun 2022 20:08:54 +0000
Date: Tue, 21 Jun 2022 04:08:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2022.06.15c 12/12]
 vmlinux.o: warning: objtool: __ct_user_enter+0x75: call to
 __kasan_check_write() leaves .noinstr.text section
Message-ID: <202206210326.jhkcWRkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel@vger.kernel.org
TO: "Paul E. McKenney" <paulmck@kernel.org>
CC: Marco Elver <elver@google.com>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2022.06.15c
head:   39a7b06a0b5a00fc57b117d6abebf2d8dae21517
commit: 39a7b06a0b5a00fc57b117d6abebf2d8dae21517 [12/12] context_tracking: Use arch_atomic_read() in __ct_state for KASAN
config: x86_64-randconfig-r012-20220620 (https://download.01.org/0day-ci/archive/20220621/202206210326.jhkcWRkx-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/39a7b06a0b5a00fc57b117d6abebf2d8dae21517
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2022.06.15c
        git checkout 39a7b06a0b5a00fc57b117d6abebf2d8dae21517
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_leaf+0xe882: stack state mismatch: cfa1=4+400 cfa2=4+416
   vmlinux.o: warning: objtool: leaf_move_items+0xf8e: stack state mismatch: cfa1=4+160 cfa2=4+152
   vmlinux.o: warning: objtool: leaf_copy_boundary_item+0x3239: stack state mismatch: cfa1=4+240 cfa2=4+232
   vmlinux.o: warning: objtool: leaf_copy_items_entirely+0xd1d: stack state mismatch: cfa1=4+256 cfa2=4+248
   vmlinux.o: warning: objtool: balance_internal+0x5991: stack state mismatch: cfa1=4+312 cfa2=4+320
   vmlinux.o: warning: objtool: internal_move_pointers_items+0x7a0: stack state mismatch: cfa1=4+216 cfa2=4+208
   vmlinux.o: warning: objtool: sync_regs+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_enter+0x75: call to __kasan_check_write() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __ct_user_exit+0x4a: call to __kasan_check_write() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
