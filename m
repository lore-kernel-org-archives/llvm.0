Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5578917FF;
	Sat, 25 Feb 2023 07:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677309864; x=1708845864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlRfeIorMW/gIm4Un0w8RFg6W644h7heCNV9l6bYn04=;
  b=Qyp8xw/A3EIGS3UHdNuyb01AUcDxoxPKW7GmBgVT4wG4ZI6x2CTDaDnY
   ECM4AgCirowhk5K8+ikFqlzan0EEdVWvMS70PJPzEGyETsyOmnNwP6qbp
   RtlXXmbeXf3W7F9YhEIwssOduvTRit67BNnrQS7y9D9RuZz9tFoVuIFlG
   o9Xn+g/+c5W+Ue5YLVBs4n1jyCiLVOG62sMSuhOQXEwAaAGsfSKSqRGV9
   WwL25/JFKH4rvvH1gYF9dJLBtgi3n616NcY9Q4ESAdVylVyEE2OKxet8d
   XtZXcHPW4RmWy5Hu5ZwiDWimzUx5dP0jWk6y/Ey+GBgdSmKJrTKmagiFi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="314029200"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="314029200"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 23:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705537426"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="705537426"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2023 23:24:22 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVour-00031O-0g;
	Sat, 25 Feb 2023 07:24:21 +0000
Date: Sat, 25 Feb 2023 15:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:tdx-mig-wip 104/625]
 drivers/firmware/efi/libstub/x86-stub.c:790:14: warning: implicit
 declaration of function 'efi_is_64bit' is invalid in C99
Message-ID: <202302251502.bVO1zf4T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kirill,

FYI, the error/warning still remains.

tree:   https://github.com/intel/tdx.git tdx-mig-wip
head:   e3f471304eb15841af5c14108b05d05b5370095b
commit: f9d9defcf521899d36fdc2577bb89a1bac32493d [104/625] x86/tdx: Add unaccepted memory support
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230225/202302251502.bVO1zf4T-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/f9d9defcf521899d36fdc2577bb89a1bac32493d
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx tdx-mig-wip
        git checkout f9d9defcf521899d36fdc2577bb89a1bac32493d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/ drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251502.bVO1zf4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/x86-stub.c:790:14: warning: implicit declaration of function 'efi_is_64bit' is invalid in C99 [-Wimplicit-function-declaration]
           signature = efi_is_64bit() ? EFI64_LOADER_SIGNATURE
                       ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for EFI_STUB
   Depends on [n]: EFI [=n]
   Selected by [y]:
   - INTEL_TDX_GUEST [=y] && HYPERVISOR_GUEST [=y] && X86_64 [=y] && CPU_SUP_INTEL [=y] && X86_X2APIC [=y]
   WARNING: unmet direct dependencies detected for UNACCEPTED_MEMORY
   Depends on [n]: EFI [=n] && EFI_STUB [=y]
   Selected by [y]:
   - INTEL_TDX_GUEST [=y] && HYPERVISOR_GUEST [=y] && X86_64 [=y] && CPU_SUP_INTEL [=y] && X86_X2APIC [=y]


vim +/efi_is_64bit +790 drivers/firmware/efi/libstub/x86-stub.c

d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  783  
cd33a5c1d53e43 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2019-12-24  784  static efi_status_t exit_boot_func(struct efi_boot_memmap *map,
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  785  				   void *priv)
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  786  {
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  787  	const char *signature;
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  788  	struct exit_boot_struct *p = priv;
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  789  
aab9593c0cb445 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2018-07-20 @790  	signature = efi_is_64bit() ? EFI64_LOADER_SIGNATURE
aab9593c0cb445 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2018-07-20  791  				   : EFI32_LOADER_SIGNATURE;
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  792  	memcpy(&p->efi->efi_loader_signature, signature, sizeof(__u32));
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  793  
eed4e0193ee7b0 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-30  794  	efi_set_u64_split((unsigned long)efi_system_table,
eed4e0193ee7b0 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-30  795  			  &p->efi->efi_systab, &p->efi->efi_systab_hi);
eab3126571ed1e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2022-06-03  796  	p->efi->efi_memdesc_size	= map->desc_size;
eab3126571ed1e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2022-06-03  797  	p->efi->efi_memdesc_version	= map->desc_ver;
eab3126571ed1e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2022-06-03  798  	efi_set_u64_split((unsigned long)map->map,
eed4e0193ee7b0 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-30  799  			  &p->efi->efi_memmap, &p->efi->efi_memmap_hi);
eab3126571ed1e drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2022-06-03  800  	p->efi->efi_memmap_size		= map->map_size;
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  801  
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  802  	return EFI_SUCCESS;
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  803  }
d64934019f6cc3 arch/x86/boot/compressed/eboot.c        Jeffrey Hugo   2016-08-29  804  

:::::: The code at line 790 was first introduced by commit
:::::: aab9593c0cb4454f9d261a8c87a3361f3186c4ec efi/x86: Replace references to efi_early->is64 with efi_is_64bit()

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
