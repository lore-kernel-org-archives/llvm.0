Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB08298CA3;
	Thu, 11 Jun 2026 11:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177756; cv=none; b=GWk1Irp2Ec23QcxuUGb4yiALXJHr+klDiJzRkWUlGFz/LvzL+r50vt4u/JzYIQhPZDmMFt7McSobtDjfDDh/bL70lvoSY5cjoGeBGbhPVVxZkX4hNjYRFwyS3sKTbXoNhFx1Y6Knz9g8hsczEm3hPBuMdkjgTKU3ivjQ/IbD7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177756; c=relaxed/simple;
	bh=uCy/p5+bCNVbkdHK9uPq75SvFpiqSm5/MJQaOtJuOdQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mp+vDpWte5dVlem7QDZ9LobjHmj/l0cwC8ABPzUze0uTRpZd7+amDYcmL1zqnXFIfttUA/hMlxDRD+AMG2phk0ZxltfYGYyvlC4ISG+RSegPJu3dq+xiTl17vPLWs+IyxjtguR3rVjiM9hlUq17tDRkN6AZVfMvWLCc2o6fgkuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8eTt7Ms; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8eTt7Ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781177753; x=1812713753;
  h=date:from:to:cc:subject:message-id;
  bh=uCy/p5+bCNVbkdHK9uPq75SvFpiqSm5/MJQaOtJuOdQ=;
  b=X8eTt7MshG5L55gqGGon2lO2ma+uf1QYTUuJWyIinkVulvRPeCgqGzZw
   HTGpnIuUTV4q7b+z+FqEqBlrydbDgqUBIJPhiNTbZNmLZ+g90sfDRKOei
   UfYdZeeX/EXEZ0KKtyC44zxqk07IAIVqrQC0K62VhXecsasRCgklDwZJS
   WmT05b/TKsSS4/gnWehMBKkXEIzfi9kQxlQQxJm9GUO8zfrY0fVXaTr2W
   w97Q3F+BgHXi79s1tS2Be+CX2/5IQitbEQlaaX3P4W3/24ghXRYRXWWAY
   WhDlKwNjOTbryHp4IBWY9v1+NU4kjSFq2uJ6obM7m9iLqtpblDoZQPmw6
   A==;
X-CSE-ConnectionGUID: aKtGv+cqQb2Ufp9SNV56gQ==
X-CSE-MsgGUID: +qfW/UXnTiGD/V9PlYoL7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81729737"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81729737"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 04:35:53 -0700
X-CSE-ConnectionGUID: TnsusAKMR8STEy6MsG9mIg==
X-CSE-MsgGUID: 26ATGAgQTdekn/wTfbp5aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="250377935"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2026 04:35:51 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXdhM-0000000040H-3gGv;
	Thu, 11 Jun 2026 11:35:48 +0000
Date: Thu, 11 Jun 2026 13:35:14 +0200
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:next 12/12] drivers/pmdomain/core.c:36:23: warning:
 unused variable 'genpd_provider_bus'
Message-ID: <202606111303.XQpgfuC7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
head:   ea1ca762328194de780a8e92df0b2e41bf6eeed2
commit: ea1ca762328194de780a8e92df0b2e41bf6eeed2 [12/12] pmdomain: fix early domain registration
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260611/202606111303.XQpgfuC7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111303.XQpgfuC7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111303.XQpgfuC7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:36:23: warning: unused variable 'genpd_provider_bus' [-Wunused-variable]
      36 | static struct device *genpd_provider_bus;
         |                       ^~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/genpd_provider_bus +36 drivers/pmdomain/core.c

31cb75077003ac Ulf Hansson  2025-07-01  34  
31cb75077003ac Ulf Hansson  2025-07-01  35  /* The parent for genpd_provider devices. */
a96e40f4afdcb5 Johan Hovold 2026-04-24 @36  static struct device *genpd_provider_bus;
31cb75077003ac Ulf Hansson  2025-07-01  37  

:::::: The code at line 36 was first introduced by commit
:::::: a96e40f4afdcb52a9c97a5465c964e010734d105 pmdomain: core: switch to dynamic root device

:::::: TO: Johan Hovold <johan@kernel.org>
:::::: CC: Ulf Hansson <ulfh@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
