Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC1C185B
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658232021; x=1689768021;
  h=date:from:cc:subject:message-id:mime-version;
  bh=QXwEIE0A+MbIoYbUYEOKlP1d8u685C+b83/0tMtBArY=;
  b=edQHpy96Y4oM2wjNxD9nraLVdYrtxiCax4fFBn30GCZCDdOZSYnDn6U1
   BPIE+RGY10fZIxbIa/uhy8lbWQLyYUfHFG+eQXOcItUr7nLhqU2X6daLA
   qlHISj7SOy+CyIayVNYDuQpZKf/Hmh16Qm/RVnJMDn9k4o3nEOaTKQivX
   9Drk5YUVj19NC0P+fneipuGqAdpWRnVh47Ao52cW1S8hELaDefKuPLZfb
   yEg0K8VWMg1SQ4VyEyFvMlPFqG2eau7S+F0huo2wU1c06woZDhuwUqdi7
   RnKoYp6A95ukcdhqexqJIeRny5xk3mfmtoDY4AJY+oVJtJeUtEv+bRkyO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="286485530"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="286485530"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 05:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="924746584"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2022 05:00:11 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDlta-0005co-LG;
	Tue, 19 Jul 2022 12:00:10 +0000
Date: Tue, 19 Jul 2022 20:00:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 6911/11568] vmlinux.o: warning: objtool:
 enter_from_user_mode+0xcd: call to preempt_count_add() leaves .noinstr.text
 section
Message-ID: <202207191954.CZ56ehMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Frederic Weisbecker <frederic@kernel.org>
CC: "Paul E. McKenney" <paulmck@kernel.org>
CC: Nicolas Saenz Julienne <nsaenzju@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   036ad6daa8f0fd357af7f50f9da58539eaa6f68c
commit: 171476775d32a40bfebf83250136c19b2e842672 [6911/11568] context_tracking: Convert state to atomic_t
config: x86_64-buildonly-randconfig-r002-20220718 (https://download.01.org/0day-ci/archive/20220719/202207191954.CZ56ehMv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=171476775d32a40bfebf83250136c19b2e842672
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 171476775d32a40bfebf83250136c19b2e842672
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x26: call to memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: enter_from_user_mode+0xcd: call to preempt_count_add() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode+0x266: call to preempt_count_add() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0xd0: call to preempt_count_add() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0xcd: call to preempt_count_add() leaves .noinstr.text section
   vmlinux.o: warning: objtool: balance_leaf+0x33ac: stack state mismatch: cfa1=4+232 cfa2=4+224
   vmlinux.o: warning: objtool: balance_internal+0x133c: stack state mismatch: cfa1=4+256 cfa2=4+264
   vmlinux.o: warning: objtool: .text.exynos_iommu_iova_to_phys: unexpected end of section
   vmlinux.o: warning: objtool: .text.exynos_iommu_map: unexpected end of section
   vmlinux.o: warning: objtool: .text.exynos_iommu_unmap: unexpected end of section
   vmlinux.o: warning: objtool: .text.exynos_iommu_domain_free: unexpected end of section
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3c: relocation to !ENDBR: twofish_enc_blk+0xaf


objdump-func vmlinux.o enter_from_user_mode+0xcd: call to preempt_count_add:

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
