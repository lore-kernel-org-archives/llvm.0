Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0B6FD2;
	Wed, 12 Apr 2023 17:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681319062; x=1712855062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8guRHxFq9/yPpcqOvC1MeOY9gUelFzBE58yFnp9rZU=;
  b=S44Q9TFGbOopyqH1DhwFqDi63Om5otI2nZH4viK6b2Dm640uRn0VTjDR
   bJXqO5/rOC5SiH/PrC/UuoupGX3ix/4DtOwrEyiu68G+AGDA4opUReZNM
   BL3iJb8cidP4rT1FoIoRW9Bh4aBHaKRd3Ckd9CIi+9iR8xlh+dyGX/luH
   P71p0jrK69apbpz7pga/EDQGh1M1VQMzyFPmAbD93tvP0Py7/i+RLWGz1
   d9lzoh74KLdOcPHxbQXb7thB/jvJh7xW83VyRCgMy5UUBUYm1bQhXz6DI
   7qnvrlmmRqpA6q1mqz7w8LAiD2X1sGRsVlzFY1fGC62tg5diyhVWF+TVC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341453560"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="341453560"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 10:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935192944"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="935192944"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2023 10:04:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmdtK-000XvL-1i;
	Wed, 12 Apr 2023 17:04:18 +0000
Date: Thu, 13 Apr 2023 01:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 950/1117] drivers/mtd/spi-nor/core.c:1724:34:
 warning: variable 'offset' is uninitialized when used here
Message-ID: <202304130035.hN0Czp9b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: e0c2c63b704976190abcbfb1a9b728fac4f7b7b8 [950/1117] mtd: spi-nor: Add EAR support
config: x86_64-randconfig-a001-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130035.hN0Czp9b-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/e0c2c63b704976190abcbfb1a9b728fac4f7b7b8
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout e0c2c63b704976190abcbfb1a9b728fac4f7b7b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130035.hN0Czp9b-lkp@intel.com/

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
https://github.com/intel/lkp-tests
