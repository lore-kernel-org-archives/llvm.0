Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C211A0BF3;
	Mon,  9 Dec 2024 22:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733784381; cv=none; b=oCjj4VBL9kGRVZhNvSuS/cso9eu/dzGB7blXgVunxV7CXc9hEpgsv3Mic+psV5OGLjK4qwwJPSmRFUDbd0TNswJ9rIbLoQgYRQgJ3sUcF/MPet0R3NGfF4P5YnXLs9sjewk9zDAzGVplZ51yKDbgZn3NBdW+KjlruhjGqZKP6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733784381; c=relaxed/simple;
	bh=nGyDkIQiodBnimg6j2eJHf8q/XpW+/XSdUaAiiRVCqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYLvYjEK6ETFJUjHfrrDEmbebOQRMudXbPp404ow0Jt/RD+nJMKX7AMQDKjdYWE3v09fznkDnFWYlnqpGVk5hUcW0U32kZYkysgB+Fq1t8jRp8Pdd6VuV7znomePCuc9wrgOJG6EhCsxBbx4TK+kvCKVWbXdu1qq3cbGMGTX33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QuoyK8UK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QuoyK8UK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733784379; x=1765320379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nGyDkIQiodBnimg6j2eJHf8q/XpW+/XSdUaAiiRVCqw=;
  b=QuoyK8UKRyywk2BCfjWaG8hmZ7cUTdVKPgM+0CN2fk6T1R2kbbHNDcB1
   09LbkbwBPrQZIcj7/5XKVigwtDf/zYoRKYsqSis3yjNBqQI2W1lCDpROn
   0R4XafTUaRJ5iXjG+Enc+lJ+p37KndkVhdOXQHbIlOD3rLCp3FwAniDqE
   kty9QiF18/QeaebCOTubJFckOKLeGdSPRDWmWJWrB94ly45JrcLGkt8wd
   psgMhcMM02Fq+Aq2t0dLLKvxmRKEat55yRLLqsL5EHkdeVkCCLRXXwRza
   Hf1NFCyy4puHLx65IuJ/NeqkI+xNYukRvAypzUntCsmL/HjVd/Ox+Qbj1
   w==;
X-CSE-ConnectionGUID: QevdtoxDSzq4slXD+8CT6Q==
X-CSE-MsgGUID: lUsZxpoyQBSDhXpk66UlaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33442739"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="33442739"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 14:46:18 -0800
X-CSE-ConnectionGUID: iW1zexQmRc2K9Ddp8CzmOA==
X-CSE-MsgGUID: 9rXH2vhYRbSjx7KfbcSfiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95276091"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Dec 2024 14:46:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKmW7-0004sO-0f;
	Mon, 09 Dec 2024 22:46:15 +0000
Date: Tue, 10 Dec 2024 06:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/ptp/tkntp 26/26] ld.lld: error: undefined symbol:
 timekeeping_register_ptp_clock
Message-ID: <202412100634.zKl8sHMQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/tkntp
head:   184d5014d09b27045a7e6a1e9a44122387149e59
commit: 184d5014d09b27045a7e6a1e9a44122387149e59 [26/26] timekeeping: Hack to test PTP clocks
config: i386-buildonly-randconfig-002-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100634.zKl8sHMQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100634.zKl8sHMQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100634.zKl8sHMQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: timekeeping_register_ptp_clock
   >>> referenced by timekeeping_debug.c:63 (kernel/time/timekeeping_debug.c:63)
   >>>               vmlinux.o:(tk_debug_ptp_write)
--
>> ld.lld: error: undefined symbol: timekeeping_unregister_ptp_clock
   >>> referenced by timekeeping_debug.c:65 (kernel/time/timekeeping_debug.c:65)
   >>>               vmlinux.o:(tk_debug_ptp_write)
--
>> ld.lld: error: undefined symbol: ktime_get_ptp
   >>> referenced by timekeeping_debug.c:47 (kernel/time/timekeeping_debug.c:47)
   >>>               vmlinux.o:(tk_debug_ptp_show)
   >>> referenced by timekeeping_debug.c:47 (kernel/time/timekeeping_debug.c:47)
   >>>               vmlinux.o:(tk_debug_ptp_show)
   >>> referenced by timekeeping_debug.c:47 (kernel/time/timekeeping_debug.c:47)
   >>>               vmlinux.o:(tk_debug_ptp_show)
   >>> referenced 5 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
