Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55FC3211;
	Wed,  6 Nov 2024 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886383; cv=none; b=tbbt/xzbM7iz7ZUYFfdd+6WN2+QfzyhrRPvv97IF+GvV0LiHSVY1D1SYr87KsIgXQEy3IsIdAFL7MG6gTLExRStmozbWTXvnigKXGajZjQiui4p3lX8e/rMtybA7D7TKIG5C+j4/ep1Q/wfCY5/06iA5haZInIjR6zmVU/XTzUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886383; c=relaxed/simple;
	bh=b0MvF/Bd/6vMVojtjHo3DTZ1P1e6+dYU3aZJLPSU+Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3YY7o3AzPGL7x8Vjdz8yES7ch9MDDIK1Q6u1EHWB+GSZJLkwpN9x49cevcKda5mg+5VcPB2cZhpaK8qUV+lWRvZl9pyDgGStnuKDM9/dB7lPgB95oJyKnRzI+StHdCVtYEdsY43QqIchY1Ku53Zk/mErPtxwG7F8Cbyhv7Oi24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ia8m7qqi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ia8m7qqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730886382; x=1762422382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b0MvF/Bd/6vMVojtjHo3DTZ1P1e6+dYU3aZJLPSU+Pc=;
  b=Ia8m7qqiHVg7FT4o6eghjDIcMaRMQMsyk62SkByTaz2i10dV+Tt9k3mw
   vVzWnaGEaP/T1WK1yw/Fax5n7Ca3dKRQXyVed61EQB1greqwm94osM8/W
   Hs513O48+vczxo+0wPOZQwvKQY6BdexQoVH8hLimpUMNeY82Ku95z3Z2F
   5hSUukYLwt5DSi7qsuEGBuCoqfNKwxSdGZ+Zz606HSJeg8zJaoo09P3TZ
   JW/odzy+MGlys4u59FVYSq1sGHdgu2g8KZ0GLU58OXSD/JM7w7zDwKIOY
   XT6XJ9KgvD5RrfwxZCzaIyxlAlsXlQXAnM8n4/ZzE+g0mQy7XsZLEZLyj
   g==;
X-CSE-ConnectionGUID: 5y+/4OjQQaC5HQYKzU5VgQ==
X-CSE-MsgGUID: +MeFRSYtTqO647kTvLDMrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34371285"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34371285"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 01:46:21 -0800
X-CSE-ConnectionGUID: EGw32GqRR2aZnmVCrH1XzA==
X-CSE-MsgGUID: sSkIVPAiRkmyCxOW6u+F1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="115229086"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Nov 2024 01:46:20 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ccD-000n9W-1q;
	Wed, 06 Nov 2024 09:46:17 +0000
Date: Wed, 6 Nov 2024 17:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 2823/9686] ld.lld: error: undefined symbol:
 ptp_schedule_worker
Message-ID: <202411061759.pllJz18k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5b913f5d7d7fe0f567dea8605f21da6eaa1735fb
commit: ad8e66a4d963ce3936eb6dc92c3be41ee92f3350 [2823/9686] eth: fbnic: add initial PHC support
config: x86_64-buildonly-randconfig-006-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061759.pllJz18k-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061759.pllJz18k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411061759.pllJz18k-lkp@intel.com/

Note: the linux-next/master HEAD 5b913f5d7d7fe0f567dea8605f21da6eaa1735fb builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ptp_schedule_worker
   >>> referenced by fbnic_time.c
   >>>               drivers/net/ethernet/meta/fbnic/fbnic_time.o:(fbnic_time_start) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ptp_cancel_worker_sync
   >>> referenced by fbnic_time.c
   >>>               drivers/net/ethernet/meta/fbnic/fbnic_time.o:(fbnic_time_stop) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ptp_clock_register
   >>> referenced by fbnic_time.c
   >>>               drivers/net/ethernet/meta/fbnic/fbnic_time.o:(fbnic_ptp_setup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: ptp_clock_unregister
   >>> referenced by fbnic_time.c
   >>>               drivers/net/ethernet/meta/fbnic/fbnic_time.o:(fbnic_ptp_destroy) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
