Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8040F1F4176;
	Sun, 17 May 2026 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054357; cv=none; b=rxmSfooVtfCxlAH56KR4Al4G0V5RU0YrhyxBfJOg5y58rktR/Nqklr/9GlvaqOU5bysOm/rPvYuBb32YrMjmUgukjqkUXdNzfcVxgqhCZ59/ieU2r+XVS6c/8OkKMKfgdcLc4SKozcZN1Qs3GwDlRRZIHKsf3h/P6odoC8E5ENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054357; c=relaxed/simple;
	bh=HcHkVQED+BUDIbbFFoaWvhuqZicKw1PktcSgrTy4mSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJLO/78xX5VdljNd6+UPHHTdt4lUD1gOYeJw2vlaXyA42gWBeqI5H84hAoNT8tKvFpFDlepFSRq5nvuDQOsafg7W/VrEid+5yDUYPpHrNHIsLdM83Tj0mpZ6s8Exs1drhf3b4xVR//Dy6tUvyTdgfsrw+w1wQKC3PqHH2Z0iMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJkBqqkC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJkBqqkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779054356; x=1810590356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HcHkVQED+BUDIbbFFoaWvhuqZicKw1PktcSgrTy4mSs=;
  b=hJkBqqkCNvLaL+/dBNqyC5Tk5l94U5XLfiOjdyT7oGyo2aQd72XCc+Sj
   C8n+S/E9KK+Q8OUWEXnoQz7VRANRJJXwjWXM/Oy3ygfj/Um6WUqgGOG/d
   F+q1/s5odLs8t7520Daq/2NRTVVJMoCHJcP09UVESRvty/NHdpY/Vc34D
   lzKsSa0x2M4u5aPHj1CvpW8ypQ98tQuStEDNPfZrf3C+7WMpPBFZRCbpS
   CX1bRR4BHUESXTExngqvIdGTEzU6trw3NqkCpx/f8fTQxrFPkYDI4iKjH
   EZeY0HJM8dtK1Ylh97Zgo4sVvvIAvPuzyNKrKcarg9IbgB94PM6Q5s3C9
   w==;
X-CSE-ConnectionGUID: pjOGuJ0dSeOwgMpkiqeSVg==
X-CSE-MsgGUID: iYi4pUeUQpOrp/4gQDQNWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90493036"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="90493036"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 14:45:55 -0700
X-CSE-ConnectionGUID: 81Lj7rBnS2qvPMLM4gtjwA==
X-CSE-MsgGUID: QrWDyaHwRx+3Y9FWD6pstw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="243549847"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 May 2026 14:45:54 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOjJ0-000000001xi-3CWM;
	Sun, 17 May 2026 21:45:50 +0000
Date: Mon, 18 May 2026 05:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: shayderrr <darknessshayder@gmail.com>, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pranav Bajjuri <darknessshayder@gmail.com>
Subject: Re: [PATCH] net: octeon: fix carrier state, null guard, and
 modernize phy ioctl
Message-ID: <202605180508.53ptUezJ-lkp@intel.com>
References: <20260517141955.79666-1-darknessshayder@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517141955.79666-1-darknessshayder@gmail.com>

Hi shayderrr,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shayderrr/net-octeon-fix-carrier-state-null-guard-and-modernize-phy-ioctl/20260517-222121
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260517141955.79666-1-darknessshayder%40gmail.com
patch subject: [PATCH] net: octeon: fix carrier state, null guard, and modernize phy ioctl
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260518/202605180508.53ptUezJ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180508.53ptUezJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180508.53ptUezJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/octeon/ethernet-mdio.c:91:6: error: conflicting types for 'cvm_oct_common_stop'
      91 | void cvm_oct_common_stop(struct net_device *dev)
         |      ^
   drivers/staging/octeon/octeon-ethernet.h:90:5: note: previous declaration is here
      90 | int cvm_oct_common_stop(struct net_device *dev);
         |     ^
   1 error generated.


vim +/cvm_oct_common_stop +91 drivers/staging/octeon/ethernet-mdio.c

    90	
  > 91	void cvm_oct_common_stop(struct net_device *dev)
    92	{
    93		struct octeon_ethernet *priv = netdev_priv(dev);
    94		int interface = INTERFACE(priv->port);
    95		int index = INDEX(priv->port);
    96		union cvmx_helper_link_info link_info;
    97		union cvmx_gmxx_prtx_cfg gmx_cfg;
    98	
    99		gmx_cfg.u64 = cvmx_read_csr(CVMX_GMXX_PRTX_CFG(index, interface));
   100		gmx_cfg.s.en = 0;
   101		cvmx_write_csr(CVMX_GMXX_PRTX_CFG(index, interface), gmx_cfg.u64);
   102	
   103		priv->poll = NULL;
   104	
   105		netif_carrier_off(dev);
   106	
   107		if (dev->phydev)
   108			phy_disconnect(dev->phydev);
   109	
   110		if (priv->last_link) {
   111			link_info.u64	= 0;
   112			priv->link_info	= 0;
   113			priv->last_link	= 0;
   114	
   115			cvmx_helper_link_set(priv->port, link_info);
   116			cvm_oct_note_carrier(priv, link_info);
   117		}
   118	}
   119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
