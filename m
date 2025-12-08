Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A426ED4A;
	Mon,  8 Dec 2025 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765222443; cv=none; b=d8wgrwBua51KFt6YZrLZfdz3s0LiPmV2s32hebmOiPU06sIFnrIWJkByvH/VjuX4BgtBD+QEPPUPlp99SIcdn628h9e3VWEBPV26ATiivqh86E3THqvSC8nr0Z//BandyL/YuwUIWa2hNApLrpszCa80aqWJaWqBHltOe0Iblfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765222443; c=relaxed/simple;
	bh=tz1TjVvR1Q8AndOt5uptgLZhpVh6KHB9uxzkAJkhY+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IkcETc6OotBeQP1Vsb24joxfkZ6Yo2nP5tcvivrU0QYTEDnHDuGlk/ybYHQYDYkh5eGJ6H7fnyUEm0E5v7Eq/f7UD1kyKhwPoMK6vwDm7sS4C1RLQfYu8oyp9EVCInOTA30TVBvqFkcyzagBKFAxOMPFWJHg9AFEzcaM0zjkIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkDmP+fU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkDmP+fU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765222441; x=1796758441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tz1TjVvR1Q8AndOt5uptgLZhpVh6KHB9uxzkAJkhY+8=;
  b=fkDmP+fU+VVwv+tS1WgvfTWlM/r7og/WOM7EVnx+ReC6TtAZclEBtkcn
   FbnQ9ku10xLnYEbbM7hnJuv1MR6LfNZqwh6CDM6M8RJoDh7WWDhLLIeG0
   NCiGnA3FIWBpwRHetsAi00gxkv4Vqgc2tfaY+ohReBpSLpNjR6UAMrAkm
   v0SBwVeTaceYvZu9yk5JuMb4vdnUSyqssLvWxc/A3S8kubt3v8LrepjpZ
   6UQVq6+soDA98G3JEXVX0SzL1hUkcPC8193G+/QF42neEYKQolgahKXp1
   h7kPb6iokuHoS0l+nmY4rUqE/E3L4Qtinj4Vf+7hSS0G4DWlqyxdiu43G
   w==;
X-CSE-ConnectionGUID: JuZdr0Q8ROu/O/zV9WMsbw==
X-CSE-MsgGUID: 5o7NpgczSimkBoTzSxzrqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66174834"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="66174834"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:34:00 -0800
X-CSE-ConnectionGUID: VS6rYU+SRlyQv0z4y4Dbuw==
X-CSE-MsgGUID: E6Ab17nhRsyMioTLQW2pkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195809721"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 11:33:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSgzc-000000000m7-3h8h;
	Mon, 08 Dec 2025 19:33:56 +0000
Date: Tue, 9 Dec 2025 03:33:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/no-macro-conv 22/28] kernel/sysctl.c:1062:1:
 error: expected identifier or '('
Message-ID: <202512090311.b4EI1VT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/no-macro-conv
head:   2728b6e9ae21d434fa0398d74843da3ae11235a3
commit: 67e8f7821aa32fb3308bed04113e0106fbe45711 [22/28] sysctl: Return -ENOSYS from proc_douintvec_conv when CONFIG_PROC_SYSCTL=n
config: powerpc64-randconfig-002-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090311.b4EI1VT0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090311.b4EI1VT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090311.b4EI1VT0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sysctl.c:1062:1: error: expected identifier or '('
    1062 | {
         | ^
   1 error generated.


vim +1062 kernel/sysctl.c

  1057	
  1058	int proc_douintvec_conv(const struct ctl_table *table, int write, void *buffer,
  1059				size_t *lenp, loff_t *ppos,
  1060				int (*conv)(unsigned long *lvalp, unsigned int *valp,
  1061					    int write, const struct ctl_table *table));
> 1062	{
  1063		return -ENOSYS;
  1064	}
  1065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
