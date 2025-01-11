Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193E91531E1;
	Sat, 11 Jan 2025 05:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736572596; cv=none; b=ajUiMgC6RjsHR6oGncdpTRsvavL3LL9czriYYNSVbWMFSivZxDjT2AcQ3mBUu+KPCHeNRZPjZzeMbxuQL+DuORsMJ2zyDnD4/QtjUA4OQY6KC1G2khKSUwWh45vKQRIl5zKRds+hHwzXcxc5oEF8tOYvVp6poSyrqh+X+u1k9aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736572596; c=relaxed/simple;
	bh=O4vP44VJYEVRk0ed4vPFZ504Vv04vfMNtlw4UsHv6B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+aXc6TqzldYjqGq+pU+x5PISMZgBjouNTf4yV2ZO1LeoVCchmI+m9g5SIJNMbTNLkEVoSF24p2Wmogc6uiOO9YpQvu65Cqo2sjzRvPsIgyCTGXHRH0U1el+vbSQYlHMixl3RjkdBVWqZhdNuzoQs1dQlshs3d3ZLqH3VO0IS9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qb8fkzwH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qb8fkzwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736572595; x=1768108595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4vP44VJYEVRk0ed4vPFZ504Vv04vfMNtlw4UsHv6B4=;
  b=Qb8fkzwHK06snld4X5S9w0YoaZNM8E9rwHEeV5TVrF39UvJ4klZrSNiW
   TqMWaPfc0famEud2Ic9VtQ8wvEn0iPpAw8GkZgSdmgSqzAegT8qy46oAm
   HTe6+pPccFNzxiFi5aGo+mhMbTTr1FG9jaoDrd5OK+G7Ib2IG75AwVNVt
   Kbb4SeKFVu9rNpXpl4LQf6bh2Rvq+Llw5gKa9TmvSWNXcJ4xDQgpw6wMC
   SHMOk51N5vFxOeOyNuTn3KKwV0Uv6Qry4+f0m9meg6l8sg9Ypch+wXDDq
   THI4BdwU0tvV+DnXOSaEweg2zg2qSRCWQ/5G4O99Or5u/GoIZ8E1eDwkL
   A==;
X-CSE-ConnectionGUID: Nbv3ZjRSSCKPrFjq7XfUVA==
X-CSE-MsgGUID: 7Y2qZ1ONRCWdRivv+/+jGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47866585"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="47866585"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 21:16:32 -0800
X-CSE-ConnectionGUID: 0wfoG3bkTTmws/PWdvTMXA==
X-CSE-MsgGUID: sHskwdsbR2yUcJqk2dCR7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="103863755"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 21:16:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWTrH-000KDz-1C;
	Sat, 11 Jan 2025 05:16:27 +0000
Date: Sat, 11 Jan 2025 13:16:07 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>,
	Friedrich Vock <friedrich.vock@gmx.de>
Subject: [mripard:cgroup-dmem-drm 1/4] ld.lld: error: undefined symbol:
 page_counter_calculate_protection
Message-ID: <202501111330.3VuUx8vf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git cgroup-dmem-drm
head:   dfe6aa163c3b3780add4392d93b686b399ceb591
commit: b168ed458ddecc176f3b9a1f4bcd83d7a4541c14 [1/4] kernel/cgroup: Add "dmem" memory accounting cgroup
config: x86_64-randconfig-002-20250110 (https://download.01.org/0day-ci/archive/20250111/202501111330.3VuUx8vf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111330.3VuUx8vf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111330.3VuUx8vf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: page_counter_calculate_protection
   >>> referenced by dmem.c:275 (kernel/cgroup/dmem.c:275)
   >>>               vmlinux.o:(dmem_cgroup_state_evict_valuable)
--
>> ld.lld: error: undefined symbol: page_counter_uncharge
   >>> referenced by dmem.c:607 (kernel/cgroup/dmem.c:607)
   >>>               vmlinux.o:(dmem_cgroup_uncharge)
--
>> ld.lld: error: undefined symbol: page_counter_try_charge
   >>> referenced by dmem.c:657 (kernel/cgroup/dmem.c:657)
   >>>               vmlinux.o:(dmem_cgroup_try_charge)
--
>> ld.lld: error: undefined symbol: page_counter_set_min
   >>> referenced by dmem.c:115 (kernel/cgroup/dmem.c:115)
   >>>               vmlinux.o:(reset_all_resource_limits)
   >>> referenced by dmem.c:115 (kernel/cgroup/dmem.c:115)
   >>>               vmlinux.o:(set_resource_min)
--
>> ld.lld: error: undefined symbol: page_counter_set_low
   >>> referenced by dmem.c:121 (kernel/cgroup/dmem.c:121)
   >>>               vmlinux.o:(reset_all_resource_limits)
   >>> referenced by dmem.c:121 (kernel/cgroup/dmem.c:121)
   >>>               vmlinux.o:(set_resource_low)
--
>> ld.lld: error: undefined symbol: page_counter_set_max
   >>> referenced by dmem.c:127 (kernel/cgroup/dmem.c:127)
   >>>               vmlinux.o:(reset_all_resource_limits)
   >>> referenced by dmem.c:127 (kernel/cgroup/dmem.c:127)
   >>>               vmlinux.o:(set_resource_max)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
