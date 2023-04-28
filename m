Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EA015BC;
	Fri, 28 Apr 2023 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682645258; x=1714181258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rMWirGqWPeqUcmQxpxbGTcWQFNIPD6SvVIR9EHZpiCw=;
  b=gnFQn3WMQRhdn3PipXFXS1jrAaNg7+fxf3oJx5x8bFSqqZJO3EBpCPtD
   TuGZgRQ+n0Rqg1w43i2nzhH5/mrkKM2gOwluX5YoL59GBmldTIUwIx31g
   qhoOXKk0CEzb+zXJObx1oB8YfFd/YqF2tWbpXE6SnQmuQhMYpNBAoiQOr
   WYOcttlZR3DG4hHe0KARY7+ZtOiIEMfm2TlRah2IC1qBsZKJiuqKNMOM4
   pGzWcL3K1dVuOpWm0owTULAW7T3tQTpwFQPIm3mzReWTPlU6YsINBUlFu
   W2Nq2UH7KWDWgMeE+aQx2O0KeSMcZ25KIBBS7/SasNcm3MXSYy/SRgrkx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="345071973"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="345071973"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 18:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868962671"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="868962671"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 18:27:32 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psCtX-0000GQ-2F;
	Fri, 28 Apr 2023 01:27:31 +0000
Date: Fri, 28 Apr 2023 09:26:34 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [palmer:for-next 71/73]
 drivers/firmware/efi/libstub/efi-stub-helper.c:825:23: warning: implicit
 declaration of function 'efi_get_kimg_min_align' is invalid in C99
Message-ID: <202304280914.JoGEqII1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git for-next
head:   6ea13757cbd6077ce0a7f54c80f9a75ec16e14d1
commit: 17e3193214a13b77e1ce3ec38d819904da2ab7a8 [71/73] arm64: libstub: Move KASLR handling functions to efi-stub-helper.c
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230428/202304280914.JoGEqII1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?id=17e3193214a13b77e1ce3ec38d819904da2ab7a8
        git remote add palmer https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
        git fetch --no-tags palmer for-next
        git checkout 17e3193214a13b77e1ce3ec38d819904da2ab7a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280914.JoGEqII1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/efi-stub-helper.c:825:23: warning: implicit declaration of function 'efi_get_kimg_min_align' is invalid in C99 [-Wimplicit-function-declaration]
           u64 min_kimg_align = efi_get_kimg_min_align();
                                ^
   drivers/firmware/efi/libstub/efi-stub-helper.c:868:2: warning: implicit declaration of function 'caches_clean_inval_pou' is invalid in C99 [-Wimplicit-function-declaration]
           caches_clean_inval_pou(*image_addr, *image_addr + kernel_codesize);
           ^
   2 warnings generated.


vim +/efi_get_kimg_min_align +825 drivers/firmware/efi/libstub/efi-stub-helper.c

   799	
   800	/**
   801	 * efi_kaslr_relocate_kernel() - Relocate the kernel (random if KASLR enabled)
   802	 * @image_addr:	Pointer to the current kernel location
   803	 * @reserve_addr:	Pointer to the relocated kernel location
   804	 * @reserve_size:	Size of the relocated kernel
   805	 * @kernel_size:	Size of the text + data
   806	 * @kernel_codesize:	Size of the text
   807	 * @kernel_memsize:	Size of the text + data + bss
   808	 * @phys_seed:		Random seed used for the relocation
   809	 *
   810	 * If KASLR is not enabled, this function relocates the kernel to a fixed
   811	 * address (or leave it as its current location). If KASLR is enabled, the
   812	 * kernel physical location is randomized using the seed in parameter.
   813	 *
   814	 * Return:	status code, EFI_SUCCESS if relocation is successful
   815	 */
   816	efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
   817					       unsigned long *reserve_addr,
   818					       unsigned long *reserve_size,
   819					       unsigned long kernel_size,
   820					       unsigned long kernel_codesize,
   821					       unsigned long kernel_memsize,
   822					       u32 phys_seed)
   823	{
   824		efi_status_t status;
 > 825		u64 min_kimg_align = efi_get_kimg_min_align();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
