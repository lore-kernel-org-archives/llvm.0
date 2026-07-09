Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EF440E8EF;
	Thu,  9 Jul 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594396; cv=none; b=Wz48WmDYHdIa687BUq6TJo+RB+YPlPUq6RHDmlcVo/hB2fFi152Z1gzMkQQ6Ya6j+5plo45zHuuUeizs5fiiiF8AF9QG0pMvSPw+FJ5VF8i1jUYrDvZ8sBgeVWXwlQrSO8XTThkUEfj0oXMXfQQrU2uVCO/lWBhfE8Rss5RYVGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594396; c=relaxed/simple;
	bh=gKK9ndbB/e0ibNRMF2XQgn6FWuZz73Wu0sXpHLwv4Ls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lNpdPxpXhitqaKb+enkHqBLmRXpwpsh7w/H9ShowDauQDcLDJTDn2PMADK7hwYZl1wDw/e4mITELq0MA1XYCTTmKKO/BmQMMu/cdismkDNPx6AJDYDo0oVc7tiN/0X0LlOngGV3ewVyte+eL/C19j5FJ0ttbZIJXmrM1nhDTHgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAo5H8/6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAo5H8/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783594393; x=1815130393;
  h=date:from:to:cc:subject:message-id;
  bh=gKK9ndbB/e0ibNRMF2XQgn6FWuZz73Wu0sXpHLwv4Ls=;
  b=QAo5H8/61tOq/ZMvEYskNJWMo1+VRSrXxPrhjXwznV1rBb3rV4GsHrzp
   4HZdx8e8NQlUEK9o+Qs4SaOCaHSTiwCD0S0RjlyKxXBPNEVmjeeI5xfc9
   UoFi7RAAc9DQPWiKEZvJVwarPetJBK7Ssik3M/fvS6TqrT8O4SUd0INBA
   NXEnkNbwco1dMl75GOo7102tLOcObnoNnDcr41IsFFKZyrGEvK0hK8VhR
   oxU9Xvh/VL2r9wOKnO6kqP+N+ktZRyDg42XqDGCT3DmlDWYpZDDbifyJi
   D6VzPmdxrJOdVzSPjhPoP3l/8MHu+Or+0B3SLT3+yP9vtSGYCUMkAbVRI
   g==;
X-CSE-ConnectionGUID: 9PUOhJVlTByefMXnvxDnWA==
X-CSE-MsgGUID: hkVgiVEqQWivxaYRTmcTDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88098587"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88098587"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:53:09 -0700
X-CSE-ConnectionGUID: UR016NsYT9ujFogQGHoxYA==
X-CSE-MsgGUID: H24C/8AiSzixADzsxSmclg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292742145"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2026 03:53:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whmNM-00000000Ha1-3sLv;
	Thu, 09 Jul 2026 10:53:04 +0000
Date: Thu, 09 Jul 2026 18:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/qemu_boot 8/69] usr/include/asm/ptrace.h:33:
 userspace cannot reference function or variable defined in the kernel
Message-ID: <202607091839.yjg7FFjN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   89efd48e5609f41280973bc49df20ffe80177690
commit: 306b04135e9b14c2c9948eff6706674b4b9b5f5a [8/69] hexagon: update UAPI headers
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607091839.yjg7FFjN-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091839.yjg7FFjN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091839.yjg7FFjN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> usr/include/asm/ptrace.h:33: userspace cannot reference function or variable defined in the kernel
   usr/include/asm/ptrace.h:34: userspace cannot reference function or variable defined in the kernel

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
