Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69A728EC;
	Tue,  5 Sep 2023 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693925960; x=1725461960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/bhZKevR2GaoPJgfgicNQmFs36R3GB7CQVYzZPsnrI=;
  b=C8hJ1y3M2KONka8ZTBsykSvczI9rj0V9vbO9lUoJvHMhjCwm7fI7DZvY
   fBldchg9e1MVQgetK2+K7o++SbKorycJZ+PevLZcLRbhNKu6+N5eiSvf6
   l5zQS5ReJy0wKMBeGxrvT09on05oezpEpKN53XRUAld3V1gcpP9GO2gLq
   bBi+Sgy2+AsNsCwNOoabrMiXestSymzeTGBLENghKh66a/yb0PR0GhNnk
   Gt1+i1MqHjy/SUyGN8PTjlDqRa90sbDirwygl0Y+5i88smFlw8ACGdJRn
   j8gE4/zYcxEuaYHPALKVCiRGzJVTipfjPKztjRatVMDptF6LvFA01b3CN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="367034131"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="367034131"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 07:59:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="1071993327"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="1071993327"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Sep 2023 07:59:16 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdXWM-0001mK-0u;
	Tue, 05 Sep 2023 14:59:14 +0000
Date: Tue, 5 Sep 2023 22:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 950/1123] drivers/mtd/spi-nor/core.c:1724:34:
 warning: variable 'offset' is uninitialized when used here
