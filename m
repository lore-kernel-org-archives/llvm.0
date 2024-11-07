Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA0E194C94;
	Thu,  7 Nov 2024 06:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730962801; cv=none; b=V28iYunC5ACzyYB+RMzuSzfbf2ZqTjNDt/AFxGgUn7A2ETuKX51A/zzfrFYa2lUFAMlpIn4cPx3Fz28Y/2Qd13NWQb/BBwAsB3OOyaQfp09LOcmvrDz9d9lD00LSr59/bzxBZGufXLUKsUj10elZsU5Z1Zl5PdSEEoOYGQ6cjq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730962801; c=relaxed/simple;
	bh=R72FqnRAsMrcai4ddGQgu86IiktkQtDcMeTzhle9bQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9SyJxOHxvnDssDkkj6HFD++JxElbS1UY9sMKcl7GjxcsOUfTxsUljVv8fp8iRpJJOA5Tjtj5+aL2vFpNQo45z/GKLCmSLqzmHo+7ZxLh8+rBL8eOqvjljklvZpuwLcUKRhy77R52tqVpdMXKPynnf7axoBHFOJGddv5nDp5wFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2+c2wyY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2+c2wyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730962800; x=1762498800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R72FqnRAsMrcai4ddGQgu86IiktkQtDcMeTzhle9bQo=;
  b=U2+c2wyYlwTHz8+9a11Lh7vYOBgds04JildsF93PL79HArEOjv9LE1Yu
   a1s6z54Sie4Xl8D/UgWBFznipHiO6n0h0eX/dNcTQhQRYMRlfhQC7+Sr5
   lQ1SlU+uw9W5utKF7WbEKsnNHaiDDqQ3nHKA6vvA431uECtqgycLvsHJ9
   n2yLiZO6zpiDBL4gcMQBvQmCwweZN92PcdpkR1N1RsOrnhZTpObBrKlFZ
   7lcrxh+Gdpgn2BrY3NHS1rIpDcrwiTfpxoX0PsoxTRA9Tu/eWW6OCtu8w
   cAAEJ/APu1U1f3BUtVTeZOHd6yiPQoU0arePGJMLLq0ENgUHRQocVqi6/
   g==;
X-CSE-ConnectionGUID: xOHiXLiORIuD5d6M6DzT7w==
X-CSE-MsgGUID: xSdlrI5/QjSNb4G5uj62vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30213097"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30213097"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 22:59:59 -0800
X-CSE-ConnectionGUID: Ppmqr1kiQqqf1K7LSxSOMA==
X-CSE-MsgGUID: 8QFAlsCYRBSttMF9mTDNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="89577381"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2024 22:59:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8wUm-000pvE-1l;
	Thu, 07 Nov 2024 06:59:56 +0000
Date: Thu, 7 Nov 2024 14:58:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/tick-sched 3/3] ld.lld: error: undefined symbol:
 get_jiffies_update
Message-ID: <202411071450.TUzqdWGX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/tick-sched
head:   f0e253cdae796b8b09c2724389ef5d1fee9048c1
commit: f0e253cdae796b8b09c2724389ef5d1fee9048c1 [3/3] tick-sched: Replace jiffie readout with idle_entrytime
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241107/202411071450.TUzqdWGX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071450.TUzqdWGX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071450.TUzqdWGX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: get_jiffies_update
   >>> referenced by timer_migration.c:1081 (kernel/time/timer_migration.c:1081)
   >>>               vmlinux.o:(tmigr_handle_remote)
   >>> referenced by timer_migration.c:1167 (kernel/time/timer_migration.c:1167)
   >>>               vmlinux.o:(tmigr_requires_handle_remote)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
