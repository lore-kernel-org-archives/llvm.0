Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A247A6A;
	Tue,  6 Aug 2024 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722967180; cv=none; b=aVtja1S3mY/urxds6IkUOiyuK4u/6iiOc3MArSKIzag2XWiIlsAARgOJ0UDKGpQpex9fYI4nw9ZB9Cjbmh0rjB31HmAfXG3gKv3FpBoDcupnldJItpK0wlKFLNpM3oKqzKUq28CQbAHbFhXPeqxl4KwNjzK1Yndoch4WRGPT2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722967180; c=relaxed/simple;
	bh=cvqnoXLfxr1UC05xp7c/v2HyVhtnQYYuDXB7MZLSZIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RTtWhqaBHkXVbZ+VtiMpCVwnTRi1VoryBExMMZLWQCQBxTGRz1Zeeh2Ks/5gRRsA90UGCYvW6PFe3P6OKjmwnEKOs7v+Jf7qH0eejN/pZt3wsS6qmK2OrTn8LbRvbwdKeX4Pl868MSVhoxxYfiCHBfwARpth5AagMWkVRgYGv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0bhSEGW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0bhSEGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722967178; x=1754503178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cvqnoXLfxr1UC05xp7c/v2HyVhtnQYYuDXB7MZLSZIo=;
  b=G0bhSEGWHgHb9buqw1nVSqDCyWU89eZggR68FGmHr/dCDCBqeYe+wM/T
   ULb0ScUW9eg1+Hd12YiXTqrJLrh9d00kn/lDvTh73jVdwOwzJxTXwBoVH
   5Qlu7D4a5qZrIbR/fMD2K53K51rTCNmasNXAHBxDEm0J+1etqru5j3CY6
   5qFn/8txZG/EVdIHicEieWDcTxTBezCMNzltoEWm75h2Zx6SZaVhmik63
   kyA0HYzV//MT4Uwcw0nW3UC+SLjtcowe531XaoUAged9ni1YULhhg8m2s
   Vb6B0o+saEUgzLpjyIMl105vihjGrkKPaghmXfWxAff1fyDYUzKo57bqi
   A==;
X-CSE-ConnectionGUID: 7NcpT6ZtQkmZIvZZu1CR8g==
X-CSE-MsgGUID: zbP8dttNSMqu8fTVl+l6ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="23916237"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="23916237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 10:59:37 -0700
X-CSE-ConnectionGUID: unE5sVzOQYGk+8Tlp2B4jA==
X-CSE-MsgGUID: 3HMzepVsQHy+zKCX5qf9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="57149395"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2024 10:59:36 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbOT7-0004jL-23;
	Tue, 06 Aug 2024 17:59:33 +0000
Date: Wed, 7 Aug 2024 01:58:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:cpufreq-compile-test 6/6] ld.lld: error: undefined symbol:
 pl320_ipc_transmit
Message-ID: <202408070110.OXolpmAL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git cpufreq-compile-test
head:   51646201e21cdf40aad3925f7742a8d2ac727f43
commit: 51646201e21cdf40aad3925f7742a8d2ac727f43 [6/6] cpufreq: Drop CONFIG_ARM and CONFIG_ARM64 dependency on Arm drivers
config: i386-buildonly-randconfig-005-20240806 (https://download.01.org/0day-ci/archive/20240807/202408070110.OXolpmAL-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070110.OXolpmAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070110.OXolpmAL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pl320_ipc_transmit
   >>> referenced by highbank-cpufreq.c:30 (drivers/cpufreq/highbank-cpufreq.c:30)
   >>>               drivers/cpufreq/highbank-cpufreq.o:(hb_cpufreq_clk_notify) in archive vmlinux.a
   >>> referenced by highbank-cpufreq.c:30 (drivers/cpufreq/highbank-cpufreq.c:30)
   >>>               drivers/cpufreq/highbank-cpufreq.o:(hb_cpufreq_clk_notify) in archive vmlinux.a
   >>> referenced by highbank-cpufreq.c:30 (drivers/cpufreq/highbank-cpufreq.c:30)
   >>>               drivers/cpufreq/highbank-cpufreq.o:(hb_cpufreq_clk_notify) in archive vmlinux.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
