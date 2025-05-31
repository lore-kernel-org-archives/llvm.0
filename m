Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4F286A9;
	Sat, 31 May 2025 23:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748734921; cv=none; b=WgYri7PyG7w2rskIcsmjib6Yl2u0hkipM4wMvprrbq+rMePnEs79Q15xBY3/3zm8yeazhldbCzafjkOEWhqN71Xf2i9uaXXxfK2VJB/gc7kigNi1HUguxbUpAP0cMHdJoxcsXcYj3CG0gN9dQvlLtIVuesOMODFUZMeav2/cOxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748734921; c=relaxed/simple;
	bh=PbVF/lSwZXAZkLl5+CReTMCHc5N4ldXvQrdjuLc82eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wpx2bE5f6a3SpCGukTIY0KMs1lgKm3A5h9eklkqeCUQzWK7UFuOIq925KIGKssZigvwbfUctA4w1cW1XRVSJglSSGWzo2Zoou7z4aXrAPhaIcZUJoRAWj3I3Dfzqi1upVo58KRmHohRTMJGth/5r69XliKm8/dynuzLJoC/Shw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHuZikaK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHuZikaK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748734919; x=1780270919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PbVF/lSwZXAZkLl5+CReTMCHc5N4ldXvQrdjuLc82eI=;
  b=LHuZikaKquOqKes6PO9JeNPapLayVga9ZJtY4b3XWtXWzx/l9a37d3od
   hIC4gmQ6R4kNxf/xyd8fWUlLlXklfF6ocvEizaflC/9wmaD9mzAhjWBE0
   oq7r1B3mk8TkT2h38cqWGCiMkP2NeN0PBwTvC8NL0rlPcRPO+BvVIRMnD
   D0nW+7alVTxc+s7I5g07Qni/wyUwGV2zEOj2wqtbLxV3SttoRTaRWUv3g
   OPJMjZfTKjerqQKp41AlQh7jQcrKH7G/+tvIbAQaXlT5qTVBF25ofpTQZ
   W0zcmmZkxPS//gdGqseUZw8uw4gZPgddUWWrBQ8Ah9B7N/9vtBxdJiaYr
   A==;
X-CSE-ConnectionGUID: tjWC6rOESXu2oY1pMxKybg==
X-CSE-MsgGUID: IkCIwSi0TJacSoc+fYYwZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="54586694"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="54586694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 16:41:59 -0700
X-CSE-ConnectionGUID: Tj0yFlowS1ORel9HVEMOvA==
X-CSE-MsgGUID: lIAUJhmXR3mbo+8oTvqLXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="167388166"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 May 2025 16:41:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLVpr-000YhM-2L;
	Sat, 31 May 2025 23:41:55 +0000
Date: Sun, 1 Jun 2025 07:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 01/10] net: dsa: b53: add support for FDB operations
 on 5325/5365
Message-ID: <202506010756.N5VMksdd-lkp@intel.com>
References: <20250531101308.155757-2-noltari@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250531101308.155757-2-noltari@gmail.com>

