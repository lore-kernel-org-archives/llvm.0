Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F6613D537;
	Fri,  6 Sep 2024 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725650396; cv=none; b=Xiwb1fedZOdXKbhnPS0pICW7WiAuMtV7PxDdCYAFz6sKeVhFEbQjCK0PAK8RQ02ZVnRP+VgDfoMknf/d3A+wKxCHkwk7QK2L3suydJzwLjKNml8q3woyPkS7TDRbkTbUngtGYqlb4y8IfBIwdwCSLwL2zg2lUN+Iw2dpe+dkrvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725650396; c=relaxed/simple;
	bh=FvvPdxhhiokJNpAXuT6GFHCU8VBhmVaGLXft4hE0X6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mxFTRCRgbt5BKZgPVJBJ1jt0K64g4z/vEdkQZ7oUznu+sxoO7b/vMO6hfF2R/+8qli9h4kns8YTK70F38YBptkDMRhGMB/RP4l3rzpjzR4XJp3m2itT6RcovsLs207/Li7/9GLNaZf48asflrEWmsRk9tH4KXDLAarbk96Z8Dls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzHa+mNG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzHa+mNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725650394; x=1757186394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FvvPdxhhiokJNpAXuT6GFHCU8VBhmVaGLXft4hE0X6U=;
  b=TzHa+mNGsGdWq3H7y8t/qqUScN/NKP1zCSxvPzOLCK3MeoIn9nDgoonl
   g35OxbF0RVjOu8KgdnCByXC7x0V0ceddEAZvTcMstjZNgYgi3imOXt0BO
   a+HJ1vU840fxSnGsQN5vBssmpodajrbsY76ONiaRPwcUxDoOKsRKBSmaz
   j6uA+o9/gCfitULdeElyoN8mE0UWG62wZZEvEfPC2wK7bdw1EnfgOajbc
   B8sQQfMlTn1obnKUoUVa99mtR5k4pmkhUyKOhxNQTuwHd0Xdb3ayB9Oqy
   //8ZkscuSFizz9YeSfTpOFeQ0IjPhBX8lPkm6aCPOGMGDUDHm8o7RbkVy
   w==;
X-CSE-ConnectionGUID: WPQuCu4GQwSTKtb5qchPGA==
X-CSE-MsgGUID: RaYCPDOmQ+O0yXFfZ3JZwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28206589"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="28206589"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 12:19:53 -0700
X-CSE-ConnectionGUID: 0POp1ifrTPCw6Ak7rp1O1g==
X-CSE-MsgGUID: cxxpnXIpTSm6bjsGYiK2pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="66073686"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Sep 2024 12:19:51 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smeUn-000BdF-0x;
	Fri, 06 Sep 2024 19:19:49 +0000
Date: Sat, 7 Sep 2024 03:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lucas Stach <l.stach@pengutronix.de>
Subject: [pengutronix:mfe/v6.10/topic/touchscreen-axiom 6/6]
 drivers/input/touchscreen/touchnetix_axiom.c:1765:47: warning: equality
 comparison with extraneous parentheses
