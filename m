Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281964;
	Thu, 28 May 2026 00:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779926824; cv=none; b=dGxGuLBy76LWubTQRalHVAM75jNsQDIAo+x+sYSSvwCXjfV599jpcYLam8HkMcZAeWu+n2UgxIfPAxG8vZay68ll6OVc0pDgx2zWbfc6FEeqFy8CYcGkZ8ipZO8BJtCuw2XWktJ15RMTink23ysoTOP6HBkrYfPNEwZttf4WTME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779926824; c=relaxed/simple;
	bh=lkOrnF6OXHnb2nqYnVqVD8lUOk47lunYW81LzncPNTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hm4mzqjwa1pEqg5o2aXXo7IqbeJJan2J0Z4juwhQAqNhxkyOZK6Xypx386ymfVZOBhk6ydJoUZhRi+cQmUh4O1W5vXat/IaHi5+GnCycYGavsPfUBXkgolmWgFINCwlYEUNcxUqLOdhyHWPU1miESpe2wB9ud5W3v+BWXPqJ6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkFWMiib; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkFWMiib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779926823; x=1811462823;
  h=date:from:to:cc:subject:message-id;
  bh=lkOrnF6OXHnb2nqYnVqVD8lUOk47lunYW81LzncPNTE=;
  b=NkFWMiibn810xhKf4+AFM6hk1yH0sWMOPkdVBKiiMBExg5tY3bbj2ZnY
   TcrGabr4wuxZRsNM5HH+Ks9c3MBLPva5c2NXyL8zYv23+IBRdv6xUiAXy
   ZpN+BCLK5ICb2JmSWoiXtC471RTRsfXQDJsBQ1XIr67plAmeVdCNMeUhN
   Km27Z6A+eOUV5UMeUAm9GSZqTbfW1w/WDScJluxYi0UgNz/pkHq6rVh4E
   qSAZFXVBsEfmsmo8DyeWGQIBJSoVu0J15fVRBRzVyMyEUNinbYo9cO7m4
   mw4Cpjed+IJrYydkqM5ODnoX0lE4mC/3pbhbSdiM3MlGji4nxEa9yvyBI
   w==;
X-CSE-ConnectionGUID: 5wZj9PFWS5Kbik6EDxi2Cw==
X-CSE-MsgGUID: i3LPpOVJRoqag+JrJ2M9lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80737206"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="80737206"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 17:07:03 -0700
X-CSE-ConnectionGUID: t+xfOpmWQ22AS7RSTYY76w==
X-CSE-MsgGUID: f4NG7QSqQYacqdVRF8rZ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="242476158"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 May 2026 17:07:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSOH3-000000004Za-1ExR;
	Thu, 28 May 2026 00:06:57 +0000
Date: Thu, 28 May 2026 08:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Woodhouse <dwmw@amazon.co.uk>,
 Amit Bernstein <amitbern@amazon.com>
Subject: [dwmw2:ptp 70/72] drivers/ptp/ptp_chardev.c:486:11: error:
 no member named 'pre_ts' in 'struct ptp_system_timestamp'
Message-ID: <202605280728.xL7ui09n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ptp
head:   33c2ba4213d3cbe068fe02d9788ec8e3087ae5c7
commit: dae4d1bfd97625b351e5e59e3791eb6a01f6bdfb [70/72] ptp: Add ioctls for PHC timestamps with quality attributes
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260528/202605280728.xL7ui09n-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280728.xL7ui09n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280728.xL7ui09n-lkp@intel.com/

Note: the dwmw2/ptp HEAD 33c2ba4213d3cbe068fe02d9788ec8e3087ae5c7 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/ptp/ptp_chardev.c:486:11: error: no member named 'pre_ts' in 'struct ptp_system_timestamp'
     486 |                 if (sts.pre_ts.tv_sec < 0 || sts.post_ts.tv_sec < 0)
         |                     ~~~ ^
