Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05B114D296;
	Fri, 14 Jun 2024 15:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377873; cv=none; b=CdhOAdKYdiKhjmHSWxXqrDrA/oWoecX+2Aji+AHPpAIdeeL+tY+CmUyQP3VgG0fWuRSJpybVPTRhgtIoI4a2ocNCeomWqd20e1dbmJQOf2ND7kPRe8KbnqLnUx96/G+45QM8eEF3AtmcQuXBqgW0gET84DLjrMgLqQ1RIQNFTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377873; c=relaxed/simple;
	bh=3QxMbr4BVnR+FWXmquOIfSHQwXU9wmtdEs3c9BRu4A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ul89+ZLaLlrZYNQ346xdALNigOmLnT2/gHS48Eu+VWfa3y9EMPUgl1yhFJjSMB/+VJxr7+wYHssWnxSLAwlg/qIR8QZvMtk9Cbc2PApwohm7xHp7OmhLlL5HsIxCmDpk9sWwWkIgUVEB9Qn/4Nc++hmJwnSnqWg3fpbHeA4FCYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsAFrby+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsAFrby+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718377871; x=1749913871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QxMbr4BVnR+FWXmquOIfSHQwXU9wmtdEs3c9BRu4A0=;
  b=YsAFrby+riMeO6JHGX637qiqpbOsxgY4UdyBVlKXbR4lOIRf5aE+0LyX
   Q5KQM64cd+2irMp5/+jBcthJVpYswUV3Bri5//vjvF3s32iQheqcLOwEK
   rFAVRAFq1svcvqX3iSdxCH3C2pbj0pWcejiNeASuWTELkNC5kZSGR5e7l
   PxfEaOuw+08pYJjF89rqLKUyofOCB/c6ajYQLLGBQGOdJfvJ2nUC2neX6
   4llbNFESTKey2hvdO+1E+5wbHnqTfpYkI9SWmYG1T9/5lPvvC2lVAjprc
   gTIWyjxbPB2BvAik+fqYYHsO9obZYEvR2tnZAr1p0cBu7Gink7OQ3P7Pb
   A==;
X-CSE-ConnectionGUID: 487pIivSTvaMLmbDrOGELw==
X-CSE-MsgGUID: 2kje5zscQsC28UmliSPquQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19119120"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="19119120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 08:11:08 -0700
X-CSE-ConnectionGUID: dvIWw8UHSIOZsWJQCQshbQ==
X-CSE-MsgGUID: cbzNZ/sfTgeHbZuO9LgSGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="71297905"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2024 08:11:06 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI8Zz-0001RC-19;
	Fri, 14 Jun 2024 15:11:03 +0000
Date: Fri, 14 Jun 2024 23:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Panis <jpanis@baylibre.com>
Subject: [mediatek:v6.10-next/dts64 51/53] Error:
 arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 syntax error
Message-ID: <202406142304.D63dr3NH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.10-next/dts64
head:   2f950510411a33d98eea28c22d7880eeb48adb61
commit: d7c1bde38bf37a59551cfd52cfdb5bd974b17431 [51/53] arm64: dts: mediatek: mt8186: add default thermal zones
config: arm64-randconfig-004-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142304.D63dr3NH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406142304.D63dr3NH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142304.D63dr3NH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
