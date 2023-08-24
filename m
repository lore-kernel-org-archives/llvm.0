Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2EBA93E;
	Thu, 24 Aug 2023 22:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692915866; x=1724451866;
  h=date:from:cc:subject:message-id:mime-version;
  bh=WQiXwC9pzq6vdUB+H7Zl+HDgTaO4GZfvZznOCZmo3Uk=;
  b=NjfDEmkg3/RJIAMCJh+bXW4C5xOv/CQaMHmpgEBf8rKBsYjq4Dp4jhIm
   0IINSvy4Y0ghFoxHKGRmD3WlH6mFw7V9Kvg2tEOAXxlTIsO1eyCaXr74X
   kol+u+aS52G/FM5Aox2WGbRPuL7SiB+icmnhnDvCci1cSX/8nelsY6Lak
   XZc3+7FKgdg7G/YWcVeBYRitNtWp9UFwgDCCzwd4GL4Iq1YwoAuz3RDjP
   DcAmCPb5SBHPHzhWmG99/ki+4H5SG2x3Dn9gC+lVM8JlxvOdbJ5eudxVu
   l4wLUwtNG9aclcbB+JdIJTLkl5i+O4tRBsMb8ATnahxqDJjHplWrKHaDU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438516276"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="438516276"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="714129517"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="714129517"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Aug 2023 15:24:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZIkY-00030W-2R;
	Thu, 24 Aug 2023 22:24:22 +0000
Date: Fri, 25 Aug 2023 06:23:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 5635/12477] test_set_error_stamp: rm
 /kbuild/obj/consumer/riscv-randconfig-001-20230825/.reduce_errors/ld.lld:error:vmlinux.a(init-initramfs.o):(function-wait_for_initramfs:.text):relocation-R_RISCV_HI20-out-of-range:is-not-in-references-initramfs_cookie
Message-ID: <202308250630.aII6rEwE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sean Christopherson <seanjc@google.com>
CC: Like Xu <likexu@tencent.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b3bd393093b04d4882152398019cbb96b0440ff
commit: 0033fa35491680bce65ff78fb41445f472aa5baa [5635/12477] KVM: x86/pmu: Use enums instead of hardcoded magic for arch event indices
config: riscv-randconfig-001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250630.aII6rEwE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250630.aII6rEwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250630.aII6rEwE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/initramfs.o):(function wait_for_initramfs: .text+0x10): relocation R_RISCV_HI20 out of range: 531995 is not in [-524288, 524287]; references 'initramfs_cookie'
   >>> referenced by initramfs.c
   >>> defined in vmlinux.a(init/initramfs.o)
--
>> ld.lld: error: vmlinux.a(init/initramfs.o):(function wait_for_initramfs: .text+0x20): relocation R_RISCV_HI20 out of range: 531088 is not in [-524288, 524287]; references 'initramfs_domain'
   >>> referenced by initramfs.c
   >>> defined in vmlinux.a(init/initramfs.o)
--
>> ld.lld: error: vmlinux.a(init/initramfs.o):(function wait_for_initramfs: .text+0x30): relocation R_RISCV_HI20 out of range: 531990 is not in [-524288, 524287]; references 'wait_for_initramfs.__already_done'
   >>> referenced by initramfs.c
   >>> defined in vmlinux.a(init/initramfs.o)
--
>> ld.lld: error: vmlinux.a(init/initramfs.o):(function wait_for_initramfs: .text+0x54): relocation R_RISCV_HI20 out of range: 530600 is not in [-524288, 524287]; references '.L.str.4'
   >>> referenced by initramfs.c
   >>> defined in vmlinux.a(init/initramfs.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function rcu_lock_acquire: .text+0x7c): relocation R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references '.Ltmp0'
   >>> referenced by mm.h:3000 (include/linux/mm.h:3000)
   >>> defined in vmlinux.a(init/main.o)
--
>> ld.lld: error: vmlinux.a(init/main.o):(function rcu_lock_release: .text+0xc4): relocation R_RISCV_HI20 out of range: 524289 is not in [-524288, 524287]; references '.Ltmp1'
   >>> referenced by main.c:1426 (init/main.c:1426)
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
