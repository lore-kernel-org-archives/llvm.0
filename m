Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8117736;
	Sun, 15 Feb 2026 02:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771123465; cv=none; b=GMVeINWkDg5KhQ/kQiLvdA7XbZ/n1FWsud/fFfOu3TizSNYsjPDD42XSmLCHCpZelNe6szXbymyjrIJjnviylaM0VXFTydBsdiLZ52+cLwofNshOqRwBta07GG8a4OHvvgR1AsfjNyrmWXRaTuyh6Q6Bykb+NgsycARBGB4K2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771123465; c=relaxed/simple;
	bh=WtoapNoDrxRaQXqZAGIjn0/840J41gSI++CAzzcxtnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YFoXZwdEptrkg40VO07otyozxP00II7aG1aosDnmlFFc1vKtbJmUGrpGZAJWombfwFf/JLY9LfhGz3uyZ+p5x9M/2py4sdP4+uQ97Zu2bZFHfQmoTE9R7fT3q0Kve7LtwI/epDxgLcdTa5E6HU5TuC2Vfc0CyVuzOPkypqMc8l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sy+H4XUf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sy+H4XUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771123463; x=1802659463;
  h=date:from:to:cc:subject:message-id;
  bh=WtoapNoDrxRaQXqZAGIjn0/840J41gSI++CAzzcxtnQ=;
  b=Sy+H4XUfOY6bVzKpbJ8KEBTHWD8dk1EC52rKVGIw08suu9HVem5ZQQAu
   18xP4kDfowP4u/6DVmSNyCuRCdlgJI2Yq8Uzw1dNimaxsIHg2IUSCtyE5
   Vbh1Yge2WmIaxkubIFiQ2pYflpBYXRVKimtZG8Dh0rewtse3xAxTphwqT
   1J1bznSTDfgCYaIOolXhrtJLh3Gsbvu41GQSaaheyt8JzAhFeHPmjSfjC
   6CwNQOn2P3iYlMe2iZXFNaoT9vvtcMU2hJDkXN2OVGbTQWBkWO5MoxSmj
   5UGE/8U8HJbZ+u92tZVTWF4AoN5KIgI9XGZ+vCDt/seiHTmHqihKuVNbR
   Q==;
X-CSE-ConnectionGUID: pAN4O9VVQ+OzMwm12TLzRw==
X-CSE-MsgGUID: o5SjDJWaTZmHlhaPg0NybA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="83360298"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="83360298"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 18:44:23 -0800
X-CSE-ConnectionGUID: xyQj7hB+Q0+iI2oh3uLzgg==
X-CSE-MsgGUID: gFfaCxvpSGKyVKioEBYWlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="217804448"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2026 18:44:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrS77-00000000xCS-3YLj;
	Sun, 15 Feb 2026 02:44:01 +0000
Date: Sun, 15 Feb 2026 10:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/39] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by
 'arch/hexagon/boot/dts/comet.dtb.S'.
Message-ID: <202602151004.vMG6qrJn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   04e61eabbab151166a0cfc4bb76348b0fb7451ce
commit: 82fd67081b4abe26c915c0b2f6908465047a9a85 [20/39] hexagon: update build system and Kconfig
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260215/202602151004.vMG6qrJn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151004.vMG6qrJn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151004.vMG6qrJn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/comet.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
