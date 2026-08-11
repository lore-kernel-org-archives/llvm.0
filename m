Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55CA1B4F1F;
	Tue, 11 Aug 2026 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483068; cv=none; b=VA7ONPLnk3pdi8wuR5Dh7E9+X0dkjtXThO/CRel+JSbpI0l+GTJTIYndsu0ARH+Lc4WYImGtgkUqYC/Nektn95jgbSoJ0vDEUY3pM2Hb6USvEho3jwtvjTXU3voe5Vet3KrZcyYW/D/q0sGyolKQTpXvkN4kVXJujYG5vfoWK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483068; c=relaxed/simple;
	bh=SlgbFHYXTpejDwPt7EBLef+AzGH9lNDzzUt0HXHdZn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tOoUQFqz4JedBtMurdcTCFP3BfWO0E+64/LQlhqF6XkceI+4/XEl9KngIHumPkrpRchCZTOAGceOKbUR2l09gi0p3UkrVEOGELP+f0sZzQ9feVgsO9GUatTy6L2fllfkNzHonYmdJ1/J+zfRMGVzd8x1J2rVfizhXTYXfNbxBWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f8AAV0qU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8AAV0qU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786483067; x=1818019067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SlgbFHYXTpejDwPt7EBLef+AzGH9lNDzzUt0HXHdZn0=;
  b=f8AAV0qUCNClpBlZxs/LCGV5cFKCFQaFIZZgJakE4F5dRlQUzMYO3fnF
   kQOIvfCwsZL63qOwNsKp4DHkV7VMfDmC9GhYh8UwazlCnWHZMK09No6Cm
   B5SC1tQjQRLDYi/K1bHcU7e33J1Y7tGoljrfWc1fGDTtiguhdxHuQ7MBj
   ca0J7yO2P7sEcNga1YplVjphh8eoAr3bd8UQ6wR72WMxA7BQgRiKgscm0
   /cttKAHQJXDqIdB0CsIgXA/wURfZCa6QQMtLQhs894iMwAgCjK/YAvyQk
   3zXXhgaXC7jae6fU/QuejcXg9eI7tSecW7NuTCXt+ZefdhrwE/KvOCrnQ
   A==;
X-CSE-ConnectionGUID: 0+JhP0DdSlq4kMhfRGn82g==
X-CSE-MsgGUID: o+l+yo3pTJ2qY3wKyFamVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="85984494"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="85984494"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 14:17:46 -0700
X-CSE-ConnectionGUID: nzhi4VjzRKqvo4w3vEs/XA==
X-CSE-MsgGUID: k6mRqrdeQNq5qYPVdUBpNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="301684139"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Aug 2026 14:17:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wttqw-00000000PJO-2WoM;
	Tue, 11 Aug 2026 21:17:42 +0000
Date: Wed, 12 Aug 2026 05:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-loongarch32 3/3] ld.lld: error:
 version script assignment of 'LINUX_5.10' to symbol
 '__vdso_clock_getres_time64' failed: symbol not defined
Message-ID: <202608120456.WJtqUaW0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-loongarch32
head:   75d124026928985f158de7a2a5cfa49c7cfe9819
commit: 75d124026928985f158de7a2a5cfa49c7cfe9819 [3/3] 32-bit
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260812/202608120456.WJtqUaW0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120456.WJtqUaW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608120456.WJtqUaW0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_5.10' to symbol '__vdso_clock_getres_time64' failed: symbol not defined
>> ld.lld: error: version script assignment of 'LINUX_5.10' to symbol '__vdso_clock_gettime64' failed: symbol not defined
   make[3]: *** [arch/loongarch/vdso/Makefile:83: arch/loongarch/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/loongarch/Makefile:206: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
