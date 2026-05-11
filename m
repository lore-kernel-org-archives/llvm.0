Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245A730C62E;
	Mon, 11 May 2026 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483321; cv=none; b=m9kJblekwm3dm5o9lqMb8o3Hdq4XdMSo/oBjrfiUyqb9jEARwfaH91d1IA7CdLZFH9H1SORfn1udIk+jKS0GpdmzaOJVQFSQNG1PL3gR56Bn8s9f34SsHqzgijFudF36KTyt2PON3zC+45EpVcBwP7aaHJJCfAIMu41d6LOqjf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483321; c=relaxed/simple;
	bh=9jdHCqymU7t2OcKPI403pOEhEiDLXN9d4dhiqjnqq1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JOiO+HWF8FdOb7oq+CWIfxprMUJu3oFb3fOXhfim4LGr0UPHsKz3vKtojzGorG+tJw6MlQ10Fw+YLWVb+OzBCc23SaVkwKXE5X7Xl0XrO2eW8gZDIK7rGLx3RKQmVEDxHrfnqVc45Rhbv+5hL9YGOKSqZciPBM4VrVqYjsFBPww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwPwpbgL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwPwpbgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778483319; x=1810019319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9jdHCqymU7t2OcKPI403pOEhEiDLXN9d4dhiqjnqq1k=;
  b=bwPwpbgLC6EaxBc7P1tji9XZ4AtNM6arN0xzqCvAryzs0tzpzqVp7tZf
   7TlPbBfpAryr8fvVmficNzmfXw//BaT19/9mWkORd0EnPJiERX+3q+iiR
   brnpR2trFFwcxBELBo0a+xRFLJoSvg1Olw8skaO0CRql1vtomBU/deYEV
   vzYAbiQFP14cQUDNDYM70R4YrQx4vA1MFzE/Bg9ciPcRlUUadczyNMjQC
   zECOHL9j45MLZLe6OlOhGS2hEomXIMVOrPdfE3EaI5WtllNtutJrXAGTM
   FJKLyx8mwTHQsNcKNQ/GfnsyGpddY11JLwlcVht/FQC1QsJ3eGZ2iNjOn
   w==;
X-CSE-ConnectionGUID: f/BjPytwQg6zji/4IO9GmA==
X-CSE-MsgGUID: /F+bzzhKTHSSfAG7mcuc/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="81927277"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="81927277"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 00:08:38 -0700
X-CSE-ConnectionGUID: zS5zzkeUT/mETf6RsLpGEg==
X-CSE-MsgGUID: yxoJ6MmXQZGWCU5uWrx9rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="230984229"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2026 00:08:37 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMKkk-000000000Gn-1xVC;
	Mon, 11 May 2026 07:08:34 +0000
Date: Mon, 11 May 2026 15:07:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Christoph =?utf-8?Q?B=C3=B6hmwalder"?= <christoph.boehmwalder@linbit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>
Subject: [axboe:for-7.2/block 1/2] ./usr/include/linux/drbd.h:18:10:
 fatal error: 'sys/types.h' file not found
Message-ID: <202605111554.Igo3hTUS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
head:   8098eeb693c4cc4e774c62fbd4875197cb5578ce
commit: a54f499838292c1768f6575ed1ec7cf35f1b6489 [1/2] drbd: move UAPI headers to include/uapi/linux/
config: arm64-randconfig-003-20260511 (https://download.01.org/0day-ci/archive/20260511/202605111554.Igo3hTUS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111554.Igo3hTUS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605111554.Igo3hTUS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/drbd.h:18:10: fatal error: 'sys/types.h' file not found
      18 | #include <sys/types.h>
         |          ^~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
