Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C14237AA8A;
	Tue, 24 Mar 2026 01:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317098; cv=none; b=ewJZWNUCo2oVnmUlY2E59erYaGIkX2rJoRQ7zoiBFGMmWxNXghenLf96lUuFd8M8x/SYoCZtet6zV5w1M+mtuZKKlkDEPInOxS9GkrmSSlWSv6j9lX6eA/5CP19dVV/xhwXu2WGyx+yh09r+J0S54Y3qeDkq+XK0NsqUCU3OvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317098; c=relaxed/simple;
	bh=Iw+H1ifaCENM13dIQe3WmWLNFor2NPJkjF71I0dndLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=orb4fXedwsaGzfb9N1K/kTfthF2oy2LFYh2iU8d5j79k6bP9LVicraRNJUHS+uNuUV3tsH445WEBb0+1RavQxb2Tg8eRoK02a9E8n+Z+M1XHk/5zojDK/VbCx5DQ4z8Popy7mBh78b+AB1EcZy91WKBcbLH61OgD+IQt5hVijig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWKTEsCw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWKTEsCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774317096; x=1805853096;
  h=date:from:to:cc:subject:message-id;
  bh=Iw+H1ifaCENM13dIQe3WmWLNFor2NPJkjF71I0dndLw=;
  b=aWKTEsCwKm2OzI0bfMl4JZpwHNtAzFbI7q1R6EMWlyJJkM7zrHIqiDzT
   kkm+MUO3Sfef8SJJSFegkRZMczalE0QaGgH1gjV90KOlvpla21LuZviq6
   syZMkRnDALhiwfuZb0ERjgu0ruSPXxRIwfHo3CHW/OtBKibZMsFW0XBTF
   zQ+VVCWCAwgGgHlRMY96MrWYE1p8t0xZtroGdryfleJRhJGQIwc2qCtFC
   AcoOVb2pTUitzYdQhYdvQxGbDJnDOau1dB4ygFR0bo93+QokQFL3FgnlO
   /uIE4aMNwG96THDVIaM0nmJGEqkbHThzYbb4M1qjLezWxmHMeJcI/z4dI
   Q==;
X-CSE-ConnectionGUID: yFrrIVcSSUexQAOJpYlY9Q==
X-CSE-MsgGUID: nkRMPZSiQv+CQX01Ibacww==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100781540"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100781540"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:51:34 -0700
X-CSE-ConnectionGUID: 6w5eMLK+RzCcvSPxa7b6vA==
X-CSE-MsgGUID: 21BlQXlWQKuVUIIrlxufNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228947750"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 18:51:32 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qvZ-000000003WT-3dK8;
	Tue, 24 Mar 2026 01:51:29 +0000
Date: Tue, 24 Mar 2026 09:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "Alexandru-Catalin Ionita" <alexandru-catalin.ionita@nxp.com>,
 Ciprian Costea <ciprianmarian.costea@nxp.com>,
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: ERROR: modpost: "__bad_ndelay"
 [drivers/iio/adc/nxp-sar-adc.ko] undefined!
Message-ID: <202603240945.I1IElCnZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 4434072a893e4864519c167947083ff3e4cc2d95 iio: adc: Add the NXP SAR ADC support for the s32g2/3 platforms
date:   3 months ago
config: x86_64-buildonly-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240945.I1IElCnZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240945.I1IElCnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240945.I1IElCnZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bad_ndelay" [drivers/iio/adc/nxp-sar-adc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
