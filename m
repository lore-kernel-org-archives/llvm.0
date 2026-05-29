Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2B2264B0;
	Fri, 29 May 2026 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060599; cv=none; b=DanI6OxQF2ah0hsKwKjRhXpwEDA5JOgwvyvzeSjabT36/83dDU2R07wsb7jt7O+CIcT1Moh4QatbhpFt9IL4AB65RjIun0bRzgn/q4jbDy6qaX3C1Ssb24++QL8UiRPzHayxs/fc39VP3Pb9RQWMf+FYzdN14AtKx9s0N0HSmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060599; c=relaxed/simple;
	bh=GVG8z869WhjqDUMvod4lgkNnSd/yrEnyfkQDMq8Q8rU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g0LQHaX6RcCqIZCSttn9nj6WszqQky5G7qrAWZjon9WbpyQuq/ydw5taQUZn7tU3hXodi033P98LnFqaPzmt2G2NH/rLPn/V7iiNN19wEHZIeBUoUd4z1gAn72DEpogIW2G44ShRnpf5e5I9dCMxfvxP3FIBtioTYK01L+fG0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7YXGDch; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7YXGDch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780060598; x=1811596598;
  h=date:from:to:cc:subject:message-id;
  bh=GVG8z869WhjqDUMvod4lgkNnSd/yrEnyfkQDMq8Q8rU=;
  b=E7YXGDchR7Ls3cxa9mgFgzL2x5F6OP+w/VPuVOtnhxGXCPLRn6vKJS0x
   5Omt+noofb4aD6hc6mUl75Vz/eTpVFLv84CkQY0L6gx7lAVKNF0Rxy07l
   0C+Em7nZd0Ut+5D7Um7EkwnLnUk3eRQcLJVo7XYfn939YlJWuAFLK+WC/
   o76X1t7actGZs+wdpNsW3u3QDLcl7Pp1acPcERwd5Zzm+/XvSEEslecfs
   xnQyk7EzCFX36Fc6kKAgS8HV/BJdyCbclhMHkWxkPDpVwRpiZyS/ZhZJC
   6bDZKAL0IVpTTmDrtRYKsB0kadBrOf4LPtMWhG07cb0/U/PRngmilkh03
   g==;
X-CSE-ConnectionGUID: Q7sdHO6CRCq6/1K+IS6qvw==
X-CSE-MsgGUID: re4d3i3FSEOusirpFQpKQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="106361856"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="106361856"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 06:16:38 -0700
X-CSE-ConnectionGUID: DGlfKNaDRqKN4RxHlg8sag==
X-CSE-MsgGUID: MOH0pceEQUKSxT/LajMM3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="238659130"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 May 2026 06:16:36 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSx4k-000000000th-2Bq3;
	Fri, 29 May 2026 13:16:34 +0000
Date: Fri, 29 May 2026 15:16:27 +0200
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/ata/libata-core.c:5162 function parameter
 'ap' not described in 'ata_qc_issue'
Message-ID: <202605291541.2ZebwExt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/ata-libata-Fix-ata_exec_internal/20260522-024512
head:   ca9420d376532f757f27a9e97c6ec88d83982c88
commit: 7c6f79518b0b292f08de7e589f2cb4221cc0454c ata: libata: Pass the ATA port argument directly to ata_qc_issue()
date:   8 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260529/202605291541.2ZebwExt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291541.2ZebwExt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291541.2ZebwExt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/ata/libata-core.c:5027 function parameter 'ap' not described in 'ata_qc_complete'
>> Warning: drivers/ata/libata-core.c:5162 function parameter 'ap' not described in 'ata_qc_issue'
   Warning: drivers/ata/libata-core.c:5027 function parameter 'ap' not described in 'ata_qc_complete'
>> Warning: drivers/ata/libata-core.c:5162 function parameter 'ap' not described in 'ata_qc_issue'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
