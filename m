Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A7727145F;
	Tue, 28 Oct 2025 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761685500; cv=none; b=ik+58MbkGksy2YEhe2MCw0NSEGE7fzJQp+nioaOazFZ1y/vAf+tG8GIL6HeYoWGd/FHHDdMv6Vjb45gH39F+dHgaIiQ5KMR3eUA+AXeY9+kvwtJGsxdBNokPqVd5tEdagi6rB/PhA1XQYL0YAXH/xKWzW9NPHD2W1wNeVJP+eEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761685500; c=relaxed/simple;
	bh=rmqLftlsBNdXnnkAR7lZ+tywGGLzWBpRNcfVK/0meg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmeoxZ9E0a/NMi7YCXZyYKFTXbyMtc6wx6HREDFAyUxu3KGl8BW6iyMq5d4vsafHkmCNHFTkHiAycQ9Z7Esz6Y7LeLQR2gobi/hbSB9yhBlardd4h1bA41KAs4iUpPCBD6Kp22EOQ9GnN3usG3qmd8DDZbwHUfW9bs9riqsoZU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxxXPekw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxxXPekw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761685499; x=1793221499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rmqLftlsBNdXnnkAR7lZ+tywGGLzWBpRNcfVK/0meg8=;
  b=ZxxXPekwn67vUdjdQYJR3I4qXITdaXp4puC7xajwD+k6m0OZU+j9Y91f
   b1L/j9QBj1E7MWn8J9p9PHN256KOs6KeUkwerTcwg1vyqB29+BI0rvN/Y
   xWD8E9F74mjSky4mQbHE2oAVliXmk6DRyoTlLXUxeeuJR1XIKpzcp1ch/
   RKv25ZwwqkSw0rMBp5P2CTTTgV6fYXcoTJ5klDBzplFmS6X3E/RPPX1YN
   aRj3mMvA35Gc9ieiEN7UjgqlI9ScNucqmvevPhTjaMVTXzR0n0rHC+ZP0
   rjXEQsIdHuIh6KTrULa3hJKIkxPPyAf+bRKXAXEVPNWBdvSGy2Z2g4Ula
   w==;
X-CSE-ConnectionGUID: 85p3LmERReCcxGorQzCMUg==
X-CSE-MsgGUID: MD9eGCJ6SPidLm7a1SG1xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63893711"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="63893711"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 14:04:58 -0700
X-CSE-ConnectionGUID: 4/x5vsZZQgisOVj1fEzR/w==
X-CSE-MsgGUID: DXiEzOBYR028r8ZOuP6XhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="186213386"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2025 14:04:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDqrz-000Jkh-2m;
	Tue, 28 Oct 2025 21:04:47 +0000
Date: Wed, 29 Oct 2025 05:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:pmc 24/27] WARNING: modpost: vmlinux: section
 mismatch in reference: tegra_pmc_init_common+0x18 (section: .text.unlikely.)
 -> tegra_pmc_detect_tz_only (section: .init.text)
Message-ID: <202510290554.zg2t46AN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux pmc
head:   595a9703442efc488422dd3bf1209e3f1e5d49d2
commit: f8c811e8798b33a01acd81ce26d1b99e36747e10 [24/27] soc/tegra: pmc: Create PMC context dynamically
config: arm-randconfig-003-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290554.zg2t46AN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290554.zg2t46AN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290554.zg2t46AN-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tegra_pmc_init_common+0x18 (section: .text.unlikely.) -> tegra_pmc_detect_tz_only (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
