Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACDD3E5596;
	Thu,  5 Mar 2026 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731532; cv=none; b=M+GDXJa10t0Rla17lxwuyxg5wE0VopixaUzjpqzIYWYWZ2Hq4iTPGrClb8pP8BIa6TOaJFcPnCJ+36T77mL/qp2mJ3LYgT2MJzwdi0j9iTWUucbQeQmcNLDE2Rqw8r5YAQdErO6/qfYAjVz0BdmABORS5vmdYqFg6PDUNJwiU2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731532; c=relaxed/simple;
	bh=IdQB6ORpk86hj0alsgCKTYfXZmsvfpapn+BlA5W2L6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pPOZR02fFKXrDSlh1T8arIVOlaW1ZyBHWTUxDlxjZCtoGOIiYukNb1KTuR1tFWMhmEz4BThwIbp7Cf/hbyY4glxJ4Ju9xQYi/MOXoKS8ow224RQ2G/NQJl8KSNzroqyrISnlFc9Wel0EPwG56t98ABeYyoYbFff6ntCEJq/o4EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EH1OE6jJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EH1OE6jJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772731529; x=1804267529;
  h=date:from:to:cc:subject:message-id;
  bh=IdQB6ORpk86hj0alsgCKTYfXZmsvfpapn+BlA5W2L6A=;
  b=EH1OE6jJdc1DzwGs3C+bKIoJumlAXvVsgka7twFodZZC7Q5h5MIlXeV4
   9adNU6MkOcvq09T0aF2Cukbf+S7/1M+RrMtLGmftFaaYlsF4iV+09qJnX
   Ka7rUWxmyzlz8gU6z1LkpyJq5wxRbppwR+KWbFJn2mjlrgox3Q6uEPGYu
   SnDqbTtuJVz2aoJjXN3HAl2wdo8Ov1lvu1TU5fdSdVsrpEnZ6eEOlHUoH
   azA0rzyQq6KAFDMfObVuRP0UpDxl5P2sdQJyQBlEEbBwArYE0lwFkXbmR
   tq6odhhgRYhtYWRCAT79mKVzfWuJh39OtxNuhJcbqvCrt5i0ZuwRPCGmD
   w==;
X-CSE-ConnectionGUID: 7FMPwb+yTxeuWmDrmUCc6w==
X-CSE-MsgGUID: OFB5bkGpTBChY24LIihDNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="74018886"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="74018886"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 09:25:29 -0800
X-CSE-ConnectionGUID: OZCl95BaQLu/8ypL0OD5sA==
X-CSE-MsgGUID: 4++zvhWOTBCWO8SHNSbSjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223704609"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Mar 2026 09:25:27 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyCRw-000000000zS-2gaj;
	Thu, 05 Mar 2026 17:25:24 +0000
Date: Fri, 06 Mar 2026 01:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 413/467] Warning:
 drivers/firmware/xilinx/zynqmp-debug.c:376 function parameter 'iocb' not
 described in 'zynqmp_pm_debugfs_api_read'
Message-ID: <202603060144.zJBEfZ5X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 8fc4fd3d61ab810f38b713290391de41c39209f2 [413/467] firmware: xilinx: convert to read/write iterators
config: arm64-randconfig-003-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060144.zJBEfZ5X-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060144.zJBEfZ5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060144.zJBEfZ5X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/firmware/xilinx/zynqmp-debug.c:376 function parameter 'iocb' not described in 'zynqmp_pm_debugfs_api_read'
>> Warning: drivers/firmware/xilinx/zynqmp-debug.c:376 function parameter 'to' not described in 'zynqmp_pm_debugfs_api_read'
>> Warning: drivers/firmware/xilinx/zynqmp-debug.c:376 function parameter 'iocb' not described in 'zynqmp_pm_debugfs_api_read'
>> Warning: drivers/firmware/xilinx/zynqmp-debug.c:376 function parameter 'to' not described in 'zynqmp_pm_debugfs_api_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
