Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0412877FB;
	Sun,  6 Jul 2025 22:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840096; cv=none; b=EFQiJk/BY9OKTZSCHc0519Dt6U5gLaaviqOJD+1KhrkpiKNuwjFO/uIbYg1FnyWD4/5WNfyf2Da1JwNEvwtTlQlGNZjJ+dSjwSsK1xM+eIhlgnVkW79+9rAWTDuZWB3Q5GUvS3epa4o93sNq13c6TUaAbIBkZOqFi5vClNKcrJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840096; c=relaxed/simple;
	bh=pSVJG54LbGdf3nf1nJarqLBZcsrGa3Eb7lfuy54k+yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8Sif0zT8jR1u3ujo+1RLhdenRb4vZd17cdOFSKZUG0+efDWmgeGnBSZqeAQik2RKjKjtU6ppPOOkOt9mh8M7rE0iMtKJargOZdpvQwrJCTrWMkV6sfVVz0rUXtGtZtOlny6Yohi3tNprctyDVfwqER27c4uX4wsrUmSsE3sZNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bj7u4BFg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bj7u4BFg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840095; x=1783376095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pSVJG54LbGdf3nf1nJarqLBZcsrGa3Eb7lfuy54k+yg=;
  b=Bj7u4BFg28P/IeLSsgFRcySBLwD9/7u2X2vnw31x7KNQTzX6nUFDqw8L
   jFF59Uztwm0+fzoQe/cXGmAsHjL/whVFp4PeFptA0eDOEPK/Nn/0zSSys
   xCO7uxWDuVcvtnHMnP7TIZHh58ndKfY7x++NY5YBi0mQHo3V9wSZy0pCZ
   84AvGXtxxfJHvL3sa5m34t0T/G43TZtriAAGmdezlFtIrBGY6DmVAhRog
   MC6oVxRDtOpoUediNGtdO4maahFcPLLmmcUhKzIxpRTbGE2e+vrSy5PrD
   UTPZhhD8AxlYYm8rSHXDDZQ+7dzvI2ZCVyrGaQVN5zyD/1ZI9u01NjZdA
   w==;
X-CSE-ConnectionGUID: iqgXqzvrRuqV73Pj5v6xYg==
X-CSE-MsgGUID: OGI2x0rqR1qWN9rvUeI2Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64750152"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="64750152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:51 -0700
X-CSE-ConnectionGUID: h8Ln0Op/SdO1J2lEc1isMQ==
X-CSE-MsgGUID: ARpdZbO8Sma/QuScaABcig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="186075689"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jul 2025 15:14:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdH-000015-2X;
	Sun, 06 Jul 2025 22:14:47 +0000
Date: Mon, 7 Jul 2025 06:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ghennadi.procopciuc@oss.nxp.com, S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/20] clocksource/drivers/nxp-pit: Add NXP Automotive
 s32g2 / s32g3 support
Message-ID: <202507070449.1xGzeBPS-lkp@intel.com>
References: <20250705160129.3688026-19-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705160129.3688026-19-daniel.lezcano@linaro.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on soc/for-next linus/master v6.16-rc4 next-20250704]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/clocksource-drivers-vf_pit-Add-COMPILE_TEST-option/20250706-000719
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250705160129.3688026-19-daniel.lezcano%40linaro.org
patch subject: [PATCH 19/20] clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250707/202507070449.1xGzeBPS-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070449.1xGzeBPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070449.1xGzeBPS-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: pit_timer_init+0x2d4 (section: .text) -> sched_clock_register (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