Message-ID: <202409070343.u9eDpLnT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.pengutronix.de/git/linux-0-day mfe/v6.10/topic/touchscreen-axiom
head:   24a4e77c6d046026ad63145d5a5a71bca496da45
commit: 24a4e77c6d046026ad63145d5a5a71bca496da45 [6/6] Input: Add TouchNetix aXiom I2C Touchscreen support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409070343.u9eDpLnT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070343.u9eDpLnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070343.u9eDpLnT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/input/touchscreen/touchnetix_axiom.c:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/input/touchscreen/touchnetix_axiom.c:30:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/input/touchscreen/touchnetix_axiom.c:30:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/input/touchscreen/touchnetix_axiom.c:30:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/input/touchscreen/touchnetix_axiom.c:1765:47: warning: equality comparison with extraneous parentheses [-Wparentheses-equality]
    1765 |         if ((ts->crc[AXIOM_CRC_CUR].nvltlusageconfig ==
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
    1766 |              ts->crc[AXIOM_CRC_NEW].nvltlusageconfig)) {
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/touchscreen/touchnetix_axiom.c:1765:47: note: remove extraneous parentheses around the comparison to silence this warning
    1765 |         if ((ts->crc[AXIOM_CRC_CUR].nvltlusageconfig ==
         |             ~                                        ^
    1766 |              ts->crc[AXIOM_CRC_NEW].nvltlusageconfig)) {
         |                                                     ~
   drivers/input/touchscreen/touchnetix_axiom.c:1765:47: note: use '=' to turn this equality comparison into an assignment
    1765 |         if ((ts->crc[AXIOM_CRC_CUR].nvltlusageconfig ==
         |                                                      ^~
         |                                                      =
   18 warnings generated.


vim +1765 drivers/input/touchscreen/touchnetix_axiom.c

  1688	
  1689	static enum fw_upload_err
  1690	axiom_cfg_fw_prepare(struct fw_upload *fw_upload, const u8 *data, u32 size)
  1691	{
  1692		struct axiom_data *ts = fw_upload->dd_handle;
  1693		struct axiom_firmware *afw = &ts->fw[AXIOM_FW_CFG];
  1694		u32 cur_runtime_crc, fw_runtime_crc;
  1695		struct axiom_fw_cfg_chunk chunk;
  1696		struct device *dev = ts->dev;
  1697		enum fw_upload_err ret;
  1698		u32 signature;
  1699	
  1700		if (ts->fw[AXIOM_FW_AXFW].in_progress) {
  1701			dev_err(dev, "AXFW update in progress, abort TH2CFG update\n");
  1702			return FW_UPLOAD_ERR_BUSY;
  1703		}
  1704	
  1705		mutex_lock(&afw->lock);
  1706		afw->cancel = false;
  1707		mutex_unlock(&afw->lock);
  1708	
  1709		afw->in_progress = true;
  1710	
  1711		if (axiom_get_runmode(ts) != AXIOM_TCP_MODE) {
  1712			dev_err(dev, "Device not in TCP mode, abort TH2CFG update\n");
  1713			afw->in_progress = false;
  1714			return FW_UPLOAD_ERR_HW_ERROR;
  1715		}
  1716	
  1717		if (size < sizeof(struct axiom_fw_cfg_hdr)) {
  1718			dev_err(dev, "Invalid TH2CFG file size\n");
  1719			afw->in_progress = false;
  1720			return FW_UPLOAD_ERR_INVALID_SIZE;
  1721		}
  1722	
  1723		signature = get_unaligned_be32(data);
  1724		if (signature != AXIOM_FW_CFG_SIGNATURE) {
  1725			dev_err(dev, "Invalid TH2CFG signature\n");
  1726			afw->in_progress = false;
  1727			return FW_UPLOAD_ERR_FW_INVALID;
  1728		}
  1729	
  1730		/* Skip to the first fw chunk */
  1731		data += sizeof(struct axiom_fw_cfg_hdr);
  1732		size -= sizeof(struct axiom_fw_cfg_hdr);
  1733	
  1734		/*
  1735		 * Search for u33 which contains the CRC information and perform only
  1736		 * the runtime-crc check.
  1737		 */
  1738		while (size) {
  1739			unsigned int chunk_len;
  1740	
  1741			chunk_len = axiom_cfg_fw_prepare_chunk(&chunk, data);
  1742			if (chunk.usage_num == AXIOM_U33)
  1743				break;
  1744	
  1745			data += chunk_len;
  1746			size -= chunk_len;
  1747		}
  1748	
  1749		if (size == 0) {
  1750			dev_err(dev, "Failed to find the u33 entry in TH2CFG\n");
  1751			afw->in_progress = false;
  1752			return FW_UPLOAD_ERR_FW_INVALID;
  1753		}
  1754	
  1755		ret = axiom_set_new_crcs(ts, &chunk);
  1756		if (ret) {
  1757			afw->in_progress = false;
  1758			return FW_UPLOAD_ERR_FW_INVALID;
  1759		}
  1760	
  1761		/*
  1762		 * Nothing to do if the CRCs are the same. TODO: Must be extended once
  1763		 * the CDU update is added.
  1764		 */
> 1765		if ((ts->crc[AXIOM_CRC_CUR].nvltlusageconfig ==
  1766		     ts->crc[AXIOM_CRC_NEW].nvltlusageconfig)) {
  1767			afw->in_progress = false;
  1768			return FW_UPLOAD_ERR_SKIP;
  1769		}
  1770	
  1771		cur_runtime_crc = ts->crc[AXIOM_CRC_CUR].runtime;
  1772		fw_runtime_crc = ts->crc[AXIOM_CRC_NEW].runtime;
  1773		if (cur_runtime_crc != fw_runtime_crc) {
  1774			dev_err(dev, "TH2CFG and device runtime CRC doesn't match: %#x != %#x\n",
  1775				fw_runtime_crc, cur_runtime_crc);
  1776			return FW_UPLOAD_ERR_FW_INVALID;
  1777		}
  1778	
  1779		mutex_lock(&afw->lock);
  1780		ret = afw->cancel ? FW_UPLOAD_ERR_CANCELED : FW_UPLOAD_ERR_NONE;
  1781		mutex_unlock(&afw->lock);
  1782	
  1783		return ret;
  1784	}
  1785	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
