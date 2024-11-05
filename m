Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FCA18C938;
	Tue,  5 Nov 2024 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814815; cv=none; b=UB+JngU7Qq1xgH4rqGs6FkAmZ+sq78pZVq2DuR3UApSD89OCix9Q58AiM09+LpsJtQvMVzHTOEwoBQFZ0wS5bUIfauBNtfNC+9dhkrD+7guBQtJY/Fk+j40kzoS3nORAdbBK1fHtEHSH8JBe+VPBUmRRmTsQybCSm19eGOf4Cnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814815; c=relaxed/simple;
	bh=yYiiWxO22fdPMxDz35VCSXFDF8TlMhptaUy6z91Bkmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IVDSiDE8kRK3sok1abYtDoujVlj2cy6sfAd+8x+W/1jpBJ9Lb0cKboo8b/dJmopvWfqcVwX/Fh80uL/hg4fcdSpBPnubBJr1Em7zRWS39t/GDdh3vN79xctRL79AhVW2DX5liHCYmUenSG0VhlGX0jvKg0DEVN/A/UiMxaaBEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMcv+8uI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMcv+8uI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730814813; x=1762350813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yYiiWxO22fdPMxDz35VCSXFDF8TlMhptaUy6z91Bkmo=;
  b=EMcv+8uIyG0bfH+lszDGGv4WnHAIp6XeNH4Bra1uco1q5OhoIfsEkKdd
   eqeGAheGc0+zMOeD+UVYO6fNkf8u2iraPUrnqSpQBhjVhQS5DPRww6Glu
   78bJPMmGQz3dP43zlZdt6McFnDYtMhG7g6YBRmEkFIIUUAz8ErjxAM5Ut
   4C//QFsma2aQmFGzJIAzb8IxVAegdleSpYZ0aQCpaQ0Cg2refFAZVa/Xq
   IAtsIk8xbKtZwAcnxMETLdsB3RnEMaSkIODwGIbDhh9sEz5cFuVAzZK79
   SRxqWNo1XoBJjn0bh9tocVAumtdLpnezCFNYgUI+bzCDi9a7e0d7SpW27
   g==;
X-CSE-ConnectionGUID: JVN5OekDSK285E1cYDA0og==
X-CSE-MsgGUID: MZhfiB5CQpOCJIFZ7q7sIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41665546"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41665546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 05:53:32 -0800
X-CSE-ConnectionGUID: AytUpMpwQXeRvJ6gNkUnYg==
X-CSE-MsgGUID: pLgLit9rQ2+GFZ7KNjoN4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84127794"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Nov 2024 05:53:31 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Jzt-000m6n-0D;
	Tue, 05 Nov 2024 13:53:29 +0000
Date: Tue, 5 Nov 2024 21:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 1/11] ld.lld: error: undefined symbol:
 __kcfi_typeid___sw_hweight32
Message-ID: <202411052122.CKL0yuvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   ef457c113168a1aee9bedbe0027d3acf9f3bb134
commit: d1c853bc341134b5758b678d6c5915375a2d9533 [1/11] x86,kcfi: Fix EXPORT_SYMBOL vs kCFI
config: x86_64-buildonly-randconfig-005-20241105 (https://download.01.org/0day-ci/archive/20241105/202411052122.CKL0yuvN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411052122.CKL0yuvN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411052122.CKL0yuvN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid___sw_hweight32
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___sw_hweight32)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___sw_hweight64
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___sw_hweight64)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___get_user_nocheck_1
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___get_user_nocheck_1)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___get_user_nocheck_2
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___get_user_nocheck_2)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___get_user_nocheck_4
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___get_user_nocheck_4)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___get_user_nocheck_8
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___get_user_nocheck_8)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___put_user_1
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___put_user_1)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___put_user_nocheck_1
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___put_user_nocheck_1)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___put_user_2
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___put_user_2)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___put_user_nocheck_2
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___put_user_nocheck_2)
--
>> ld.lld: error: undefined symbol: __kcfi_typeid___put_user_4
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(__cfi___put_user_4)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
