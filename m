Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1664E1FDA;
	Thu, 24 Jul 2025 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753386424; cv=none; b=VLeOnogMY+TWu6kXoPhE4TR4mSiCDxURaAwHFUfPsxc9OoBrtuibOyosjgdo5pFwPtolkRxdjCTSQDLpqHFQhtJ/7NEgJ4ZPkZXs/YXvKhCuCUhK9fctQGVABc+KU/Ifxl15H1l7i+JtNtFZ7/HbGrgQJEOMs+2D06ALVTkpYEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753386424; c=relaxed/simple;
	bh=X5YZZYWkrUkeug80FDmjSYQGAehLlVZ/kJaqUuQ495s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gswIbWreHdwAkk6Zuq0ruUjGsWvzmZX6hufeuAX6LdtHah/DommjLWBVWuT8f5928RkBomFQV7PgFi/c4zr2C+nBw+Qwpu0yzkw45V2G/EiBMH7pupzlaau/TnnWReHAmMKKaeatF42fcLYWXSdcFOFKNWmQJNRmuekpK5k4X9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUqsn3vS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUqsn3vS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753386423; x=1784922423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X5YZZYWkrUkeug80FDmjSYQGAehLlVZ/kJaqUuQ495s=;
  b=nUqsn3vS4HxEmNMUgCdcCoJo1lluhKjuwnAzJYLLF5MjK869BW7Tf/Y3
   slY1oznPbEyuhzhDBmh3hbqaIaxn87czsqiJz38TMPxdocXYTBAMGETuA
   EY7qo3tX1f8O7ImfmsZZiqmelYucKeQ0oZd2HpTe+Ps0uGN/IP2hOjqLy
   RYMR3cTNmOF6U6Nyf5lM+ySGnB2kspcgRlZDJMiY0UHFnBEjo2FQCvYMi
   qoU3A3QxhugWFT80dvjfU74Bq3jnxKKdU53Wq5lbV9MJnuwuLa41ZZrMK
   +3Kf0u/mg1gKh4j7VW/UcIoOYV45hIgypyPCkblHB0IoRxISa8icBTnHT
   g==;
X-CSE-ConnectionGUID: VlOaIf16SCmHcWdEcev1/w==
X-CSE-MsgGUID: BCAux4hVS0etWF/mDJKznQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66418677"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="66418677"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 12:47:02 -0700
X-CSE-ConnectionGUID: zeJaujFRTnSGMgRiThOPKA==
X-CSE-MsgGUID: y4y4SCgVTT+4SIDA3ZB89A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="164473464"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2025 12:47:02 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf1u7-000KmF-22;
	Thu, 24 Jul 2025 19:46:59 +0000
Date: Fri, 25 Jul 2025 03:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-sparc64-generic-2 17/17] ld.lld: error:
 arch/sparc/vdso/vclock_gettime.o:(function __vdso_clock_getres:
 .text+0x350): unknown relocation (46) against symbol vdso_u_time_data
Message-ID: <202507250306.4oVYM3YZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-sparc64-generic-2
head:   208f0c23b4f7408dd631508946283c66a08d7f81
commit: 208f0c23b4f7408dd631508946283c66a08d7f81 [17/17] sparc/vdso: Implement clock_getres()
config: sparc64-randconfig-002-20250724 (https://download.01.org/0day-ci/archive/20250725/202507250306.4oVYM3YZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250306.4oVYM3YZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250306.4oVYM3YZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: arch/sparc/vdso/vclock_gettime.o:(function __vdso_gettimeofday: .text+0x10): unknown relocation (46) against symbol vdso_u_time_data
   ld.lld: error: arch/sparc/vdso/vclock_gettime.o:(function __vdso_clock_gettime: .text+0x170): unknown relocation (46) against symbol vdso_u_time_data
>> ld.lld: error: arch/sparc/vdso/vclock_gettime.o:(function __vdso_clock_getres: .text+0x350): unknown relocation (46) against symbol vdso_u_time_data

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
