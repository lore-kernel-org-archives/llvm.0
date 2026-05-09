Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BD53191BD;
	Sat,  9 May 2026 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778328843; cv=none; b=r9aOK7nQ8Srj3/BoysO/qm456lPPVX+woGFpxL5EgYTMlw4oO5AC4Iuw+io5pfQZEU73QRtrx6K5oH0baSGohdWlzNA6WWMa2kHr49ldRDDD4ZE3aNeypYtw1PFhgtYMg/FiUC+AKayNCFLYf/uR3+a1M3XMqyXSIPP3XFpcD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778328843; c=relaxed/simple;
	bh=2tN6UEJkbcem4o0nYRz4SUv0ieueob9T8aXMOvCAitc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QW/BHTZgLwuspENTBqaa6vaMKq0k5oxvQly0d4evZyo3Okdvc0yc/o7aAzAowgfLW8RAfX7X1F1RzJ0GjZBj555r57g6mGtLwqLYr/PN4mTA140rgauvCE4/WpAoGO7XClaPUqEk+/Eyp39fYrhREx8uzdF2iCtwetjDJSkZxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcJntn1R; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcJntn1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778328842; x=1809864842;
  h=date:from:to:cc:subject:message-id;
  bh=2tN6UEJkbcem4o0nYRz4SUv0ieueob9T8aXMOvCAitc=;
  b=fcJntn1R2GrZIhenunJjPLSq1ElBU83S7eCV+6duZdLva33QTXXwlvyJ
   f8vrEwLuZComlLCeLyCsRLgo9CiN6UQCtqeHzcCv/TqKy/b3gtd9JcJoU
   nZQ45kA1DvGPXIKW108QUn1hC65pleePS6MiT3GAvHOXasZdTWq7r5zWV
   RuvTaqzw5LfMqQ7UHmZ9z6CYFewHM5cAsZ8j4BrPEX60tQdTKHd8AS0s/
   GZ+qkCAS+T/gClBS8oakSly47X47kEHkGuk4SG5Hfz7JifGRbUT1wLyc5
   HLxMPcpQefyslMS/Qa5VRLldu5aIinnLG5gtaP8vDEV0S7OXDxpFbe1TZ
   w==;
X-CSE-ConnectionGUID: Q/wBoFsQRXi0DY1yiwLKmQ==
X-CSE-MsgGUID: BOb01H4MTWuWqsB9x46ICg==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="81856293"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="81856293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 05:14:01 -0700
X-CSE-ConnectionGUID: cDiDlU7+TEqLyRhiBqp2dQ==
X-CSE-MsgGUID: pmhny7MYTyWlssgQXf75NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="236036411"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 May 2026 05:14:00 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLgZB-000000000x3-2oVR;
	Sat, 09 May 2026 12:13:57 +0000
Date: Sat, 09 May 2026 20:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 28/39] WARNING: modpost:
 vmlinux: section mismatch in reference: kvm_sched_clock_init+0x2b (section:
 .text.unlikely.kvm_sched_clock_init) -> __paravirt_set_sched_clock (section:
 .init.text)
Message-ID: <202605092013.KVK0hiIo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   77ab3f9cc9d7ef1fb096d81eba39527c542f005f
commit: 4607bcbe328bd73372f72f7537da79a34fdfc777 [28/39] x86/paravirt: Mark __paravirt_set_sched_clock() as __init
config: x86_64-buildonly-randconfig-001-20260509 (https://download.01.org/0day-ci/archive/20260509/202605092013.KVK0hiIo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605092013.KVK0hiIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605092013.KVK0hiIo-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: kvm_sched_clock_init+0x2b (section: .text.unlikely.kvm_sched_clock_init) -> __paravirt_set_sched_clock (section: .init.text)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