Hi Álvaro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]
[also build test WARNING on net/main linus/master v6.15 next-20250530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/lvaro-Fern-ndez-Rojas/net-dsa-b53-add-support-for-FDB-operations-on-5325-5365/20250531-181619
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250531101308.155757-2-noltari%40gmail.com
patch subject: [RFC PATCH 01/10] net: dsa: b53: add support for FDB operations on 5325/5365
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250601/202506010756.N5VMksdd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010756.N5VMksdd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010756.N5VMksdd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/b53/b53_common.c:1764:7: warning: variable 'fwd_entry' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1764 |                 if (!is5325(dev) && !is5365(dev))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1767:39: note: uninitialized use occurs here
    1767 |                 b53_arl_to_entry(dev, ent, mac_vid, fwd_entry);
         |                                                     ^~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1764:3: note: remove the 'if' if its condition is always true
    1764 |                 if (!is5325(dev) && !is5365(dev))
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1765 |                         b53_read32(dev, B53_ARLIO_PAGE,
>> drivers/net/dsa/b53/b53_common.c:1764:7: warning: variable 'fwd_entry' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
    1764 |                 if (!is5325(dev) && !is5365(dev))
         |                     ^~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1767:39: note: uninitialized use occurs here
    1767 |                 b53_arl_to_entry(dev, ent, mac_vid, fwd_entry);
         |                                                     ^~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1764:7: note: remove the '&&' if its condition is always true
    1764 |                 if (!is5325(dev) && !is5365(dev))
         |                     ^~~~~~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1759:16: note: initialize the variable 'fwd_entry' to silence this warning
    1759 |                 u32 fwd_entry;
         |                              ^
         |                               = 0
>> drivers/net/dsa/b53/b53_common.c:1927:13: warning: variable 'fwd_entry' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1927 |         } else if (is5365(dev)) {
         |                    ^~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1936:38: note: uninitialized use occurs here
    1936 |         b53_arl_to_entry(dev, ent, mac_vid, fwd_entry);
         |                                             ^~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1927:9: note: remove the 'if' if its condition is always false
    1927 |         } else if (is5365(dev)) {
         |                ^~~~~~~~~~~~~~~~~~
    1928 |                 b53_read64(dev, B53_ARLIO_PAGE, B53_ARL_SRCH_RSTL_0_MACVID_65,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1929 |                            &mac_vid);
         |                            ~~~~~~~~~~
    1930 |         } else {
         |         ~~~~~~
   drivers/net/dsa/b53/b53_common.c:1924:6: warning: variable 'fwd_entry' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1924 |         if (is5325(dev)) {
         |             ^~~~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1936:38: note: uninitialized use occurs here
    1936 |         b53_arl_to_entry(dev, ent, mac_vid, fwd_entry);
         |                                             ^~~~~~~~~
   drivers/net/dsa/b53/b53_common.c:1924:2: note: remove the 'if' if its condition is always false
    1924 |         if (is5325(dev)) {
         |         ^~~~~~~~~~~~~~~~~~
    1925 |                 b53_read64(dev, B53_ARLIO_PAGE, B53_ARL_SRCH_RSTL_0_MACVID_25,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1926 |                            &mac_vid);
         |                            ~~~~~~~~~~
    1927 |         } else if (is5365(dev)) {
         |         ~~~~~~
   drivers/net/dsa/b53/b53_common.c:1922:15: note: initialize the variable 'fwd_entry' to silence this warning
    1922 |         u32 fwd_entry;
         |                      ^
         |                       = 0
   4 warnings generated.


vim +1764 drivers/net/dsa/b53/b53_common.c

  1742	
  1743	static int b53_arl_read(struct b53_device *dev, u64 mac,
  1744				u16 vid, struct b53_arl_entry *ent, u8 *idx)
  1745	{
  1746		DECLARE_BITMAP(free_bins, B53_ARLTBL_MAX_BIN_ENTRIES);
  1747		unsigned int i;
  1748		int ret;
  1749	
  1750		ret = b53_arl_op_wait(dev);
  1751		if (ret)
  1752			return ret;
  1753	
  1754		bitmap_zero(free_bins, dev->num_arl_bins);
  1755	
  1756		/* Read the bins */
  1757		for (i = 0; i < dev->num_arl_bins; i++) {
  1758			u64 mac_vid;
  1759			u32 fwd_entry;
  1760	
  1761			b53_read64(dev, B53_ARLIO_PAGE,
  1762				   B53_ARLTBL_MAC_VID_ENTRY(i), &mac_vid);
  1763	
> 1764			if (!is5325(dev) && !is5365(dev))
  1765				b53_read32(dev, B53_ARLIO_PAGE,
  1766					   B53_ARLTBL_DATA_ENTRY(i), &fwd_entry);
  1767			b53_arl_to_entry(dev, ent, mac_vid, fwd_entry);
  1768	
  1769			if (!(fwd_entry & ARLTBL_VALID)) {
  1770				set_bit(i, free_bins);
  1771				continue;
  1772			}
  1773			if ((mac_vid & ARLTBL_MAC_MASK) != mac)
  1774				continue;
  1775			if (dev->vlan_enabled &&
  1776			    ((mac_vid >> ARLTBL_VID_S) & ARLTBL_VID_MASK) != vid)
  1777				continue;
  1778			*idx = i;
  1779			return 0;
  1780		}
  1781	
  1782		*idx = find_first_bit(free_bins, dev->num_arl_bins);
  1783		return *idx >= dev->num_arl_bins ? -ENOSPC : -ENOENT;
  1784	}
  1785	
  1786	static int b53_arl_op(struct b53_device *dev, int op, int port,
  1787			      const unsigned char *addr, u16 vid, bool is_valid)
  1788	{
  1789		struct b53_arl_entry ent;
  1790		u32 fwd_entry;
  1791		u64 mac, mac_vid = 0;
  1792		u8 idx = 0;
  1793		int ret;
  1794	
  1795		/* Convert the array into a 64-bit MAC */
  1796		mac = ether_addr_to_u64(addr);
  1797	
  1798		/* Perform a read for the given MAC and VID */
  1799		b53_write48(dev, B53_ARLIO_PAGE, B53_MAC_ADDR_IDX, mac);
  1800		if (!is5325(dev))
  1801			b53_write16(dev, B53_ARLIO_PAGE, B53_VLAN_ID_IDX, vid);
  1802	
  1803		/* Issue a read operation for this MAC */
  1804		ret = b53_arl_rw_op(dev, 1);
  1805		if (ret)
  1806			return ret;
  1807	
  1808		ret = b53_arl_read(dev, mac, vid, &ent, &idx);
  1809	
  1810		/* If this is a read, just finish now */
  1811		if (op)
  1812			return ret;
  1813	
  1814		switch (ret) {
  1815		case -ETIMEDOUT:
  1816			return ret;
  1817		case -ENOSPC:
  1818			dev_dbg(dev->dev, "{%pM,%.4d} no space left in ARL\n",
  1819				addr, vid);
  1820			return is_valid ? ret : 0;
  1821		case -ENOENT:
  1822			/* We could not find a matching MAC, so reset to a new entry */
  1823			dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
  1824				addr, vid, idx);
  1825			fwd_entry = 0;
  1826			break;
  1827		default:
  1828			dev_dbg(dev->dev, "{%pM,%.4d} found, using idx: %d\n",
  1829				addr, vid, idx);
  1830			break;
  1831		}
  1832	
  1833		/* For multicast address, the port is a bitmask and the validity
  1834		 * is determined by having at least one port being still active
  1835		 */
  1836		if (!is_multicast_ether_addr(addr)) {
  1837			ent.port = port;
  1838			ent.is_valid = is_valid;
  1839		} else {
  1840			if (is_valid)
  1841				ent.port |= BIT(port);
  1842			else
  1843				ent.port &= ~BIT(port);
  1844	
  1845			ent.is_valid = !!(ent.port);
  1846		}
  1847	
  1848		ent.vid = vid;
  1849		ent.is_static = true;
  1850		ent.is_age = false;
  1851		memcpy(ent.mac, addr, ETH_ALEN);
  1852		b53_arl_from_entry(dev, &mac_vid, &fwd_entry, &ent);
  1853	
  1854		b53_write64(dev, B53_ARLIO_PAGE,
  1855			    B53_ARLTBL_MAC_VID_ENTRY(idx), mac_vid);
  1856	
  1857		if (!is5325(dev) && !is5365(dev))
  1858			b53_write32(dev, B53_ARLIO_PAGE,
  1859				    B53_ARLTBL_DATA_ENTRY(idx), fwd_entry);
  1860	
  1861		return b53_arl_rw_op(dev, 0);
  1862	}
  1863	
  1864	int b53_fdb_add(struct dsa_switch *ds, int port,
  1865			const unsigned char *addr, u16 vid,
  1866			struct dsa_db db)
  1867	{
  1868		struct b53_device *priv = ds->priv;
  1869		int ret;
  1870	
  1871		mutex_lock(&priv->arl_mutex);
  1872		ret = b53_arl_op(priv, 0, port, addr, vid, true);
  1873		mutex_unlock(&priv->arl_mutex);
  1874	
  1875		return ret;
  1876	}
  1877	EXPORT_SYMBOL(b53_fdb_add);
  1878	
  1879	int b53_fdb_del(struct dsa_switch *ds, int port,
  1880			const unsigned char *addr, u16 vid,
  1881			struct dsa_db db)
  1882	{
  1883		struct b53_device *priv = ds->priv;
  1884		int ret;
  1885	
  1886		mutex_lock(&priv->arl_mutex);
  1887		ret = b53_arl_op(priv, 0, port, addr, vid, false);
  1888		mutex_unlock(&priv->arl_mutex);
  1889	
  1890		return ret;
  1891	}
  1892	EXPORT_SYMBOL(b53_fdb_del);
  1893	
  1894	static int b53_arl_search_wait(struct b53_device *dev)
  1895	{
  1896		unsigned int timeout = 1000;
  1897		u8 reg, offset;
  1898	
  1899		if (is5325(dev) || is5365(dev))
  1900			offset = B53_ARL_SRCH_CTL_25;
  1901		else
  1902			offset = B53_ARL_SRCH_CTL;
  1903	
  1904		do {
  1905			b53_read8(dev, B53_ARLIO_PAGE, offset, &reg);
  1906			if (!(reg & ARL_SRCH_STDN))
  1907				return 0;
  1908	
  1909			if (reg & ARL_SRCH_VLID)
  1910				return 0;
  1911	
  1912			usleep_range(1000, 2000);
  1913		} while (timeout--);
  1914	
  1915		return -ETIMEDOUT;
  1916	}
  1917	
  1918	static void b53_arl_search_rd(struct b53_device *dev, u8 idx,
  1919				      struct b53_arl_entry *ent)
  1920	{
  1921		u64 mac_vid;
  1922		u32 fwd_entry;
  1923	
  1924		if (is5325(dev)) {
  1925			b53_read64(dev, B53_ARLIO_PAGE, B53_ARL_SRCH_RSTL_0_MACVID_25,
  1926				   &mac_vid);
> 1927		} else if (is5365(dev)) {
  1928			b53_read64(dev, B53_ARLIO_PAGE, B53_ARL_SRCH_RSTL_0_MACVID_65,
  1929				   &mac_vid);
  1930		} else {
  1931			b53_read64(dev, B53_ARLIO_PAGE, B53_ARL_SRCH_RSTL_MACVID(idx),
  1932				   &mac_vid);
  1933			b53_read32(dev, B53_ARLIO_PAGE, B53_ARL_SRCH_RSTL(idx),
  1934				   &fwd_entry);
  1935		}
  1936		b53_arl_to_entry(dev, ent, mac_vid, fwd_entry);
  1937	}
  1938	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
