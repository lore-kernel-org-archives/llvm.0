Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448D18BC3B;
	Mon, 14 Apr 2025 19:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658029; cv=none; b=pgf/GoqhK8RwsdGxyyI5s365SIkf9OKm2+xw90whFuJ6VW89hLWHTsbzFUv+SHtPGGrwJgcwn6YFLzGBWUkfs/0eo/JytnsFuLjtXFFPQ0ujJEAad7/4ZCxMFkrqTcXOXtgV+GqlayLVJ8wKU7dLLca7Kmsa5B42ERVhqnM1V2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658029; c=relaxed/simple;
	bh=0P3s/Po4QM1GtKYXhqioMlyLaMNPsnommuoTSHA1+C4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUIexcZSIJH7mGCyqw+yjuEhr+FAAU1gIvS6zTDOZd1MKf8+tfwFxm040L/RmJbF9sk6W1LIXfX3DqcnzKCKnl5fPc6K3RUGg4TueAcCihpaUjDKK/737BfeN5TlSFQd8jJT1x9KJfSTZ3XoJ+ioNLJAnfQ0ztdC67CEbbcKrQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3CTZlBw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3CTZlBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744658027; x=1776194027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0P3s/Po4QM1GtKYXhqioMlyLaMNPsnommuoTSHA1+C4=;
  b=X3CTZlBwCU2+vUjJ34+MOhA3pviW0GMy00SuHO75tiPaEn9wE4KKGi5q
   vfUw6un0QcOdtAQzIP4D5VVaQIwpDso0eKiAgMgm00qc3ahE/VsnLim+i
   LitolaTfazyYYYpgJwjJjwOcNCa5JdHxIcRv8OSuA0br6h+83vJJ9Z6lD
   VlBc6IqAPIoYbbKqcN/boNcpvGwQZUAZyc8DiewI9NvB4kFCfjq24LSPy
   ktM3/HvSJ/Eq3Os/Trv8kzrWPSXqvoZY0kPjkMOb4Xdz/DxhKfp9HAVzX
   KKJsviNm01IkzSJiHG0+NNud8PT+7uCRCKkBTQyyHGi/DIuSc3qaNrHd5
   A==;
X-CSE-ConnectionGUID: yQEiI9YuSq+StTsr6dfiYg==
X-CSE-MsgGUID: R12Dl1ZFQbqxSOrQyCtoiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="33759080"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="33759080"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 12:13:47 -0700
X-CSE-ConnectionGUID: Pn2G9DkDRhaNsck/dqtN3w==
X-CSE-MsgGUID: AeRoV1/UTeWU1SUll99UDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="153087662"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2025 12:13:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4PFU-000Eaw-30;
	Mon, 14 Apr 2025 19:13:40 +0000
Date: Tue, 15 Apr 2025 03:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 3/6] vmlinux.o: warning: objtool:
 fastop+0xd1: missing int3 after indirect jump
Message-ID: <202504150331.Mv616V38-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   b5a545bda294204895870f17e0546a3d9a8a3d84
commit: c2939ccce8ec00c75758428a66eaa717df9ecc44 [3/6] x86/kvm/emulate: Avoid RET for fastops
config: x86_64-buildonly-randconfig-001-20250414 (https://download.01.org/0day-ci/archive/20250415/202504150331.Mv616V38-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150331.Mv616V38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150331.Mv616V38-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: fastop+0xd1: missing int3 after indirect jump

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
