Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44115156DB;
	Mon, 20 Nov 2023 21:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTTlwODT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700514116; x=1732050116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jt/f7YUrTTS0ABySbkdVLeVCCX9FlWj9Tgf/hCaAVkY=;
  b=YTTlwODTozb2MsjQ4P4xqKcxQEChChN4F0VcZmwR44cS3GBPojdBCpPB
   AFQ5ZdlXbaT0drOWyXYWND809/oBJ0Gjm2bP5Mh2n5cvLEB9TAqA44L/t
   rlMoI4S3qOQvsTWXTGLNcF1OMzc5lub3kObWa0RVz/yneVIZ7iNGyO2bq
   f8Qlk4dCtIszPysF2MbtcZCWEL7dhLjt/tDruacf5UmRYxXfHT4EePC8y
   3BNFxa0ay1fKCkDklBxAEgfD9NR/ytRY9HtUHTBEhVcZug5lC48217deI
   qmdxOiI17spSDFNkmaFlQnX59VRYlqHO9O6lszWqg3/nsU79eaj5To2uS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="395632418"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="395632418"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7837598"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2023 13:01:46 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5BOq-0006v4-09;
	Mon, 20 Nov 2023 21:01:44 +0000
Date: Tue, 21 Nov 2023 05:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Marko <robimarko@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 1421/2011]
 drivers/net/phy/aquantia/aquantia_firmware.c:107:9: error: call to
 '__compiletime_assert_331' declared with 'error' attribute: FIELD_PREP:
 value too large for the field
Message-ID: <202311210414.sEJZjlcD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5a82d69d48c82e89aef44483d2a129f869f3506a
commit: e93984ebc1c82bd34f7a1b3391efaceee0a8ae96 [1421/2011] net: phy: aquantia: add firmware load support
config: s390-randconfig-002-20231121 (https://download.01.org/0day-ci/archive/20231121/202311210414.sEJZjlcD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210414.sEJZjlcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210414.sEJZjlcD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/phy/aquantia/aquantia_firmware.c:11:
   In file included from drivers/net/phy/aquantia/aquantia.h:10:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/net/phy/aquantia/aquantia_firmware.c:11:
   In file included from drivers/net/phy/aquantia/aquantia.h:10:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/phy/aquantia/aquantia_firmware.c:11:
   In file included from drivers/net/phy/aquantia/aquantia.h:10:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/phy/aquantia/aquantia_firmware.c:107:9: error: call to '__compiletime_assert_331' declared with 'error' attribute: FIELD_PREP: value too large for the field
     107 |                       VEND1_GLOBAL_MAILBOX_INTERFACE4_LSW_ADDR(addr));
         |                       ^
   drivers/net/phy/aquantia/aquantia.h:33:53: note: expanded from macro 'VEND1_GLOBAL_MAILBOX_INTERFACE4_LSW_ADDR'
      33 | #define VEND1_GLOBAL_MAILBOX_INTERFACE4_LSW_ADDR(x)     FIELD_PREP(VEND1_GLOBAL_MAILBOX_INTERFACE4_LSW_ADDR_MASK, (u16)(x))
         |                                                         ^
   include/linux/bitfield.h:114:3: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:17:1: note: expanded from here
      17 | __compiletime_assert_331
         | ^
   12 warnings and 1 error generated.


vim +107 drivers/net/phy/aquantia/aquantia_firmware.c

    88	
    89	/* load data into the phy's memory */
    90	static int aqr_fw_load_memory(struct phy_device *phydev, u32 addr,
    91				      const u8 *data, size_t len)
    92	{
    93		u16 crc = 0, up_crc;
    94		size_t pos;
    95	
    96		/* PHY expect addr in LE */
    97		addr = (__force u32)cpu_to_le32(addr);
    98	
    99		phy_write_mmd(phydev, MDIO_MMD_VEND1,
   100			      VEND1_GLOBAL_MAILBOX_INTERFACE1,
   101			      VEND1_GLOBAL_MAILBOX_INTERFACE1_CRC_RESET);
   102		phy_write_mmd(phydev, MDIO_MMD_VEND1,
   103			      VEND1_GLOBAL_MAILBOX_INTERFACE3,
   104			      VEND1_GLOBAL_MAILBOX_INTERFACE3_MSW_ADDR(addr));
   105		phy_write_mmd(phydev, MDIO_MMD_VEND1,
   106			      VEND1_GLOBAL_MAILBOX_INTERFACE4,
 > 107			      VEND1_GLOBAL_MAILBOX_INTERFACE4_LSW_ADDR(addr));
   108	
   109		/* We assume and enforce the size to be word aligned.
   110		 * If a firmware that is not word aligned is found, please report upstream.
   111		 */
   112		for (pos = 0; pos < len; pos += sizeof(u32)) {
   113			u32 word;
   114	
   115			/* FW data is always stored in little-endian */
   116			word = get_unaligned((const u32 *)(data + pos));
   117	
   118			phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_MAILBOX_INTERFACE5,
   119				      VEND1_GLOBAL_MAILBOX_INTERFACE5_MSW_DATA(word));
   120			phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_MAILBOX_INTERFACE6,
   121				      VEND1_GLOBAL_MAILBOX_INTERFACE6_LSW_DATA(word));
   122	
   123			phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_MAILBOX_INTERFACE1,
   124				      VEND1_GLOBAL_MAILBOX_INTERFACE1_EXECUTE |
   125				      VEND1_GLOBAL_MAILBOX_INTERFACE1_WRITE);
   126	
   127			/* calculate CRC as we load data to the mailbox.
   128			 * We convert word to big-endian as PHY is BE and mailbox will
   129			 * return a BE CRC.
   130			 */
   131			word = (__force u32)cpu_to_be32(word);
   132			crc = crc_ccitt_false(crc, (u8 *)&word, sizeof(word));
   133		}
   134	
   135		up_crc = phy_read_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_MAILBOX_INTERFACE2);
   136		if (crc != up_crc) {
   137			phydev_err(phydev, "CRC mismatch: calculated 0x%04x PHY 0x%04x\n",
   138				   crc, up_crc);
   139			return -EINVAL;
   140		}
   141	
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
