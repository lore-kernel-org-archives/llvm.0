Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BE2A4A;
	Wed,  5 Apr 2023 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680688450; x=1712224450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2/OTwjVKqgrnKWGIdha9aXaIU5L4xTXV6YaueFUYFYE=;
  b=Qb0hZN0trmh4RiIK/C1ur9uvvAgHO55PaTt39hU8YEl7YwMNKsiFnuob
   oTEJowzuABIu2RPOXIg9fy1nzfYp5+B/99AOqhtWvfzdqiGSQm6f7hUH+
   GGH+n8w+tJ2j0rZ2+yGJGWpmNULTj4gcDCALc3Sez1BtHV6fYf0l73EQe
   qodPgGQ0NbgKg78hJV5cCCggEtlqktT1JpOtIIvupM1ywhcP93PHO4jqg
   xV+RLQekEeAjOJK9MY2/6vMdyea/s+vpRxkkUL728A210TEH5gGOl0u4i
   CT1dhB6bOIAAJ93O3DcSvI6PPAmIpqVvtPT1DLr3YeBdNtnTGCgtQA3GM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428698905"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="428698905"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 02:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="716970891"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="716970891"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Apr 2023 02:54:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjzqB-000QRy-1Z;
	Wed, 05 Apr 2023 09:54:07 +0000
Date: Wed, 5 Apr 2023 17:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [ambarus:s25hx02gt-v3 31/31] drivers/mtd/spi-nor/spansion.c:584:16:
 error: no member named 'num_of_dice' in 'struct spi_nor_flash_parameter'
Message-ID: <202304051714.u6XHcn1j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day s25hx02gt-v3
head:   17262634676fc89ea1fff217ed2cdebc15fc2f11
commit: 17262634676fc89ea1fff217ed2cdebc15fc2f11 [31/31] mtd: spi-nor: spansion: Add support for Infineon
config: hexagon-randconfig-r041-20230403 (https://download.01.org/0day-ci/archive/20230405/202304051714.u6XHcn1j-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ambarus/linux-0day/commit/17262634676fc89ea1fff217ed2cdebc15fc2f11
        git remote add ambarus https://github.com/ambarus/linux-0day
        git fetch --no-tags ambarus s25hx02gt-v3
        git checkout 17262634676fc89ea1fff217ed2cdebc15fc2f11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051714.u6XHcn1j-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/spansion.c:7:
   In file included from include/linux/mtd/spi-nor.h:11:
   In file included from include/linux/spi/spi-mem.h:14:
   In file included from include/linux/spi/spi.h:15:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/mtd/spi-nor/spansion.c:7:
   In file included from include/linux/mtd/spi-nor.h:11:
   In file included from include/linux/spi/spi-mem.h:14:
   In file included from include/linux/spi/spi.h:15:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/mtd/spi-nor/spansion.c:7:
   In file included from include/linux/mtd/spi-nor.h:11:
   In file included from include/linux/spi/spi-mem.h:14:
   In file included from include/linux/spi/spi.h:15:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/mtd/spi-nor/spansion.c:584:16: error: no member named 'num_of_dice' in 'struct spi_nor_flash_parameter'
                   nor->params->num_of_dice = 2;
                   ~~~~~~~~~~~  ^
   6 warnings and 1 error generated.


vim +584 drivers/mtd/spi-nor/spansion.c

   558	
   559	static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
   560	{
   561		struct spi_nor_erase_type *erase_type =
   562						nor->params->erase_map.erase_type;
   563		unsigned int i;
   564	
   565		/*
   566		 * In some parts, 3byte erase opcodes are advertised by 4BAIT.
   567		 * Convert them to 4byte erase opcodes.
   568		 */
   569		for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
   570			switch (erase_type[i].opcode) {
   571			case SPINOR_OP_SE:
   572				erase_type[i].opcode = SPINOR_OP_SE_4B;
   573				break;
   574			case SPINOR_OP_BE_4K:
   575				erase_type[i].opcode = SPINOR_OP_BE_4K_4B;
   576				break;
   577			default:
   578				break;
   579			}
   580		}
   581	
   582		/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
   583		if (nor->params->size == SZ_256M)
 > 584			nor->params->num_of_dice = 2;
   585	
   586		return cypress_nor_get_page_size(nor);
   587	}
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
