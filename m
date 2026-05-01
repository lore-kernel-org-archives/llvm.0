Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB2837475D;
	Fri,  1 May 2026 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626293; cv=none; b=gwG0z3dz8oEUvqR28aB6jkGtZjkQrVgLhNoDVQYd/C5DpeLVQeLWQfyeA4LjnCWcH7EHevHj4y7XLXPdTbFb7zU0tn/TpWODa1lyu/xBx3hV1ggxWqdQgQtuQgPp0TfmKRl/W/r3HOqoDHRx/M5UMHi7VIi/eWTX3In9EjbY4ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626293; c=relaxed/simple;
	bh=9H6uPfhdx3mgF07ZoLv4tqSdJ32jwJX5Omtvu+kPbV8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OfrDLptKXf+6THfTYs0xZelc+LqPDte/In5HsR4JDU3+9A7saUnU/UZXWi8RQc+3wT2PtuTDdvrQPCs0MAGmyFko6hm/Ye2oVrYxhblCblSglCuARIHz2+Bd5x0lhZwlstK3hYhLwMOxWvTsQ3rTDVPckXh3yBEQfETKkIBFfnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3s8+9xb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3s8+9xb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777626292; x=1809162292;
  h=date:from:to:cc:subject:message-id;
  bh=9H6uPfhdx3mgF07ZoLv4tqSdJ32jwJX5Omtvu+kPbV8=;
  b=F3s8+9xbyseoA2y1gsvTjHoBA4Fx0ULR7JwtHvqCA3mZDcyRHBUn5H3h
   vqmhlwN6EGuo9v1taa732noMkmhb7hugQkpCI26Dmssi4D89B4/5yUGJV
   82v0OGaHitU4StNajLngn0zY/PhcdAeM3Wr7XxrfvXkoldtPAvwXANIV0
   5Vne5WseQuI0XzU4ZgDbgXFuXFc/qxOFuQheCCGVKT/930wLm2RtmY7Kv
   pcoylrH14XFF9IUxmlbGqYsxu8h7YZ3jPV8EzfjAxBIYrGEps79bvpADO
   YvgXkxnS1WCwrzLHkMjTqc4qzcjUP2n45l3BMnu1YY5trdKIl4valAesM
   w==;
X-CSE-ConnectionGUID: HQb5EgFOSp21G7ZZDUyX3w==
X-CSE-MsgGUID: 1WRauMTYQPCdHv3Qo+yoEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82442979"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="82442979"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 02:04:51 -0700
X-CSE-ConnectionGUID: DbFAi0spSs+zSvcWpd+jew==
X-CSE-MsgGUID: VvVSA4QaSO6H3zfTmEHJLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="230472542"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 May 2026 02:04:49 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIjnj-000000000O5-20L9;
	Fri, 01 May 2026 09:04:47 +0000
Date: Fri, 01 May 2026 17:04:35 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/glink 20/56] make[3]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by
 'arch/hexagon/boot/dts/dtbs-list'.
Message-ID: <202605011611.Wzc2fUUk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/glink
head:   5d897d0f6b0bbd170ef332eeae9a8329ec812a5e
commit: 626b4f9eccb43ebe6fdce2736241acefc252d435 [20/56] hexagon: update build system and Kconfig
config: hexagon-randconfig-002-20260501 (https://download.01.org/0day-ci/archive/20260501/202605011611.Wzc2fUUk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011611.Wzc2fUUk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011611.Wzc2fUUk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/dtbs-list'.
   make[3]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
