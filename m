Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1682FD1C2;
	Tue, 26 Aug 2025 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197506; cv=none; b=HBF+X3OZXTERniNxxeqY7dj/KObqOcrJlePJq/4EMV2Gcva5jTVEQLI03GZ42Yd+3lWA0xEJDpKZwgUwLnrI0vAD8EYOgj5Ezns3uHQ2zQad9SRgxm1n9d+YCJlO9LTUhmiuqf/MzOD8ZqAsTDE5tSPFJFkJuqCKw32OnnfTpC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197506; c=relaxed/simple;
	bh=VwnkGumi7m+NtmngQTDJp+c+kv9r0AJvz0+ZbICwF+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tjNcPlEVt/77xLHmyJpiuaZT8WXPqKUk5U1ZHh/+Yzq42NLaabbQ9wHQgl6VYp6sKdaw7Ic7xYOi9HYlWdn8/0SGefA2nyHaT+xTZZmTqEe16KLh21aH5X400WZZ5K74JB8mqdXaxmA3v5H8tNpVvKY2rPdDgWzV8alU+CHGNC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoxLg2gA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoxLg2gA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756197505; x=1787733505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VwnkGumi7m+NtmngQTDJp+c+kv9r0AJvz0+ZbICwF+o=;
  b=WoxLg2gAHUzl8RGvpqNJalfSZVq4Bx8EG8+vU7yNnghVrVN+7GPEomaT
   AV61D46NxXaq3khD+4UALKxUwqsyupUm7NHCqx2gAcDYTKAlxIRKpaSHm
   7luPSEPZA3ZfZL8bMyB3oAWIjPQelW+rO0hUW7e7zQBs1AdllDNKANfRK
   hytOpqsRIwm5Kcdx1Syo2QrmimXZK1RLGt3IPopZHOANoY82EvUDn8ka0
   7ek3zd/Yr2DCp5aD/HPsJqLdT3/rnGiQiNOfvAAfiL2R2nlRx4NZe5Ols
   wYge6CoiUljuOOFKsixYelgJH17xoWId6ZiuAsdGDlTe4+QK2b3/3AujF
   Q==;
X-CSE-ConnectionGUID: kUTK0cjQTwu2NJWMdxAqpg==
X-CSE-MsgGUID: qy2uOUUaS56Ox356flYFLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69020167"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69020167"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 01:38:24 -0700
X-CSE-ConnectionGUID: YtI7BNYMTi6X/BeA5AqvUg==
X-CSE-MsgGUID: MDPEXGemQvWvVE0kp4uRKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169124514"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Aug 2025 01:38:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqpC8-000OKZ-2J;
	Tue, 26 Aug 2025 08:38:20 +0000
Date: Tue, 26 Aug 2025 16:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4166/4221] vmlinux.o: warning: objtool:
 dev_pm_opp_find_level_exact+0x47: no-cfi indirect call!
Message-ID: <202508261620.orOkZR9F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c68f4c0a147c025ae0b25fab688c7c47964a02f
commit: f441989dc8b0ebb984b4781856865eeb17d1bff4 [4166/4221] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250826/202508261620.orOkZR9F-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508261620.orOkZR9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261620.orOkZR9F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: dev_pm_opp_find_level_exact+0x47: no-cfi indirect call!
>> vmlinux.o: warning: objtool: dev_pm_opp_find_level_ceil+0x75: no-cfi indirect call!
>> vmlinux.o: warning: objtool: dev_pm_opp_find_level_floor+0x66: no-cfi indirect call!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
