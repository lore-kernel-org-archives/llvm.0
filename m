Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D69418C31;
	Fri, 31 Jan 2025 05:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738302083; cv=none; b=Nm6kDlnW7mFoGWKIXQ/PdxuTg4btxwfTUwXSbB0nsjaW0wR1CLGydh7FfchkHI4UGYBWpZfwsBpivBp4igNtgF+X81BjrqgA05kpo7VMAhNqDzHct87W9tMinrHPRau9MjXYNv28KlhP9Li+kMZ5+nSCPYUQheCT7CBzTpWU1BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738302083; c=relaxed/simple;
	bh=pkknZO5pcaD4z6AViT3LsXU1gjlPCqeB7kG4vXmhMuU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfHaV6Zcn1s/QW6t9p9QdDdmIEBdX2zharwyZbYTCffpEt5ZYUYNcnwB+PORNswe9vdvuwlKT5/gcdFVyJ8L7bCWu47rwc1bJy90gc+srm/SjWrvB7KpzJlN/8SD6wLndI3QKsdBPF/0gd70JgRWwlHXeG8duo/8ADZfBMkNZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuaYZFa5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuaYZFa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738302081; x=1769838081;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pkknZO5pcaD4z6AViT3LsXU1gjlPCqeB7kG4vXmhMuU=;
  b=FuaYZFa5oR9c0KnCvKiIPrIlPQDdOPhV+dlBRB5rfYNAL8J3VaQox/T9
   WI3Tv5cq6rS4JxS8kMGkfu8XLaJ+kL7Wdt94msfq/XJWYbODPoYHl8Szo
   FHGwxP0P5ENQpLEyu6PLBNH7Kb0bZTRWBAHaDmp8JJyEjzid9Nmfb7PCp
   OOg/rSXTUKb6omAhgRgfC39eLQXLtmVSg/Qij4em8OWLBhuQf4GCGIG7H
   iK59NOrvlDYrD/IwIMKVQXp069darkIne1JT+Bp45fy+D6lUxkk4ULRUW
   ftUCmJxhvPoZrJFFckckR3bmbO7yNNF7wXLC/4+8AoMdXa9E8M6wR99Cr
   A==;
X-CSE-ConnectionGUID: WZDBhbxGRLSd3Yo20uacXg==
X-CSE-MsgGUID: QqB1do1MTySX6WOtlNasFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49528854"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; 
   d="scan'208";a="49528854"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 21:41:21 -0800
X-CSE-ConnectionGUID: 2amJJEb/TKC/ivk4DepU7g==
X-CSE-MsgGUID: 7fh5mGONSWm31ekBs2ffpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113565400"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2025 21:41:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdjmH-000m2Q-2H;
	Fri, 31 Jan 2025 05:41:17 +0000
Date: Fri, 31 Jan 2025 13:40:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/platform/surface/surface_hotplug.c:79:39: warning:
 arithmetic between different enumeration types ('enum shps_dsm_fn' and 'enum
 shps_irq_type')
Message-ID: <202501311309.bcshLrq3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Maximilian Luz <luzmaximilian@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69e858e0b8b2ea07759e995aa383e8780d9d140c
commit: bd69bcce4aa089435e2891222236b1cb20395bec platform/surface: Add Surface Hot-Plug driver
date:   4 years ago
config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-ci/archive/20250131/202501311309.bcshLrq3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311309.bcshLrq3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311309.bcshLrq3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/surface/surface_hotplug.c:79:39: warning: arithmetic between different enumeration types ('enum shps_dsm_fn' and 'enum shps_irq_type') [-Wenum-enum-conversion]
      79 |         return SHPS_DSM_FN_IRQ_BASE_PRESENCE + type;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~
   1 warning generated.


vim +79 drivers/platform/surface/surface_hotplug.c

    76	
    77	static enum shps_dsm_fn shps_dsm_fn_for_irq(enum shps_irq_type type)
    78	{
  > 79		return SHPS_DSM_FN_IRQ_BASE_PRESENCE + type;
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