>> drivers/ptp/ptp_chardev.c:486:36: error: no member named 'post_ts' in 'struct ptp_system_timestamp'
     486 |                 if (sts.pre_ts.tv_sec < 0 || sts.post_ts.tv_sec < 0)
         |                                              ~~~ ^
   drivers/ptp/ptp_chardev.c:489:39: error: no member named 'pre_ts' in 'struct ptp_system_timestamp'
     489 |                 extoffattrs->ts[i][0].pct.sec = sts.pre_ts.tv_sec;
         |                                                 ~~~ ^
   drivers/ptp/ptp_chardev.c:490:40: error: no member named 'pre_ts' in 'struct ptp_system_timestamp'
     490 |                 extoffattrs->ts[i][0].pct.nsec = sts.pre_ts.tv_nsec;
         |                                                  ~~~ ^
   drivers/ptp/ptp_chardev.c:498:39: error: no member named 'post_ts' in 'struct ptp_system_timestamp'
     498 |                 extoffattrs->ts[i][2].pct.sec = sts.post_ts.tv_sec;
         |                                                 ~~~ ^
   drivers/ptp/ptp_chardev.c:499:40: error: no member named 'post_ts' in 'struct ptp_system_timestamp'
     499 |                 extoffattrs->ts[i][2].pct.nsec = sts.post_ts.tv_nsec;
         |                                                  ~~~ ^
   6 errors generated.


vim +486 drivers/ptp/ptp_chardev.c

   452	
   453	static long ptp_sys_offset_extended_attrs(struct ptp_clock *ptp, void __user *arg)
   454	{
   455		struct ptp_sys_offset_extended_attrs *extoffattrs __free(kfree) = NULL;
   456		struct ptp_clock_attributes att = {};
   457		struct ptp_system_timestamp sts;
   458		int err;
   459	
   460		if (!ptp->info->gettimexattrs64)
   461			return -EOPNOTSUPP;
   462	
   463		extoffattrs = memdup_user(arg, sizeof(*extoffattrs));
   464		if (IS_ERR(extoffattrs))
   465			return PTR_ERR(extoffattrs);
   466	
   467		if (extoffattrs->n_samples > PTP_MAX_SAMPLES ||
   468		    extoffattrs->rsv[0] ||
   469		    extoffattrs->rsv[1])
   470			return -EINVAL;
   471	
   472		err = ptp_validate_sys_offset_clockid(extoffattrs->clockid);
   473		if (err)
   474			return err;
   475	
   476		sts.clockid = extoffattrs->clockid;
   477		memset(extoffattrs->ts, 0, sizeof(extoffattrs->ts));
   478		for (unsigned int i = 0; i < extoffattrs->n_samples; i++) {
   479			struct timespec64 ts;
   480	
   481			err = ptp->info->gettimexattrs64(ptp->info, &ts, &sts, &att);
   482			if (err)
   483				return err;
   484	
   485			/* Filter out disabled or unavailable clocks */
 > 486			if (sts.pre_ts.tv_sec < 0 || sts.post_ts.tv_sec < 0)
   487				return -EINVAL;
   488	
   489			extoffattrs->ts[i][0].pct.sec = sts.pre_ts.tv_sec;
   490			extoffattrs->ts[i][0].pct.nsec = sts.pre_ts.tv_nsec;
   491			extoffattrs->ts[i][1].pct.sec = ts.tv_sec;
   492			extoffattrs->ts[i][1].pct.nsec = ts.tv_nsec;
   493			extoffattrs->ts[i][1].att.error_bound = att.error_bound;
   494			extoffattrs->ts[i][1].att.timescale = att.timescale;
   495			extoffattrs->ts[i][1].att.status = att.status;
   496			extoffattrs->ts[i][1].att.counter_id = att.counter_id;
   497			extoffattrs->ts[i][1].att.counter_value = att.counter_value;
   498			extoffattrs->ts[i][2].pct.sec = sts.post_ts.tv_sec;
   499			extoffattrs->ts[i][2].pct.nsec = sts.post_ts.tv_nsec;
   500		}
   501	
   502		return copy_to_user(arg, extoffattrs, sizeof(*extoffattrs)) ? -EFAULT : 0;
   503	}
   504	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
