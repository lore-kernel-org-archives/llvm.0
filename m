Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19493D8103;
	Wed, 20 May 2026 23:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321137; cv=none; b=DR11m5m769WLCfF7wbv0E06/897RyGx8fvcO5W17infSJvmCPaqG7Wl2TBdT8Ng4TEIRnFNf5HRFwkAjbLAJZSdP5C1JNpGcchge09MOu3/e8L7b8rc2KhWpDJklpsVwYOPXTIMqDkE2a+gkE1vFhQGkeU4scT6OLDvab9Tmgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321137; c=relaxed/simple;
	bh=HSnpAW/7khYFj33ICaBTM/G4TFstQLTgHnevTFRO2iI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i5FXLhNwSsB+PPyek1lG6TR05Z1r4SGVQwIYkhj8rk0OcP8oL1+S7v27Is2Y5YcnWJE1rC10v6fzRq8ZPFYNFPcvROD1Eua1b2CqkVm5l86fL9ZTJD8NO8Vxv6OA1a3z8y25rJKS3BTy+AGtJV3YS8v02kD9dv6ACbskrZwl/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOqOd+28; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOqOd+28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779321134; x=1810857134;
  h=date:from:to:cc:subject:message-id;
  bh=HSnpAW/7khYFj33ICaBTM/G4TFstQLTgHnevTFRO2iI=;
  b=cOqOd+2887+AXSg1/SoYC4reOxFEZ0G0C5GISDJRqIWW3vs/99kXZE9N
   1qkyyDtLCxJ8oAMHjNvDex8xTmiaOOS3MmckSbgX5MzEmhNb7/MKBYVlH
   Q0fcciTGz3gk2SH7Tu5S94Z8UBXVNTJZaPfE80RL7H8ZdCuQeUSu7gkil
   GQDBsSIq44/JRxs2cN8xKJVtEKYhLzJOrY8CqhBngW9w7uOMH6WArWEuZ
   MHEgqng2TjenoV4kUlV4smMzS6ioMLodvMQk7j/xdFklEa7FSg5GsQQxP
   14aqJvfYhcNhktHW6MPqBE19JxnCZ02M4CESyseScPEjVndQCD/hmT3IO
   Q==;
X-CSE-ConnectionGUID: FEN74iYrRRipBi3lATVgRg==
X-CSE-MsgGUID: sMVK3vk7RWymV1CqQuDpwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79260348"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79260348"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:52:12 -0700
X-CSE-ConnectionGUID: U873+GBKTRGDLNH003ctoA==
X-CSE-MsgGUID: q2k89F8qQ8uD5m6CumNXgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="263866945"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 16:52:08 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPqh1-0000000041H-2XO1;
	Wed, 20 May 2026 23:51:24 +0000
Date: Thu, 21 May 2026 07:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jork Loeser <jloeser@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Wei Liu <wei.liu@kernel.org>,
 "Anirudh Rayabharam (Microsoft)" <anirudh@anirudhrb.com>,
 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Subject: [linux-next:master 1545/6922] ld.lld: error: undefined
 symbol: hv_vmbus_exists
Message-ID: <202605210748.9SnkKaKK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   687da68900cd1a46549f7d9430c7d40346cb86a0
commit: f1a9e67c11388965802a61922c313bfc43272afe [1545/6922] mshv: limit SynIC management to MSHV-owned resources
config: x86_64-randconfig-072-20260520 (https://download.01.org/0day-ci/archive/20260521/202605210748.9SnkKaKK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210748.9SnkKaKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210748.9SnkKaKK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: hv_vmbus_exists
   >>> referenced by mshv_synic.c:470 (drivers/hv/mshv_synic.c:470)
   >>>               vmlinux.o:(mshv_synic_cpu_init)
   >>> referenced by mshv_synic.c:591 (drivers/hv/mshv_synic.c:591)
   >>>               vmlinux.o:(mshv_synic_cpu_exit)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
