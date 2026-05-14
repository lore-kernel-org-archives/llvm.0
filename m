Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF113C2782;
	Thu, 14 May 2026 12:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762508; cv=none; b=f6NRZAi+yL+nTK0YI5URWIBCKJXke6NT96Ehls2+ortbAXKT0sjfE40U5fcg/jx9VtavQ21UNitbXxX559AaqBTq11PEVEp1Ze68Dh5BpcGymBtK5TAA1Uc9MpqQ68niOddu+WuTCeU9o5wlI5H4qJkySPROwlwx7Nu+wuz2n8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762508; c=relaxed/simple;
	bh=25NpyjhihkjnjfBEZ4UrFPPenXKS+aRuqNSYcNUwzzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWBAo8eRpFvq/lCXU8YVhCdKfvoKs8305ElMlGz7uQ3t7YrbziW7aHzVd04WqJFjWgeSPkeYQwb9yYKzE1ylug24OsIfW4+ApoF0CBuSEql+yAu1VzVo8f2UAdTVCF9sLllfsB+KniYlf6JVKxPw4gJndxUKADD2sdmp65Gd7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJyIG+xa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJyIG+xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778762507; x=1810298507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=25NpyjhihkjnjfBEZ4UrFPPenXKS+aRuqNSYcNUwzzc=;
  b=iJyIG+xa3goTsdzPqWayhC/rrol3P7mjYLm9QFvIrc++YkHg8fInEzV8
   sBwllCAAF97TUXzikeaf27bl/MR1YnaSo+wOGkvMwdmcaDt1FxIpVVSdP
   +q3iqk/G7w4rgtMLOIIYEpWKF0P/55oz2X6jTV/guoDSnOC4gGXn7or7o
   5s64vUPpBMypMznzK3WCVo8/50Ao+AX4ARHb/UXtibLOJwS4mWKtc2EO7
   SCV/1iHxXI9QjjOZO5j0LJ4p3XugqgB7M3qFps2GmxEqIVrzzvF9Mm32/
   EvQ9ba8MKlJnfwc943taZMxDv/z7Ld9m47t96qnywyA4+j8NQdE4rrWUw
   Q==;
X-CSE-ConnectionGUID: hqhkXGZPQhuY5QuJuNGeIQ==
X-CSE-MsgGUID: 8I6vkYRPRGKba83h6gspbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79739288"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79739288"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:41:46 -0700
X-CSE-ConnectionGUID: Xs8nQIwQQYySesratsHSfQ==
X-CSE-MsgGUID: Mzvk1JA+QeW9+EPrCo23FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238625133"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2026 05:41:44 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNVNm-000000006YN-0yIZ;
	Thu, 14 May 2026 12:41:42 +0000
Date: Thu, 14 May 2026 20:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
Message-ID: <202605142053.5rExqXop-lkp@intel.com>
References: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk>

Hi Andrew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 7fd2df204f342fc17d1a0bfcd474b24232fb0f32]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Murray/printk-remove-BOOT_PRINTK_DELAY/20260514-132813
base:   7fd2df204f342fc17d1a0bfcd474b24232fb0f32
patch link:    https://lore.kernel.org/r/20260505-printk_delay-v1-1-5dba51d7f17c%40thegoodpenguin.co.uk
patch subject: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260514/202605142053.5rExqXop-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142053.5rExqXop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142053.5rExqXop-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/sysctl.c:11:18: warning: unused variable 'ten_thousand' [-Wunused-const-variable]
      11 | static const int ten_thousand = 10000;
         |                  ^~~~~~~~~~~~
   1 warning generated.


vim +/ten_thousand +11 kernel/printk/sysctl.c

faaa357a55e034 Xiaoming Ni 2022-01-21  10  
faaa357a55e034 Xiaoming Ni 2022-01-21 @11  static const int ten_thousand = 10000;
faaa357a55e034 Xiaoming Ni 2022-01-21  12  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
