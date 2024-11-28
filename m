Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E83232;
	Thu, 28 Nov 2024 16:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732810728; cv=none; b=C3yspMsaM/DBQpI1VutIZWJ1VLqJD6p2XVPxw/xqNnitBpudJkoe2sHtsMnrBpk5I7ip+thgHTaMPg3IHA+fZ0mGT0nHzF8FF7ORl7agwcCY8pO6R0Bd7D6wERxt20neC9SrKMphF9q1vF3Kso7JIt+6CF8YyPMHrnxixaFOAgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732810728; c=relaxed/simple;
	bh=RrDnV3vV6J5CgcJY7vFvaCv/CB426hHEGuCAiVmSFLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h28aeIX0K3H2nvfcv/uJoIpHkG+2uvB7wkwXbBexJsXwbuD5i8XiTK+HvU1MNaspOBQ9vcSzBir4VvzKl+Xj6YitwJQ61qAnbkbTMZmsenbqkr3+h96JceBKJWA5ukvDFa4cDlmqNzjZKNr1nyKLRpBafTUxacNlJ7ZQQPpmZ9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bt5lNQZK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bt5lNQZK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732810727; x=1764346727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RrDnV3vV6J5CgcJY7vFvaCv/CB426hHEGuCAiVmSFLw=;
  b=Bt5lNQZK/oQsHeINokKCmjzS1NJCioQtInTiT6ZfUYPOmC5b5O7r3fOS
   AM8A/JLbCzYtpnxzxi1NK9egQLULSP+dO++IdZiyWCpyqFLznwPz/WeZj
   NZlwe0qP7TD56p39pqWZMAjgp+2m3jsXK+TrlL+QSZip0YbPRH/wILX/Q
   QGR5JZ4jQL8a4HizeuLcg8KHi8MqzRqQLO9Cww+OZ5vZjhBy7yOA9Rl0K
   HsTrXwPB5/k8p4XWYxRHo/Fd9CESQgJp7P1NYXOu45pZDt892tbFmaZam
   WCXclPMtT2lUMkPoz8M1iAx7+9RzSy/WdClKVK3QBjEVX28sKUnYKlQ74
   Q==;
X-CSE-ConnectionGUID: Or5XqGKvQuam+gLjnfOv3Q==
X-CSE-MsgGUID: wKvtpBvVT2ejbnsLgvH/ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36716353"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="36716353"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 08:18:46 -0800
X-CSE-ConnectionGUID: 4MacMwUhS5ie5WxGMuunAw==
X-CSE-MsgGUID: O1CVKdb5Qju91U4BNq1nzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="93118724"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 08:18:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGhE2-0009n5-2J;
	Thu, 28 Nov 2024 16:18:42 +0000
Date: Fri, 29 Nov 2024 00:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv-gic 12/12]
 arch/arm64/kvm/vgic/vgic-v3-nested.c:116:1: warning: non-void function does
 not return a value
Message-ID: <202411290026.Q8iUaHa3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-gic
head:   cd3fedf7137034ee2858afe5fabf24784d0b3919
commit: cd3fedf7137034ee2858afe5fabf24784d0b3919 [12/12] WIP
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241129/202411290026.Q8iUaHa3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290026.Q8iUaHa3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290026.Q8iUaHa3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/vgic/vgic-v3-nested.c:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/vgic/vgic-v3-nested.c:116:1: warning: non-void function does not return a value [-Wreturn-type]
     116 | }
         | ^
   arch/arm64/kvm/vgic/vgic-v3-nested.c:114:13: warning: unused function 'vgic_v3_get_mi_level' [-Wunused-function]
     114 | static bool vgic_v3_get_mi_level(int intid)
         |             ^~~~~~~~~~~~~~~~~~~~
   6 warnings generated.


vim +116 arch/arm64/kvm/vgic/vgic-v3-nested.c

   113	
   114	static bool vgic_v3_get_mi_level(int intid)
   115	{
 > 116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
