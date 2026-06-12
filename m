Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81130FC27;
	Fri, 12 Jun 2026 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289795; cv=none; b=SZwDgmtjr/TkJC5jasTyD/+jpKhjuQNeBWmHwhFhyc0jPV1pNF8/vYjyfkxo/eAlLYab7hbzoMJSL7TPsBgbibTvyE068TQOw8lSCI6Ugzaz3z+0ZeLlhmEcLjuVD51tqS6V7RIUk8aEPIoQTWUDeDwhnXUbv76kCAOjZvlcca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289795; c=relaxed/simple;
	bh=wNhL5iRSmfNMwXCHqObtG0A0zazh6f3pyoNDGG/0z8Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kVONQLpRrgCVGdz1/VC3o7DnutfjGyIeegE0APaoQE15RLau8fNX1rKLFHgUYi2gYCp2+XfNZuhYNlwF2vP1d5xjsaeX6JKnAjwBowaQuhQzMPY97/y936i1IjR/qhGttjLQzMyznb3HUEsfZZL3uuDjdkG4AfIX8/xnDrJ342c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPZrkCR2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPZrkCR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781289795; x=1812825795;
  h=date:from:to:cc:subject:message-id;
  bh=wNhL5iRSmfNMwXCHqObtG0A0zazh6f3pyoNDGG/0z8Y=;
  b=UPZrkCR2wiXMRp9skbgRsRbpKntws2Nl8CGwX8fRcRIYF2QNqJXgTNlk
   F6CVBDPz1jWH6E7WW/kmXM0dtnpNJCOGn8g7Izibybcg3wmNJx/KwreR4
   /catESeVS3TtlCmh+EO5kHHs40Szk+wqsGTJDY34BRtEOqbdXsTt0/i+k
   a0JG9O2rFV+/PcHIXPL/Y7I+qwvkuOWf2UFq786Ko4FC4bdtd4hRXzHaS
   56DK65Y5au/2YMip37NBBXUUxCDcyz4ySVb1GgpKT+hgHVwvc3ygCw/6z
   KmcBCyNSB3pO8XU4PlDYiIr7McjLnA68ILdnRvVAxvEfGCQP5Dh9r+KKl
   w==;
X-CSE-ConnectionGUID: qPwE+GPVRdezbZqsWyRdZQ==
X-CSE-MsgGUID: Zh1XpxMyRCyMkI7xNU5qug==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="104797083"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="104797083"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 11:43:14 -0700
X-CSE-ConnectionGUID: MnUUMRjxRMiVKK5FawwyVQ==
X-CSE-MsgGUID: fvyB5zhqTt2qcIg1Ycc6yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="245984627"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jun 2026 11:43:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY6qU-00000000PDF-2ZsF;
	Fri, 12 Jun 2026 18:43:10 +0000
Date: Sat, 13 Jun 2026 02:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:xor-pending 1/1] lib/raid/xor/x86/xor_arch.h:16:6:
 error: call to undeclared function 'cpu_has_xfeatures'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202606130214.hwLDHz6m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git xor-pending
head:   29d2790c2a2ae236ad76443f63a16fc2ebc3c3bf
commit: 29d2790c2a2ae236ad76443f63a16fc2ebc3c3bf [1/1] lib/raid/xor: x86: Add AVX-512 optimized xor_gen()
config: um-randconfig-002-20260612 (https://download.01.org/0day-ci/archive/20260613/202606130214.hwLDHz6m-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 62847ab7593df144a5708406e6240ec5e8a3a101)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130214.hwLDHz6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130214.hwLDHz6m-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/raid/xor/x86/xor-avx512.c:12:
>> lib/raid/xor/x86/xor_arch.h:16:6: error: call to undeclared function 'cpu_has_xfeatures'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      16 |             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {
         |             ^
>> lib/raid/xor/x86/xor_arch.h:16:24: error: use of undeclared identifier 'XFEATURE_MASK_AVX512'
      16 |             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {
         |                               ^~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
   In file included from lib/raid/xor/xor-core.c:140:
   In file included from lib/raid/xor/um/xor_arch.h:2:
>> lib/raid/xor/um/../x86/xor_arch.h:16:6: error: call to undeclared function 'cpu_has_xfeatures'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      16 |             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {
         |             ^
>> lib/raid/xor/um/../x86/xor_arch.h:16:24: error: use of undeclared identifier 'XFEATURE_MASK_AVX512'
      16 |             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {
         |                               ^~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/cpu_has_xfeatures +16 lib/raid/xor/x86/xor_arch.h

    11	
    12	static __always_inline void __init arch_xor_init(void)
    13	{
    14		if (IS_ENABLED(CONFIG_X86_64) && boot_cpu_has(X86_FEATURE_AVX512F) &&
    15		    !boot_cpu_has(X86_FEATURE_PREFER_YMM) &&
  > 16		    cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL)) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
