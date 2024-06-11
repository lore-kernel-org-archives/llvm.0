Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D352A1C0;
	Tue, 11 Jun 2024 03:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718076846; cv=none; b=o4zOGfNW9Lb6O2zPgxObI8Iu1on1g6pjEoZNWQrvHcy63R3DZ953YAVvo72l44dETPFdh995okDusAY5fvppmeqN+HyYMGEym57fawiRRff5cxpSRYMtbePxRktgnSs9Ut2uu435SNlawqVMOz1DNSEyaAeo/Y3NTcv7kxBJUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718076846; c=relaxed/simple;
	bh=vbHfMNDunoQCkHA6O0Fnf1moTYcmFOJUbk22RPVN4lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=undKEtM7U1qpAAxojpVDxXKZ7LnSvJNs7Dv4y+0Tqh5kZtWbdQWb+BV2oiGQK+2/dMXahC4GiA+fY0onMwexUlL/Prp8pu6eYd47gP661Y91BiwU2fUVBlyOjHo7PqXqaIZACl0sjG/Xyp7a8cLdOl/iGgQzQOxUEbxbzgjnXTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dz+uKVl3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dz+uKVl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718076845; x=1749612845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vbHfMNDunoQCkHA6O0Fnf1moTYcmFOJUbk22RPVN4lY=;
  b=dz+uKVl38k11DNhFA14vbsWay88qLBB406y8tb6cuzZeVD9P1zrQK5cC
   +z4PjW99rUB3OY6ztWO5qplQee7xvOazmW/0iz0vJMDdKlft4RZvoYuol
   X8jXiHLO99H4yLULSwWJsKCEAETrAxKGMIwUoBI0iUkiaiX4R+DtF5Z0n
   NfAwhA9L779JEvPse7iUEkNGOMZpNRDnMijUtfUmjug/BYjt3IHsbkNxF
   f8HnHFCUjY2Il0Z+RZvqA0f9DeB8fKlATPPKEixe0zlBfB9pDk2Ft2wXB
   fdhft0T9d0VQ7mjOT+OlpAeIwtfjD2Tx9DQ3E3afIBRsLBFs2OwvVjnt6
   A==;
X-CSE-ConnectionGUID: wnX38O01SDWHuZla5C7wzQ==
X-CSE-MsgGUID: OWDLV0nmRUiM8biIi6MHVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32250814"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32250814"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 20:34:05 -0700
X-CSE-ConnectionGUID: s3o/aRT2TNukIv11e34OqA==
X-CSE-MsgGUID: X5a+NF7USOCNqCbV/KjLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39953052"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jun 2024 20:34:03 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGsGm-0002lZ-28;
	Tue, 11 Jun 2024 03:34:00 +0000
Date: Tue, 11 Jun 2024 11:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [net-next,v6] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <202406111130.CCbMJGDt-lkp@intel.com>
References: <20240610135935.2519155-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610135935.2519155-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc3 next-20240607]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-S-derlund/net-ethernet-rtsn-Add-support-for-Renesas-Ethernet-TSN/20240610-220814
base:   linus/master
patch link:    https://lore.kernel.org/r/20240610135935.2519155-1-niklas.soderlund%2Brenesas%40ragnatech.se
patch subject: [net-next,v6] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240611/202406111130.CCbMJGDt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111130.CCbMJGDt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111130.CCbMJGDt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/renesas/rtsn.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/ethernet/renesas/rtsn.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from drivers/net/ethernet/renesas/rtsn.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/renesas/rtsn.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
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
>> drivers/net/ethernet/renesas/rtsn.c:913:5: warning: variable 'iface' is uninitialized when used here [-Wuninitialized]
     913 |                                 iface);
         |                                 ^~~~~
   drivers/net/ethernet/renesas/rtsn.c:904:2: note: variable 'iface' is declared here
     904 |         phy_interface_t iface;
         |         ^
   8 warnings generated.


vim +/iface +913 drivers/net/ethernet/renesas/rtsn.c

   898	
   899	static int rtsn_phy_init(struct rtsn_private *priv)
   900	{
   901		struct device_node *np = priv->ndev->dev.parent->of_node;
   902		struct phy_device *phydev;
   903		struct device_node *phy;
   904		phy_interface_t iface;
   905	
   906		priv->link = 0;
   907	
   908		phy = of_parse_phandle(np, "phy-handle", 0);
   909		if (!phy)
   910			return -ENOENT;
   911	
   912		phydev = of_phy_connect(priv->ndev, phy, rtsn_adjust_link, 0,
 > 913					iface);
   914		of_node_put(phy);
   915		if (!phydev)
   916			return -ENOENT;
   917	
   918		/* Only support full-duplex mode */
   919		phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_10baseT_Half_BIT);
   920		phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_100baseT_Half_BIT);
   921		phy_remove_link_mode(phydev, ETHTOOL_LINK_MODE_1000baseT_Half_BIT);
   922	
   923		phy_attached_info(phydev);
   924	
   925		return 0;
   926	}
   927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
