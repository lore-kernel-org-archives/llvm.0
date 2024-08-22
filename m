Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FB517A584;
	Thu, 22 Aug 2024 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724327467; cv=none; b=L6+i/FM7AUl+mUg7aArX8PW4wvuLNU3cWBpCAzAqSzY788LdnlIlKKNYYFAsvLgBfSfE92TVHj6LjDG+9T1FefTyhpTdR3NoLeX5Nsn/vNSMoh0G4Mil70zECfuYshPV22ZmEc3ZRERtljYZFY9MCRPd+LQ4FzEi/2azhh6vqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724327467; c=relaxed/simple;
	bh=y5Ll5IV/gSUArRW04LkRMe1VRJkY1p4ESwfOUOSn3uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfrY5LMuvSBdI8MWtBVHE3rC7x/qo3COnqPx0qKNzWbxSsmd/FaUp2EZ8vQqbjzmR4x3MW7l5tuKLzx2GtKCI7vUiNIQgD/J6wcEYBa6vJLTtljn0clKhIp+7abrWjxxAxo7zkEDAmi0XsXY6MFgajaTn3j2f7p/gr2DFSVv+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXQfNc6L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXQfNc6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724327466; x=1755863466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y5Ll5IV/gSUArRW04LkRMe1VRJkY1p4ESwfOUOSn3uQ=;
  b=kXQfNc6L7KkcDAPTN/PerkiswbhgzUiUaxfeBXuvSRSFfPGaQgeVh53O
   Pr2xTWlqDBQJTI7P0iER7dU5CqvdbX6liKndSkKSEeg0TAWsRS0lfvf2+
   ZiXRBOBUGDFjpHbjLWLe2yDiO0O3LLWXj0u+xyODVTrY+jouL2nlmTu9k
   3AWz8hbX44CqgEbPTyBETDc/J/mNPL1aI0RYLwLjjN8HK60jaMtfxBMsR
   nqwjZd3F6BjCLycFgbRDDpVs9/vAsKlx5XPln1ZuVB2UcdwwKGLG79cG0
   NAyOuHBO7hJ3sGsMPzsEWAqbJtIpRu9haldSJ6PAiIerUnOSRsOmY+HYC
   w==;
X-CSE-ConnectionGUID: JHJscDjsS9q8D/PLYC9j6Q==
X-CSE-MsgGUID: 47Es8tvURPis/xoxRln5Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="26601893"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="26601893"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 04:51:05 -0700
X-CSE-ConnectionGUID: ycs3A8WJRYmUMFInBkXF2A==
X-CSE-MsgGUID: pV3s+zmHQAegkZ5IiVQmdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="92167483"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Aug 2024 04:51:04 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh6LF-000CiC-1L;
	Thu, 22 Aug 2024 11:51:01 +0000
Date: Thu, 22 Aug 2024 19:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: AlvinZhou <alvinzhou@mxic.com.tw>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [miquelraynal:macronix/nand-next/spi-nand-cont-read 3/19]
 drivers/spi/spi-mxic-uefc.c:983:25: error: use of undeclared identifier
 'mxic_uefc_of_ids'; did you mean 'mxic_uefc_spi_of_ids'?
Message-ID: <202408221934.ia5BiDkx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git macronix/nand-next/spi-nand-cont-read
head:   fadbfba401d2b839e573b267e4380bedc055da2c
commit: 3a117622bcdd9cc7e4747224858f669a5209a35d [3/19] spi: Add support for MXIC UEFC SPI controller
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240822/202408221934.ia5BiDkx-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221934.ia5BiDkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221934.ia5BiDkx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/spi/spi-mxic-uefc.c:6:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/spi/spi-mxic-uefc.c:6:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/spi/spi-mxic-uefc.c:6:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/spi/spi-mxic-uefc.c:13:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/spi/spi-mxic-uefc.c:983:25: error: use of undeclared identifier 'mxic_uefc_of_ids'; did you mean 'mxic_uefc_spi_of_ids'?
     983 | MODULE_DEVICE_TABLE(of, mxic_uefc_of_ids);
         |                         ^~~~~~~~~~~~~~~~
         |                         mxic_uefc_spi_of_ids
   include/linux/module.h:250:15: note: expanded from macro 'MODULE_DEVICE_TABLE'
     250 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^
   drivers/spi/spi-mxic-uefc.c:979:34: note: 'mxic_uefc_spi_of_ids' declared here
     979 | static const struct of_device_id mxic_uefc_spi_of_ids[] = {
         |                                  ^
   7 warnings and 1 error generated.


vim +983 drivers/spi/spi-mxic-uefc.c

   978	
   979	static const struct of_device_id mxic_uefc_spi_of_ids[] = {
   980	    { .compatible = "mxic-uefc,uefc-spi", },
   981	    { /* sentinel */ }
   982	};
 > 983	MODULE_DEVICE_TABLE(of, mxic_uefc_of_ids);
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
