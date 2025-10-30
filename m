Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A92E0927;
	Thu, 30 Oct 2025 04:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761800375; cv=none; b=TzHYJ9YZaM271BfGjw879R9ssYBJsa9J2WZpekFciiaW2RyyBWc6RxxEVE+zjME8N1bnLqqdurndhI4dRId2ZLkhyU/YvlOOIHJ/+zMH6JdXyDaLBBh0Yxi93fnkqUTYWSsy07F/i3PK3GT7t7xPw21Xhncy7AkLNsLq9udDEvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761800375; c=relaxed/simple;
	bh=XrSWWjKUo7m9rj5cc4tuAtsaIQt7tpo1lwMllKwYVkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT5O978cdkACBqogOJodQyIj7e2/+gLABCjG+F2U2jyUEIAjBs8zmEKUkM7UTzfzzg94ng62mRUZooqEg3+fJMNsV9PYDl4qHeYAkExRvYcXdHVTXMMnv24O+b4e3ByVTzeHQ9EeEuEKAmW1gYnhTrp/UxtUcqVFRYR48gO9AsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEnTlUeU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEnTlUeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761800374; x=1793336374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XrSWWjKUo7m9rj5cc4tuAtsaIQt7tpo1lwMllKwYVkE=;
  b=bEnTlUeUKZHKZYnm+FVSVfXazTKgR6DwV/AUAWn23vBCJf1pW0JFemlf
   kSwkeLgImmlQdv+CB2z/USrTtKmSE/ZEko2lgZlX8AYB6CPt6hQjRgayA
   dHVMLFbaZe8beN00LKIwcJJnAReoORa/AUNsZsAL+NYZ6JAp9wk/U0tJE
   pb3mTWIsk4rg36gvNgaSDBgAI+vp2lLYFFdj3UMdyaqOfDW6OBHDFSmtK
   JFAT4YaAWbefQaip+lVIvNUQOWask1+GvSgJM2hz/YWZi8syphR4x1SVK
   C4enfmuMha55z+RbzJJacD4CUogapAlwKpO4hs+5xMf1ngIQ/ed4JwfnU
   A==;
X-CSE-ConnectionGUID: KkicMuDVRjG4qQaxSVIQcg==
X-CSE-MsgGUID: Pya6qZFsTZy87+ljbQG9Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75053767"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="75053767"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 21:59:33 -0700
X-CSE-ConnectionGUID: bQZdnZDLReSi76ExYndiCg==
X-CSE-MsgGUID: SQ5nwnfASfK/7dgA9AJjIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="223075256"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2025 21:59:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEKkx-000LTs-0r;
	Thu, 30 Oct 2025 04:59:27 +0000
Date: Thu, 30 Oct 2025 12:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrei Botila <andrei.botila@oss.nxp.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, s32@nxp.com,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>
Subject: Re: [PATCH net-next] net: phy: nxp-c45-tja11xx: config_init restore
 macsec config
Message-ID: <202510301246.x4ua5CJ6-lkp@intel.com>
References: <20251029104258.1499069-1-andrei.botila@oss.nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029104258.1499069-1-andrei.botila@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Botila/net-phy-nxp-c45-tja11xx-config_init-restore-macsec-config/20251029-185313
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251029104258.1499069-1-andrei.botila%40oss.nxp.com
patch subject: [PATCH net-next] net: phy: nxp-c45-tja11xx: config_init restore macsec config
config: x86_64-randconfig-076-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301246.x4ua5CJ6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301246.x4ua5CJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301246.x4ua5CJ6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/phy/nxp-c45-tja11xx.c:20:
>> drivers/net/phy/nxp-c45-tja11xx.h:42:6: warning: no previous prototype for function 'nxp_c45_macsec_link_change_notify' [-Wmissing-prototypes]
      42 | void nxp_c45_macsec_link_change_notify(struct phy_device *phydev)
         |      ^
   drivers/net/phy/nxp-c45-tja11xx.h:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void nxp_c45_macsec_link_change_notify(struct phy_device *phydev)
         | ^
         | static 
   1 warning generated.


vim +/nxp_c45_macsec_link_change_notify +42 drivers/net/phy/nxp-c45-tja11xx.h

    33	
    34	#if IS_ENABLED(CONFIG_MACSEC)
    35	void nxp_c45_macsec_link_change_notify(struct phy_device *phydev);
    36	int nxp_c45_macsec_config_init(struct phy_device *phydev);
    37	int nxp_c45_macsec_probe(struct phy_device *phydev);
    38	void nxp_c45_macsec_remove(struct phy_device *phydev);
    39	void nxp_c45_handle_macsec_interrupt(struct phy_device *phydev,
    40					     irqreturn_t *ret);
    41	#else
  > 42	void nxp_c45_macsec_link_change_notify(struct phy_device *phydev)
    43	{
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
