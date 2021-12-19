Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861E429CA
	for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 04:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639887255; x=1671423255;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jQdm4y2s3dIApejZTYVtqGyy/yAJGRFU1wEpnHlNtwI=;
  b=TbbuNE7ybeQmWhEiSKfypfklpxJgVvU8XsAWg5EwSfXcKjG2L32x45d5
   wYYG3lFvDRE6tJx+3X+w7YJpbPmwwpUOkFrW6MNvjknjmjm+U6R3/nTJf
   09HoCvLqVVtRFzvzkRxoWqHrlEfZR/iB/yeHnRxPlEryhlQEGCXQyC16j
   LfXJHmN69me6X/JC2CWDod54CeTCqZKtbKKtlOyigojAbmIiiLiEARET3
   ibrxt07ig3moGwHJHH9I48NFlVRahf12IB3uE+s9qfMiildthvSHbe8qP
   /6Wf/KxRnONqZl5QpENSknI9i0T6HhIRqXaTe6XamxefrNTJiLkiNX9fj
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="219988172"
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; 
   d="scan'208";a="219988172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2021 20:14:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; 
   d="scan'208";a="520308848"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 18 Dec 2021 20:14:13 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mynaO-0006h2-EI; Sun, 19 Dec 2021 04:14:12 +0000
Date: Sun, 19 Dec 2021 12:14:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: vmx_update_host_rsp()+0x2d: call to
 __kasan_check_read() leaves .noinstr.text section
Message-ID: <202112191243.CFzzXRtq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: db2b0c5d7b6f19b3c2cab08c531b65342eb5252b objtool: Support pv_opsindirect calls for noinstr
date:   3 months ago
config: x86_64-randconfig-a002-20211219 (https://download.01.org/0day-ci/archive/20211219/202112191243.CFzzXRtq-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=db2b0c5d7b6f19b3c2cab08c531b65342eb5252b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout db2b0c5d7b6f19b3c2cab08c531b65342eb5252b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x1a: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0x28: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x2a: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: vmx_update_host_rsp()+0x2d: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_vcpu_enter_exit()+0x72: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_l1d_flush()+0xf: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sync_regs()+0x24: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x10: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x14: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x10b: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_setup()+0x13: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0x3d: call to mce_gather_info() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault()+0x38: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter()+0x42: call to __kasan_check_read() leaves .noinstr.text section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
