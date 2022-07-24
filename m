Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF002F4B
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658702914; x=1690238914;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qvyEDRnGy2j81gG2C+I0ADeqIH4jC4Hm9IeS5+Yzi9M=;
  b=Mkzi1/M/xUAzIBgS8fGU6cfjCFlnLg2I3CpzAjCldpX4UEe7FxmZ//B7
   EhFcwf6t91GJIL36ki2H03l1LmCuavPOhx8RBWo1GnG8cx7en/ZR0HZG+
   jyn+vzQ61YnQ+PECpQYhos3LnhHlYlm8cQFdGBbZIJ83W4o1HcJmO0p9p
   0+MjQTh//M8p5iu/9cHIBcPHXkXFcaAidiZUhWQvVrPs5a8KWPnCF4sYQ
   0ANbGXU1KgldzvHiOaANvsX5rdy5GbcHG1FmARI5/p6EhBciqwIauRC0w
   c/w+qxNyF4utDOMb74gvDkdbDKnWQ8ToKL2GfXGlhmCa10Fl6CR+XmUrY
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="349273548"
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="349273548"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 15:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="574818511"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2022 15:48:32 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFkOm-0004NP-0l;
	Sun, 24 Jul 2022 22:48:32 +0000
Date: Mon, 25 Jul 2022 06:48:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: .text.exynos_iommu_domain_free:
 unexpected end of section
Message-ID: <202207250649.8VJotys6-lkp@intel.com>
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
TO: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14 scripts/Makefile.clang: default to LLVM_IAS=1
date:   12 months ago
config: x86_64-buildonly-randconfig-r002-20220718 (https://download.01.org/0day-ci/archive/20220725/202207250649.8VJotys6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f12b034afeb3a977bbb1c6584dedc0f3dc666f14
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f12b034afeb3a977bbb1c6584dedc0f3dc666f14
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64()+0x9d: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_syscall_32()+0xaa: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xe7: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x22: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_page() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack()+0x12: call to cpu_entry_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_setup()+0xa3: call to cpuid_eax() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0xa2: call to mce_gather_info() leaves .noinstr.text section
   vmlinux.o: warning: objtool: replace_key()+0x19b: stack state mismatch: cfa1=4+64 cfa2=4+80
   vmlinux.o: warning: objtool: leaf_copy_items_entirely()+0x436: stack state mismatch: cfa1=4+160 cfa2=4+152
>> vmlinux.o: warning: objtool: .text.exynos_iommu_domain_free: unexpected end of section
>> vmlinux.o: warning: objtool: .text.exynos_iommu_map: unexpected end of section
>> vmlinux.o: warning: objtool: .text.exynos_iommu_unmap: unexpected end of section
>> vmlinux.o: warning: objtool: .text.exynos_iommu_iova_to_phys: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
