Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCAB6D38;
	Wed,  8 Mar 2023 14:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678285191; x=1709821191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MYKSRNhxw96IUQMCBazg68wJ6R+1e8wARf5Nz6MscDI=;
  b=a2h69jSdL29wcxoVwSmyL3Ja+PGNY33cfbOqBnuAkZy9R76qwkZC2S5B
   8PZBkUgd98DDA000hpaLurB9VzhOQvsvvehikxiPli1mJEhO39XjNsg1q
   EGG2WYlZfwliZFCITwBw1T90KpMUj3VbYqZdoMvBtoXoxLollrtFmKqKU
   7ST98f1PiAuQS1+fJsDiPACXdPWY0KslVHRjEXEC5GG26Y1gKU957TSMF
   bERy1DYTXcDWlbuZlimRgct74bqkZtmk3AzWrTgAyyFLVpC+mvorjFj2x
   zJsJpyP8acACJ5fnXu4tTPPzYNWG/+is2KB4FZsGlcayhqiLK2sFL7mMQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337678359"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="337678359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 06:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745922247"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="745922247"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2023 06:19:47 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZudu-0002Aj-1O;
	Wed, 08 Mar 2023 14:19:46 +0000
Date: Wed, 8 Mar 2023 22:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: Evgeniy Baskov <baskov@ispras.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:efi-x86-nx 10/24] drivers/firmware/efi/libstub/mem.c:171:20:
 warning: variable 'rounded_start' is uninitialized when used here
Message-ID: <202303082221.muIbxFhj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-nx
head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
commit: 6b4ae58e7147165ec019e3899a5d4d14e0396110 [10/24] efi/libstub: Move helper function to related file
config: riscv-randconfig-r001-20230305 (https://download.01.org/0day-ci/archive/20230308/202303082221.muIbxFhj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=6b4ae58e7147165ec019e3899a5d4d14e0396110
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-x86-nx
        git checkout 6b4ae58e7147165ec019e3899a5d4d14e0396110
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082221.muIbxFhj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/mem.c:171:20: warning: variable 'rounded_start' is uninitialized when used here [-Wuninitialized]
                            (unsigned long)rounded_start,
                                           ^~~~~~~~~~~~~
   drivers/firmware/efi/libstub/efistub.h:71:45: note: expanded from macro 'efi_warn'
           efi_printk(KERN_WARNING "WARNING: " fmt, ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   drivers/firmware/efi/libstub/mem.c:150:35: note: initialize the variable 'rounded_start' to silence this warning
           efi_physical_addr_t rounded_start, rounded_end;
                                            ^
                                             = 0
>> drivers/firmware/efi/libstub/mem.c:172:20: warning: variable 'rounded_end' is uninitialized when used here [-Wuninitialized]
                            (unsigned long)rounded_end);
                                           ^~~~~~~~~~~
   drivers/firmware/efi/libstub/efistub.h:71:45: note: expanded from macro 'efi_warn'
           efi_printk(KERN_WARNING "WARNING: " fmt, ##__VA_ARGS__)
                                                      ^~~~~~~~~~~
   drivers/firmware/efi/libstub/mem.c:150:48: note: initialize the variable 'rounded_end' to silence this warning
           efi_physical_addr_t rounded_start, rounded_end;
                                                         ^
                                                          = 0
   2 warnings generated.


vim +/rounded_start +171 drivers/firmware/efi/libstub/mem.c

   131	
   132	/**
   133	 * efi_adjust_memory_range_protection() - change memory range protection attributes
   134	 * @start:	memory range start address
   135	 * @size:	memory range size
   136	 *
   137	 * Actual memory range for which memory attributes are modified is
   138	 * the smallest ranged with start address and size aligned to EFI_PAGE_SIZE
   139	 * that includes [start, start + size].
   140	 *
   141	 * @return: status code
   142	 */
   143	efi_status_t efi_adjust_memory_range_protection(unsigned long start,
   144							unsigned long size,
   145							unsigned long attributes)
   146	{
   147		efi_status_t status;
   148		efi_gcd_memory_space_desc_t desc;
   149		efi_physical_addr_t end, next;
   150		efi_physical_addr_t rounded_start, rounded_end;
   151		efi_physical_addr_t unprotect_start, unprotect_size;
   152	
   153		if (efi_dxe_table == NULL)
   154			return EFI_UNSUPPORTED;
   155	
   156		/*
   157		 * This function should not be used to modify attributes
   158		 * other than writable/executable.
   159		 */
   160	
   161		if ((attributes & ~(EFI_MEMORY_RO | EFI_MEMORY_XP)) != 0)
   162			return EFI_INVALID_PARAMETER;
   163	
   164		/*
   165		 * Disallow simultaniously executable and writable memory
   166		 * to inforce W^X policy if direct extraction code is enabled.
   167		 */
   168	
   169		if ((attributes & (EFI_MEMORY_RO | EFI_MEMORY_XP)) == 0) {
   170			efi_warn("W^X violation at [%08lx,%08lx]\n",
 > 171				 (unsigned long)rounded_start,
 > 172				 (unsigned long)rounded_end);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