Message-ID: <202309052205.KTfkeQu1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amit,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: e0c2c63b704976190abcbfb1a9b728fac4f7b7b8 [950/1123] mtd: spi-nor: Add EAR support
config: x86_64-buildonly-randconfig-004-20230905 (https://download.01.org/0day-ci/archive/20230905/202309052205.KTfkeQu1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309052205.KTfkeQu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309052205.KTfkeQu1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/core.c:593:5: warning: no previous prototype for function 'spi_nor_write_ear' [-Wmissing-prototypes]
   int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
       ^
   drivers/mtd/spi-nor/core.c:593:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
   ^
   static 
>> drivers/mtd/spi-nor/core.c:1724:34: warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
                                   ret = spi_nor_write_ear(nor, offset);
                                                                ^~~~~~
   drivers/mtd/spi-nor/core.c:1563:23: note: initialize the variable 'offset' to silence this warning
           u32 addr, len, offset, cur_cs_num = 0;
                                ^
                                 = 0
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +/offset +1724 drivers/mtd/spi-nor/core.c

  1554	
  1555	/*
  1556	 * Erase an address range on the nor chip.  The address range may extend
  1557	 * one or more erase sectors. Return an error if there is a problem erasing.
  1558	 */
  1559	static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
  1560	{
  1561		struct spi_nor *nor = mtd_to_spi_nor(mtd);
  1562		struct spi_nor_flash_parameter *params;
  1563		u32 addr, len, offset, cur_cs_num = 0;
  1564		uint32_t rem;
  1565		int ret;
  1566		u64 sz;
  1567	
  1568		dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
  1569				(long long)instr->len);
  1570	
  1571		params = spi_nor_get_params(nor, 0);
  1572		sz = params->size;
  1573	
  1574		if (spi_nor_has_uniform_erase(nor)) {
  1575			div_u64_rem(instr->len, mtd->erasesize, &rem);
  1576			if (rem)
  1577				return -EINVAL;
  1578		}
  1579	
  1580		addr = instr->addr;
  1581		len = instr->len;
  1582	
  1583		ret = spi_nor_lock_and_prep(nor);
  1584		if (ret)
  1585			return ret;
  1586	
  1587		if (!(nor->flags & SNOR_F_HAS_PARALLEL)) {
  1588			/* whole-chip erase? */
  1589			if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
  1590				unsigned long timeout;
  1591	
  1592				while ((cur_cs_num < SNOR_FLASH_CNT_MAX) && params) {
  1593					nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
  1594					ret = spi_nor_write_enable(nor);
  1595					if (ret)
  1596						goto erase_err;
  1597	
  1598					ret = spi_nor_erase_chip(nor);
  1599					if (ret)
  1600						goto erase_err;
  1601	
  1602					/*
  1603					 * Scale the timeout linearly with the size of the flash, with
  1604					 * a minimum calibrated to an old 2MB flash. We could try to
  1605					 * pull these from CFI/SFDP, but these values should be good
  1606					 * enough for now.
  1607					 */
  1608					timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
  1609						      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
  1610						      (unsigned long)(params->size /
  1611								      SZ_2M));
  1612					ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
  1613					if (ret)
  1614						goto erase_err;
  1615	
  1616					cur_cs_num++;
  1617					params = spi_nor_get_params(nor, cur_cs_num);
  1618				}
  1619	
  1620			/* REVISIT in some cases we could speed up erasing large regions
  1621			 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
  1622			 * to use "small sector erase", but that's not always optimal.
  1623			 */
  1624	
  1625			/* "sector"-at-a-time erase */
  1626			} else if (spi_nor_has_uniform_erase(nor)) {
  1627				/* Determine the flash from which the operation need to start */
  1628				while ((cur_cs_num < SNOR_FLASH_CNT_MAX) &&
  1629				       (addr > sz - 1) && params) {
  1630					cur_cs_num++;
  1631					params = spi_nor_get_params(nor, cur_cs_num);
  1632					sz += params->size;
  1633				}
  1634				while (len) {
  1635					nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
  1636					ret = spi_nor_write_enable(nor);
  1637					if (ret)
  1638						goto erase_err;
  1639	
  1640					offset = addr;
  1641					if (nor->flags & SNOR_F_HAS_STACKED) {
  1642						params = spi_nor_get_params(nor, cur_cs_num);
  1643						offset -= (sz - params->size);
  1644					}
  1645	
  1646					if (nor->addr_nbytes == 3) {
  1647						/* Update Extended Address Register */
  1648						ret = spi_nor_write_ear(nor, offset);
  1649						if (ret)
  1650							goto erase_err;
  1651					}
  1652					ret = spi_nor_wait_till_ready(nor);
  1653					if (ret)
  1654						goto erase_err;
  1655	
  1656					ret = spi_nor_write_enable(nor);
  1657					if (ret)
  1658						goto erase_err;
  1659	
  1660					ret = spi_nor_erase_sector(nor, offset);
  1661					if (ret)
  1662						goto erase_err;
  1663	
  1664					ret = spi_nor_wait_till_ready(nor);
  1665					if (ret)
  1666						goto erase_err;
  1667	
  1668					addr += mtd->erasesize;
  1669					len -= mtd->erasesize;
  1670	
  1671					/*
  1672					 * Flash cross over condition in stacked mode.
  1673					 */
  1674					if ((nor->flags & SNOR_F_HAS_STACKED) && (addr > sz - 1)) {
  1675						cur_cs_num++;
  1676						params = spi_nor_get_params(nor, cur_cs_num);
  1677						sz += params->size;
  1678					}
  1679				}
  1680	
  1681			/* erase multiple sectors */
  1682			} else {
  1683				u64 erase_len = 0;
  1684	
  1685				/* Determine the flash from which the operation need to start */
  1686				while ((cur_cs_num < SNOR_FLASH_CNT_MAX) &&
  1687				       (addr > sz - 1) && params) {
  1688					cur_cs_num++;
  1689					params = spi_nor_get_params(nor, cur_cs_num);
  1690					sz += params->size;
  1691				}
  1692				/* perform multi sector erase onec per Flash*/
  1693				while (len) {
  1694					erase_len = (len > (sz - addr)) ? (sz - addr) : len;
  1695					offset = addr;
  1696					nor->spimem->spi->cs_index_mask = 1 << cur_cs_num;
  1697					if (nor->flags & SNOR_F_HAS_STACKED) {
  1698						params = spi_nor_get_params(nor, cur_cs_num);
  1699						offset -= (sz - params->size);
  1700					}
  1701					ret = spi_nor_erase_multi_sectors(nor, offset, erase_len);
  1702					if (ret)
  1703						goto erase_err;
  1704					len -= erase_len;
  1705					addr += erase_len;
  1706					params = spi_nor_get_params(nor, cur_cs_num);
  1707					sz += params->size;
  1708				}
  1709			}
  1710		} else {
  1711			nor->spimem->spi->cs_index_mask = SPI_NOR_ENABLE_MULTI_CS;
  1712	
  1713			/* whole-chip erase? */
  1714			if (len == mtd->size && !(nor->flags &
  1715						  SNOR_F_NO_OP_CHIP_ERASE)) {
  1716				unsigned long timeout;
  1717	
  1718				ret = spi_nor_write_enable(nor);
  1719				if (ret)
  1720					goto erase_err;
  1721	
  1722				if (nor->addr_nbytes == 3) {
  1723					/* Update Extended Address Register */
> 1724					ret = spi_nor_write_ear(nor, offset);
  1725					if (ret)
  1726						goto erase_err;
  1727				}
  1728				ret = spi_nor_wait_till_ready(nor);
  1729				if (ret)
  1730					goto erase_err;
  1731	
  1732				ret = spi_nor_write_enable(nor);
  1733				if (ret)
  1734					goto erase_err;
  1735	
  1736				ret = spi_nor_erase_chip(nor);
  1737				if (ret)
  1738					goto erase_err;
  1739	
  1740				/*
  1741				 * Scale the timeout linearly with the size of the flash, with
  1742				 * a minimum calibrated to an old 2MB flash. We could try to
  1743				 * pull these from CFI/SFDP, but these values should be good
  1744				 * enough for now.
  1745				 */
  1746				timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
  1747					      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
  1748					      (unsigned long)(mtd->size / SZ_2M));
  1749				ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
  1750				if (ret)
  1751					goto erase_err;
  1752	
  1753			/* REVISIT in some cases we could speed up erasing large regions
  1754			 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
  1755			 * to use "small sector erase", but that's not always optimal.
  1756			 */
  1757	
  1758			/* "sector"-at-a-time erase */
  1759			} else if (spi_nor_has_uniform_erase(nor)) {
  1760				while (len) {
  1761					ret = spi_nor_write_enable(nor);
  1762					if (ret)
  1763						goto erase_err;
  1764	
  1765					offset = addr / 2;
  1766	
  1767					if (nor->addr_nbytes == 3) {
  1768						/* Update Extended Address Register */
  1769						ret = spi_nor_write_ear(nor, offset);
  1770						if (ret)
  1771							goto erase_err;
  1772					}
  1773					ret = spi_nor_wait_till_ready(nor);
  1774					if (ret)
  1775						goto erase_err;
  1776	
  1777					ret = spi_nor_write_enable(nor);
  1778					if (ret)
  1779						goto erase_err;
  1780	
  1781					ret = spi_nor_erase_sector(nor, offset);
  1782					if (ret)
  1783						goto erase_err;
  1784	
  1785					ret = spi_nor_wait_till_ready(nor);
  1786					if (ret)
  1787						goto erase_err;
  1788	
  1789					addr += mtd->erasesize;
  1790					len -= mtd->erasesize;
  1791				}
  1792	
  1793			/* erase multiple sectors */
  1794			} else {
  1795				offset = addr / 2;
  1796				ret = spi_nor_erase_multi_sectors(nor, offset, len);
  1797				if (ret)
  1798					goto erase_err;
  1799			}
  1800		}
  1801		ret = spi_nor_write_disable(nor);
  1802	
  1803	erase_err:
  1804		spi_nor_unlock_and_unprep(nor);
  1805	
  1806		return ret;
  1807	}
  1808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
