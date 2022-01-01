Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7540B168
	for <llvm@lists.linux.dev>; Sat,  1 Jan 2022 22:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641076082; x=1672612082;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MvCysr1gtyaNbU+Lq9bzipGxpjhnvKywCpyAV1FLpC8=;
  b=KZwbE0/EGXWSqkhD+D8X8xiTzd6nkvS/olQT/3viTYDqP2zeH6OrT3BX
   GahIXCh4esQPHdpEc3X9e/aKimWcBAqgGF1hHpJhdY9yk71knVXWICPRI
   4mEOhzUhkwLru2u+lIxUaMTO4GfFftfac2d+R+RmXvRwAE3wPPEC/kULH
   CyBemlLHX75K5sxgZVmHwSE2G+2yesq9AwRSxcUd0XhMZi3ak0xIikqXp
   gcePeJ24RlvCF3xdeRrzYXu8Am8mdTWXKPAuYAsVI818Exhr+rPoeDz/R
   DrBT8QgyjRdSwa6Lk4R1ZFNfhIC/JiPvyS39dkmDr+l+7I+1BDncz34ZK
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10214"; a="241882751"
X-IronPort-AV: E=Sophos;i="5.88,254,1635231600"; 
   d="scan'208";a="241882751"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2022 14:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,254,1635231600"; 
   d="scan'208";a="619919521"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Jan 2022 14:28:00 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n3mr2-000Cq0-8o; Sat, 01 Jan 2022 22:28:00 +0000
Date: Sun, 2 Jan 2022 06:27:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:paulmck/linux-rcu/kcsan 25/29] vmlinux.o:
 warning: objtool: vmx_update_host_rsp()+0x7e: call to __kcsan_check_access()
 leaves .noinstr.text section
Message-ID: <202201020611.kcsqMN88-lkp@intel.com>
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
TO: Marco Elver <elver@google.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/kcsan
head:   b473a3891c46393e9c4ccb4e3197d7fb259c7100
commit: bd3d5bd1a0ad386475ea7a3de8a91e7d8a600536 [25/29] kcsan: Support WEAK_MEMORY with Clang where no objtool support exists
config: x86_64-randconfig-a005-20220102 (https://download.01.org/0day-ci/archive/20220102/202201020611.kcsqMN88-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c054402170cd8466683a20385befc0523aba3359)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/bd3d5bd1a0ad386475ea7a3de8a91e7d8a600536
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/kcsan
        git checkout bd3d5bd1a0ad386475ea7a3de8a91e7d8a600536
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x18: call to static_key_count() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: vmx_update_host_rsp()+0x7e: call to __kcsan_check_access() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit()+0x89: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vmx_l1d_flush()+0xe: call to static_key_count() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0x13: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x8: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x55: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x5c: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x55: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exit_to_user_mode()+0x6e: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_exit_to_user_mode()+0x174: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x55: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit_to_user_mode()+0x75: call to __kcsan_check_access() leaves .noinstr.text section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
