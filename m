Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B720720ED;
	Wed, 18 Dec 2024 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734506300; cv=none; b=m2Q/atlBo1bsJobPkHCNfzKobIPBZJc1SrIHzRe4RbyrL7X6w2etrvfGgm7MkSQB+VNWmycC/APN5kiBVG/U31d0EKPnsKFJOynjmlsd58hKHC8ANJUPd3C2deGqlJAlCSEU+SY/i3hRdsVDL8934rhG2Bb30QgoOuSFT/akfM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734506300; c=relaxed/simple;
	bh=vuXznsQZUGcqFKuDiKR4cpstSU9CdG+zxq9aNRfbcR4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QpdfssTBMyoYQeVcLJoFi6Xg1ZAb5X8s4vdNn93hYIfNNJspbJ5IbTRBWXfyfip0bZnLTmrBaxF4OeokAyXRCAvqrAics9pYGeR13TZGyw1kGnsiZ5eXcmFAUFxedU6adgEP3qKzygQL10khJ/zXqUBE+JG2s9iUgBrRP4Hn6Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2kaDPvB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2kaDPvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734506299; x=1766042299;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vuXznsQZUGcqFKuDiKR4cpstSU9CdG+zxq9aNRfbcR4=;
  b=e2kaDPvBICk+I9UMBz5Jz5jUCZ3TLbetWCPCcCfzhxHrA3d8Y2vctu+G
   S0EKP95iOBDwmEsTxkl/cfm5lGwzesN0lI8Juidq8VdzBQbPhsBvjZU88
   uC2rZie4OhBC3D36zyJShG14sTlfd5MZdqht/dNXwgDTxGxb7zR5zCNkn
   h9kPmmw9MSkYJLmXBcVlmgK3+d/Pb7qOFdBA0HQv05W8rL6Yb6PmMV2cH
   9VzPNQn/vWwCRsa0Rkyakju1J33TckM9qPQf2SAVCByw7hkh4okM0nzMY
   4CFKxNtNCRx6Q7jXmknnMktTAi/FoUxFnlRgFvwlMy0GmIjTB75eMlKag
   Q==;
X-CSE-ConnectionGUID: Rpu6caSuQ6ecchN7UlaF+w==
X-CSE-MsgGUID: JSSe9OmaSB+vShJUSGWNvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35119007"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="35119007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 23:18:18 -0800
X-CSE-ConnectionGUID: WZdrrzgJSmW31GPToLEzEQ==
X-CSE-MsgGUID: lHnBjtgvR8m/+MARHHta4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="128583258"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2024 23:18:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNoJy-000GB4-2Q;
	Wed, 18 Dec 2024 07:18:14 +0000
Date: Wed, 18 Dec 2024 15:18:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 3146/3192]
 sound/soc/sdw_utils/snd-soc-sdw-utils.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202412181540.uh9kimwi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa366f1b6e376c38966faa42da7f0f2e013fdab
commit: a346a3280fbc15df5e1496cb0d4c9187d7faae0e [3146/3192] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: x86_64-buildonly-randconfig-001-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181540.uh9kimwi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181540.uh9kimwi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412181540.uh9kimwi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sdw_utils/snd-soc-sdw-utils.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
