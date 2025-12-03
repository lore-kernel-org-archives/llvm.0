Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F642D8DC2;
	Wed,  3 Dec 2025 23:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764805184; cv=none; b=basufEQqilsnASylJZSjJgJUmtVvn2rv/45+UX6VgTGJZ3OlA2+9MjHf4j+ehjHIwrZ77uR0DMIjiO4JVjvtIFertgP/kG7KiBIb4DhdhDOecoW0iDVqOj7YOORKTEBqfFD99qeFgUqM1+g4cqpLzONFEgBmKnW7MzpbmCdCGno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764805184; c=relaxed/simple;
	bh=ZWLqSmDBDfW+rgzqFS7MWwINI8oCKiSfDIzM9Jzm7ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOe0RBnvtIYeBWGSeE0WUbMqW5vSUhetY1J3TUOVcxzYSQUVECyeKuV4PR80E9UsTXx5xxignbJsPf4dUlMMwHh3lc5RG3hKOSzmKiA38jic7A9sejJ1AgaL0bnlUuddAiACGr6TFlIy4whOPdhCTGHhRw8AsJaCyx5aQYXvoqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S3OQbjCw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3OQbjCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764805183; x=1796341183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWLqSmDBDfW+rgzqFS7MWwINI8oCKiSfDIzM9Jzm7ek=;
  b=S3OQbjCwUBtl6BtOdz8F+RbtUusrogb3wiX0GaCVJkonhPDPJyt45CrG
   Lp4zcCtszIk9Y2PYqq71XK3Cn63oa9SIAw/sfK48KhoT9sLEQYpM0g9bp
   o2iZ+BDjs9gXD1lOS2rAdDH6eG1khuEa2hVYFQUdXYUpuS9PcIw6obH5i
   B3d1z6bXzlspLEhWIiCaS8w5j/ZCcrcXKanolTzc3lupEPWV7w4hnRkY3
   Q17E4uGbDns0lhLb65CIR+Zm4yjWdPSpVJkvuyN4HDpl9FCvi4/H2nsEh
   4BfabHxxUgou9Lif+WXvb2HJayu0V+UfCmL4wrdT0itmGTUjZTtcSk1q2
   w==;
X-CSE-ConnectionGUID: z/TW88lsTESeYY8eJxur3g==
X-CSE-MsgGUID: E7EW253PTQG022WTdzda+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70666202"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="70666202"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 15:39:41 -0800
X-CSE-ConnectionGUID: bQ0gcs9HQhSRVdQrh5rP3A==
X-CSE-MsgGUID: 1t0Fj5MWT62jsg71igA5cw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Dec 2025 15:39:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQwRd-00000000DHh-1VTq;
	Wed, 03 Dec 2025 23:39:37 +0000
Date: Thu, 4 Dec 2025 07:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 09/15] net: stmmac: rk: use rk_encode_wm16()
 for RMII clock
Message-ID: <202512040705.bipjEIV8-lkp@intel.com>
References: <E1vQ5FQ-0000000GNwH-37za@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vQ5FQ-0000000GNwH-37za@rmk-PC.armlinux.org.uk>

Hi Russell,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-rk-add-GMAC_CLK_xx-constants-simplify-RGMII-definitions/20251202-025335
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vQ5FQ-0000000GNwH-37za%40rmk-PC.armlinux.org.uk
patch subject: [PATCH RFC net-next 09/15] net: stmmac: rk: use rk_encode_wm16() for RMII clock
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251204/202512040705.bipjEIV8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040705.bipjEIV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040705.bipjEIV8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:498:39: error: variable has incomplete type 'const struct rk_reg_speed_data'
     498 | static const struct rk_reg_speed_data rk3308_reg_speed_data = {
         |                                       ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:498:21: note: forward declaration of 'struct rk_reg_speed_data'
     498 | static const struct rk_reg_speed_data rk3308_reg_speed_data = {
         |                     ^
>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:893:9: error: use of undeclared identifier 'RK3528_GMAC0_CLK_RMII_DIV2'
     893 |                              RK3528_GMAC0_CLK_RMII_DIV2);
         |                              ^
   2 errors generated.


vim +/RK3528_GMAC0_CLK_RMII_DIV2 +893 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

1725f0eb37d621 David Wu 2025-03-19  884  
1725f0eb37d621 David Wu 2025-03-19  885  static void rk3528_set_to_rmii(struct rk_priv_data *bsp_priv)
1725f0eb37d621 David Wu 2025-03-19  886  {
1725f0eb37d621 David Wu 2025-03-19  887  	if (bsp_priv->id == 1)
1725f0eb37d621 David Wu 2025-03-19  888  		regmap_write(bsp_priv->grf, RK3528_VPU_GRF_GMAC_CON5,
1725f0eb37d621 David Wu 2025-03-19  889  			     RK3528_GMAC1_PHY_INTF_SEL_RMII);
1725f0eb37d621 David Wu 2025-03-19  890  	else
1725f0eb37d621 David Wu 2025-03-19  891  		regmap_write(bsp_priv->grf, RK3528_VO_GRF_GMAC_CON,
1725f0eb37d621 David Wu 2025-03-19  892  			     RK3528_GMAC0_PHY_INTF_SEL_RMII |
1725f0eb37d621 David Wu 2025-03-19 @893  			     RK3528_GMAC0_CLK_RMII_DIV2);
1725f0eb37d621 David Wu 2025-03-19  894  }
1725f0eb37d621 David Wu 2025-03-19  895  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
