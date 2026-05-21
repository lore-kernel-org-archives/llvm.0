Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727CA36CE04;
	Thu, 21 May 2026 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357487; cv=none; b=N4m2SHDcYOimKIrLEvm0EzsuO7KXUYgTlMc84qAOsvdkmFNwG7aUawmgztBmojYoyUmwhriPDBgCxcIkKXomaolLBzANSf7Mt3sv7Xc5AdV+vJ5vURVupIcceXbCx1jFcUv5trULoacyvyoBnN6pIImlh6M05Gs0FCQT8X9yhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357487; c=relaxed/simple;
	bh=YCkFEN2sdGy8fVCrMbN1sImixAQ35ExP90zxAjONSxc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SI9667OrLfyE9SJsMlMB/CCuy5/NezNJPSbfNfCVtJOE+43g4eJ/aW4px90uvUcAXm6JqxbvlEPiwYwGeeR63DlqCItaDMUSNq5sMdUXBA6pFnQm1gq7HLCDXWbHXPwBZKI7MUliCLfTMJHSPLp6bXW9+fHYa6siTfdzCQHJYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWwl1mEZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWwl1mEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779357486; x=1810893486;
  h=date:from:to:cc:subject:message-id;
  bh=YCkFEN2sdGy8fVCrMbN1sImixAQ35ExP90zxAjONSxc=;
  b=HWwl1mEZi4GYcBwXvA1AgAyCEbq84CsVTp4IOLaJ6JgDU/V37+J6J/jw
   xt0IUyQVCgg2W3NXxafLkRpmfVRyhdG9LU/M9i0dgd9GMLmrFfXw8ImLz
   FGEWqLKMYd9q6uOooCiDLw780jugHeBHSxWQbOx2eLsPfFA/OULIh18/Y
   UlZNOn3OtrO6LHXd2WNAzXNSWjfKFOCXGUnbaXnNU2mSPLoxgcTSivMCS
   MpWsJQIQ09BgWQf2lqRqAkCxFQq2gUVaqACABFZAgA4rZ8MhA5tmdzWhJ
   i/7OfmSyJrxYeRT93P9IWjHpFSECBCU2huwxgaSZOsW1ALdXtI8BHOrWN
   A==;
X-CSE-ConnectionGUID: 88Rn8PxfS9Wt9AY1TZI4UA==
X-CSE-MsgGUID: bQnDntNLQAuT2UxJ/2DvSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97843465"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="97843465"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 02:58:06 -0700
X-CSE-ConnectionGUID: xoRvK7bSS1exBAxTDSaluQ==
X-CSE-MsgGUID: XTriRGeuQJeaSTI9rgaR5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="237461035"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 May 2026 02:58:04 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ0AE-0000000003t-1Z40;
	Thu, 21 May 2026 09:58:02 +0000
Date: Thu, 21 May 2026 17:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1100/1130]
 lib/crypto/riscv/poly1305-core.S:91:5: error: invalid operand for instruction
Message-ID: <202605211742.9Ntf9P3i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 3a93cebfaed1cf821c02f08e7be6572f55b6756a [1100/1130] cheri: lib/crypto: cherify poly1305
config: riscv-randconfig-001-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211742.9Ntf9P3i-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211742.9Ntf9P3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211742.9Ntf9P3i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/crypto/riscv/poly1305-core.S:91:5: error: invalid operand for instruction
    sd xs0,3*8(x2)
       ^
   lib/crypto/riscv/poly1305-core.S:92:5: error: invalid operand for instruction
    sd xs1,2*8(x2)
       ^
   lib/crypto/riscv/poly1305-core.S:93:5: error: invalid operand for instruction
    sd xs2,1*8(x2)
       ^
   lib/crypto/riscv/poly1305-core.S:94:5: error: invalid operand for instruction
    sd xs3,0*8(x2)
       ^
   lib/crypto/riscv/poly1305-core.S:188:5: error: invalid operand for instruction
    ld xs0,3*8(x2) # epilogue
       ^
   lib/crypto/riscv/poly1305-core.S:189:5: error: invalid operand for instruction
    ld xs1,2*8(x2)
       ^
   lib/crypto/riscv/poly1305-core.S:190:5: error: invalid operand for instruction
    ld xs2,1*8(x2)
       ^
   lib/crypto/riscv/poly1305-core.S:191:5: error: invalid operand for instruction
    ld xs3,0*8(x2)
       ^

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
