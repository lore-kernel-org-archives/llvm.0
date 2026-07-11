Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ED42066DE;
	Sat, 11 Jul 2026 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774512; cv=none; b=MPpqCYNI3JOyOkzOeL+mWEAL9N10jCoQAi9RKexR3Uc+vZcGLBHAO4O2Q6yXrjqNEibO7jm4ZxR1gdasWMrPB6xfD+i63RcMRMKruWxKlcwFew6NRLd4jakwgZmY24J5KlFO+mw3G/tsLTGNQskOhuKO93kgCI7CA0nEKH7nrK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774512; c=relaxed/simple;
	bh=KLvfqxDQOgWJJEPKl5IOol6BRLJi1B+sGPcW7aM2dUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h9iiCAyEAssCAxfnLIEAFIEv7qrkeil1SLUiBiqpmJTTb5x6ScI8oWHV+roh02QLSc9IpNL/e5f/v5cyU9ibyscym7k7BuwtkZkpsF3TPQpR1jghubuvpnUCYyAGTUNqqWJ5K9DvzdCsProo3RtlCx8CiSbFzhdvNyxr2wDfx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URc5m1ht; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URc5m1ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783774511; x=1815310511;
  h=date:from:to:cc:subject:message-id;
  bh=KLvfqxDQOgWJJEPKl5IOol6BRLJi1B+sGPcW7aM2dUk=;
  b=URc5m1htAkXJsUbJrTJXe1i665WpthNNlWSWDYQVVEMa0cD35dio00x/
   +P5uRy67URGfuVpyyrxgMEWrFuEuAymutqclNjcBRFJ2stui97VmxZdvP
   3hFLbHrbPhJHzkzj2YHyIjNnN0qZLbGuvPYRRCOhx1m1A3PWrw7LUfTtP
   92vb7CPCENBLb5+RjKrb9BhSPJ0e5lvXqJrtT83bcbIObvHnEKcpalnF+
   SoCfwBqy8P6yZdaau+MTEsEmUfLhdFkEYNSvesaRPdVr3QcWsyTo7PZJq
   uaYDuNDrxVPuQPazG1L0Bt/m1gJVl2aSnLmiuIC2cL9oCggK9GX3+3DBK
   Q==;
X-CSE-ConnectionGUID: 10HBA+skRcyw1QaUoHyzgg==
X-CSE-MsgGUID: omf5CqpfQsOvrdGxlvR3PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95605786"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95605786"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 05:55:11 -0700
X-CSE-ConnectionGUID: VBFrEblqSnOL1GWm5YF4Og==
X-CSE-MsgGUID: kocAmlEoQQOSsoWhbxCp9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251146345"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2026 05:55:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiXEU-00000000K3p-3XMg;
	Sat, 11 Jul 2026 12:55:03 +0000
Date: Sat, 11 Jul 2026 20:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/frpc_demo 16/88] make[3]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/'.
Message-ID: <202607112040.ts5clvyD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/frpc_demo
head:   c465ecabc7dee9cfb5640b25a4d75a5cad9f33da
commit: 288801685d71376da5644b5f11ea806fc06ccea1 [16/88] hexagon: add device tree support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260711/202607112040.ts5clvyD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607112040.ts5clvyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607112040.ts5clvyD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/'.
   make[3]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
