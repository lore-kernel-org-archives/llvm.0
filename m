Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C92773CB;
	Thu,  4 Sep 2025 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988141; cv=none; b=p6h5prAP/CutPcdx6I5yLZAgqfSJoDjlZdF2A9VcQuQDr+L/91dyHD2wTlq0Rq8Z1I+qTmtQXZQ1wb0niXJNvtRtBVEuiLH5m4fzVXXu/+QjWQNg+amhJSnMPEbrlGL5o41ChFe6Z0cE0jd9laBU1ClOPcpHHL7icrpu8+vCAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988141; c=relaxed/simple;
	bh=+tv22QaZtPg9Yyusx7UZ2+v7a7UbbctyBpYCRgiV+kk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WjnwdorlrzLzeO3igGR6AgKnsqlQ0vCBYzWmzdF2RmlRbc1YSQi2+auThlu1/wYAG1E3JN+vxNsdDt/b/qDXWcGwh1PYxsaSe5jv2ezlcTNHQTvhZhv2Q7gK3MWtNbsKHJ729Q9Kyp1/2kIaJOWx2FInvJDs85mowM/45+5Ervw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhC/wKem; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhC/wKem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756988139; x=1788524139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+tv22QaZtPg9Yyusx7UZ2+v7a7UbbctyBpYCRgiV+kk=;
  b=dhC/wKemdL+g2u7Fs99dcAeT7dfJlDnizSL6trYKoBybvpD3t74VLUNR
   Y8C5KZ9qS/lLsT3cLCkGLmSgZUPtE0AlGtGvlbkBLrL3EH2B4xpYPwKEs
   qqWLIJv4odN6ATUlEGMf9ZXPjll9F1XyBoGhEs84EcoT8gSU/wwhv4rxT
   9216qWkp5gwuFXJw23KxteI15oLCLOykihseu6NrFzlkEqM9AISIP9yNP
   GdedbOxYtj5D8QbYE7DkMwKCgwOMeYHIQ++zkeh1s0L67engdy5C6JiBg
   Sj48Xa0Zdk358ZU4VoGXKGU4ujC8rHzNkjEjxZgB9nfR8ORTJgJzBxzzr
   g==;
X-CSE-ConnectionGUID: +/4E8rBCQ++1lPxS8DmrEA==
X-CSE-MsgGUID: M5PZCeSiSfOMNPJPAvEtrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69588390"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="69588390"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:15:38 -0700
X-CSE-ConnectionGUID: P3EsGTsoQyyE2ydiMnC/ZQ==
X-CSE-MsgGUID: 8KHOhCLZSWqxFrXuZn2HUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="202806333"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Sep 2025 05:15:36 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu8sI-0005EL-0m;
	Thu, 04 Sep 2025 12:15:34 +0000
Date: Thu, 4 Sep 2025 20:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Lee Jones <lee@kernel.org>
Subject: [lee-mfd:for-mfd-next 32/42] ld.lld: error: undefined symbol:
 stmpe_enable
Message-ID: <202509042050.mCkkZuJS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   a4eb677652a5da4d8e7271c0c0c8719c39f10e36
commit: e160dd0ac8c35747a8ef74aa62c6346c2d76e644 [32/42] mfd: stmpe: Allow building as module
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250904/202509042050.mCkkZuJS-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509042050.mCkkZuJS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509042050.mCkkZuJS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: stmpe_enable
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: stmpe_disable
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_probe) in archive vmlinux.a
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_disable) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: stmpe_reg_read
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_dbg_show) in archive vmlinux.a
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_dbg_show) in archive vmlinux.a
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_dbg_show) in archive vmlinux.a
   >>> referenced 7 more times
--
>> ld.lld: error: undefined symbol: stmpe_block_read
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_irq) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: stmpe_reg_write
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_irq) in archive vmlinux.a
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_irq) in archive vmlinux.a
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_direction_output) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: stmpe_set_altfunc
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_request) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: stmpe_set_bits
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_direction_input) in archive vmlinux.a
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_direction_output) in archive vmlinux.a
   >>> referenced by gpio-stmpe.c
   >>>               drivers/gpio/gpio-stmpe.o:(stmpe_gpio_direction_output) in archive vmlinux.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
