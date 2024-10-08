Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19C9155C97;
	Tue,  8 Oct 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728369584; cv=none; b=nPzaMvxwpU7fTIH+eTz4tegd/kLxb8yV+WLNGDI77asjoJs09ADWZpscuPcmbPeJ1Tt/ACB+x734CgK4i+xe4c+ymts8Hta0JbN2sATyFUdTARPDf0RN/6iYLtvnewScyW1gpTcqvlEDhexJAVQGiNNEC4wP3/Ra5YAv2frr/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728369584; c=relaxed/simple;
	bh=U+xvv9ov4LKFFfbARdhJSp+b4d+ti9HdIRUspm5hlrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqipM/WX9HMPlE81uY5ZqcyFFOfJMAzEPb9SrhgZ9lf5fZD0HoFloArKtMcxJLOIT/MpxcExK68r7AE8MNvZKSLbAq9VCjSui8eqFbTH0Lj8u+9H1CeCmR/1zEuafKbbU9OmUIxZWCtTIcyRi+aWuowsgLZfC3zvg5r7j0tz8VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1q5F2ij; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1q5F2ij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728369582; x=1759905582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U+xvv9ov4LKFFfbARdhJSp+b4d+ti9HdIRUspm5hlrQ=;
  b=m1q5F2ij+FsK2tSIrVsMFMImQ9BkQ7eUBpdMI+f1BG/s7YZnfNjduDU6
   yhurlBg8PO/0B7UMqa1ykVjAwjUL6DBKOE8eoJgb0vxqbItkWoMiBWt1u
   Odp2j6JWbbQmqESY3Xju5PFIvE2nRcN36M0Qq+yi5MIeTfqdRhDYo3xJ0
   ChBTUfI8xTFRmnNj8lGXyFw5WiHCdpo/GW5b1t/o9+B27i/FU/3C4fdDY
   ebzKfUCdxgGzVEQwpnnDGauW5398HnAgxpKYImTId2Y0DxzhHPjGOiSB/
   0xc9X7xZNi62TbBgeCfvq5OPsYqDb3vPZlanCNVz06HIYmslkgfx6Rt2R
   w==;
X-CSE-ConnectionGUID: 0/Q2TkOqRoSdwMprJDhfqg==
X-CSE-MsgGUID: OyR45XSORCukdUWTsmE38w==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27487275"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="27487275"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 23:39:41 -0700
X-CSE-ConnectionGUID: 2O/ZX9oZRoippCzKMVib/Q==
X-CSE-MsgGUID: t8B9+OhcRzKZFH+HbDzGrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="76560025"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Oct 2024 23:39:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy3se-0005zg-2P;
	Tue, 08 Oct 2024 06:39:36 +0000
Date: Tue, 8 Oct 2024 14:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
	linux-phy@lists.infradead.org, chris.packham@alliedtelesis.co.nz,
	devicetree@vger.kernel.org, krzk@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v2 3/3] phy: Integrate Realtek Otto SerDes driver into
 build system
Message-ID: <202410081436.fFz8vjTK-lkp@intel.com>
References: <20241007163623.3274510-4-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163623.3274510-4-markus.stockhausen@gmx.de>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk-dt/for-next linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/dt-bindings-phy-add-realtek-otto-serdes-PHY-binding/20241008-003929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241007163623.3274510-4-markus.stockhausen%40gmx.de
patch subject: [PATCH v2 3/3] phy: Integrate Realtek Otto SerDes driver into build system
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241008/202410081436.fFz8vjTK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081436.fFz8vjTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081436.fFz8vjTK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/phy/realtek/phy-rtk-otto-serdes.c:11:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/phy/realtek/phy-rtk-otto-serdes.c:11:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
   In file included from drivers/phy/realtek/phy-rtk-otto-serdes.c:11:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/phy/realtek/phy-rtk-otto-serdes.c:11:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
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
>> drivers/phy/realtek/phy-rtk-otto-serdes.c:490:15: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     490 |         if (sid >= 2 || sid <= 9)
         |             ~~~~~~~~~^~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:509:15: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     509 |         if (sid >= 2 || sid <= 9)
         |             ~~~~~~~~~^~~~~~~~~~~
