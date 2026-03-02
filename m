Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E56732FA2E;
	Mon,  2 Mar 2026 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450976; cv=none; b=L5+HrpTVl1Yiibdc5mnZdSGXQP2IeXVArouVKXOVdG2xjkdXlQ6QPGn4xyrGIu4Fa+a4NlIgTzxfjTc/i/H7IzxvI/bKPYsEmnd9JhRMTfNe/JcNnEdOqICtrj/utTT2AvFd+lTs9AI61olQ+hLIkKi7qrN9NIezHIZ74k5yleQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450976; c=relaxed/simple;
	bh=gOPJt1HbZxWKq4xWH2JT+8mUyqnlw74sRaHxmR/D9Qs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=urBA7orEHl90pQwG2Kh4EmfGGwqVB26G9l56yaQgZa9pGbORxe/QmGTtm11tC0dYbO5KtxMiWEdpS60KR0jE+vyAZum+pjRgWUEvIe1gXFDSHwKKzDQ6GTRTOY8D+dQhlLHbqJO7M0/yGcpH0MwecWHVljM9nvoew0yxjJFXXcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CK8dNRNg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CK8dNRNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772450974; x=1803986974;
  h=date:from:to:cc:subject:message-id;
  bh=gOPJt1HbZxWKq4xWH2JT+8mUyqnlw74sRaHxmR/D9Qs=;
  b=CK8dNRNgb5P2BQcQdfIv8SrYkjdyo3EYbx513iMTVG92QCDhssMw2oem
   RnMGeYQQHl697w47EYZZybgPvGh9GtYY621b5Mpa9SVHTcM2015boUjnI
   dODDnUHP/4ubMvWrBOZoWBqSpNYT5zH6Hu+oGzatqMLSFxR7kRb7/hWhw
   OAkNAjqNmVH7REgAvFHPR5wTicb44dGjAJ29iCmUTO3OEQudOgnCeaCf8
   C4VFIzb1Tja5g6L4uKB4PB5RE+WpHRzbM+gUhp6X5iP5+9ibrVk0tnbh1
   sFO1XscaIZY3nQ3TH2/YUiPM1NFJklvIADuvkJBi9LbIV2kcNzZ+rzbDP
   g==;
X-CSE-ConnectionGUID: JlqFWIskQ8OH97FVIaNKYg==
X-CSE-MsgGUID: yO6G0IL1RFKZUS4dxDvDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="76058047"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="76058047"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 03:29:33 -0800
X-CSE-ConnectionGUID: PXRZuDjgQj2qJH/sYiyytQ==
X-CSE-MsgGUID: KtXOWk0JS96Jek/UsLsGbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217651032"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2026 03:29:32 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vx1Sr-000000000nJ-1GRO;
	Mon, 02 Mar 2026 11:29:29 +0000
Date: Mon, 02 Mar 2026 19:29:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/core 7/14] ld.lld: error: undefined symbol:
 irq_proc_calc_prec
Message-ID: <202603021928.vz1Gc3vd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   81f5ad552e6edb1dcf872e7c1f4ea54298056007
commit: f4153c1b78f7bcf77d6f5c45a8fdf9fe17b09f66 [7/14] genirq: Calculate precision only when required
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260302/202603021928.vz1Gc3vd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260302/202603021928.vz1Gc3vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603021928.vz1Gc3vd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: irq_proc_calc_prec
   >>> referenced by irqdesc.c
   >>>               kernel/irq/irqdesc.o:(irq_set_nr_irqs) in archive vmlinux.a
   >>> referenced by irqdesc.c
   >>>               kernel/irq/irqdesc.o:(early_irq_init) in archive vmlinux.a
   >>> referenced by irqdesc.c
   >>>               kernel/irq/irqdesc.o:(__irq_alloc_descs) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
