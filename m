Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6C62EC54C;
	Tue,  5 May 2026 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974408; cv=none; b=IRY2XP4btM4HeitrYxc8j0QaylAI1IZiNkjEsmbJdNIQCB/leg+DA9LYFHGDAT7p8c/gSpunw76T+xnfqvNE/B+KrLD7Rrpkn36pxYDnjXzr8d1ZaMI4xdZ+eW3uwGqW22f8EolkoY6dAEcpkoN0NWxj9yqoOynpuRzL9/gSn+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974408; c=relaxed/simple;
	bh=M5fdNptJJUjYOVz9eSGMJZpNe2GEg4VX3wjch6hKHmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bjyTLb+OjaXAjXxLHnKTXaWn0x3Hbip4/dDLq6qkss1ETemvBH+mFUF6hwN6qsh87vPW4j7d598UDwonjRvMZx/sQutV/UYRfHVa8vcKwb+UQKljjpEZLfcdaq/IK7Xzxa57DyR0l1MOfFwmsuZkK3QroFUiM3CFw/p7PSHnYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoYMhlCc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoYMhlCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777974406; x=1809510406;
  h=date:from:to:cc:subject:message-id;
  bh=M5fdNptJJUjYOVz9eSGMJZpNe2GEg4VX3wjch6hKHmw=;
  b=HoYMhlCcnf48gk9Xx5tdHP+TDSirJg9bJC10G48sMO/93zHsixKV2YLb
   F5yRbuzc+AHWD+vkNBD2LvN+ObvQWgeJM3THx5HlNIBMVQNZvs1Li9fTC
   9Vp81Y2+QX6UUdm+/MqN17GIUFMt6akkVmfx+0OOPl4LqOgEe6FAhxMN0
   EcgxWpoIklSf/PFulflVcRBkX51LNVSOMV5DmvBP0+wtlkuK0I+LmpcX+
   BGZkJNeJQGUPrOheCJvT+LBK8xom39NsSnpggm1psTUX2jTCngjjmVjRH
   sOdkWNm33ERDa8BwJ8cT5N+LFaLj4FTjsQPulViNTrJMr0a/q6ZfuFJPG
   w==;
X-CSE-ConnectionGUID: v4DZ4cp1QvKXTi4uEaddJQ==
X-CSE-MsgGUID: kPVMSGrWRp+BkwoQ/vMuTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78890557"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78890557"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 02:46:45 -0700
X-CSE-ConnectionGUID: oZTq7EiCRhqgMssgmcGWcA==
X-CSE-MsgGUID: 6GW2fnN7S4m9WkIb0vLQQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="237540256"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2026 02:46:44 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKCMU-0000000002r-0Dvw;
	Tue, 05 May 2026 09:46:42 +0000
Date: Tue, 05 May 2026 17:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/glink 27/71] make[4]: *** No rule to make
 target 'arch/hexagon/platform/common/sirc.o', needed by
 'arch/hexagon/platform/common/built-in.a'.
Message-ID: <202605051759.h6Af5BIn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Brian,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/glink
head:   f5a983a09d006ee1c9fe4c66beca5f1f927caa04
commit: 2f79afc796b7773a165337289a7c8edbf341d33c [27/71] hexagon: add H2/QEMU platform and toolchain workarounds to build system
config: hexagon-randconfig-002-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051759.h6Af5BIn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051759.h6Af5BIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051759.h6Af5BIn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/platform/common/sirc.o', needed by 'arch/hexagon/platform/common/built-in.a'.
   make[4]: *** [scripts/Makefile.build:289: arch/hexagon/platform/common/platform.o] Error 1 shuffle=3064998352
   make[4]: Target 'arch/hexagon/platform/common/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
