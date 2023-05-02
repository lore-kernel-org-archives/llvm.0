Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41220622;
	Tue,  2 May 2023 02:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682993458; x=1714529458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FhwnsB8bTE5ZmLbS2+O6g1gT9BK4EhnQG21gUoEWX08=;
  b=GTT8tRoKE4/+Yb8iVcVJwK2UH5KWi2CMiYfu5lb4DIykJ9Wp4V84RjN2
   7tiwe1b69NAtrbdC0pObT3RybRtZxrEdv8aMEIFwihPcHHhdspGnK5QKm
   cy+PgMwcRNAk1yGhiubLYhzH9cpb9R6ur0ahUAKnXTUjn/vF35Hfcaj7b
   lK9R4vJ2jFpPJyaB2RxciYvcaC62uzGGP+cnitaKip8i0+UQAvopP3RbB
   BMu+31AjhM5QcBmxB8c09lJ0vOoP+5g23kk9zbBrqpvoIcmeYeB2w76MY
   axO+7G3RYGwUjZmbUO/WJ5EJ9qooY8bXplT0q4RCB4TMuwYKgO1GIj15S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="351259668"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="351259668"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2023 19:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="673439137"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; 
   d="scan'208";a="673439137"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 May 2023 19:10:56 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptfTj-0000ls-1D;
	Tue, 02 May 2023 02:10:55 +0000
Date: Tue, 2 May 2023 10:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 57/59]
 drivers/regulator/ti-abb-regulator.c:669:34: warning: unused variable
 'ti_abb_of_match'
Message-ID: <202305021028.M12yAwRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   34ab035cf8c37588331031cac8fc0dd07f15f3cc
commit: 23496cc222294cb10cd0a3601c443f75a5016ad6 [57/59] Use of_device_get_match_data
config: hexagon-randconfig-r031-20230501 (https://download.01.org/0day-ci/archive/20230502/202305021028.M12yAwRC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=23496cc222294cb10cd0a3601c443f75a5016ad6
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout 23496cc222294cb10cd0a3601c443f75a5016ad6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/regulator/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305021028.M12yAwRC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/regulator/ti-abb-regulator.c:15:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/regulator/ti-abb-regulator.c:15:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/regulator/ti-abb-regulator.c:15:
   In file included from include/linux/io.h:13:
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
>> drivers/regulator/ti-abb-regulator.c:669:34: warning: unused variable 'ti_abb_of_match' [-Wunused-const-variable]
   static const struct of_device_id ti_abb_of_match[] = {
                                    ^
   7 warnings generated.
--
   In file included from sound/soc/codecs/rt5677.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
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
   In file included from sound/soc/codecs/rt5677.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from sound/soc/codecs/rt5677.c:16:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
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
>> sound/soc/codecs/rt5677.c:5233:36: warning: unused variable 'rt5677_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id rt5677_acpi_match[] = {
                                      ^
   7 warnings generated.


vim +/ti_abb_of_match +669 drivers/regulator/ti-abb-regulator.c

6127daa85094e2 Nishanth Menon     2014-01-23  668  
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02 @669  static const struct of_device_id ti_abb_of_match[] = {
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  670  	{.compatible = "ti,abb-v1", .data = &abb_regs_v1},
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  671  	{.compatible = "ti,abb-v2", .data = &abb_regs_v2},
6127daa85094e2 Nishanth Menon     2014-01-23  672  	{.compatible = "ti,abb-v3", .data = &abb_regs_generic},
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  673  	{ },
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  674  };
40b1936efebdb9 Andrii.Tseglytskyi 2013-05-02  675  

:::::: The code at line 669 was first introduced by commit
:::::: 40b1936efebdb9c31d9ed6fe59055f71ea366509 regulator: Introduce TI Adaptive Body Bias(ABB) on-chip LDO driver

:::::: TO: Andrii.Tseglytskyi <andrii.tseglytskyi@ti.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
