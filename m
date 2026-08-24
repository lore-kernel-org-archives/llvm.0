Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3315C1DB13A;
	Mon, 24 Aug 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568105; cv=none; b=TzV7APsZvGEQqIOGict0qG5iF9KbTGyLucPtkSWQ1pW3VcEO9XRZeuvWeApDiE7+G1Hj+ZIefuQNbeeV2CIUCGHwojdV6phSafkSsU2VLF+VH29vCDI/Az8KmyX0rjnh1HMTGSba5uGznwYhiYphHIenQNbHzMRemmJRvZv6L7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568105; c=relaxed/simple;
	bh=XTsjfsTyTl/uNZKrbGX/ymwsiENFZieQl/9usonbpVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jb+qarAIV7knWaPcZJy7ePyVkDpqkk0QhT5ljHjpadZ+OYTmjx9dOZMLAO26anU1KlyXoEfphYvJoScLNLhy49m+RDtDSlb93jXyuQNQKydlsRLl+6g5n2WBk25B5QdtZ47mOhw9Tn54UnnLXIJM/GETZttnBQBCaBSU3MN9WdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDo10ceU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDo10ceU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787568103; x=1819104103;
  h=date:from:to:cc:subject:message-id;
  bh=XTsjfsTyTl/uNZKrbGX/ymwsiENFZieQl/9usonbpVk=;
  b=LDo10ceU+z35vXcvnv1g4vjtgP97rJG18YJisaV/hqHLYOfcEjxtU1ai
   V93LVlJmi6BCfKKm/0JGHql+pqF+4Y0/N4WMAeO7RGaq30ljTKpWQbXX4
   IUWOVVc5A9zbB+ReAnnsMBpOsEcgs/duo0YzlS4jOG/RGQEYYvwM5EhqO
   EtNdA+qMpnFIk3oZrOl7lCyBpT6gp+M+XC9Wi9Mrcr+6fcb4GgrR5QeLf
   A5OaCQ4HUvck+h1SeCfcIh2XzyCdQjuhRx7v+n9iiDopNrLVFhKiABXS9
   D12HByPRlZx6JywmC7CE2EQk9m8PVlLYpyC4t92e/IP2/NtofdA7+fZrE
   Q==;
X-CSE-ConnectionGUID: EUappK5xTtionyPkgrXc8w==
X-CSE-MsgGUID: w3Qw8emjRY2ZxMVXI2j9uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99367900"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="99367900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 03:41:43 -0700
X-CSE-ConnectionGUID: ozKQAKuQTiaKvE0x9jC73g==
X-CSE-MsgGUID: afiU52CfQWG+czjMzqzcMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267535400"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Aug 2026 03:41:41 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyS7R-000000002o3-2qfw;
	Mon, 24 Aug 2026 10:41:35 +0000
Date: Mon, 24 Aug 2026 18:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 20/87] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/'.
Message-ID: <202608241843.sbV6QM30-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Richard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   844bcfb5bee7bf0e713f61307dc2a4e16963c2f9
commit: abe97c987224d2686550fd938cd15c284c1132c3 [20/87] hexagon: update build system and Kconfig
config: hexagon-randconfig-001-20260824 (https://download.01.org/0day-ci/archive/20260824/202608241843.sbV6QM30-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608241843.sbV6QM30-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608241843.sbV6QM30-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
