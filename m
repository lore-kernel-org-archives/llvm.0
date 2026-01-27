Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752FD2D7D2F;
	Tue, 27 Jan 2026 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769519070; cv=none; b=EtyVQvg1pXBuw1YKADwRKGvT2yQdtwQdnkQBRbkE0fxhME860qnfks4WcgyGMRbtwM0vzYeduFJMAzgjqAg8rySe7iSN9HbgoUlQkRmaxL9SIZ2EcvitLG/eZxvbH09SOJv3EPFpYmkyt4hnCIgtq2blD85PG01/wyCkLaKnRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769519070; c=relaxed/simple;
	bh=cw/iACAWMowNqflXNfTm7PxlpQuYoiSKYuiVAxuo/xg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H8WtytCbfDzBxeGBTowz9yMAMmHBGuzN71Km9kVEo4JSYGTDMEchrNELDk7DjYrb80mAdBEUeh1Q0/gRiBGYYBWe+OR2+uFZFY9j58CxTT3mRChocFwjFwYZVj3tFcc4aLRIOvBtmx5fJ31DT/vB2HXjEmZtZXtqdtv93IYCZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgByMTlx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgByMTlx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769519069; x=1801055069;
  h=date:from:to:cc:subject:message-id;
  bh=cw/iACAWMowNqflXNfTm7PxlpQuYoiSKYuiVAxuo/xg=;
  b=AgByMTlx0Z9cABjcNzfF5C63x5m+fMBzEOq6FnC5/ih/pmJHgne2Peqw
   4vu7mBIQ2HBI5gyrlpfurklwoXDfry23q3bGK3y4io8zHG0/Cw1cMf+j2
   aT2sStKnwvkCCpLzPb8WVSj/yyP1jR5gIGZ+H2aEjsWxIlnyO1y8wDVWA
   DLt3uNIi+36T+zjvubq2OtcJ+QRRitR73KL5Nf8KSnVYr7sYN7DglV3Ud
   ZbkAtbQf4Iwneaqd44TlQy79jVOflvxoRd+9A/AQHF78k2bEf0evNNz/0
   OqT0hPpS64rv2h6EeBLNzO2AXvezQdNmpM8dRcWF0pMMjD5HHxxhggZTQ
   g==;
X-CSE-ConnectionGUID: MuKiCmrzRLSnXXbGD/HDLQ==
X-CSE-MsgGUID: gaCNeu7FTuKdgpk6gvM9AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70615395"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70615395"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 05:04:28 -0800
X-CSE-ConnectionGUID: 07fYHp5bSsWw8L61JBeBfQ==
X-CSE-MsgGUID: ylpPVGnGQr2pwUd2ykx7bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207589207"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jan 2026 05:04:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkik4-00000000YUr-17i4;
	Tue, 27 Jan 2026 13:04:24 +0000
Date: Tue, 27 Jan 2026 21:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 29/38]
 arch/hexagon/platform/common/sirc.c:27:10: fatal error:
 'asm/platform/comet/comet_iomap.h' file not found
Message-ID: <202601272144.x3y98ExS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: 27ef5458a802452357cf9fcd8f28c1a1a3c68535 [29/38] hexagon: add platform infrastructure and common code
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260127/202601272144.x3y98ExS-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272144.x3y98ExS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272144.x3y98ExS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/hexagon/platform/common/sirc.c:27:10: fatal error: 'asm/platform/comet/comet_iomap.h' file not found
      27 | #include <asm/platform/comet/comet_iomap.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +27 arch/hexagon/platform/common/sirc.c

  > 27	#include <asm/platform/comet/comet_iomap.h>
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
