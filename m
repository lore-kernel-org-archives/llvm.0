Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1FE9457;
	Thu, 18 Jul 2024 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721310705; cv=none; b=jIukuHBfrMFDp9IFf2KdEpFQjgc7d+JvlzpEIkfeFUmGLWmLOFR7DLDQjUtqA5eWC7IH3de8UdpVTOqHZZYzXOOBxldrDfM2d8e12ycNYD6QI21WGSIFp3a6dIiQgUeVclhl68g4iPyXzk+NAb/PsAT7CbfylIwYk4rmAg+qZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721310705; c=relaxed/simple;
	bh=ldLUFz7lG8I5hhAgpkg5sriaBzHcvpg5AuTzTuEsB1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uW4GopImbnqNBlJ+cyL04v/9sg/D6xhS9c9bdd2ibFUO8MpJEVrAt6Vy6JZbq8Ua2sLtJGx1aXKmXQmQ/x42/UbCUGH32UHi76WMMRho/V73pvpIBr1h3PJHzoSp6A8RqC0cIvEE4uK9s0tgYvd50MDVkeAwfu6bkr0MFfWF6cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfcWdAmN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfcWdAmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721310704; x=1752846704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ldLUFz7lG8I5hhAgpkg5sriaBzHcvpg5AuTzTuEsB1g=;
  b=BfcWdAmNlq3qaq0pyHifWpYXYiQMNqETljje8FUhKxTnnm0sP+TlSna9
   tCGKIilX84vf561V+zXfBgXr6FLHGMW0kCxn+64W62RSxxW/oIwcqSlPR
   ycQKhlmTohuDcKu2qorXcUP9beYqc+tso/dLk1u17Kyni7V6mDuM2G+ta
   Vg4f70S4ZlJ4836pei66zQRe9Hu42skgPaRqw2TW75nOmo3polABKRMQY
   xu3u4MSSZNAsEH9gZwTLy6kg6glhicnH0EsHcu57QQfsw9GE4OHO9KpM9
   Dc3oshphFHod6xTK9+1Qfm7RhCzxYxh1zcrm2NDr9qm3Y2ke4b9uYX7ut
   Q==;
X-CSE-ConnectionGUID: 9vPx7yoRSvm7/VPmmicHzg==
X-CSE-MsgGUID: ID7Of87pRiCOl9yWSsyFyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19053655"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="19053655"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 06:51:43 -0700
X-CSE-ConnectionGUID: bnYLQPanQv65HBY1TWKSgA==
X-CSE-MsgGUID: MBlssHA0SN2VwunoM44Czg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; 
   d="scan'208";a="51388460"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2024 06:51:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sURXm-000hJG-1q;
	Thu, 18 Jul 2024 13:51:38 +0000
Date: Thu, 18 Jul 2024 21:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vibhore Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>
Subject: [khilman-omap:lpm-v6.10/constraints 9/15]
 drivers/pmdomain/ti/ti_sci_pm_domains.c:135:26: error: called object type
 'void *' is not a function or function pointer
Message-ID: <202407182123.SoC03BGG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git lpm-v6.10/constraints
head:   e2d1fd7e6367d7aa0db506b7d3794eb61553d29c
commit: 7a2a54738aa64954989f42a22bcc087bbc8b3c48 [9/15] pmdomain: ti_sci: add per-device latency constraint management
config: arm64-randconfig-001-20240718 (https://download.01.org/0day-ci/archive/20240718/202407182123.SoC03BGG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407182123.SoC03BGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407182123.SoC03BGG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pmdomain/ti/ti_sci_pm_domains.c:135:26: error: called object type 'void *' is not a function or function pointer
           return pm_generic_resume(dev);
                  ~~~~~~~~~~~~~~~~~^
   drivers/pmdomain/ti/ti_sci_pm_domains.c:156:27: error: called object type 'void *' is not a function or function pointer
           return pm_generic_suspend(dev);
                  ~~~~~~~~~~~~~~~~~~^
   drivers/pmdomain/ti/ti_sci_pm_domains.c:175:32: error: called object type 'void *' is not a function or function pointer
           return pm_generic_suspend_late(dev);
                  ~~~~~~~~~~~~~~~~~~~~~~~^
   3 errors generated.


vim +135 drivers/pmdomain/ti/ti_sci_pm_domains.c

   131	
   132	static int ti_sci_pd_resume(struct device *dev)
   133	{
   134		ti_sci_pd_clear_constraints(dev);
 > 135		return pm_generic_resume(dev);
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
