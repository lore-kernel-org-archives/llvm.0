Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32D72F26;
	Sat, 11 May 2024 11:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715426826; cv=none; b=AvxE9PidvsEr3TbnlQQcOsBdPVX6bXeVn3XifBrykbzfBhTLeLtTcKV38TuqSZYHy7wMncns0zz4XAmo6cFRAlKytUxJxyKWqgCrJryPkSAaBFutHnjRvyKQSdGwz5TuEnbpmrcWgm1qWEr5aBAIjEZ6LunCMbh26eRyMuikxAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715426826; c=relaxed/simple;
	bh=H2OaQTPAsRZkWaPkzN8SlKZEtKvekM0EraPhEUlNOrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SI7ZWNRzNP+dMqMVQ01duICfLGfqHSuaM0ivD9pR7NRzxxbCTlUil8DJujSG71XipNL7+oy1BWnUefEvzbtD4gl03hm1ms9176Cmz12cWGha3lT4ya2lURFoILtV8CVHcImQnnbkifWspMXjiR6MWE6XmxnJv4+X51IDi0Jj/sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfjhIwod; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfjhIwod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715426825; x=1746962825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2OaQTPAsRZkWaPkzN8SlKZEtKvekM0EraPhEUlNOrs=;
  b=gfjhIwod10EOhbVb0ssjRBWwBpxHLPGW2JRIoyXD/Rmws7RziIkFavwg
   5QGMDSADLvrjfvwCUTpkN2WszyLDX8dVBg0M4wvmUPYxcdVUbPMqV2zZT
   7g/z6c5sOwMteMGySV5n7RVS5hHfmpYE5y1qD8K/kMx70kKyulV0N6ZAp
   XndB8T8Jqxi1TGvzSF7kkDEhUXR9riev3rIydyLxQg3BnCqulO6iFNjXB
   hH/fHsa0trkuBGmX/eIsicBlqxUIMcElx963tzToyzJ/bzWkL55lBSbca
   C8a+lVBmAtUZJ7cXnciGhaWIHy6msYpqGjqInO0wa/NGWANP7ik5wc+Jm
   Q==;
X-CSE-ConnectionGUID: 0CQO8tAaTIS10xxf5CQp7Q==
X-CSE-MsgGUID: eeYKxjbZTAGUkBgfU0W4aA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11637470"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="11637470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 04:27:04 -0700
X-CSE-ConnectionGUID: Yf3obMfxQiqcqDEfToEKEw==
X-CSE-MsgGUID: g0vg9dvpQhCianGhlWDPaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="29996088"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2024 04:27:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5ksV-0007JX-2i;
	Sat, 11 May 2024 11:26:59 +0000
Date: Sat, 11 May 2024 19:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Simon Horman <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [morimoto:renesas-bsp/v6.1-dev 13/18]
 drivers/net/ethernet/renesas/rswitch.c:1807:10: error: call to undeclared
 function 'clk_get_rate'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202405111942.d7Fbf8aC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1-dev
head:   77aa8a782c7cfec5abdd25e5426bd90f67497848
commit: fa24f11486bc1e6885936fd713c7e5da9323b16c [13/18] net: ethernet: renesas: rcar_gen4_ptp: Get clock increment from clock rate
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240511/202405111942.d7Fbf8aC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111942.d7Fbf8aC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111942.d7Fbf8aC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/renesas/rswitch.c:7:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1775:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/ethernet/renesas/rswitch.c:7:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/renesas/rswitch.c:7:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/renesas/rswitch.c:7:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/net/ethernet/renesas/rswitch.c:1807:10: error: call to undeclared function 'clk_get_rate'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1807 |                                      clk_get_rate(priv->clk));
         |                                      ^
>> drivers/net/ethernet/renesas/rswitch.c:1807:29: error: no member named 'clk' in 'struct rswitch_private'
    1807 |                                      clk_get_rate(priv->clk));
         |                                                   ~~~~  ^
   7 warnings and 2 errors generated.


