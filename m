Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D3736B05B;
	Thu, 20 Nov 2025 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652573; cv=none; b=RQWR9+z9tABJq+79MJyXJPs79X/DCGUd9u7/BYZz68sLQEEg3et3eEE9bMksJ5w1xdH51LVph3fvlnSCdUr+FXbNOp7w/dKHpWxI5bcQhD4gcfY3opdrRZnXQ8ojcqv5511RWIvykxB6wn+bl8w2A1fQKBmANdqhaYkMFz3peUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652573; c=relaxed/simple;
	bh=hmqy9d3+OQC9bGm9xjwOAbUxR+ZQATvsm+zfL9KrnTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rZs43qit+hYiBqs2Y2M0j87qTx0t20kJ/2tBn++XQVdIWGmBbu59sdg++d99SY3pbYo2ZfkW63F3bEOur31z9p1xkTxzDsy2Msxvl8/F30EGL+/CLmYJrG+UQb9ZSNzUXYb4FngMF8lfBJrHTml7aEXkeKHDA2QUSPk36Hfxuew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdvyWDth; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdvyWDth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763652572; x=1795188572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmqy9d3+OQC9bGm9xjwOAbUxR+ZQATvsm+zfL9KrnTQ=;
  b=cdvyWDthO1WjURkibL967jyHWC9SdbT86+m/esf+D9558Kpypq2iG8HQ
   /JK/EPhURNRxBiP7YI9KbR1CS1BmKWY00lQ56IuOx8LQY5AfhdfCyoHOz
   SBqOpJibhL2w8/0Ki/MqM/6NWR8Lo944mELiCIxpc8pPjzJPT2ArmYHPs
   U7d6h2zCokwQW+t7QMEZ536IkWkNKkb7pftkDcXsUZAcApjsP501WkH/N
   2LXLxcA4IBW9M3ATcJIORbqgfoSqWxsTP1/8QEwzHfoXgoJyAix31FKAa
   uesCAP5N2Tc1sKqOUSl5MU3wT6X9hCki3f5v+DTCNhhH/VGKjV1A3eD/8
   Q==;
X-CSE-ConnectionGUID: mZ+e7n5NRCeOzBD+As7iqA==
X-CSE-MsgGUID: 26Ve5BDMRJyMoOlFRQwIkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64733749"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="64733749"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 07:29:30 -0800
X-CSE-ConnectionGUID: w0D8LG7LTbue40Thj5Ppug==
X-CSE-MsgGUID: p2jx3psSTWiQ3eKDPOYHPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="196371063"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2025 07:29:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM6b8-0004BZ-2F;
	Thu, 20 Nov 2025 15:29:26 +0000
Date: Thu, 20 Nov 2025 23:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri 20/24] include/linux/riscv_qos.h:10:10:
 fatal error: 'asm/qos.h' file not found
Message-ID: <202511202306.3GDs8iOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   f8bf739ad96594b69b3bf724e65ddf8c25a7d570
commit: 6ef95cee3c96622eb715a3f707edc237f0bbdf89 [20/24] DO_NOT_MERGE soc: build Foobar SoC drivers
config: s390-randconfig-6001-20251120 (https://download.01.org/0day-ci/archive/20251120/202511202306.3GDs8iOg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202306.3GDs8iOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202306.3GDs8iOg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/foobar/foobar_cbqri_memory.c:10:
>> include/linux/riscv_qos.h:10:10: fatal error: 'asm/qos.h' file not found
      10 | #include <asm/qos.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +10 include/linux/riscv_qos.h

323bf1bd959da7 Drew Fustini 2023-04-19   9  
323bf1bd959da7 Drew Fustini 2023-04-19 @10  #include <asm/qos.h>
323bf1bd959da7 Drew Fustini 2023-04-19  11  

:::::: The code at line 10 was first introduced by commit
:::::: 323bf1bd959da71b544db59810cec3a50afffe5b RISC-V: QoS: define properties of CBQRI controllers

:::::: TO: Drew Fustini <fustini@kernel.org>
:::::: CC: Drew Fustini <fustini@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
