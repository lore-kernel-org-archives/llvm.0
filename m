Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD42434E767;
	Thu, 26 Mar 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511292; cv=none; b=Huh4IE/MG3JpIEVshGUAy5trZjafzryZNAbpBWcfl7ztoYeLPIvqo/WEa81MeaS59WnmckKqd1V193D19y3YbBq7iX/IsBOLeTQm27//wlWHoHDaRD+Yh3SZPa2gN5Wfayi3wT9Mf/7WqHeNzS7ymmVDb2CXI68C97aZk7CJ5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511292; c=relaxed/simple;
	bh=T0rnpOtBOtxwawzTr/v44+relMzfTJYdSkehmthMANA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMZeLjJ1HTIt4J5peqc0lhWEyTkyx05CRC5+nEDCBcYXfu0HXFHqmXFyQgNdmBUDBK8xkevujBcgDNuASc6ddT/8fB4CrJMlt/PAwWmpjwvjsl70kS4yf9SGK4bvCY0HW8aIsZZU9vaTpA9Z7fHhDGEWi6AVxDIcyo05p+S1gZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayQ9nPUH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayQ9nPUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774511291; x=1806047291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T0rnpOtBOtxwawzTr/v44+relMzfTJYdSkehmthMANA=;
  b=ayQ9nPUHImUGSte26jY8Lysn4b4GH6mtTAt5mDpD+c0NXhr5lwNPWaVG
   7dQao4pKpqGyDivgZF327dV0ePYTKfqNLrhaRA1brIDVcS74r2KbOMprL
   egde/PB6IHLLoqAup3Krj8kgNfWlN1ff7DkrOPBpzQd7cY7cCzU8h3cyA
   LXvCzXW4KUOcQMu7/Dnm1AM+S5UFX1VRpGYpzJeLPtR7qv12C3edTQ/OT
   f/V83lUBb+5Xy9V3vN87LycgyK1Dj21vlyDLEsphtRy7P370TFDE7IF0u
   QQ4fFEmWqNAzERXA/4jr2NKnE2UTmH5JNFIsaUQYu5QPMteaNufwBCpf2
   g==;
X-CSE-ConnectionGUID: exxiA4d7TaCKxwpta/aznA==
X-CSE-MsgGUID: AVAba9+QRJaP6zRFbyxUTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75628614"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75628614"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 00:48:10 -0700
X-CSE-ConnectionGUID: S8BewAKMRXGvpOTCrVXQng==
X-CSE-MsgGUID: 6uj/xmAQTvuHErUgE0gB0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="225184394"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2026 00:48:03 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5fRg-000000008aX-2Uk5;
	Thu, 26 Mar 2026 07:48:00 +0000
Date: Thu, 26 Mar 2026 15:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	joshwash@google.com, hramamurthy@google.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, willemb@google.com,
	nktgrg@google.com, jfraker@google.com, ziweixiao@google.com,
	maolson@google.com, thostet@google.com, jordanrhee@google.com,
	jefrogers@google.com, alok.a.tiwari@oracle.com,
	linux-kernel@vger.kernel.org, Kevin Yang <yyd@google.com>,
	Naman Gulati <namangulati@google.com>
Subject: Re: [PATCH net-next 3/3] gve: implement PTP gettimex64
Message-ID: <202603261542.ki4x7Oq5-lkp@intel.com>
References: <20260323234829.3185051-4-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323234829.3185051-4-hramamurthy@google.com>

Hi Harshitha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5446b8691eb8278f10deca92048fad84ffd1e4d5]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshitha-Ramamurthy/gve-skip-error-logging-for-retryable-AdminQ-commands/20260324-133808
base:   5446b8691eb8278f10deca92048fad84ffd1e4d5
patch link:    https://lore.kernel.org/r/20260323234829.3185051-4-hramamurthy%40google.com
patch subject: [PATCH net-next 3/3] gve: implement PTP gettimex64
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603261542.ki4x7Oq5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261542.ki4x7Oq5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261542.ki4x7Oq5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/google/gve/gve_ptp.c:187:10: warning: format specifies type 'unsigned long long' but the argument has type 'cycles_t' (aka 'unsigned long') [-Wformat]
     186 |                                             "AdminQ system clock cycle counts out of order. Expecting %llu <= %llu <= %llu <= %llu\n",
         |                                                                                                       ~~~~
         |                                                                                                       %lu
     187 |                                             sysclock.host_pre_cycles,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:225:45: note: expanded from macro 'dev_err_ratelimited'
     225 |         dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
         |                                             ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:215:25: note: expanded from macro 'dev_level_ratelimited'
     215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                                ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_ptp.c:190:10: warning: format specifies type 'unsigned long long' but the argument has type 'cycles_t' (aka 'unsigned long') [-Wformat]
     186 |                                             "AdminQ system clock cycle counts out of order. Expecting %llu <= %llu <= %llu <= %llu\n",
         |                                                                                                                               ~~~~
         |                                                                                                                               %lu
     187 |                                             sysclock.host_pre_cycles,
     188 |                                             sysclock.nic_pre_cycles,
     189 |                                             sysclock.nic_post_cycles,
     190 |                                             sysclock.host_post_cycles);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:225:45: note: expanded from macro 'dev_err_ratelimited'
     225 |         dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
         |                                             ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:215:25: note: expanded from macro 'dev_level_ratelimited'
     215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
         |                                ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +187 drivers/net/ethernet/google/gve/gve_ptp.c

   160	
   161	static int gve_ptp_gettimex64(struct ptp_clock_info *info,
   162				      struct timespec64 *ts,
   163				      struct ptp_system_timestamp *sts)
   164	{
   165		struct gve_ptp *ptp = container_of(info, struct gve_ptp, info);
   166		struct gve_sysclock_sample sysclock = {0};
   167		struct gve_priv *priv = ptp->priv;
   168		struct system_time_snapshot snap;
   169		u64 nic_ts;
   170		int err;
   171	
   172		/* Take system clock snapshot before sampling cycle counters */
   173		if (sts)
   174			ktime_get_snapshot(&snap);
   175	
   176		err = gve_clock_nic_ts_read(priv, &nic_ts, &sysclock);
   177		if (err)
   178			return err;
   179	
   180		if (sts) {
   181			/* Reject samples with out of order system clock values */
   182			if (!(sysclock.host_pre_cycles <= sysclock.nic_pre_cycles &&
   183			      sysclock.nic_pre_cycles  <= sysclock.nic_post_cycles &&
   184			      sysclock.nic_post_cycles <= sysclock.host_post_cycles)) {
   185				dev_err_ratelimited(&priv->pdev->dev,
   186						    "AdminQ system clock cycle counts out of order. Expecting %llu <= %llu <= %llu <= %llu\n",
 > 187						    sysclock.host_pre_cycles,
   188						    sysclock.nic_pre_cycles,
   189						    sysclock.nic_post_cycles,
   190						    sysclock.host_post_cycles);
   191				return -EBADMSG;
   192			}
   193	
   194			err = gve_cycles_to_timespec64(priv, sts->clockid, &snap,
   195						       sysclock.nic_pre_cycles,
   196						       &sts->pre_ts);
   197			if (err)
   198				return err;
   199	
   200			err = gve_cycles_to_timespec64(priv, sts->clockid, &snap,
   201						       sysclock.nic_post_cycles,
   202						       &sts->post_ts);
   203			if (err)
   204				return err;
   205		}
   206	
   207		*ts = ns_to_timespec64(nic_ts);
   208	
   209		return 0;
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
