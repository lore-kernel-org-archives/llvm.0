Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5763D1C879E;
	Mon, 14 Oct 2024 19:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728934565; cv=none; b=VYmnVaq0mYtPkd89Y1cOO2baYejzjfv61qaCSrkXqOJjMo3X3TZPfnYVEgHYZL9T/zZVewmZzMWx9KfQxyJzoI1W1tNV+Ax0cSgmca0S+cGbqI3EnHL9vXT+hBWPEVR3YQiQQBUWWVKfOOLumncr79cmT/Q0kzC8st1PU2x38Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728934565; c=relaxed/simple;
	bh=y92CkpN+2tfdYaKR34UuAF8ksRa0TIOALaEj4otfh38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tvaox8AMwNik5HpG95r66gdvOjuSAt4glMMPy0b/5OjhXO9sVqUpjRtKR0w1EF2sX4hRR8GAEZEJPoEETxYs+xAA7IiTYPTYXPpf3H+qNe3Df/EQ8aR+i+cyMGn13XHNHz4/VlHVbuZo3oXvmlOBIFI8SoREgZzbGjtxoXXaDGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASX/8Pfz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASX/8Pfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728934564; x=1760470564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y92CkpN+2tfdYaKR34UuAF8ksRa0TIOALaEj4otfh38=;
  b=ASX/8PfzELW2CKT5FGhInI40fEEM9we8pXJxhZ249XSTriUuXhbYMzah
   j0OZn4a9rphN7/enKTxFB1fqc2b3FOI9L+Z7RhFsm+kp2uKqYryjBDV/1
   2Nu2mBzHIGS5ySoAzKUSPk0fGDFCEZtR6OQItD3xoIsplXMzsUAX40OHC
   43NWwpt1YEbuJ8OTRJ4gvOKVxkdTWM7H+RnjbIWquQUvnb9SbBtyB3faL
   +mEx4f0k0du8GGo0+VNie0W+6tJEiImdd0i9x6YniMkCWOMDjzLDncyF1
   Jfl/Bbo5AaiDsCAJDJS70HCGMajKpmCURgKz8In8CVVVmZwQEf+fVEcZz
   w==;
X-CSE-ConnectionGUID: XYRexntaRnKPXmKz/Y1hjQ==
X-CSE-MsgGUID: AH/+skAKSGC1Cxl4KUBGTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31999230"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31999230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 12:36:03 -0700
X-CSE-ConnectionGUID: dcLyOhQnQ9myiIrIBNPWUw==
X-CSE-MsgGUID: d3J12DlxTu6xihDIAlqThA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="115121765"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2024 12:36:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0QrH-000H43-0Z;
	Mon, 14 Oct 2024 19:35:59 +0000
Date: Tue, 15 Oct 2024 03:35:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.experiments 3/3]
 include/linux/rcuref_long.h:49:14: error: use of undeclared identifier
 'RCUREF_RELEASED'
Message-ID: <202410150319.k34MiJ5b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.experiments
head:   007604382bae5e5955ef294a676bd3eb1c1bbac2
commit: 007604382bae5e5955ef294a676bd3eb1c1bbac2 [3/3] fs: port files to rcuref_long_t
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241015/202410150319.k34MiJ5b-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150319.k34MiJ5b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150319.k34MiJ5b-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:1120:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:48:
>> include/linux/rcuref_long.h:49:14: error: use of undeclared identifier 'RCUREF_RELEASED'
      49 |         return c >= RCUREF_LONG_RELEASED ? 0 : c + 1;
         |                     ^
   include/linux/rcuref_long.h:23:30: note: expanded from macro 'RCUREF_LONG_RELEASED'
      23 | #define RCUREF_LONG_RELEASED    RCUREF_RELEASED
         |                                 ^
   In file included from arch/arm/kernel/asm-offsets.c:12:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/RCUREF_RELEASED +49 include/linux/rcuref_long.h

d72d156a1254d8 Christian Brauner 2024-09-18  37  
d72d156a1254d8 Christian Brauner 2024-09-18  38  /**
d72d156a1254d8 Christian Brauner 2024-09-18  39   * rcuref_long_read - Read the number of held reference counts of a rcuref
d72d156a1254d8 Christian Brauner 2024-09-18  40   * @ref:	Pointer to the reference count
d72d156a1254d8 Christian Brauner 2024-09-18  41   *
d72d156a1254d8 Christian Brauner 2024-09-18  42   * Return: The number of held references (0 ... N)
d72d156a1254d8 Christian Brauner 2024-09-18  43   */
d72d156a1254d8 Christian Brauner 2024-09-18  44  static inline unsigned long rcuref_long_read(rcuref_long_t *ref)
d72d156a1254d8 Christian Brauner 2024-09-18  45  {
d72d156a1254d8 Christian Brauner 2024-09-18  46  	unsigned long c = atomic_long_read(&ref->refcnt);
d72d156a1254d8 Christian Brauner 2024-09-18  47  
d72d156a1254d8 Christian Brauner 2024-09-18  48  	/* Return 0 if within the DEAD zone. */
d72d156a1254d8 Christian Brauner 2024-09-18 @49  	return c >= RCUREF_LONG_RELEASED ? 0 : c + 1;
d72d156a1254d8 Christian Brauner 2024-09-18  50  }
d72d156a1254d8 Christian Brauner 2024-09-18  51  

:::::: The code at line 49 was first introduced by commit
:::::: d72d156a1254d8298d22a59f13b5ed47126b6b5d rcurf: add rcuref_long_*() helpers

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
