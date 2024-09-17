Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0B7148833;
	Tue, 17 Sep 2024 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726559461; cv=none; b=pTN6vpxFUJ+Vk2RKJB8ss0R+xJVq0rB0tcjC9qKjw7eGZP1E+2L53np04AjS+WKzx6PC7G1y2CX3eh2O2sz2ANuhhNwNnZ2RNO1OedUm4zNkMT4m9aJ636bGqqoBJpOx2j+/dPSZdMCWEGL9AwsX3XebWbabFc80SFCpspCt9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726559461; c=relaxed/simple;
	bh=KaD7syLjE7teAAaOgbfUnfRDdhlrc5GwZcRPS/1Fnpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ny6ROUC6iEhYmIqEZQK5lT4cVh/MRTdJDSCngpXzvyoSKoMl0/UjVDRUxKAqyQpDcUlQLoEoWrbyZe1H14IEY3psS24fsz9yyamQzrQTT8+YEP/Ey4j7KGFj/gBxn1TZ8kdVngmzzqRh4KNBMrcmcIoc0nYTsgkQ9/bjhSLPRU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHcMNZaR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHcMNZaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726559459; x=1758095459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KaD7syLjE7teAAaOgbfUnfRDdhlrc5GwZcRPS/1Fnpw=;
  b=dHcMNZaRH2G+2pcGM9IXOEMRXszzxJuoAghxoXwZaniyRBTa//7B6Crc
   wTn1ZQhHgrJsGSWvxaSV11QjZBenSXp43psKh1JxnY4YM/WdNPNowmOhm
   7+E55qwE1rHTXt5ImKAi5fe+J/HeLjfvuf5pcBfqqP/vEsxGVGcGLZ+pC
   dqa+j1op1vrVQnHvdrZjCdCw8ua1oiw9UrZk8DVhtLDBUUfhM6/CpndPL
   xAA9iHUsSElLbqMiHde8Ak4IcEwwA3XSK7zArGXYNeHirC0kRKr/ErERh
   cinxjJlwqLeRDkU5hW48aE/NNnm2j5b2n62frS730pBfOunYoO4f1blRK
   w==;
X-CSE-ConnectionGUID: GValBBf8QQembWoJCJzp4Q==
X-CSE-MsgGUID: /ciSsB/KQYquIiu1xI4rcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36076029"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36076029"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 00:50:59 -0700
X-CSE-ConnectionGUID: Z2jXNcyZT2Ws50F1xNE4AQ==
X-CSE-MsgGUID: kNbww6YrRGKBv8N3TtzGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69433140"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Sep 2024 00:50:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqSz8-000Ax4-2f;
	Tue, 17 Sep 2024 07:50:54 +0000
Date: Tue, 17 Sep 2024 15:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Haener <michael.haener@siemens.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against
 symbol 'init_task'; recompile with -fPIC
Message-ID: <202409171519.1IhuuqTs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a430d95c5efa2b545d26a094eb5f624e36732af0
commit: 45121fcbe7d200c1269804b5e191ce788fdc8364 dt-bindings: tpm: Add st,st33ktpm2xi2c
date:   4 months ago
config: powerpc-randconfig-003-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171519.1IhuuqTs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171519.1IhuuqTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171519.1IhuuqTs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'init_task'; recompile with -fPIC
   >>> defined in vmlinux.a(init/init_task.o)
   >>> referenced by head_44x.S:100 (arch/powerpc/kernel/head_44x.S:100)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x3E) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol 'init_task'; recompile with -fPIC
   >>> defined in vmlinux.a(init/init_task.o)
   >>> referenced by head_44x.S:101 (arch/powerpc/kernel/head_44x.S:101)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x42) in archive vmlinux.a
--
>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against symbol 'init_thread_union'; recompile with -fPIC
   >>> defined in ./arch/powerpc/kernel/vmlinux.lds:135
   >>> referenced by head_44x.S:108 (arch/powerpc/kernel/head_44x.S:108)
   >>>               arch/powerpc/kernel/head_44x.o:(.head.text+0x4E) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
