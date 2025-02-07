Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23703194A67;
	Fri,  7 Feb 2025 04:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738902485; cv=none; b=svqk0oSDGlWoFxoV7Xa594Wyy1RlzB2Tn6130wBZ4vAerfln8Ad02TrMRQ3t3Xr7pO80V3tL2oYzlHKfHFOlX9gVNRtquzZkueJsEcNfa4Hhhy0QM4e1M52PYh7YDw1sTJ8WWU4nf0B1Ia2fbLDFAFSCFB8IFKvOW8qY7IInM0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738902485; c=relaxed/simple;
	bh=Mcl1vYKeW8BvPnbilRvevK2BPlSI2HQC+kMuXwj+caU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggFdylAN1zsFqkBlOvzywHmcy1LRiRpJL5VQt9DdplVLvhCRXLldXOV8KTEYjtuj8EI3H4KiGAzV4vd/63Q3A4O+3QYbkNpbJlWWmFZAsv2e9sSR0+WUsJSCNaHLklgiqM6KuI6P25zmhPy3642iXb79rEY8HoYsdrBLEqzWVnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/OySZGA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/OySZGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738902483; x=1770438483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mcl1vYKeW8BvPnbilRvevK2BPlSI2HQC+kMuXwj+caU=;
  b=a/OySZGAxJ3PX8Xk4vjmkA2G0XQbyF9gpH4XyMgKmq4FLiwhWHjXfOAB
   wm+ssxVsHKamWlIzQfS/7z3Nq2fSBcK3VHcWToVkYFhCpptsdo79E+bNX
   yCkpp10TuAEuSl10rHI6hCAxWoFtF832Ta1dzbdJEmJRCym198zN0HNOL
   xKI7Pa33NA5ETuwwIPFoW9TQPpbbns/C5X5SLvGCcZNRyCg2U79VHA2Am
   BqhoEr+jYM3rxQZGCa4Mwxy6HxdfBLdDQLFM0BKco0GxkCHE/cUJSSOC2
   3xvPfCwyS4u7BG4uaa0BDxUj9JJpxjFJhUv0Q3Qb5SvkC0qmGXD1xaQeJ
   w==;
X-CSE-ConnectionGUID: lWcEyvqDTg+iDR5kSCvvMg==
X-CSE-MsgGUID: MkrdRMJRTGCoo6w5ibuJYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39231101"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39231101"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 20:28:02 -0800
X-CSE-ConnectionGUID: 1ZNy7BgCRYis1UOKgeRh5Q==
X-CSE-MsgGUID: Jbr2VU0nT2ar6shmI5ZzoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111341508"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Feb 2025 20:28:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgFyB-000xkl-1N;
	Fri, 07 Feb 2025 04:27:59 +0000
Date: Fri, 7 Feb 2025 12:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 3/3] net: dsa: mt7530: convert to phylink
 managed EEE
Message-ID: <202502071244.32dBt3l7-lkp@intel.com>
References: <E1tfh3R-003aRS-3M@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tfh3R-003aRS-3M@rmk-PC.armlinux.org.uk>

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-phylink-provide-phylink_mac_implements_lpi/20250206-032648
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1tfh3R-003aRS-3M%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 3/3] net: dsa: mt7530: convert to phylink managed EEE
config: x86_64-randconfig-072-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071244.32dBt3l7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071244.32dBt3l7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071244.32dBt3l7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/dsa/mt7530.c:3008:10: error: no member named 'lpi_timer_limit_us' in 'struct phylink_config'
    3008 |         config->lpi_timer_limit_us = FIELD_MAX(LPI_THRESH_MASK);
         |         ~~~~~~  ^
   1 error generated.


vim +3008 drivers/net/dsa/mt7530.c

  2998	
  2999	static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
  3000					    struct phylink_config *config)
  3001	{
  3002		struct mt7530_priv *priv = ds->priv;
  3003		u32 eeecr;
  3004	
  3005		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
  3006	
  3007		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
> 3008		config->lpi_timer_limit_us = FIELD_MAX(LPI_THRESH_MASK);
  3009	
  3010		eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
  3011		/* tx_lpi_timer should be in microseconds. The time units for
  3012		 * LPI threshold are unspecified.
  3013		 */
  3014		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
  3015	
  3016		priv->info->mac_port_get_caps(ds, port, config);
  3017	}
  3018	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
