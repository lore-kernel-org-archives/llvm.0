Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AABED5
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652713397; x=1684249397;
  h=date:from:cc:subject:message-id:mime-version;
  bh=mdUtOE5FSj1p4ZrkQTyIpEuu2tATZdqLMnnoNz27fCQ=;
  b=Uq1lZXpJu1uwYPC6PvEd0vpSdrJmiV28KqDMMV4XaeozSFJ706f1xLvJ
   +PYftWCmXWDmq67KT2cxACYrcYH7jnqS3wyfPvVV8aErmUqB8Ktq6F5QM
   Y3h7OeoEAOSmz9lLP+BE9+DhTUkapb95YHQ/HbDowkoNsFjmBlEcoysxj
   m0mpeaf7KhPOJ+QyjOyhZgLN8QpF0F0a+wIsAIAZ1n92w0xBdRpigcH4Y
   OliXVkc7EWOyF/d80TZvERiDUk7kXZkqX1EhEGxgY7k/DQEYv3vl1pr3B
   IQJW0IdgLRVSQqm3kmjY8xpGpOYdht9XTDSGNU6uAsj9l/y/mKc4l1+ds
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="252920557"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="252920557"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 08:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="574051712"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 May 2022 08:02:34 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqcEz-00007p-9A;
	Mon, 16 May 2022 15:02:33 +0000
Date: Mon, 16 May 2022 23:02:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: .altinstr_replacement+0x5e4: call
 without frame pointer save/setup
Message-ID: <202205162203.X9ZMQm2k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42226c989789d8da4af1de0c31070c96726d990c
commit: ed53a0d971926e484d86cce617ec02a7ee85c3fe x86/alternative: Use .ibt_endbr_seal to seal indirect calls
date:   9 weeks ago
config: x86_64-randconfig-a005-20220516 (https://download.01.org/0day-ci/archive/20220516/202205162203.X9ZMQm2k-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ed53a0d971926e484d86cce617ec02a7ee85c3fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ed53a0d971926e484d86cce617ec02a7ee85c3fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest()+0x14: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: .altinstr_replacement+0x5e4: call without frame pointer save/setup
   vmlinux.o: warning: objtool: do_syscall_64()+0x9f: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0xb0: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x108: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x2a: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x14: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x11: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x30: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x39: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x30: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x30: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ibt_selftest()+0x1e: return with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
