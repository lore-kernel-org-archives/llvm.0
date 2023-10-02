Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FBD7E3;
	Mon,  2 Oct 2023 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696219399; x=1727755399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hRObPB/cUflAKnLYnprq4mSDpV/9v/dozX2ZwQ4yL/0=;
  b=UkGahkDJc3iceJ98Edkvfre5pGzsCYU8cXC0mS8sCJGn4NV1dswqr9La
   D1ZaFKC2/h8tp400xXt8lbGjncM5mL0af30LpH3qXbG0xeigOU2pmTwMs
   qw6E6VnB8FcoubZGcN1TJ1B8Sm7rnJb0bs/qkCyCHXnC6uP+vzfSfQk/K
   9ymIpvUxYYqGaembN5NUC2YuH/58BtKP8nh4ikONyIenymlE+0iV8uwmR
   k3VuGOZP4qwV3Jeh2RzgeU/H64UsDqNOXg5wtix1epNwApPQpkKAjJrpI
   Zw4kt8xYsB6CAV5WuzZhgpVRHx8c6HodUgjdVINS8W7Ryp7c54xavLsC+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="386451643"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="386451643"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 21:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="924151566"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="924151566"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Oct 2023 21:03:16 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnA9K-0005k5-0j;
	Mon, 02 Oct 2023 04:03:14 +0000
Date: Mon, 2 Oct 2023 12:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 898/1370]
 drivers/mtd/spi-nor/core.c:1726:34: warning: variable 'offset' is
 uninitialized when used here
