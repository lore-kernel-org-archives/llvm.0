Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F722BF3CC;
	Sun, 15 Feb 2026 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771142804; cv=none; b=NINDcVdetJ5eAv6wfAVWquFQRapv9DDB9FYCgpcK7515PqrCzeekqj6DMW5JcsZS2bTvFn4FhpAc+C4uQsinvSQVGNEYzCpgErprYAE2vp3uB7PXs6W95Zi/zsQHX65e2nUYTdicyTXrKND4YFCLslSC9SgPLty0wWNPom11esk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771142804; c=relaxed/simple;
	bh=ZqgQpoOvqY2uKQ6RyhH70N3bUCOBZLxCkbz05DnHG0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVhgdaV7OSqynQzaXCuqpFV/nO5c1Cuhkdttuq7Vc3+NFVNMPSgg7PMILcQRUAVNZMvVFCyOi2VM/AwnQByl8Ex6IBpjtvli0DclONOyuWs91ALv5X/A5ESPIUOxNpt32yvYd1sTZ44Nu5BmoGLpsUSw9BR2a5JQmJI9MgAvnbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anuJbExH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anuJbExH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771142803; x=1802678803;
  h=date:from:to:cc:subject:message-id;
  bh=ZqgQpoOvqY2uKQ6RyhH70N3bUCOBZLxCkbz05DnHG0g=;
  b=anuJbExHvwwWdbfAqroxCwERmBmrNLwZIb9sNTUcqGmkYTOiL82qDgG9
   CC7iWwMYNWxM5otOQS4ONskij7jNPBR6vaHZ3peEc9+x1BGYJdS1YyYLp
   MXH5c4BzC01qGrpCS5UVMZhahnydlmFhivYZdM5FJ7ot1gPIAa62ak9L/
   0QYGSh9XGlEiusg3KisHIGA1D9xW3ePCvDR0GCFMHEKXRCvPziaBRRybj
   8u7pEzeguVZcT9Zcyd0yBhyzp98JQhkJAtgwJgbRJs0NnL1kAIQIUHuqK
   QkGCQaCUJ93ZPjb4xNGL4lOgywdQAnbLNftyHbvIWBvAvbTuRFREjDP7Z
   A==;
X-CSE-ConnectionGUID: XP3Z+vlcQz+i9JE7dap/aA==
X-CSE-MsgGUID: FqNcdalDT/219+QTnROKkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="97724478"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="97724478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 00:06:39 -0800
X-CSE-ConnectionGUID: Z4UAeJMGQHminxAAUG0jTw==
X-CSE-MsgGUID: c2h54M7vTdK/ZE66zEPpuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="212669025"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Feb 2026 00:06:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrX9H-00000000xyg-0Ct8;
	Sun, 15 Feb 2026 08:06:35 +0000
Date: Sun, 15 Feb 2026 16:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ross Philipson <ross.philipson@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Ard Biesheuvel <ardb@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [ardb:x86-slaunch 14/44] include/linux/tpm_common.h:83:2:
 warning: field  within 'struct tpm_header' is less aligned than 'union
 tpm_header::(anonymous at include/linux/tpm_common.h:83:2)' and is usually
 due to 'struct tpm_header' being packed, which can lead to unaligned accesses
Message-ID: <202602151619.0HMvIasQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-slaunch
head:   a3d6f431161a83e75e3398f2390d714c3a4f7167
commit: ae9fc7f1dcfbdca364954aafd32a193e44f7df69 [14/44] tpm: Move TPM common base definitions to new public common header
config: arm-randconfig-002-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151619.0HMvIasQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151619.0HMvIasQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151619.0HMvIasQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm2-space.c:16:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
   In file included from drivers/char/tpm/tpm2-space.c:16:
   In file included from drivers/char/tpm/tpm.h:27:
   In file included from include/linux/tpm.h:28:
>> include/linux/tpm_common.h:83:2: warning: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at include/linux/tpm_common.h:83:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      83 |         union {
         |         ^
   2 warnings generated.
--
   In file included from drivers/char/tpm/tpm-buf.c:7:
   In file included from include/linux/tpm.h:28:
>> include/linux/tpm_common.h:83:2: warning: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at include/linux/tpm_common.h:83:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Wunaligned-access]
      83 |         union {
         |         ^
   1 warning generated.


vim +83 include/linux/tpm_common.h

    79	
    80	struct tpm_header {
    81		__be16 tag;
    82		__be32 length;
  > 83		union {
    84			__be32 ordinal;
    85			__be32 return_code;
    86		};
    87	} __packed;
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
