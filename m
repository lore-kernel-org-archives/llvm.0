Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFE98BFD;
	Sat,  2 Mar 2024 03:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709351893; cv=none; b=SIKyFuI5+4oE+dum3FZVJpwJ+KPdVT0pJ8cZsfzQmraOeIvFBQuwIPLcyJqVbCO4VQ2HV3slPpurad+gdGJupwskQ5PS1z8rND+qybgSzUMxJeWMN8Mvs/gi3aLEbNzIdPFXXBq/i55hjGao3S0KVq5b1Xn2d5Svfb/VtgnVNvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709351893; c=relaxed/simple;
	bh=G2J5agBzj3aBA6n/a8xaG2AY1mnvnS2JEuKi+exc2iI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEj5BEhzjSNeD5MHiDFTw2XuL2KpA+WO1OGwqmhJajRnHDhjpaoVdslQxyyC4a0+aPIFhUzkDPixh+ffpOYt8SPRRbPxDuoy7MURrx3EiFn6Ho1OZiHRuKnibPokyT44UjXYI9+te/uAE62JQmBAH0Sy+pQVG10GN+C2TnaN4to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fQIRIZvL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQIRIZvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709351891; x=1740887891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G2J5agBzj3aBA6n/a8xaG2AY1mnvnS2JEuKi+exc2iI=;
  b=fQIRIZvLE1CYhK3GrTIwIFh0lblO3eVe4Gw9a2uhCbqbdpD2N51UM1zP
   +1gi3EEugPP46eSZ/TFR1U9X2QqF7S8Jatzyk+Fd+moEkpR2/bI8ztimk
   5ZlA0MIbquFYMP3iVgmLJxWDFkEI+j0X6lTt0C96vVwvuguZRPiFETuP+
   uSNcj0AhQgUE1+zm4XhmFlR10Ohzrrub+9j/YuBtDqaPr3J65dOR7tODL
   CANRM3cn478A7XiTYLxL5YQIlt9gdijWyK0PCifThQmrwxDEElpjDT0SJ
   eP+sCK850zDekYd9JTCLZf93v2vUtGDmiDjtuhTZiLhwSIqhSfjuKdcpY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="14484100"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="14484100"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 19:58:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="12987130"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Mar 2024 19:58:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgGVh-000EID-1N;
	Sat, 02 Mar 2024 03:58:05 +0000
Date: Sat, 2 Mar 2024 11:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>, Michael Kelley <mhklinux@outlook.com>
Subject: [hyperv:hyperv-fixes 11/12] ld.lld: error: undefined symbol:
 idle_thread_get
Message-ID: <202403021151.guImV1Gx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-fixes
head:   ea05b55de1e0af196caaa9ef70ebd0b29a0f7b45
commit: 9904eadec6dab60ab590fa800fccfc9715020e46 [11/12] x86/hyperv: Use per cpu initial stack for vtl context
config: x86_64-buildonly-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240302/202403021151.guImV1Gx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021151.guImV1Gx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021151.guImV1Gx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: idle_thread_get
   >>> referenced by hv_vtl.c
   >>>               arch/x86/hyperv/hv_vtl.o:(hv_vtl_wakeup_secondary_cpu) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