Message-ID: <202310021105.2DxpIQvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 5fee19c6329ff527e553bfb9b158869c482b1c27 [898/1370] mtd: spi-nor: Add EAR support
config: arm-dove_defconfig (https://download.01.org/0day-ci/archive/20231002/202310021105.2DxpIQvB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310021105.2DxpIQvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310021105.2DxpIQvB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/core.c:593:5: warning: no previous prototype for function 'spi_nor_write_ear' [-Wmissing-prototypes]
     593 | int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
         |     ^
   drivers/mtd/spi-nor/core.c:593:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     593 | int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
         | ^
         | static 
>> drivers/mtd/spi-nor/core.c:1726:34: warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
    1726 |                                 ret = spi_nor_write_ear(nor, offset);
         |                                                              ^~~~~~
   drivers/mtd/spi-nor/core.c:1565:23: note: initialize the variable 'offset' to silence this warning
    1565 |         u32 addr, len, offset, cur_cs_num = 0;
         |                              ^
         |                               = 0
   2 warnings generated.


vim +/offset +1726 drivers/mtd/spi-nor/core.c

  1556	
  1557	/*
  1558	 * Erase an address range on the nor chip.  The address range may extend
  1559	 * one or more erase sectors. Return an error if there is a problem erasing.
  1560	 */
  1561	static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
  1562	{
  1563		struct spi_nor *nor = mtd_to_spi_nor(mtd);
  1564		struct spi_nor_flash_parameter *params;
  1565		u32 addr, len, offset, cur_cs_num = 0;
  1566		uint32_t rem;
  1567		int ret;
  1568		u64 sz;
  1569	
  1570		dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
  1571				(long long)instr->len);
  1572	
  1573		params = spi_nor_get_params(nor, 0);
  1574		sz = params->size;
  1575	
  1576		if (spi_nor_has_uniform_erase(nor)) {
  1577			div_u64_rem(instr->len, mtd->erasesize, &rem);
  1578			if (rem)
  1579				return -EINVAL;
  1580		}
  1581	
  1582		addr = instr->addr;
  1583		len = instr->len;
  1584	
  1585		ret = spi_nor_lock_and_prep(nor);
  1586		if (ret)
  1587			return ret;
  1588	
  1589		if (!(nor->flags & SNOR_F_HAS_PARALLEL)) {
  1590			/* whole-chip erase? */
  1591			if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
  1592				unsigned long timeout;
  1593	
  1594				while ((cur_cs_num < SNOR_FLASH_CNT_MAX) && params) {
  1595					nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
  1596					ret = spi_nor_write_enable(nor);
  1597					if (ret)
  1598						goto erase_err;
  1599	
  1600					ret = spi_nor_erase_chip(nor);
  1601					if (ret)
  1602						goto erase_err;
  1603	
  1604					/*
  1605					 * Scale the timeout linearly with the size of the flash, with
  1606					 * a minimum calibrated to an old 2MB flash. We could try to
  1607					 * pull these from CFI/SFDP, but these values should be good
  1608					 * enough for now.
  1609					 */
  1610					timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
  1611						      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
  1612						      (unsigned long)(params->size /
  1613								      SZ_2M));
  1614					ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
  1615					if (ret)
  1616						goto erase_err;
  1617	
  1618					cur_cs_num++;
  1619					params = spi_nor_get_params(nor, cur_cs_num);
  1620				}
  1621	
  1622			/* REVISIT in some cases we could speed up erasing large regions
  1623			 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
  1624			 * to use "small sector erase", but that's not always optimal.
  1625			 */
  1626	
  1627			/* "sector"-at-a-time erase */
  1628			} else if (spi_nor_has_uniform_erase(nor)) {
  1629				/* Determine the flash from which the operation need to start */
  1630				while ((cur_cs_num < SNOR_FLASH_CNT_MAX) &&
  1631				       (addr > sz - 1) && params) {
  1632					cur_cs_num++;
  1633					params = spi_nor_get_params(nor, cur_cs_num);
  1634					sz += params->size;
  1635				}
  1636				while (len) {
  1637					nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
  1638					ret = spi_nor_write_enable(nor);
  1639					if (ret)
  1640						goto erase_err;
  1641	
  1642					offset = addr;
  1643					if (nor->flags & SNOR_F_HAS_STACKED) {
  1644						params = spi_nor_get_params(nor, cur_cs_num);
  1645						offset -= (sz - params->size);
  1646					}
  1647	
  1648					if (nor->addr_nbytes == 3) {
  1649						/* Update Extended Address Register */
  1650						ret = spi_nor_write_ear(nor, offset);
  1651						if (ret)
  1652							goto erase_err;
  1653					}
  1654					ret = spi_nor_wait_till_ready(nor);
  1655					if (ret)
  1656						goto erase_err;
  1657	
  1658					ret = spi_nor_write_enable(nor);
  1659					if (ret)
  1660						goto erase_err;
  1661	
  1662					ret = spi_nor_erase_sector(nor, offset);
  1663					if (ret)
  1664						goto erase_err;
  1665	
  1666					ret = spi_nor_wait_till_ready(nor);
  1667					if (ret)
  1668						goto erase_err;
  1669	
  1670					addr += mtd->erasesize;
  1671					len -= mtd->erasesize;
  1672	
  1673					/*
  1674					 * Flash cross over condition in stacked mode.
  1675					 */
  1676					if ((nor->flags & SNOR_F_HAS_STACKED) && (addr > sz - 1)) {
  1677						cur_cs_num++;
  1678						params = spi_nor_get_params(nor, cur_cs_num);
  1679						sz += params->size;
  1680					}
  1681				}
  1682	
  1683			/* erase multiple sectors */
  1684			} else {
  1685				u64 erase_len = 0;
  1686	
  1687				/* Determine the flash from which the operation need to start */
  1688				while ((cur_cs_num < SNOR_FLASH_CNT_MAX) &&
  1689				       (addr > sz - 1) && params) {
  1690					cur_cs_num++;
  1691					params = spi_nor_get_params(nor, cur_cs_num);
  1692					sz += params->size;
  1693				}
  1694				/* perform multi sector erase onec per Flash*/
  1695				while (len) {
  1696					erase_len = (len > (sz - addr)) ? (sz - addr) : len;
  1697					offset = addr;
  1698					nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
  1699					if (nor->flags & SNOR_F_HAS_STACKED) {
  1700						params = spi_nor_get_params(nor, cur_cs_num);
  1701						offset -= (sz - params->size);
  1702					}
  1703					ret = spi_nor_erase_multi_sectors(nor, offset, erase_len);
  1704					if (ret)
  1705						goto erase_err;
  1706					len -= erase_len;
  1707					addr += erase_len;
  1708					params = spi_nor_get_params(nor, cur_cs_num);
  1709					sz += params->size;
  1710				}
  1711			}
  1712		} else {
  1713			nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
  1714	
  1715			/* whole-chip erase? */
  1716			if (len == mtd->size && !(nor->flags &
  1717						  SNOR_F_NO_OP_CHIP_ERASE)) {
  1718				unsigned long timeout;
  1719	
  1720				ret = spi_nor_write_enable(nor);
  1721				if (ret)
  1722					goto erase_err;
  1723	
  1724				if (nor->addr_nbytes == 3) {
  1725					/* Update Extended Address Register */
> 1726					ret = spi_nor_write_ear(nor, offset);
  1727					if (ret)
  1728						goto erase_err;
  1729				}
  1730				ret = spi_nor_wait_till_ready(nor);
  1731				if (ret)
  1732					goto erase_err;
  1733	
  1734				ret = spi_nor_write_enable(nor);
  1735				if (ret)
  1736					goto erase_err;
  1737	
  1738				ret = spi_nor_erase_chip(nor);
  1739				if (ret)
  1740					goto erase_err;
  1741	
  1742				/*
  1743				 * Scale the timeout linearly with the size of the flash, with
  1744				 * a minimum calibrated to an old 2MB flash. We could try to
  1745				 * pull these from CFI/SFDP, but these values should be good
  1746				 * enough for now.
  1747				 */
  1748				timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
  1749					      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
  1750					      (unsigned long)(mtd->size / SZ_2M));
  1751				ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
  1752				if (ret)
  1753					goto erase_err;
  1754	
  1755			/* REVISIT in some cases we could speed up erasing large regions
  1756			 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
  1757			 * to use "small sector erase", but that's not always optimal.
  1758			 */
  1759	
  1760			/* "sector"-at-a-time erase */
  1761			} else if (spi_nor_has_uniform_erase(nor)) {
  1762				while (len) {
  1763					ret = spi_nor_write_enable(nor);
  1764					if (ret)
  1765						goto erase_err;
  1766	
  1767					offset = addr / 2;
  1768	
  1769					if (nor->addr_nbytes == 3) {
  1770						/* Update Extended Address Register */
  1771						ret = spi_nor_write_ear(nor, offset);
  1772						if (ret)
  1773							goto erase_err;
  1774					}
  1775					ret = spi_nor_wait_till_ready(nor);
  1776					if (ret)
  1777						goto erase_err;
  1778	
  1779					ret = spi_nor_write_enable(nor);
  1780					if (ret)
  1781						goto erase_err;
  1782	
  1783					ret = spi_nor_erase_sector(nor, offset);
  1784					if (ret)
  1785						goto erase_err;
  1786	
  1787					ret = spi_nor_wait_till_ready(nor);
  1788					if (ret)
  1789						goto erase_err;
  1790	
  1791					addr += mtd->erasesize;
  1792					len -= mtd->erasesize;
  1793				}
  1794	
  1795			/* erase multiple sectors */
  1796			} else {
  1797				offset = addr / 2;
  1798				ret = spi_nor_erase_multi_sectors(nor, offset, len);
  1799				if (ret)
  1800					goto erase_err;
  1801			}
  1802		}
  1803		ret = spi_nor_write_disable(nor);
  1804	
  1805	erase_err:
  1806		spi_nor_unlock_and_unprep(nor);
  1807	
  1808		return ret;
  1809	}
  1810	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
