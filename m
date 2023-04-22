Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E07F;
	Sat, 22 Apr 2023 01:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682128533; x=1713664533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JZlaQ/k2FoFO14ATQGGdhRpZ7MvW9TdMw9oM9Bhaeo=;
  b=h3OMfeqK3dfLx9148rWkVQ0pcpCtfoQ+ZZnbWdSgp0OYqzJUbm0NowgD
   iO0Qn7Cy8VRhZFuD8/jvCfR943JxA+Z28g4SlvT7+BFEnEc1Sl2NzG8LU
   qbhEk+LnwVB6ha8hk+Mwt5+pbKINaYebi9ojSOQuOv/GcNcXA1y2zsqxz
   KiY9FtSHKAG/FSHP1lKcNzjBhkDtZnkhLT8HwjiL1M0vjTDRhmbZMSaGD
   cC9qwCmzXYVFRSfHnYtF+t+Bjjt4IcoSWvJ0txen7ZyPhyDb88oLyB2GV
   Qf/RFVG54UTzQTGf7Lo/l14q8OjrV/duGVAXi4Ew0sP/qH98GAMhiEk5f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325714226"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325714226"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 18:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781789798"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="781789798"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2023 18:55:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq2TK-000h00-1N;
	Sat, 22 Apr 2023 01:55:30 +0000
Date: Sat, 22 Apr 2023 09:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie 4/19] arch/x86/kernel/head64.c:107:19: error: expected
 ';' after top level declarator
Message-ID: <202304220908.q0cNTyQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie
head:   01406d471d3e3718b3771fdabcfca8c505157404
commit: 4ba81de75d92fafdab2a8a389d1b7791dddf74f3 [4/19] x86/head64: Replace pointer fixups with PIE codegen
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230422/202304220908.q0cNTyQt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=4ba81de75d92fafdab2a8a389d1b7791dddf74f3
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-pie
        git checkout 4ba81de75d92fafdab2a8a389d1b7791dddf74f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ lib//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220908.q0cNTyQt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/head64.c:107:19: error: expected ';' after top level declarator
   static bool __head check_la57_support(unsigned long physaddr)
                     ^
                     ;
>> arch/x86/kernel/head64.c:566:19: error: use of undeclared identifier 'bringup_idt_table'; did you mean 'bringup_idt_descr'?
           gate_desc *idt = bringup_idt_table;
                            ^~~~~~~~~~~~~~~~~
                            bringup_idt_descr
   arch/x86/kernel/head64.c:546:24: note: 'bringup_idt_descr' declared here
   static struct desc_ptr bringup_idt_descr = {
                          ^
>> arch/x86/kernel/head64.c:566:13: error: initializing 'gate_desc *' (aka 'struct gate_struct *') with an expression of incompatible type 'struct desc_ptr'
           gate_desc *idt = bringup_idt_table;
                      ^     ~~~~~~~~~~~~~~~~~
   arch/x86/kernel/head64.c:582:27: error: use of undeclared identifier 'bringup_idt_table'
                   set_bringup_idt_handler(bringup_idt_table, X86_TRAP_VC, vc_boot_ghcb);
                                           ^
   arch/x86/kernel/head64.c:585:45: error: use of undeclared identifier 'bringup_idt_table'
           bringup_idt_descr.address = (unsigned long)bringup_idt_table;
                                                      ^
   5 errors generated.


vim +107 arch/x86/kernel/head64.c

866b556efa1295 Joerg Roedel       2020-09-07   86  
4c2b4058ab3258 Kirill A. Shutemov 2018-02-14   87  #ifdef CONFIG_X86_5LEVEL
4ba81de75d92fa Ard Biesheuvel     2023-04-08   88  static bool __init check_la57_support(unsigned long physaddr)
4c2b4058ab3258 Kirill A. Shutemov 2018-02-14   89  {
372fddf7090417 Kirill A. Shutemov 2018-05-18   90  	/*
d9f6e12fb0b7fc Ingo Molnar        2021-03-18   91  	 * 5-level paging is detected and enabled at kernel decompression
372fddf7090417 Kirill A. Shutemov 2018-05-18   92  	 * stage. Only check if it has been enabled there.
372fddf7090417 Kirill A. Shutemov 2018-05-18   93  	 */
372fddf7090417 Kirill A. Shutemov 2018-05-18   94  	if (!(native_read_cr4() & X86_CR4_LA57))
6f9dd329717f69 Kirill A. Shutemov 2018-02-14   95  		return false;
4c2b4058ab3258 Kirill A. Shutemov 2018-02-14   96  
4ba81de75d92fa Ard Biesheuvel     2023-04-08   97  	__pgtable_l5_enabled	= 1;
4ba81de75d92fa Ard Biesheuvel     2023-04-08   98  	pgdir_shift		= 48;
4ba81de75d92fa Ard Biesheuvel     2023-04-08   99  	ptrs_per_p4d		= 512;
4ba81de75d92fa Ard Biesheuvel     2023-04-08  100  	page_offset_base	= __PAGE_OFFSET_BASE_L5;
4ba81de75d92fa Ard Biesheuvel     2023-04-08  101  	vmalloc_base		= __VMALLOC_BASE_L5;
4ba81de75d92fa Ard Biesheuvel     2023-04-08  102  	vmemmap_base		= __VMEMMAP_BASE_L5;
6f9dd329717f69 Kirill A. Shutemov 2018-02-14  103  
6f9dd329717f69 Kirill A. Shutemov 2018-02-14  104  	return true;
4c2b4058ab3258 Kirill A. Shutemov 2018-02-14  105  }
4c2b4058ab3258 Kirill A. Shutemov 2018-02-14  106  #else
6f9dd329717f69 Kirill A. Shutemov 2018-02-14 @107  static bool __head check_la57_support(unsigned long physaddr)
6f9dd329717f69 Kirill A. Shutemov 2018-02-14  108  {
6f9dd329717f69 Kirill A. Shutemov 2018-02-14  109  	return false;
6f9dd329717f69 Kirill A. Shutemov 2018-02-14  110  }
4c2b4058ab3258 Kirill A. Shutemov 2018-02-14  111  #endif
4c2b4058ab3258 Kirill A. Shutemov 2018-02-14  112  

:::::: The code at line 107 was first introduced by commit
:::::: 6f9dd329717f696f578347c0781a0247db957596 x86/mm: Support boot-time switching of paging modes in the early boot code

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
