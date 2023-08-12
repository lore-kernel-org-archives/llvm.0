Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1334DEDD;
	Sat, 12 Aug 2023 01:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691804640; x=1723340640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dszFT3kcYKxoCFqeBmPYQUnrqzL/NMdOb3HKjC/H10c=;
  b=FuByuHaHr3adv/w/FkxXCJfDswkfvBtvvzIuCmFPi84z2yvWxcwPvjxA
   fBWTaq+CgxOJy+527wSEMVA6jICgKvKdb+9ino8OPE0K9WZlaI78sZqnh
   Cw5wQDGiomQDRVReq+uyENl2Fdoy7a5KNSiMsU6oqN6q42ELnx6+AnaUs
   oP8MtILy+8psZ76FwHShS2U6S0Ce+o+D9Ie0v6RbxNnwBQm+C5phhpj8q
   8VvSfNhxsu9ppT7HELv92mQPLZrf3xZxMidqlMTyiIic+EPXbhIUcYsIU
   UxfL0Kb5haVmVlUkZR1fepbEN7AxRHwlx7i3IAt/G0eCqCkWSH87BtO79
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="370695355"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="370695355"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846965485"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="846965485"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 18:43:57 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUdfZ-0008BU-0S;
	Sat, 12 Aug 2023 01:43:57 +0000
Date: Sat, 12 Aug 2023 09:43:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 15/24]
 drivers/firmware/efi/libstub/x86-stub.c:865:47: warning: result of
 comparison of constant 70368744177664 with expression of type 'unsigned
 long' is always false
Message-ID: <202308120958.MZkonPmw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   5e3487a17fbf6e33d8ddd60444073ff0bc59b35e
commit: cba36ee4e7f4d5d50334a59f5a5af09605bfdde6 [15/24] pci: Add basic support for discovery of IDE on PCIe device
config: i386-randconfig-i016-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120958.MZkonPmw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120958.MZkonPmw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120958.MZkonPmw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/efi/libstub/x86-stub.c:10:
   include/linux/pci.h:352:12: warning: declaration of 'enum pci_ide_stream_type' will not be visible outside of this function [-Wvisibility]
                                            enum pci_ide_stream_type type)
                                                 ^
   include/linux/pci.h:352:32: error: variable has incomplete type 'enum pci_ide_stream_type'
                                            enum pci_ide_stream_type type)
                                                                     ^
   include/linux/pci.h:352:12: note: forward declaration of 'enum pci_ide_stream_type'
                                            enum pci_ide_stream_type type)
                                                 ^
>> drivers/firmware/efi/libstub/x86-stub.c:865:47: warning: result of comparison of constant 70368744177664 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
               (IS_ENABLED(CONFIG_X86_64) && buffer_end > MAXMEM_X86_64_4LEVEL) ||
                                             ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +865 drivers/firmware/efi/libstub/x86-stub.c

