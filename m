Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EE01C8621;
	Wed,  5 Mar 2025 05:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741151161; cv=none; b=t6gIc6nuSJv0m8HTO45SPN7TnfvMnV08aTPfD3qo6XQRJ1fze3Qvi+9wyiVEb6601o4awZOLS3CBBAp632em+oLaOGNej8Lchdx8QZ0an/q8Lrp0q2nbVyug3AGhrTTRZOkGBXJk9O1hKbaksPlUZgi2D+May1lHHXp/aKrnDcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741151161; c=relaxed/simple;
	bh=A1T+rg+CjYoxg3kxZiSqnE2HBpXajRjwVn3LPsoJA48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H36Ghbtdfd0u2Vi+EjkhA2KsUNm7VKSgloydh9ImF/n38CYfM3/F4M5P6QGmxvgomnDrkg8VhebdCGTX78NTyztYgYIgpMlkufW9lHzIhQy26Sz/P6XxQvmwzH0WIKH967thhCjLJAF8mBgFQs22xF8cQalQKAQzakyHEELKOMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZG1HJ+ve; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZG1HJ+ve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741151160; x=1772687160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A1T+rg+CjYoxg3kxZiSqnE2HBpXajRjwVn3LPsoJA48=;
  b=ZG1HJ+veKO8B2VN254t+uOyk/Wu2Wrt7jufDm2CdCCmMTU/N7jYRnnpG
   1SjeMVncZUyEepqi1JBh194siFKEG640Ni7UX8Zb2F1riAoAi+YcHl/86
   KK6wJTrWr1vm07TxGlDn88Hoo5Qhup7NHrOpeD1/DUM43zMl2NS57SdH6
   ZrATZeQYJmcVVo3Gdyt7ToRhdykXQ9/f02qJ2YLGmMIJDBihWLyM6s4mB
   rRjxL49O7xe1PJBWhuicaz3LV1p0uEuZufzJA5RYdQ2rEYNqIE9r04AFr
   QsBwF+seNxTwDnFn9zEGTyg7/HjyW9xt5zx2HKaHJ13+9/zNZkiVcBdVZ
   w==;
X-CSE-ConnectionGUID: cjSZuEfIRjefgO3HwuXYIQ==
X-CSE-MsgGUID: cUMXXYUsQPmQ3saUM75ZbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45752452"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="45752452"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 21:05:59 -0800
X-CSE-ConnectionGUID: ZQwFFz92TL21qlcbwM1r6Q==
X-CSE-MsgGUID: fH3u4ZE7So2C72DSql9vLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123177928"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Mar 2025 21:05:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpgx9-000KcM-2C;
	Wed, 05 Mar 2025 05:05:55 +0000
Date: Wed, 5 Mar 2025 13:05:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tingmao Wang <m@maowtm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/9] Creating supervisor events for filesystem
 operations
Message-ID: <202503051227.Dhb3OX2X-lkp@intel.com>
References: <ed5904af2bdab297f4137a43e44363721894f42f.1741047969.git.m@maowtm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed5904af2bdab297f4137a43e44363721894f42f.1741047969.git.m@maowtm.org>

Hi Tingmao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tingmao-Wang/Define-the-supervisor-and-event-structure/20250304-092354
base:   linus/master
patch link:    https://lore.kernel.org/r/ed5904af2bdab297f4137a43e44363721894f42f.1741047969.git.m%40maowtm.org
patch subject: [RFC PATCH 6/9] Creating supervisor events for filesystem operations
config: i386-buildonly-randconfig-003-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051227.Dhb3OX2X-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051227.Dhb3OX2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051227.Dhb3OX2X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'domain' not described in 'landlock_ask_supervised_layers'
>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'denied_layers' not described in 'landlock_ask_supervised_layers'
>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'request_type' not described in 'landlock_ask_supervised_layers'
>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'access_request' not described in 'landlock_ask_supervised_layers'
>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'path1' not described in 'landlock_ask_supervised_layers'
>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'path2' not described in 'landlock_ask_supervised_layers'
>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'path1_new' not described in 'landlock_ask_supervised_layers'
>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'path2_new' not described in 'landlock_ask_supervised_layers'
>> security/landlock/supervise.c:97: warning: Function parameter or struct member 'port' not described in 'landlock_ask_supervised_layers'


vim +97 security/landlock/supervise.c

    79	
    80	/**
    81	 * landlock_ask_supervised_layers - check if all denied layers
    82	 * are supervised, and if yes, ask all of them for permission.
    83	 *
    84	 * Return whether access should be allowed.  If denied_layers
    85	 * contains any non-supervised layer, will return false without
    86	 * making any supervisor event.
    87	 *
    88	 * Caller owns any paths passed in, we might get refs.
    89	 */
    90	bool landlock_ask_supervised_layers(
    91		const struct landlock_ruleset *const domain,
    92		const layer_mask_t denied_layers,
    93		const landlock_supervise_event_type_t request_type,
    94		const access_mask_t access_request, const struct path *const path1,
    95		const struct path *const path2, const bool path1_new,
    96		const bool path2_new, const __u16 port)
  > 97	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
