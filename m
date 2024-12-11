Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A532451EA;
	Wed, 11 Dec 2024 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877980; cv=none; b=D4Ci4flvlBuLceFHVb6A9o5mf0Au80IT/wXEKcxZTUaSkIKXO/aN64d6MexEform3pef8TYXyuA8BlG/ysAS5bHntzg2Ay6KQOak4spChMWiZrW6Mv2+niu41yh1XnGOM7/vgs3xBpqa8xzqBBCN+DQ9pJnGL/xSLZqcO67gdJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877980; c=relaxed/simple;
	bh=ZAHEMmM2mHs/t2zB0hmD5pxGaKfTwp6OjxE+wBepgZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CEeSbjpHR/BiA+M2EQ1yfRAE+atDa/ChtAX+nd5h9gv2kcJVU5wqixllKxIzeMQoKo2zF4xsFlSkXLGEh8i1h5XTskdxXG/qOTFgwf9OmvVovof/q5CPdObekjJfboGUJP5sv+r4jerTeuy6T35wb1yJYgiQVQivfX4c6khF+6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVOqzxsM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVOqzxsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733877979; x=1765413979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZAHEMmM2mHs/t2zB0hmD5pxGaKfTwp6OjxE+wBepgZs=;
  b=lVOqzxsMtjArRvERuz6vWbqdXG+zgzdCAX1FFjqvyhh1QsyrFJnivr8L
   xZHu8TwkYZG11fLANV6KhsbcG5b0PRsoSXLZJaP+mWdihVYnkdAGMcSKw
   pb+LPYE+fAmbTUSCJ5y7hfkWbXdnNabisCA1zQX938GBiw0SNO0yJsvvY
   bCn/ZdJF2mcDc5mIBOgf275SdAEOweFKLTkoQDUqA9B5SC+kannEFWYVF
   xGus0+CU2vg0xERqVViqHq4eVGGj1CFhFSay+D3FKIxHgUYlTk7drrkH+
   MdxXafL5km39cluBI6zA6kEuX4JzPxoixo5PFR90vwcTltyY0P6HinN4V
   A==;
X-CSE-ConnectionGUID: vU/VTMfYRvGHhdmucrmJ4w==
X-CSE-MsgGUID: /YXptVMATKSo61okvVzR7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34385586"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34385586"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 16:46:19 -0800
X-CSE-ConnectionGUID: JY5KdQMqRay1cJ2yonxVcw==
X-CSE-MsgGUID: QySLiO5DQIiFYZ8ap3rAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95430121"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2024 16:46:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLArm-00066d-3B;
	Wed, 11 Dec 2024 00:46:14 +0000
Date: Wed, 11 Dec 2024 08:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>
Subject: [superm1:bleeding-edge 21/21] ld.lld: error: relocation
 R_PPC_ADDR16_HA cannot be used against symbol '__got2_start'; recompile with
 -fPIC
Message-ID: <202412110820.DkiqvP3G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git bleeding-edge
head:   0123e9c4f6190227590e4497068990c0ed229c84
commit: 0123e9c4f6190227590e4497068990c0ed229c84 [21/21] cpufreq/amd-pstate: Drop boost_state variable
config: powerpc-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241211/202412110820.DkiqvP3G-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412110820.DkiqvP3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412110820.DkiqvP3G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol '__got2_start'; recompile with -fPIC
   >>> referenced by misc_32.S:62 (arch/powerpc/kernel/misc_32.S:62)
   >>>               arch/powerpc/kernel/misc_32.o:(.text+0x5A) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
