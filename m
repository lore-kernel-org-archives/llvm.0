Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CC7271832;
	Thu,  6 Mar 2025 19:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741289090; cv=none; b=tYFNTBHppuh9fUNwPtNMcBkk6N9Y5rQpDhBdhK7L7Jp1KWOOfkuMl2Mbp+gTiwjxAMTYrOuz4+B8Pz/Tc/u61nME9gP8Yk0AKZ1WKNBzI4713wT6WjuA7XjM0WMhe1+PttHK3Uc0Yf8mako7ToEU1Zud/SehzP4eo+wkfBDZiys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741289090; c=relaxed/simple;
	bh=WyeBC2LR1l+TKo5NG9bSyuQ7j7PqsB2XVToVYsZZcXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mG+bPTcMzaJHJcijt+iqxNsfkh2DJkbHkFSkXxqOZ0iqTP8hWYMZlPvbbjhsK5SCafJQpjnNCfQ6Lb3dLn+zcvaou4NmylotJJIrMiVTba281seDtOe050MwfMHiS8sIte6KxT38MvrmKyCbfXzrdfqyIdXVoYXrUYePXZ6Tv+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHKgaB+4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHKgaB+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741289089; x=1772825089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WyeBC2LR1l+TKo5NG9bSyuQ7j7PqsB2XVToVYsZZcXE=;
  b=hHKgaB+4YeGvW++NIehyA9PgUpoO9b5JUsNFs30IlKQW8vR1my096Z/J
   pwsa8kXHlEVi9NXMjsCk3t9G6FCn9e9dtlGPyoNZU9BTj2404GMIpQH9l
   UyjidF6ovMRDT/juTZQyGDZX9VzBYU3UgmaIv6+RGdj4Tc/RumUaMx8LR
   qZdQqyIKjwV5i/tzPJcixLzpFIq1meBn5T3095b/QszjdYXxtrhMetGKM
   bhBCib11HwS3CeSik+X2yngMuf4OtnBEAedWOgODTFFviiprxPd3Fx45d
   5qj1TcSlpfCnF4iOhuxYE9KFoNsud94ZqraJsSbE8aDF7zb1q3+HWgUK8
   g==;
X-CSE-ConnectionGUID: imCm5V5GQsO4Jk8dfrOwJA==
X-CSE-MsgGUID: wZIYc4MTQq6r+Q1uNptGzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46093313"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="46093313"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 11:24:48 -0800
X-CSE-ConnectionGUID: aikOEpP+TI2gX2Zoa3gW0A==
X-CSE-MsgGUID: 5UkDgjoqRUS0hgWLcYRR2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="123713053"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 06 Mar 2025 11:24:47 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqGpo-000NVa-2a;
	Thu, 06 Mar 2025 19:24:44 +0000
Date: Fri, 7 Mar 2025 03:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 1/2] net: phylink: add functions to
 block/unblock rx clock stop
Message-ID: <202503070329.D6SVd1ez-lkp@intel.com>
References: <E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tpt2t-005UNB-MC@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-phylink-add-functions-to-block-unblock-rx-clock-stop/20250306-060346
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tpt2t-005UNB-MC%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 1/2] net: phylink: add functions to block/unblock rx clock stop
config: arm-exynos_defconfig (https://download.01.org/0day-ci/archive/20250307/202503070329.D6SVd1ez-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503070329.D6SVd1ez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503070329.D6SVd1ez-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/net/phy/phylink.c:2613:40: error: expected ';' after expression
    2613 |             pl->config->eee_rx_clk_stop_enable)
         |                                               ^
         |                                               ;
>> drivers/net/phy/phylink.c:2613:40: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
   drivers/net/phy/phylink.c:2611:2: note: previous statement is here
    2611 |         if (pl->mac_rx_clk_stop_blocked++ == 0 &&
         |         ^
>> drivers/net/phy/phylink.c:2613:40: error: expected expression
    2613 |             pl->config->eee_rx_clk_stop_enable)
         |                                               ^
>> drivers/net/phy/phylink.c:2613:18: warning: expression result unused [-Wunused-value]
    2613 |             pl->config->eee_rx_clk_stop_enable)
         |             ~~~~~~~~~~  ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +2613 drivers/net/phy/phylink.c

  2595	
  2596	
  2597	void phylink_rx_clk_stop_block(struct phylink *pl)
  2598	{
  2599		ASSERT_RTNL();
  2600	
  2601		if (pl->mac_rx_clk_stop_blocked == U8_MAX) {
  2602			phylink_warn(pl, "%s called too many times - ignoring\n",
  2603				     __func__);
  2604			dump_stack();
  2605			return;
  2606		}
  2607	
  2608		/* Disable PHY receive clock stop if this is the first time this
  2609		 * function has been called and clock-stop was previously enabled.
  2610		 */
  2611		if (pl->mac_rx_clk_stop_blocked++ == 0 &&
  2612		    pl->mac_supports_eee_ops && pl->phydev)
> 2613		    pl->config->eee_rx_clk_stop_enable)
  2614			phy_eee_rx_clock_stop(pl->phydev, false);
  2615	}
  2616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
