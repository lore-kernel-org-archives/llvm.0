Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B137618893D;
	Thu, 19 Sep 2024 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726752302; cv=none; b=tutGMYi9cXskjuqxak16Xr6mvCMdRhSkarfvzjGzgaN5E/O6l95wEJpepaL9Pjle6/MSKX/TzKsQlyH9+9COdjpPmIOoaqoxxvj9diPOh5ubxOoKcoznkYM4z1nNPJ5x7rx0OWVDKE97iUXzSsXzJscYIwXMNKAk8n8tau//5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726752302; c=relaxed/simple;
	bh=I5GSNvrczKmStGWp6Dgs5SLrjo+re4cEEm57VzBSIdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrNkbpDVFJ9qBH/GB3snsPwmsvEkw0WNpCfOXspkpgifT3csrVScZPsrYJeAQoP2MMIC1+s9HkaJDbV6g4b6a32sNFfBZJg50i7XAw86fvf2sDrYc6jRfS/PgGd9VM7pNy5fxCYrbVyIvh6kllAriK5SNVlmSYnMjOsZqG54zF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoAq4g3Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoAq4g3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726752301; x=1758288301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5GSNvrczKmStGWp6Dgs5SLrjo+re4cEEm57VzBSIdc=;
  b=CoAq4g3ZGiu0w5KbbRKFPkAPbsPdfDw1ke/CknBT/xbDJDXx0cg6QNX3
   wbevHV3T22vgZJQMvDhJR86vSA3TbBrF9Wl8vbE0q+JrUpzOgiWdmuE4k
   pEoAGidFspE/C6z10i/tdheqXk8ZFOH9KOc5Ec+ZV7mrdEVmXL8YEB2WV
   QV7mPn/k0Tz2cJMlm3VVTm2dkqQkMjdlewwbDkYRwRxiS+RTCGOEa/qFw
   tzMo82rZbIXCUJYRk5s7NPMEBlG7KKMf73yAUqE/0Ed7Qs28b6paI0/px
   Ybq5SRNUhumYt3dwmoDbiuKPUxCnTAToe3mP6HeyVWKg1XyfYHOQ8kMRo
   w==;
X-CSE-ConnectionGUID: fspys2yhT/+7XIs2Vz1cvg==
X-CSE-MsgGUID: q8LzxVDvT6Gd1bTuOiIRTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25806976"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="25806976"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 06:24:59 -0700
X-CSE-ConnectionGUID: +TRuc28/STeBIPRsujTgfg==
X-CSE-MsgGUID: 9OdnHUNXTfeP45Sc0YDsNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="69523881"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Sep 2024 06:24:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srH9T-000DJc-1F;
	Thu, 19 Sep 2024 13:24:55 +0000
Date: Thu, 19 Sep 2024 21:24:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 8/13] kernel/time/timekeeping_debug.c:59:15:
 warning: no previous prototype for function 'timekeeping_mg_get_floor_swaps'
Message-ID: <202409192115.qF1AILLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   c276587422e7965813f945523c522b95b0f5ffcf
commit: 6f453b2b31051a046df355061b0bfcfe32198083 [8/13] timekeeping: add percpu counter for tracking floor swap events
config: arm-exynos_defconfig (https://download.01.org/0day-ci/archive/20240919/202409192115.qF1AILLT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409192115.qF1AILLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409192115.qF1AILLT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping_debug.c:59:15: warning: no previous prototype for function 'timekeeping_mg_get_floor_swaps' [-Wmissing-prototypes]
      59 | unsigned long timekeeping_mg_get_floor_swaps(void)
         |               ^
   kernel/time/timekeeping_debug.c:59:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      59 | unsigned long timekeeping_mg_get_floor_swaps(void)
         | ^
         | static 
   1 warning generated.


vim +/timekeeping_mg_get_floor_swaps +59 kernel/time/timekeeping_debug.c

    58	
  > 59	unsigned long timekeeping_mg_get_floor_swaps(void)
    60	{
    61		int i;
    62		unsigned long sum = 0;
    63	
    64		for_each_possible_cpu(i)
    65			sum += per_cpu(timekeeping_mg_floor_swaps, i);
    66		return sum < 0 ? 0 : sum;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