>> drivers/phy/realtek/phy-rtk-otto-serdes.c:686:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     686 |         if (ret)
         |             ^~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:677:9: note: initialize the variable 'ret' to silence this warning
     677 |         int ret;
         |                ^
         |                 = 0
   drivers/phy/realtek/phy-rtk-otto-serdes.c:706:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     706 |         if (ret)
         |             ^~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:697:9: note: initialize the variable 'ret' to silence this warning
     697 |         int ret;
         |                ^
         |                 = 0
   drivers/phy/realtek/phy-rtk-otto-serdes.c:723:7: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     723 |         if (!ret)
         |              ^~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:717:9: note: initialize the variable 'ret' to silence this warning
     717 |         int ret;
         |                ^
         |                 = 0
   12 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +490 drivers/phy/realtek/phy-rtk-otto-serdes.c

40f1aea80b53b8 Markus Stockhausen 2024-10-07  477  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  478  static int rtsds_930x_set_mode(struct rtsds_ctrl *ctrl, u32 sid, int combomode)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  479  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  480  	int modeshift, subshift;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  481  	int mode = RTSDS_MODE(combomode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  482  	int submode = RTSDS_SUBMODE(combomode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  483  	void __iomem __force *modereg;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  484  	void __iomem __force *subreg;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  485  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  486  	if (rtsds_invalid_sds(ctrl, sid))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  487  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  488  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  489  	rtsds_930x_mode_offset(sid, &modereg, &modeshift, &subreg, &subshift);
40f1aea80b53b8 Markus Stockhausen 2024-10-07 @490  	if (sid >= 2 || sid <= 9)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  491  		iomask32(0x1f << subshift, (submode & 0x1f) << subshift, subreg);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  492  	else if (submode != 0)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  493  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  494  	iomask32(0x1f << modeshift, (mode & 0x1f) << modeshift, modereg);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  495  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  496  	return 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  497  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  498  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  499  static int rtsds_930x_get_mode(struct rtsds_ctrl *ctrl, u32 sid)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  500  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  501  	int modeshift, subshift, mode, submode = 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  502  	void __iomem __force *modereg;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  503  	void __iomem __force *subreg;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  504  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  505  	if (rtsds_invalid_sds(ctrl, sid))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  506  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  507  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  508  	rtsds_930x_mode_offset(sid, &modereg, &modeshift, &subreg, &subshift);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  509  	if (sid >= 2 || sid <= 9)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  510  		submode = (ioread32(subreg) >> subshift) & 0x1f;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  511  	mode = ioread32(modereg) >> modeshift & 0x1f;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  512  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  513  	return RTSDS_COMBOMODE(mode, submode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  514  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  515  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  516  static int rtsds_930x_reset(struct rtsds_ctrl *ctrl, u32 sid)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  517  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  518  	int modecur, modeoff = ctrl->conf->mode_map[PHY_INTERFACE_MODE_NA];
40f1aea80b53b8 Markus Stockhausen 2024-10-07  519  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  520  	if (rtsds_invalid_sds(ctrl, sid))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  521  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  522  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  523  	modecur = rtsds_930x_get_mode(ctrl, sid);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  524  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  525  	/* It is enough to power off SerDes and set to old mode again */
40f1aea80b53b8 Markus Stockhausen 2024-10-07  526  	if (modecur != modeoff) {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  527  		rtsds_930x_set_mode(ctrl, sid, modeoff);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  528  		rtsds_930x_set_mode(ctrl, sid, modecur);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  529  	}
40f1aea80b53b8 Markus Stockhausen 2024-10-07  530  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  531  	return 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  532  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  533  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  534  /*
40f1aea80b53b8 Markus Stockhausen 2024-10-07  535   * The RTL931x family has 14 "frontend" SerDes that are cascaded. All operations (e.g. reset) work
40f1aea80b53b8 Markus Stockhausen 2024-10-07  536   * on this frontend view while their registers are distributed over a total of 32 background
40f1aea80b53b8 Markus Stockhausen 2024-10-07  537   * SerDes. Two types of SerDes have been identified:
40f1aea80b53b8 Markus Stockhausen 2024-10-07  538   *
40f1aea80b53b8 Markus Stockhausen 2024-10-07  539   * A "even" SerDes with numbers 0, 1, 2, 4, 6, 8, 10, 12 works on two background SerDes. 64 analog
40f1aea80b53b8 Markus Stockhausen 2024-10-07  540   * and 64 XGMII data pages are coming from a first background SerDes while another 64 XGMII pages
40f1aea80b53b8 Markus Stockhausen 2024-10-07  541   * are served from a second SerDes.
40f1aea80b53b8 Markus Stockhausen 2024-10-07  542   *
40f1aea80b53b8 Markus Stockhausen 2024-10-07  543   * The "odd" SerDes with numbers 3, 5, 7, 9, 11 & 13 SerDes consist of a total of 3 background
40f1aea80b53b8 Markus Stockhausen 2024-10-07  544   * SerDes (one analog and two XGMII) each with an own page/register set.
40f1aea80b53b8 Markus Stockhausen 2024-10-07  545   *
40f1aea80b53b8 Markus Stockhausen 2024-10-07  546   * To align this and improve readability the driver will simulate a total of 576 pages and mix
40f1aea80b53b8 Markus Stockhausen 2024-10-07  547   * them as follows.
40f1aea80b53b8 Markus Stockhausen 2024-10-07  548   *
40f1aea80b53b8 Markus Stockhausen 2024-10-07  549   * frontend page		"even" frontend SerDes	"odd" frontend SerDes
40f1aea80b53b8 Markus Stockhausen 2024-10-07  550   * page 0-63 (analog):		back SDS page 0-63	back SDS page 0-63
40f1aea80b53b8 Markus Stockhausen 2024-10-07  551   * page 64-127 (XGMII1):	back SDS page 0-63	back SDS+1 page 0-63
40f1aea80b53b8 Markus Stockhausen 2024-10-07  552   * page 128-191 (XGMII2):	back SDS+1 page 0-63	back SDS+2 page 0-63
40f1aea80b53b8 Markus Stockhausen 2024-10-07  553   */
40f1aea80b53b8 Markus Stockhausen 2024-10-07  554  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  555  static int rtsds_931x_reg_offset(u32 sid, u32 page)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  556  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  557  	int map[] = {0, 1, 2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23};
40f1aea80b53b8 Markus Stockhausen 2024-10-07  558  	int offs = map[sid];
40f1aea80b53b8 Markus Stockhausen 2024-10-07  559  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  560  	if ((sid & 1) && (sid != 1))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  561  		offs += (page >> 6); /* distribute "odd" to 3 background SerDes */
40f1aea80b53b8 Markus Stockhausen 2024-10-07  562  	else if (page >= 128)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  563  		offs += 1; /* "distribute "even" to 2 background SerDes */
40f1aea80b53b8 Markus Stockhausen 2024-10-07  564  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  565  	return offs;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  566  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  567  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  568  static int rtsds_931x_read(struct rtsds_ctrl *ctrl, u32 sid, u32 page, u32 reg)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  569  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  570  	int offs;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  571  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  572  	if (rtsds_invalid_reg(ctrl, sid, page, reg))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  573  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  574  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  575  	offs = rtsds_931x_reg_offset(sid, page);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  576  	if (offs < 0)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  577  		return 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  578  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  579  	return rtsds_93xx_read(ctrl, offs, page, reg);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  580  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  581  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  582  static int rtsds_931x_mask(struct rtsds_ctrl *ctrl, u32 sid, u32 page, u32 reg, u32 val, u32 mask)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  583  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  584  	int offs;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  585  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  586  	if (rtsds_invalid_reg(ctrl, sid, page, reg))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  587  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  588  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  589  	offs = rtsds_931x_reg_offset(sid, page);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  590  	if (offs < 0)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  591  		return 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  592  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  593  	return rtsds_93xx_mask(ctrl, offs, page, reg, val, mask);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  594  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  595  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  596  static int rtsds_931x_set_mode(struct rtsds_ctrl *ctrl, u32 sid, int combomode)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  597  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  598  	int shift = (sid & 3) << 3, offs = sid & ~3;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  599  	int mode = RTSDS_MODE(combomode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  600  	int submode = RTSDS_SUBMODE(combomode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  601  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  602  	if (rtsds_invalid_sds(ctrl, sid))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  603  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  604  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  605  	rtsds_931x_mask(ctrl, sid, 0x1f, 0x09, (submode & 0x3f << 6), 0x0fc0);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  606  	iomask32(0xff << shift, ((mode | RTSDS_931X_SDS_FORCE_SETUP) & 0xff) << shift,
40f1aea80b53b8 Markus Stockhausen 2024-10-07  607  		 RTSDS_931X_SERDES_MODE_CTRL + offs);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  608  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  609  	return 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  610  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  611  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  612  static int rtsds_931x_get_mode(struct rtsds_ctrl *ctrl, u32 sid)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  613  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  614  	int mode, submode, shift = (sid & 3) << 3, offs = sid & ~3;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  615  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  616  	if (rtsds_invalid_sds(ctrl, sid))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  617  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  618  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  619  	submode = (rtsds_931x_read(ctrl, sid, 0x1f, 0x09) >> 6) & 0x3f;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  620  	mode = (ioread32(RTSDS_931X_SERDES_MODE_CTRL + offs) >> shift) & 0x1f;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  621  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  622  	return RTSDS_COMBOMODE(mode, submode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  623  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  624  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  625  static int rtsds_931x_reset(struct rtsds_ctrl *ctrl, u32 sid)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  626  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  627  	int pwr, modecur, modeoff = ctrl->conf->mode_map[PHY_INTERFACE_MODE_NA];
40f1aea80b53b8 Markus Stockhausen 2024-10-07  628  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  629  	if (rtsds_invalid_sds(ctrl, sid))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  630  		return -EINVAL;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  631  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  632  	modecur = rtsds_931x_get_mode(ctrl, sid);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  633  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  634  	if (modecur != modeoff) {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  635  		/* reset with mode switch cycle while being powered off */
40f1aea80b53b8 Markus Stockhausen 2024-10-07  636  		pwr = ioread32(RTSDS_931X_PS_SERDES_OFF_MODE_CTRL);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  637  		iowrite32(pwr | BIT(sid), RTSDS_931X_PS_SERDES_OFF_MODE_CTRL);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  638  		rtsds_931x_set_mode(ctrl, sid, modeoff);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  639  		rtsds_931x_set_mode(ctrl, sid, modecur);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  640  		iowrite32(pwr, RTSDS_931X_PS_SERDES_OFF_MODE_CTRL);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  641  	}
40f1aea80b53b8 Markus Stockhausen 2024-10-07  642  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  643  	return 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  644  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  645  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  646  int rtsds_read(struct phy *phy, u32 page, u32 reg)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  647  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  648  	struct rtsds_macro *macro = phy_get_drvdata(phy);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  649  	struct rtsds_ctrl *ctrl = macro->ctrl;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  650  	u32 sid = macro->sid;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  651  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  652  	return ctrl->conf->read(ctrl, sid, page, reg);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  653  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  654  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  655  int rtsds_mask(struct phy *phy, u32 page, u32 reg, u32 val, u32 mask)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  656  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  657  	struct rtsds_macro *macro = phy_get_drvdata(phy);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  658  	struct rtsds_ctrl *ctrl = macro->ctrl;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  659  	u32 sid = macro->sid;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  660  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  661  	if (rtsds_readonly(ctrl, sid))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  662  		return 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  663  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  664  	return ctrl->conf->mask(ctrl, sid, page, reg, val, mask);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  665  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  666  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  667  int rtsds_write(struct phy *phy, u32 page, u32 reg, u32 val)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  668  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  669  	return rtsds_mask(phy, page, reg, val, 0xffff);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  670  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  671  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  672  static int rtsds_phy_init(struct phy *phy)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  673  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  674  	struct rtsds_macro *macro = phy_get_drvdata(phy);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  675  	struct rtsds_ctrl *ctrl = macro->ctrl;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  676  	u32 sid = macro->sid;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  677  	int ret;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  678  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  679  	if (rtsds_readonly(ctrl, sid))
40f1aea80b53b8 Markus Stockhausen 2024-10-07  680  		return 0;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  681  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  682  	mutex_lock(&ctrl->lock);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  683  //	ret = rtsds_run_event(ctrl, sid, RTSDS_EVENT_INIT);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  684  	mutex_unlock(&ctrl->lock);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  685  
40f1aea80b53b8 Markus Stockhausen 2024-10-07 @686  	if (ret)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  687  		dev_err(ctrl->dev, "init failed for SerDes %d\n", sid);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  688  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  689  	return ret;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  690  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07  691  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
