Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992AA7B;
	Sat, 11 Mar 2023 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678555680; x=1710091680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I6qiHHfIPaaLE0Nxo2IqkaGwo+KUhMLcsnEXR24Mrvk=;
  b=SiQ5SgFRsCMFaxJrBSg0AX3e9vBhrSyr7MSnwqpRSfHaaxE94gxAhxdv
   796NR7RsaXGnHBcjIObfzM5brYGL5vsipqIlKGLsrRW+mAYf+PeF6FwzK
   7372VEQHep0c8za/AfvmZxvBEW66zxz56GnPp1nhzj0fLXmoLwSXxxBt3
   4YNAKnRIykEjRXJ4duwTd1loAI9zUTCEfG/bN3JvbC33bF+3EDK/k3yCN
   Vql7uoxc8Sh9s23zwPVs9kOKapvc12bd/prvc3IuAQ/sj92gP0FvKnnwd
   QqW/tBff85chEWy7Sf+j/o+3tORpNraNbtbnkt1+xKVT35Hg9NxD81NlW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="338478057"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="338478057"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 09:28:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="747099657"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="747099657"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Mar 2023 09:27:58 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb30f-0004in-2m;
	Sat, 11 Mar 2023 17:27:57 +0000
Date: Sun, 12 Mar 2023 01:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Evgeniy Baskov <baskov@ispras.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:for-kernelci 20/23] arch/x86/boot/tools/build.c:319:40:
 warning: variable 'image_size' set but not used
Message-ID: <202303120143.JwHGEebm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   307a19a22eea94622a082f1bce0959cfb6f7d9f7
commit: 31670b84460306d4990df9973fcc711208151399 [20/23] x86/build: Make generated PE more spec compliant
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230312/202303120143.JwHGEebm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=31670b84460306d4990df9973fcc711208151399
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout 31670b84460306d4990df9973fcc711208151399
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120143.JwHGEebm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/boot/tools/build.c:319:40: warning: variable 'image_size' set but not used [-Wunused-but-set-variable]
           unsigned int compat_size, reloc_size, image_size;
                                                 ^
   1 warning generated.


