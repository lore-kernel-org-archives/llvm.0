Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143651A3167;
	Sat, 20 Sep 2025 07:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758352288; cv=none; b=uoL1EcSw7Ua89JexKudUXJ58Zgk31iGsu1j3R2QZCZeU0dAYeOadbcKNViDbICyrDMpr0nZZqdwb6Yfm0HuUZpF70eHX5yVT/6kz07krbJJeUxssfQ2KuNzU1TgoCaIXeEBG3/zThQWwUaouqKBf8MSHEJlAJb92uarUua9czqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758352288; c=relaxed/simple;
	bh=+CvDYUIf6DoiHBHQudz1UmnBeXF1ljxWnEr6IuBAn0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJ1aFjDeZSdvjCbuiG5+rRkOV8uP5EVKXYxGhyhYvMn9jxjoP9NcJOA8ibqjUB1K50AQwCoQi6URvH9PzwvR78RneDpvidqxIjcnRzrnu25Sphj3/rz1TlWwP+EPTCkjSgLdP/Eqy5eSL/61OaCSh0jcaoe5X2kW0s335reIHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwqQPaL6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwqQPaL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758352285; x=1789888285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+CvDYUIf6DoiHBHQudz1UmnBeXF1ljxWnEr6IuBAn0I=;
  b=YwqQPaL6VOhXtFaQJmaaQ0/VpKdupXxF7qBQgpK3ze5WUr/r4c7vFaxB
   Pmra6Rv1cd4l+kVuG7/D85L4SFsJKw2ackcAnUqRHcACEnh7VRIjG9IQm
   ZWaEqTFzpNtsxkDiMvNm4MQ8PddbdcMJ5WqEnJ++ZItyTQI61bNtvEryy
   Ri/4e/F/AxOqZu66/FvHvh+cS32sqWF6G6AG4fktrsadGMNMKtn8NQuWc
   q/0e+YZHuTYDq0Oz1qYvZyDA10munhghQkQurq1SW7mH1JM6IYuV1ZJCY
   XoG0+T0+QafmvoJcrGJCOqNz27aNkOcpJPe9IE571T1rwoMxN4jyANMsy
   A==;
X-CSE-ConnectionGUID: 1hLpzbFaRROxn2FCAUHIug==
X-CSE-MsgGUID: TisHeMKaQa6JDE/1KtNp0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71797663"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="71797663"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 00:11:24 -0700
X-CSE-ConnectionGUID: KjwNkg3mS72R7Pu/ByA5hA==
X-CSE-MsgGUID: tb6IWqUHRh+III3DiErk9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="213173397"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Sep 2025 00:11:23 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzrkf-00057X-0B;
	Sat, 20 Sep 2025 07:11:21 +0000
Date: Sat, 20 Sep 2025 15:10:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.09.15a 45/45] ERROR: modpost:
 "init_srcu_struct_fast" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202509201519.udl3bu3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.09.15a
head:   f81c21ec3fca688bfcb6fa0abaf70404655765dc
commit: f81c21ec3fca688bfcb6fa0abaf70404655765dc [45/45] rcutorture: Exercise DEFINE_STATIC_SRCU_FAST() and init_srcu_struct_fast()
config: arm-randconfig-003-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201519.udl3bu3X-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201519.udl3bu3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201519.udl3bu3X-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "init_srcu_struct_fast" [kernel/rcu/rcutorture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
