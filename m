Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADFC2D838E;
	Mon, 18 May 2026 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779130244; cv=none; b=Ip05tbCIj9qTy5J/7Ansxe5I/f4vPA6E1VcTuo/yJkko0erX7LNtnkCunIghB0+USZ+ts8cEAvcxG1Vo0QkFFI6t5wCh8kgpnrwvuvkNSR3FnaXHMPRPrfU8H4C7KGavobglEEY8zELwPvM+8nafufBUQXLqu/12HbFWAUK31j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779130244; c=relaxed/simple;
	bh=nwPEjj5H17EqEyysRKakjy2wHqwbx6QxL1QG5UK8uHU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IF9nvsWk9rGMRoVW2uEz9BOYKzyrq3UWt0mfTWvpfHWE2XVJqlKqKfSmKOWY71Bb/1wkMDte9bD/sDf9UI+K1IK44FQlZdFbB2uWXc20yYKHfBQxTg5hZvk9rahFwgIRv91NsXpQfNFpDcL2Y+aGWgGsRIXJUidzEKiQ/YqylLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVZRv9bD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVZRv9bD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779130243; x=1810666243;
  h=date:from:to:cc:subject:message-id;
  bh=nwPEjj5H17EqEyysRKakjy2wHqwbx6QxL1QG5UK8uHU=;
  b=jVZRv9bDsnfFyBAJBfMmncziYk/hmWe0T2AKRcFBBXnzA+ELGGsfVEMJ
   DSjgtmq4KE5aaO1Bwn24J1SDRcDR9UXlQ3Adoh54wv1/4eU0yDq8r8Iav
   O+4UAC+euN5mvqCGQjkTOmXdH3U9qYzE2jZH4axGjP+pEWSy5F4dqx92x
   +FCGO4GnEBWNqwphVvg8+UP6eT25kJk4e2MOYyz9q7YRUbTqUWoMsm6UU
   HCizNPMj6/UZmZY5z1+Gm+9hCbKu+0f+GAws/E3kzoxjubBwrDDfeM4pW
   IIbzCi6UTVYDjMUGWC0G0oXNC8TpANx78cBdsq2Xgvy68XNC40NMBhZ/F
   A==;
X-CSE-ConnectionGUID: qgk5g/JAQAqRud0p9i8Qig==
X-CSE-MsgGUID: i6+cdIs9TlOQEnW2YGjZXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79136240"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79136240"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 11:50:42 -0700
X-CSE-ConnectionGUID: oyc5/liTS12TKHv8aPF83g==
X-CSE-MsgGUID: RtUUm/XQSEeV29zCu9b8hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="239771239"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 May 2026 11:50:41 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP330-000000003HS-05rU;
	Mon, 18 May 2026 18:50:38 +0000
Date: Tue, 19 May 2026 02:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 1/15]
 include/linux/compiler_types.h:638:10: fatal error: 'asm/percpu_types.h' file
 not found
Message-ID: <202605190207.jcEtGdzJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   2b2ed0b59c61d67712474679cd0dce58e983e656
commit: 0742d6b30874ad043eb39a7a1b9e96a296a70ce8 [1/15] percpu: Sanitize __percpu_qual include hell
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260519/202605190207.jcEtGdzJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190207.jcEtGdzJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190207.jcEtGdzJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/um/bugs_32.c:9:
   In file included from arch/um/include/shared/longjmp.h:6:
   In file included from arch/um/include/shared/os.h:13:
   In file included from arch/um/include/shared/skas/mm_id.h:9:
>> include/linux/compiler_types.h:638:10: fatal error: 'asm/percpu_types.h' file not found
     638 | #include <asm/percpu_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +638 include/linux/compiler_types.h

   637	
 > 638	#include <asm/percpu_types.h>
   639	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