vim +/image_size +319 arch/x86/boot/tools/build.c

   311	
   312	static unsigned int update_pecoff_sections(unsigned int setup_size,
   313						   unsigned int file_size,
   314						   unsigned int init_size,
   315						   unsigned int text_size)
   316	{
   317		/* First section starts at 512 byes, after PE header */
   318		unsigned int mem_offset = BASE_RVA, file_offset = SECTOR_SIZE;
 > 319		unsigned int compat_size, reloc_size, image_size;
   320		unsigned int bss_size, text_rva_diff, reloc_rva;
   321		pe_opt_hdr  *opt_hdr = get_pe_opt_header(buf);
   322		struct pe_hdr *hdr = get_pe_header(buf);
   323		struct data_dirent *base_reloc;
   324	
   325		if (get_unaligned_le32(&hdr->sections))
   326			die("Some sections present in PE file");
   327	
   328		/*
   329		 * The PE/COFF loader may load the image at an address which is
   330		 * misaligned with respect to the kernel_alignment field in the setup
   331		 * header.
   332		 *
   333		 * In order to avoid relocating the kernel to correct the misalignment,
   334		 * add slack to allow the buffer to be aligned within the declared size
   335		 * of the image.
   336		 */
   337		init_size += CONFIG_PHYSICAL_ALIGN;
   338		image_size = init_size;
   339	
   340		reloc_size = round_up(RELOC_SECTION_SIZE, FILE_ALIGNMENT);
   341		compat_size = round_up(COMPAT_SECTION_SIZE, FILE_ALIGNMENT);
   342	
   343		/*
   344		 * Let's remove extra memory used by special sections
   345		 * and use it as a part of bss.
   346		 */
   347		init_size -= round_up(reloc_size, SECTION_ALIGNMENT);
   348		init_size -= round_up(compat_size, SECTION_ALIGNMENT);
   349		if (init_size < file_size + setup_size) {
   350			init_size = file_size + setup_size;
   351			image_size += round_up(reloc_size, SECTION_ALIGNMENT);
   352			image_size += round_up(compat_size, SECTION_ALIGNMENT);
   353		}
   354	
   355		/*
   356		 * Update sections offsets.
   357		 * NOTE: Order is important
   358		 */
   359	
   360		bss_size = init_size - file_size - setup_size;
   361	
   362		emit_pecoff_section(".setup", setup_size - SECTOR_SIZE, 0,
   363				    &file_offset, &mem_offset, SCN_RO |
   364				    IMAGE_SCN_CNT_INITIALIZED_DATA);
   365	
   366		text_rva_diff = mem_offset - file_offset;
   367		text_rva = mem_offset;
   368		emit_pecoff_section(".text", text_size, 0,
   369				    &file_offset, &mem_offset, SCN_RX |
   370				    IMAGE_SCN_CNT_CODE);
   371	
   372		/* Check that kernel sections mapping is contiguous */
   373		if (text_rva_diff != mem_offset - file_offset)
   374			die("Kernel sections mapping is wrong: %#x != %#x",
   375			    mem_offset - file_offset, text_rva_diff);
   376	
   377		emit_pecoff_section(".data", file_size - text_size, bss_size,
   378				    &file_offset, &mem_offset, SCN_RW |
   379				    IMAGE_SCN_CNT_INITIALIZED_DATA);
   380	
   381		reloc_offset = file_offset;
   382		reloc_rva = mem_offset;
   383		emit_pecoff_section(".reloc", reloc_size, 0,
   384				    &file_offset, &mem_offset, SCN_RW |
   385				    IMAGE_SCN_CNT_INITIALIZED_DATA |
   386				    IMAGE_SCN_MEM_DISCARDABLE);
   387	
   388		compat_offset = file_offset;
   389	#ifdef CONFIG_EFI_MIXED
   390		emit_pecoff_section(".comat", compat_size, 0,
   391				    &file_offset, &mem_offset, SCN_RW |
   392				    IMAGE_SCN_CNT_INITIALIZED_DATA |
   393				    IMAGE_SCN_MEM_DISCARDABLE);
   394	#endif
   395	
   396		if (file_size + setup_size + reloc_size + compat_size != file_offset)
   397			die("file_size(%#x) != filesz(%#x)",
   398			    file_size + setup_size + reloc_size + compat_size, file_offset);
   399	
   400		/* Size of code. */
   401		put_unaligned_le32(round_up(text_size, SECTION_ALIGNMENT), &opt_hdr->text_size);
   402		/*
   403		 * Size of data.
   404		 * Exclude text size and first sector, which contains PE header.
   405		 */
   406		put_unaligned_le32(mem_offset - round_up(text_size, SECTION_ALIGNMENT),
   407				   &opt_hdr->data_size);
   408	
   409		/* Size of image. */
   410		put_unaligned_le32(mem_offset, &opt_hdr->image_size);
   411	
   412		/*
   413		 * Address of entry point for PE/COFF executable
   414		 */
   415		put_unaligned_le32(text_rva + efi_pe_entry, &opt_hdr->entry_point);
   416	
   417		/*
   418		 * BaseOfCode for PE/COFF executable
   419		 */
   420		put_unaligned_le32(text_rva, &opt_hdr->code_base);
   421	
   422		/*
   423		 * Since we have generated .reloc section, we need to
   424		 * fill-in Reloc directory
   425		 */
   426		base_reloc = &get_data_dirs(buf)->base_relocations;
   427		put_unaligned_le32(reloc_rva, &base_reloc->virtual_address);
   428		put_unaligned_le32(RELOC_SECTION_SIZE, &base_reloc->size);
   429	
   430		return file_offset;
   431	}
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
