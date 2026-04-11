Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261EB212FAD;
	Sat, 11 Apr 2026 05:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775884087; cv=none; b=dr3e4U/dzv9DQ6JFlxT6UVN6SFCknOQ7ZAvTBFWS8rxa37ygVZCQmtyab1mn/oyqjrY4X6lr6z2UH2z6vSXhuFcVJNfrPNZdr2ZK6RJI2A6NXC/p7BJ9D3XveBkZI/2vebZojdefgc1Z1PrCynJrrgLE8TeSGYZ14T9467jM4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775884087; c=relaxed/simple;
	bh=HwxcSupoQxdmAaDJSUgBwplojG0HM5KK1Fr+fACyPR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wjywcss4U5BNL716N8jrlh2z/Nu614zRzQMBLqBtnqXYSYc1UhiYNSzzF6HdbvCHVM3xO3C+m8ce0xxQn2l/1HfLUq8MAmph84Wecpo+mOkiPYx/3NuGanKZJUCvgjw22eZ92ELE13IJUGcAuEQSUQ1iNuXWP82uBt1AB+D7IyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQUdm4Ko; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQUdm4Ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775884085; x=1807420085;
  h=date:from:to:cc:subject:message-id;
  bh=HwxcSupoQxdmAaDJSUgBwplojG0HM5KK1Fr+fACyPR8=;
  b=PQUdm4Ko4NYTpcU7rbwjHjfvr3Yd7HLrsOEaq1sjevgbG4g5GjxVV22G
   ka2uVaY+N7Ki+IysPdgTeA4vZu9jKp4UPY78Nc+VKnlkp4AnCi/Af5tn7
   M3REP4HtUhRwMYBXx+07lS0SyX4imQIVxd2YVePDPC4X7Q/OX6YPcKSKH
   sBzGhlizh9tHZZuYFENgUmC8EDF2PqiukZUQOl2I2+u7kqnfqhMd2WkrO
   sC9G44ImZJTcg5j3TlSmHpXRMmqnGOA1KUJELZt2yVu1pHNiEBPLBLOre
   cf+1+MLMGQ3Cn0aL6ENn9nAYEMBJNmrt1iTzYfsND+4Ov0KIz/z3ckURW
   A==;
X-CSE-ConnectionGUID: 8Q6KlKqTT/W/4AA2Gy6DCQ==
X-CSE-MsgGUID: fKk9JOztTeyrNVfMxyQvpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102358707"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="102358707"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 22:08:04 -0700
X-CSE-ConnectionGUID: bAEEcunaRXSB+7yZs2rYqQ==
X-CSE-MsgGUID: gqlw2WdiTG6sbOgD9YXwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="252461374"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2026 22:08:03 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBQZd-000000000oj-0SU6;
	Sat, 11 Apr 2026 05:08:01 +0000
Date: Sat, 11 Apr 2026 13:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 1/38]
 include/linux/compiler_types.h:44:10: fatal error: 'asm/percpu_types.h' file
 not found
Message-ID: <202604111357.tAmG7omy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: bd0087d97e3a6c9fc7d4ecc5e9c7e2e3bf704d9e [1/38] percpu: Sanitize __percpu_qual include hell
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604111357.tAmG7omy-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111357.tAmG7omy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111357.tAmG7omy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/um/stub_segv.c:6:
   In file included from arch/x86/um/shared/sysdep/stub.h:6:
   In file included from arch/um/include/shared/skas/stub-data.h:11:
>> include/linux/compiler_types.h:44:10: fatal error: 'asm/percpu_types.h' file not found
      44 | #include <asm/percpu_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +44 include/linux/compiler_types.h

    43	
  > 44	#include <asm/percpu_types.h>
    45	#include <linux/compiler-context-analysis.h>
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
