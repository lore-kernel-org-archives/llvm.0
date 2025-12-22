Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C0F33D4EC;
	Mon, 22 Dec 2025 10:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399157; cv=none; b=NndvSTaCYgdigbIRBeZ0KuXdrrRDRM6LJ0vgGbYr5eBxBShZVNmDPPtYeXOI2gq3VohY6peNOUMC44i/k7WhYHv0QQaQ1/MVsG/0N04Ewt5d+0r0ooJggNEIA+OdFuJUzbK4UKzWxh6qsTF40Qi8dKi96RsHpkibpvJXLb7eepc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399157; c=relaxed/simple;
	bh=62taOR2EI0MqLH+HSIMWwZvEtr5H5VJiNu+vI3TqvDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijiOdxGVdhxXc5vFjYDL5XdJHjY/TNVqMq2I9hAFLyfNS7nHSpst7JlkljG9XVHEMSkbOksO66+jGvBDpwCtZV96f4mWNKAJ4/82lpzSuXZY2mfH8ggclECTM/Epla+RtcE5yYHBFtfOtQgMOSJIpOpByNFpnBiio2UEU/Z3z1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXUGH507; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXUGH507"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766399155; x=1797935155;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62taOR2EI0MqLH+HSIMWwZvEtr5H5VJiNu+vI3TqvDE=;
  b=EXUGH507ssVqSGPykHptYrKegQItq23E6Lfz35yDRQiFdg1PnXV24++k
   bbGL7PPWNEgnQQCcW/wtVdqaNOr0m9HpgTGRqGJ+XFqy35fWoexIcjxiN
   0+xECN1xOIqO7J8LCI3Aea+FbZnXYjCHbtoC+y2Y4GZWKtbKHdYN6Z2Ut
   y1eJzJGPXIHZa7GoyViVTHsQBAnErC2XeGI2Fd/pOU4BPVadqXIIAiLYt
   d50aZv7KkCyABQCpSjr2+KPHuAhrpUIMRRhNSc4JkmkbSJ2thabP6AUKl
   Zwwg82CeR3kwtATporDY7ZsCr/5yQefXjQNMoxDuPDmCkrjsS8ycFYi1j
   A==;
X-CSE-ConnectionGUID: mK4qzJu2RKmgNo1YGlpTXg==
X-CSE-MsgGUID: AJF6DBaEQZKiA/tTXP+cCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68297227"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68297227"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:25:54 -0800
X-CSE-ConnectionGUID: fAWCdZUaR5q2u7vr4ATdJQ==
X-CSE-MsgGUID: 5u0tkOQdRAmhs1RBOjgFlQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 02:25:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXd6L-000000000Nt-051A;
	Mon, 22 Dec 2025 10:25:34 +0000
Date: Mon, 22 Dec 2025 18:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>,
	Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>,
	Ripan Deuri <quic_rdeuri@quicinc.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
Message-ID: <202512221824.sz1jZjhH-lkp@intel.com>
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUOw1J0TU4VgeXj6@stanley.mountain>

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251217]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/wifi-ath12k-clean-up-on-error-in-ath12k_dp_setup/20251218-154554
base:   next-20251217
patch link:    https://lore.kernel.org/r/aUOw1J0TU4VgeXj6%40stanley.mountain
patch subject: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251222/202512221824.sz1jZjhH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221824.sz1jZjhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221824.sz1jZjhH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/dp.c:1767:8: error: use of undeclared label 'rhash_destroy'
                   goto rhash_destroy;
                        ^
   1 error generated.


vim +/rhash_destroy +1767 drivers/net/wireless/ath/ath12k/dp.c

  1734	
  1735	int ath12k_dp_alloc(struct ath12k_base *ab)
  1736	{
  1737		struct ath12k_dp *dp = &ab->dp;
  1738		struct hal_srng *srng = NULL;
  1739		size_t size = 0;
  1740		u32 n_link_desc = 0;
  1741		int ret;
  1742		int i;
  1743	
  1744		dp->ab = ab;
  1745	
  1746		INIT_LIST_HEAD(&dp->reo_cmd_list);
  1747		INIT_LIST_HEAD(&dp->reo_cmd_cache_flush_list);
  1748		INIT_LIST_HEAD(&dp->reo_cmd_update_rx_queue_list);
  1749		spin_lock_init(&dp->reo_cmd_lock);
  1750		spin_lock_init(&dp->reo_rxq_flush_lock);
  1751	
  1752		dp->reo_cmd_cache_flush_count = 0;
  1753		dp->idle_link_rbm = ath12k_dp_get_idle_link_rbm(ab);
  1754	
  1755		ret = ath12k_wbm_idle_ring_setup(ab, &n_link_desc);
  1756		if (ret) {
  1757			ath12k_warn(ab, "failed to setup wbm_idle_ring: %d\n", ret);
  1758			return ret;
  1759		}
  1760	
  1761		srng = &ab->hal.srng_list[dp->wbm_idle_ring.ring_id];
  1762	
  1763		ret = ath12k_dp_link_desc_setup(ab, dp->link_desc_banks,
  1764						HAL_WBM_IDLE_LINK, srng, n_link_desc);
  1765		if (ret) {
  1766			ath12k_warn(ab, "failed to setup link desc: %d\n", ret);
> 1767			goto rhash_destroy;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
