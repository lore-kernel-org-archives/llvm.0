Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C55372B52;
	Fri, 27 Feb 2026 08:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772180560; cv=none; b=ODmlmLYuNSQvBupCXAe8SBBu7cOkG9DAntbMcUpzAHavMSunR9FDx4tkf//IyVN1XzTTkenBBRON0DCHeLI51g6/18PRli/jKhSrfGsLyrlL6UD/6iak0P21m523/cJq6O2HdfZuw2rPP1RMGhuBXqZI03RqJZAKECa80qw+s5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772180560; c=relaxed/simple;
	bh=Ggu/6bF4/9ukRadrcDP6ItbKIcOTzi8D3vIIlflOYBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JW3GqCXaVmRb3Fx+VbFbmT9vH67YE/QqVLBnl+gnYo4mQYDTB/26tcUZIykoE5zPoHmy8WqG+TFe8pk5kMd/BuoujK701tjTHoeXI4nY1mzhcMr1unNOyk46bZy1jMGlqnjf9hHvD3UkRjco/vydTChIO6rQmKuyMA409xGmXlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1eXyrJU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1eXyrJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772180558; x=1803716558;
  h=date:from:to:cc:subject:message-id;
  bh=Ggu/6bF4/9ukRadrcDP6ItbKIcOTzi8D3vIIlflOYBE=;
  b=g1eXyrJUL8kA0GP3Newu7sHgXiYSvdsfoRTNHw00HErw8ZNwh+J6CUnV
   wJJ0yTeXTTiDmLScXaXAGdMl1BpSt2CecgMjHodCib9UQvWoD6DXKKaFJ
   QCOjJUZ/tWg7i7LNcojbHYsk01QCRQdNV11lxX86GeB1QYfDZIP2A/P1/
   JxwuR4F4YABZnnw2Y5jXB29S1N/BxImk+QofBc2A0M6tmVtMPFaMdoLPK
   zWTMLXE4AhsjZoB9eLyYzmu37R4rkwpMvJ11IlmD1nGX6oUa7CkX41paD
   ekO2MsZZY1WvNxaSBWGE8b6jG4h9r81ta7R4+E8Yjq64tvO3DDGMtmnAn
   Q==;
X-CSE-ConnectionGUID: Qqn8nKH9QxqqZycozI+BYQ==
X-CSE-MsgGUID: ayQliCJLRn+JyBWruSkWTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73131959"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73131959"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 00:22:38 -0800
X-CSE-ConnectionGUID: OYWO2Ri2TG2RlRpliTgcnQ==
X-CSE-MsgGUID: uLozu04RQameRMjzrj7Raw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="216069675"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 Feb 2026 00:22:37 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvt7K-00000000AMN-0p5N;
	Fri, 27 Feb 2026 08:22:34 +0000
Date: Fri, 27 Feb 2026 16:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-sme-no-cpuidle 2/2] ld.lld: error:
 duplicate symbol: arch_cpu_idle_enter
Message-ID: <202602271600.xA8OnON2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-sme-no-cpuidle
head:   cb493e527146b1c3eae12bb35c71a165dc6491fd
commit: cb493e527146b1c3eae12bb35c71a165dc6491fd [2/2] arm64/fpsimd: Ensure we don't contend a SMCU from idling CPUs
config: arm64-randconfig-003-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271600.xA8OnON2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271600.xA8OnON2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271600.xA8OnON2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: arch_cpu_idle_enter
   >>> defined at process.c
   >>>            arch/arm64/kernel/process.o:(arch_cpu_idle_enter) in archive vmlinux.a
   >>> defined at topology.c
   >>>            arch/arm64/kernel/topology.o:(.text+0x104) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
