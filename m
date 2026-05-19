Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A10348C59;
	Tue, 19 May 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198012; cv=none; b=J9CJfwTpLGW9/W/uNRXIVizB1+k9VdnbCPpdELDmRqfnW0g8xMuzBjJSNfhtx5NeLq1LhJW0tf1XKkhVGGdIiIrBxW2CD50MWie6G3eZ/Fzf00eNJEy6ZwUBfEM0xKekk7iMItb/SE7pnxme64znDo+yHBremXDEVTQq0rTW4Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198012; c=relaxed/simple;
	bh=Pre3XIVwYqyhFl5IoKVwrBvw+uSYDs/U3dSMAKX6z4Y=;
	h=Date:From:Cc:Subject:Message-ID; b=LXXiTnigp34Mrg7shwi09UZO8SxeItTYJHQ2ISVH2MUnU9r2I5h1LRin/1O7O1mjEh5BudbzsHDA52CedPBYl9uzFt37fDgDD9c7ovVJ5ZLCNwYwgFiWKW9NoBpE3reWhnZe5klffVGSPUyE0uzP96Qk8pIxy1bZYenAZjDsegU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcUHNFC2; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcUHNFC2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779198010; x=1810734010;
  h=date:from:cc:subject:message-id;
  bh=Pre3XIVwYqyhFl5IoKVwrBvw+uSYDs/U3dSMAKX6z4Y=;
  b=TcUHNFC2TpxikMGuBfYENfmxj76tGyS8dM++ZZAxExytj5tFTMv5CmJm
   unvZkrs1V9LCA8UrFlHhRoc9EQtDeU/WMiicbfqtOkLgkOaRRmwvtbRvt
   l88QLhim6URRqKS2YmCZQRe5ANPY56U65ZsR5UWU31Aw8aUsTJTBSJXRx
   eFICXouukcMMkqoyRvzSyWLtQtHpAWmlXMQ8hGKhvbvzQFabHPaUVzCck
   h2quCIQ3hW0YNR6wUibHrVHCwxHelI/0kZrsk1M8aT9HRWAyLe7FkLNqh
   +/uP3fmDWzF2FFVxFVih3dZgcJvS8i6HmbqwjpF4d60VniMvonFN624cu
   w==;
X-CSE-ConnectionGUID: bv+peJinTOWg1j0ZLCW4eg==
X-CSE-MsgGUID: dcPRvQGiR8ubBiF6aZQdZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80246369"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80246369"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:40:10 -0700
X-CSE-ConnectionGUID: SaNzczvQQRGvJiWPZxo5jA==
X-CSE-MsgGUID: 1jdHl5u8Q0O+8xvMftPLJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238782070"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 May 2026 06:40:09 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPKg2-0000000017h-0j7G;
	Tue, 19 May 2026 13:40:06 +0000
Date: Tue, 19 May 2026 21:39:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [android-common:android-mainline-desktop 224/224] Unable to
 generate bindings: clang diagnosed error: include/linux/iommu.h:1627:17:
 error: incomplete definition of type 'struct iommu_mm_data'
Message-ID: <202605192142.T2uMppqh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   cdd6fbc4d780cb61492a768f9641a353ea08dbfb
commit: fcc7b0befffb37d99c0e287f456bd4c21e4ec9e9 [224/224] Merge 61e629596fab ("Merge tag 'for-7.0/dm-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm") into android-mainline
config: x86_64-randconfig-015-20260519 (https://download.01.org/0day-ci/archive/20260519/202605192142.T2uMppqh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192142.T2uMppqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605192142.T2uMppqh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   include/linux/iommu.h:1627:17: error: incomplete definition of type 'struct iommu_mm_data'
   include/linux/mm_types.h:1074:8: note: forward declaration of 'struct iommu_mm_data'
   include/linux/mman.h:135:21: warning: division by zero is undefined [-Wdivision-by-zero]
>> clang diag: include/linux/mman.h:135:21: warning: division by zero is undefined [-Wdivision-by-zero]
>> Unable to generate bindings: clang diagnosed error: include/linux/iommu.h:1627:17: error: incomplete definition of type 'struct iommu_mm_data'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y] && (ARM64 || X86 [=y])
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
