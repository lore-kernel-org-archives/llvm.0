Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041D86329;
	Thu, 16 Oct 2025 02:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760582071; cv=none; b=U0tG9t25MNQL+YIJRp95QTNcxFU9zWtaTWoUSRhQjJVv1SZNny1TMXrICH4KuTGcF+IZMCJXQ9kK2wC6QGoDAF0vFWQch9Soee88I8DPXa7CaePm4A3Hh2Q0zlpR7whzpMlbV/Zkjnb3HX7Gr1sxt7tnrF29EurPUXOLZNjBjsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760582071; c=relaxed/simple;
	bh=ef0Ovu1puurK00Q5eCdbvlZLZdvCyoNqQpGwRTXPNtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eXHC0h9ybPL9+NOdJ8VTMDu/uz9cAap0gQbwiaFbnB99upeRCD7bdt4dkG1cbLEv1jzjZWBjBcEsK4KIbnDOTYRirdSAUhaMvRorqjGHAxTR5d6kXY/90YUdyRjn6afTb4EjglwwfKkNkMz9f5+sHMv1SQCPysDssLj2lZcIu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrQwqhRi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrQwqhRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760582069; x=1792118069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ef0Ovu1puurK00Q5eCdbvlZLZdvCyoNqQpGwRTXPNtE=;
  b=GrQwqhRiEpazHtZDmKsX9Pl+dws1NVomkxRKZIkdGUakFhHhIQdGZnkq
   4ZVaokhEY+CWGvBTW1PQfryakaDDlYmKcIqjCzGb+n2M5KmCfFUC0+eEP
   UzelZSUnuBnhq3YQjddmL8AUZ6SpqXZ1uRtaDRLII0xH/Y66sSVY7tUA/
   a6QseRD1uAteuTOoLiDwfK1JzvLC1JiP9I3SeYRmo7B8Ygd/bq0F4DU5Z
   2nQVX/Iuem2SqVAS8BwqthB5DQvbTLCetz/82+f4aK2C/PhGyAWRyve1r
   lUjShMKVkYJlUWcOwsrnqau7hmrFWAab9fwTVgymep5tdq8pN3Zh1vBXS
   w==;
X-CSE-ConnectionGUID: t5N2GoRjTF2mQqqYIzIJMg==
X-CSE-MsgGUID: bZ+nom98SrW77Zqv298NkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62474298"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="62474298"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 19:34:28 -0700
X-CSE-ConnectionGUID: jvW1h7qET7GiKzkWmKd1qQ==
X-CSE-MsgGUID: O0tK55AiT5i0Bv4n48UwXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="212932729"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Oct 2025 19:34:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Dno-0004OV-1U;
	Thu, 16 Oct 2025 02:33:45 +0000
Date: Thu, 16 Oct 2025 10:31:27 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:for-gvs 3/3] ld.lld: error: undefined symbol:
 nbcon_atomic_flush_pending
Message-ID: <202510161044.X1dyMbuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux for-gvs
head:   531ec318e70783dd2865c62ad274ed77b88c2dea
commit: 531ec318e70783dd2865c62ad274ed77b88c2dea [3/3] printk: HACK: Avoid scheduling irq_work on suspend
config: x86_64-buildonly-randconfig-003-20251015 (https://download.01.org/0day-ci/archive/20251016/202510161044.X1dyMbuE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161044.X1dyMbuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161044.X1dyMbuE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nbcon_atomic_flush_pending
   >>> referenced by suspend.c:458 (kernel/power/suspend.c:458)
   >>>               kernel/power/suspend.o:(suspend_devices_and_enter) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
