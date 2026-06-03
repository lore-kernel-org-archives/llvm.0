Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8DF349CC0;
	Wed,  3 Jun 2026 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481804; cv=none; b=KIw1bMRKZOJKvN1fqofRM+d6PIuFDTfkVaB0R0CVxpsu9TWCoAd9Ra8a48/H4hHVU4pmGpMhfQ6QOpabidJej+JyUzDCRbF4y9oOXUmxze+DAK7oACk/zlIKfKi144QPDzqXaY16XsxWsJbw3gZj66BGVRakOy35VFxcbptALZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481804; c=relaxed/simple;
	bh=kEDaWNO/UHvSqcFrEWkAoVLJZcVYnkaHukaQ0/eA74g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cR6+UFkdUrys4k2SY6UT0O6+zOXCwqDQX/xUKrc6rRNH7YMrECZVe2NiZvre2tKE6hxwTtkbuW1KvC3sTNkMFTRIfEKD0+Kq52iVvOJ+YU+dSAQtGO3UJvnK5RK91aeQyMmCR0sLUBL4pE7MM9CaLHssbRil2uej0SuQNH+xivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KShMeZzh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KShMeZzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780481802; x=1812017802;
  h=date:from:to:cc:subject:message-id;
  bh=kEDaWNO/UHvSqcFrEWkAoVLJZcVYnkaHukaQ0/eA74g=;
  b=KShMeZzhY53NNj1TRyz6Dnenh7agCKVSlSF8LQVSUHNoNiKvBo7yn9fK
   ofYQHcOuTkm0lxUbeUPsnH7g27B/lwVzmNeZKnzGbAp+dfioluJzPO/Tb
   Xe+X2SdRXbgVJ3q+ASXQdTBWfifY0R8RBCR2z/aqybrZY2lZ7pCNdXZuS
   Y03/FBmI1r+DKhGCPdYSczO2OwPgyIZQ077JNXOkV0iRkhl+v4OW99GC7
   NAXwFtccDH3UqlUJlY2DBoVnD4YMU6jcxkeagImfh0m6mXsuZrVJWAjVP
   iHS5ihEvQV9bWJy8xG1VtYGtaCb7YiYCUp3nsMdtigVAkY8phKgrGFY/Z
   Q==;
X-CSE-ConnectionGUID: ZdLf99FIQ0e/dQ2CVKu35Q==
X-CSE-MsgGUID: AdepK9mVSGOIOHrxVw2fEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91857378"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="91857378"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 03:16:41 -0700
X-CSE-ConnectionGUID: K3tptMd8Qy+yNfDxFysxEQ==
X-CSE-MsgGUID: uL/+zqP6SPii2EeVzAWfow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="243333205"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2026 03:16:39 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUieK-00000000DHY-1WHk;
	Wed, 03 Jun 2026 10:16:36 +0000
Date: Wed, 03 Jun 2026 18:16:24 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "T.J. Mercier" <tjmercier@google.com>
Subject: [linux-next:master 6133/10263] ERROR: modpost:
 "set_memory_decrypted" [drivers/dma-buf/heaps/system_heap.ko] undefined!
Message-ID: <202606031851.Pjdaxrvw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Maxime,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08484c504b55a98bd100527fbe10a3caf55ff3ff
commit: fd55edff8a0abe1b198af9a4280bfb208b9d2ab7 [6133/10263] dma-buf: heaps: system: Turn the heap into a module
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606031851.Pjdaxrvw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031851.Pjdaxrvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031851.Pjdaxrvw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "set_memory_decrypted" [drivers/dma-buf/heaps/system_heap.ko] undefined!
>> ERROR: modpost: "set_memory_encrypted" [drivers/dma-buf/heaps/system_heap.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
