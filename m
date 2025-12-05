Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE680305048;
	Fri,  5 Dec 2025 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764922074; cv=none; b=iQDyyBo8+Z+RUl4iihp7V2IGz1Kfna95X2Culq7cvoH4aWZl3hJO3d8fiUXN8d8TLECcazg4PO9S1Ruf2pJ8P/okhQ60XqLHEabDggOzDM6BX8Lr1sR8uUZqZnUkKSPWw4PKFLz0DxSbr5EoOsEf4AU/Ac/0/Cq3c23i84Qh+z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764922074; c=relaxed/simple;
	bh=w7i8YV/Q7VLTEjh++9d6HBmXUidy4ymy38cw7m7QT9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sFSYdWrEwIT9C1s9FWTfv2io09P6AUjcZtzU3I8MRt2F7gnhsr6+Ipeg1utKDiPzmXq1KSSAxuRKBjt6vUTcy/gg6Ct67wa2ZN4+IeQU9uD0+PUArbTVPVqRF/m0CyLbZGMddsUmAck6rvG5U2ocDiFXsMh3vGyKCOeW/CVvbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6iuByfY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6iuByfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764922062; x=1796458062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7i8YV/Q7VLTEjh++9d6HBmXUidy4ymy38cw7m7QT9g=;
  b=E6iuByfY7DFmXlFcL+MJSMxbqT2/GCWbemhY5I0SpeqR94A5o/jY2Mtu
   MhpZrVDg2vhBlzzlz8MU7+s0FyP2S43WdFmmkuKC+DFmMkTcu9P7l32se
   19vFEWIih1Xe7Ks+xyarr626f5p2UeQGHGnkgRFa+v8B2zSiRMkfz6n82
   DLA3ove4sm9h8tVCPfLdYf3EMKazt2YDg373zlaX9vHI2JPpPyT3P3ujL
   t7zNirVytzsDnpC/JnG1VRQ4zRe8lICfxH/YY/EH2O8b4+ByRvwsMPBAP
   lq1WaoPjn7VFa68bI10tAnDEKqKmn1QuQOqAT2VVKXGbhF7DQqnGpFI+Y
   w==;
X-CSE-ConnectionGUID: 6u1nT0PtQ+usflww8k1S5Q==
X-CSE-MsgGUID: GDtkJZF1S92v1gsiBJIbqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78064468"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="78064468"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 00:07:33 -0800
X-CSE-ConnectionGUID: IHPX/qmqQ6iBteuCT/ndIw==
X-CSE-MsgGUID: 1NRSFAQ5SyOlvRUWfi9bSw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Dec 2025 00:07:33 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRQqh-00000000Em5-2zvj;
	Fri, 05 Dec 2025 08:07:31 +0000
Date: Fri, 5 Dec 2025 16:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/no-macro-conv 24/25] ld.lld: error: undefined
 symbol: proc_int_u2k_conv_uop
Message-ID: <202512051658.DpsgfQp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/no-macro-conv
head:   60075afc9fabecdb5b1015df21a05df3b2d50562
commit: 71c0b361117fe4d62c3c9ebe9a0893d137af3aea [24/25] sysctl: Remove INT converter macros and add explicit functions
config: x86_64-buildonly-randconfig-005-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051658.DpsgfQp3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051658.DpsgfQp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051658.DpsgfQp3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: proc_int_u2k_conv_uop
   >>> referenced by jiffies.c:115 (kernel/time/jiffies.c:115)
   >>>               kernel/time/jiffies.o:(do_proc_int_conv_jiffies) in archive vmlinux.a
   >>> referenced by jiffies.c:125 (kernel/time/jiffies.c:125)
   >>>               kernel/time/jiffies.o:(do_proc_int_conv_userhz_jiffies) in archive vmlinux.a
   >>> referenced by jiffies.c:145 (kernel/time/jiffies.c:145)
   >>>               kernel/time/jiffies.o:(do_proc_int_conv_ms_jiffies) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: proc_int_k2u_conv_kop
   >>> referenced by jiffies.c:120 (kernel/time/jiffies.c:120)
   >>>               kernel/time/jiffies.o:(do_proc_int_conv_jiffies) in archive vmlinux.a
   >>> referenced by jiffies.c:135 (kernel/time/jiffies.c:135)
   >>>               kernel/time/jiffies.o:(do_proc_int_conv_userhz_jiffies) in archive vmlinux.a
   >>> referenced by jiffies.c:155 (kernel/time/jiffies.c:155)
   >>>               kernel/time/jiffies.o:(do_proc_int_conv_ms_jiffies) in archive vmlinux.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