291f36325f9f25 arch/x86/boot/compressed/eboot.c        Matt Fleming   2011-12-12  805  
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  806  /*
8acf63efa1712f drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  807   * On success, we return the address of startup_32, which has potentially been
8acf63efa1712f drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  808   * relocated by efi_relocate_kernel.
8acf63efa1712f drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  809   * On failure, we exit to the firmware via efi_exit instead of returning.
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  810   */
db14655ad7854b drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2022-10-14  811  asmlinkage unsigned long efi_main(efi_handle_t handle,
c3710de5065d63 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2019-12-24  812  				  efi_system_table_t *sys_table_arg,
796eb8d26a57f9 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-01-13  813  				  struct boot_params *boot_params)
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  814  {
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  815  	unsigned long bzimage_addr = (unsigned long)startup_32;
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  816  	unsigned long buffer_start, buffer_end;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  817  	struct setup_header *hdr = &boot_params->hdr;
f4dc7fffa9873d drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2022-09-16  818  	const struct linux_efi_initrd *initrd = NULL;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  819  	efi_status_t status;
54b52d87268034 arch/x86/boot/compressed/eboot.c        Matt Fleming   2014-01-10  820  
ccc27ae7749425 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2020-04-16  821  	efi_system_table = sys_table_arg;
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  822  	/* Check if we were booted by the EFI firmware */
ccc27ae7749425 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2020-04-16  823  	if (efi_system_table->hdr.signature != EFI_SYSTEM_TABLE_SIGNATURE)
3b8f44fc0810d5 drivers/firmware/efi/libstub/x86-stub.c Ard Biesheuvel 2020-02-16  824  		efi_exit(handle, EFI_INVALID_PARAMETER);
9ca8f72a9297f2 arch/x86/boot/compressed/eboot.c        Matt Fleming   2012-07-19  825  
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy 2022-03-03  826  	efi_dxe_table = get_efi_config_table(EFI_DXE_SERVICES_TABLE_GUID);
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy 2022-03-03  827  	if (efi_dxe_table &&
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy 2022-03-03  828  	    efi_dxe_table->hdr.signature != EFI_DXE_SERVICES_TABLE_SIGNATURE) {
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy 2022-03-03  829  		efi_warn("Ignoring DXE services table: invalid signature\n");
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy 2022-03-03  830  		efi_dxe_table = NULL;
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy 2022-03-03  831  	}
3ba75c1316390b drivers/firmware/efi/libstub/x86-stub.c Baskov Evgeniy 2022-03-03  832  
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  833  	/*
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  834  	 * If the kernel isn't already loaded at a suitable address,
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  835  	 * relocate it.
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  836  	 *
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  837  	 * It must be loaded above LOAD_PHYSICAL_ADDR.
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  838  	 *
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  839  	 * The maximum address for 64-bit is 1 << 46 for 4-level paging. This
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  840  	 * is defined as the macro MAXMEM, but unfortunately that is not a
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  841  	 * compile-time constant if 5-level paging is configured, so we instead
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  842  	 * define our own macro for use here.
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  843  	 *
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  844  	 * For 32-bit, the maximum address is complicated to figure out, for
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  845  	 * now use KERNEL_IMAGE_SIZE, which will be 512MiB, the same as what
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  846  	 * KASLR uses.
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  847  	 *
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  848  	 * Also relocate it if image_offset is zero, i.e. the kernel wasn't
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  849  	 * loaded by LoadImage, but rather by a bootloader that called the
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  850  	 * handover entry. The reason we must always relocate in this case is
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  851  	 * to handle the case of systemd-boot booting a unified kernel image,
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  852  	 * which is a PE executable that contains the bzImage and an initrd as
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  853  	 * COFF sections. The initrd section is placed after the bzImage
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  854  	 * without ensuring that there are at least init_size bytes available
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  855  	 * for the bzImage, and thus the compressed kernel's startup code may
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  856  	 * overwrite the initrd unless it is moved out of the way.
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  857  	 */
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  858  
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  859  	buffer_start = ALIGN(bzimage_addr - image_offset,
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  860  			     hdr->kernel_alignment);
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  861  	buffer_end = buffer_start + hdr->init_size;
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  862  
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  863  	if ((buffer_start < LOAD_PHYSICAL_ADDR)				     ||
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  864  	    (IS_ENABLED(CONFIG_X86_32) && buffer_end > KERNEL_IMAGE_SIZE)    ||
d5cdf4cfeac914 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08 @865  	    (IS_ENABLED(CONFIG_X86_64) && buffer_end > MAXMEM_X86_64_4LEVEL) ||
21cb9b414301c7 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-09  866  	    (image_offset == 0)) {
688eb28211abdf drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-10-11  867  		extern char _bss[];
688eb28211abdf drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-10-11  868  
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  869  		status = efi_relocate_kernel(&bzimage_addr,
688eb28211abdf drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-10-11  870  					     (unsigned long)_bss - bzimage_addr,
688eb28211abdf drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-10-11  871  					     hdr->init_size,
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  872  					     hdr->pref_address,
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  873  					     hdr->kernel_alignment,
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  874  					     LOAD_PHYSICAL_ADDR);
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  875  		if (status != EFI_SUCCESS) {
36bdd0a78d5683 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-04-30  876  			efi_err("efi_relocate_kernel() failed!\n");
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  877  			goto fail;
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  878  		}
1887c9b653f995 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  879  		/*
1887c9b653f995 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  880  		 * Now that we've copied the kernel elsewhere, we no longer
1887c9b653f995 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  881  		 * have a set up block before startup_32(), so reset image_offset
1887c9b653f995 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  882  		 * to zero in case it was set earlier.
1887c9b653f995 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  883  		 */
1887c9b653f995 drivers/firmware/efi/libstub/x86-stub.c Arvind Sankar  2020-03-08  884  		image_offset = 0;
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  885  	}
04a7d0e1560676 arch/x86/boot/compressed/eboot.c        Ard Biesheuvel 2020-02-10  886  

:::::: The code at line 865 was first introduced by commit
:::::: d5cdf4cfeac914617ca22866bd4685fd7f876dec efi/x86: Don't relocate the kernel unless necessary

:::::: TO: Arvind Sankar <nivedita@alum.mit.edu>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
