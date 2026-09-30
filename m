Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE08C2D1F77;
	Wed, 30 Sep 2026 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763822; cv=none; b=ABdMjx8/ZgcB4x1vVV9eJxW8HsFBrjpsNPdOmI3Grwmiy4q5db2Zl6OO/K1Pzte6NgS/QEuKB1Az+jpCWerz7mhlyOtgv+Ew/BpfQ26vuiwoMlgtCjCq+dVm69OuKB67Idr7+437GbxyV9Q8VYF+zdUhVxgSzBDbEokRgTUHOcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763822; c=relaxed/simple;
	bh=ZVeAmWbEH938LqNMzvNvgLRoNVwYbNEiTpRXzJoR1SE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZAc7dSnGy+p+uENuLXnRdEn8Cn6uHe3mgr9FduM8KURCw98IWHaJEnUApUO4QqvBJbsiZB04m3Ziaq57zw7hlsip+HwyGcHAFl/qaaBE58ah6JhV9w/zGRq51oixp8YdRo498jPHFEWIk1kKwvgxDSbfFpbzUyR8K+8eFNdX42A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2jrEkm+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2jrEkm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790763820; x=1822299820;
  h=date:from:to:cc:subject:message-id;
  bh=ZVeAmWbEH938LqNMzvNvgLRoNVwYbNEiTpRXzJoR1SE=;
  b=k2jrEkm+jO0eX4FPC2JkMxIe0crrEmNXgg1VEExYisbK44VZGQa7sgew
   nd9sHVrq9a6lT2TzFTHvqJasDxcCTKXFZuyl+Pz5IG7HV6J6MUiwp895d
   nvMteMa3GAFi4Xnjty01qrRUb22oWCydojRQVlY2VUWsBrmjYpEcDHFwq
   fNeOY6oxs/iqnq4ihxAr68qfCjHuvlE7VhmTszmiUBcLMMvNUzPR5kMPd
   vGGXI4M0BEl/VmpCn9/pFhR/UNwLSdSraIyeIILjfnCMJ46AASIERwt5V
   6ijzrzS8EA2M+4uqE62gczfStFnSZfpJ+6N8neQxe+Qoaraam/Yztkq5w
   g==;
X-CSE-ConnectionGUID: GPQd4DIuST2WMaR/kzkSiw==
X-CSE-MsgGUID: TfYc4LXBR6K/6Q/vEo98Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93983958"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="93983958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 03:23:38 -0700
X-CSE-ConnectionGUID: 50/EaQRjTJ+Uwu6bt7URNQ==
X-CSE-MsgGUID: bkoBo/3WSyCk9s82HvB3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="313586386"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2026 03:23:38 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBrTL-000000001p9-09t7;
	Wed, 30 Sep 2026 10:23:35 +0000
Date: Wed, 30 Sep 2026 12:23:26 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/scsi/ipr.c:5016 function parameter 'host'
 not described in 'ipr_device_reset'
Message-ID: <202609301243.BBNZR0RS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/PCI-Convert-to_pci_dev-into-an-inline-function/20260925-112539
head:   fdfe48ef6987903539e62ab539dc21f4108e43e8
commit: 669d147a81f263a639a829da93b7dd8793679904 scsi: ipr: Pass the host pointer directly to several functions
date:   5 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260930/202609301243.BBNZR0RS-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301243.BBNZR0RS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301243.BBNZR0RS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/ipr.c:5016 function parameter 'host' not described in 'ipr_device_reset'
>> Warning: drivers/scsi/ipr.c:5056 function parameter 'host' not described in '__ipr_eh_dev_reset'
>> Warning: drivers/scsi/ipr.c:5016 function parameter 'host' not described in 'ipr_device_reset'
>> Warning: drivers/scsi/ipr.c:5056 function parameter 'host' not described in '__ipr_eh_dev_reset'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