vim +/clk_get_rate +1807 drivers/net/ethernet/renesas/rswitch.c

  1764	
  1765	static int rswitch_init(struct rswitch_private *priv)
  1766	{
  1767		int i, err;
  1768	
  1769		for (i = 0; i < RSWITCH_NUM_PORTS; i++)
  1770			rswitch_etha_init(priv, i);
  1771	
  1772		rswitch_clock_enable(priv);
  1773		for (i = 0; i < RSWITCH_NUM_PORTS; i++)
  1774			rswitch_etha_read_mac_address(&priv->etha[i]);
  1775	
  1776		rswitch_reset(priv);
  1777	
  1778		rswitch_clock_enable(priv);
  1779		rswitch_top_init(priv);
  1780		err = rswitch_bpool_config(priv);
  1781		if (err < 0)
  1782			return err;
  1783	
  1784		err = rswitch_gwca_linkfix_alloc(priv);
  1785		if (err < 0)
  1786			return -ENOMEM;
  1787	
  1788		err = rswitch_gwca_ts_queue_alloc(priv);
  1789		if (err < 0)
  1790			goto err_ts_queue_alloc;
  1791	
  1792		rswitch_gwca_ts_queue_fill(priv, 0, TS_RING_SIZE);
  1793		INIT_LIST_HEAD(&priv->gwca.ts_info_list);
  1794	
  1795		for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
  1796			err = rswitch_device_alloc(priv, i);
  1797			if (err < 0) {
  1798				for (i--; i >= 0; i--)
  1799					rswitch_device_free(priv, i);
  1800				goto err_device_alloc;
  1801			}
  1802		}
  1803	
  1804		rswitch_fwd_init(priv);
  1805	
  1806		err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
> 1807					     clk_get_rate(priv->clk));
  1808		if (err < 0)
  1809			goto err_ptp_register;
  1810	
  1811		err = rswitch_gwca_request_irqs(priv);
  1812		if (err < 0)
  1813			goto err_gwca_request_irq;
  1814	
  1815		err = rswitch_gwca_ts_request_irqs(priv);
  1816		if (err < 0)
  1817			goto err_gwca_ts_request_irq;
  1818	
  1819		err = rswitch_gwca_hw_init(priv);
  1820		if (err < 0)
  1821			goto err_gwca_hw_init;
  1822	
  1823		err = rswitch_ether_port_init_all(priv);
  1824		if (err)
  1825			goto err_ether_port_init_all;
  1826	
  1827		rswitch_for_each_enabled_port(priv, i) {
  1828			err = register_netdev(priv->rdev[i]->ndev);
  1829			if (err) {
  1830				rswitch_for_each_enabled_port_continue_reverse(priv, i)
  1831					unregister_netdev(priv->rdev[i]->ndev);
  1832				goto err_register_netdev;
  1833			}
  1834		}
  1835	
  1836		rswitch_for_each_enabled_port(priv, i)
  1837			netdev_info(priv->rdev[i]->ndev, "MAC address %pM\n",
  1838				    priv->rdev[i]->ndev->dev_addr);
  1839	
  1840		return 0;
  1841	
  1842	err_register_netdev:
  1843		rswitch_ether_port_deinit_all(priv);
  1844	
  1845	err_ether_port_init_all:
  1846		rswitch_gwca_hw_deinit(priv);
  1847	
  1848	err_gwca_hw_init:
  1849	err_gwca_ts_request_irq:
  1850	err_gwca_request_irq:
  1851		rcar_gen4_ptp_unregister(priv->ptp_priv);
  1852	
  1853	err_ptp_register:
  1854		for (i = 0; i < RSWITCH_NUM_PORTS; i++)
  1855			rswitch_device_free(priv, i);
  1856	
  1857	err_device_alloc:
  1858		rswitch_gwca_ts_queue_free(priv);
  1859	
  1860	err_ts_queue_alloc:
  1861		rswitch_gwca_linkfix_free(priv);
  1862	
  1863		return err;
  1864	}
  1865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
