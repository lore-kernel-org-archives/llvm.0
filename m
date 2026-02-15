Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429E03EBF3D;
	Sun, 15 Feb 2026 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771130298; cv=none; b=s0hFF8pVpoSd01lGkyBBC1bhpZ75iFqNav1HZphEAeiNiiQwwwf2i9K2Iu/rGe1WqkqRF5EG/JSFAnzUl7LqYL4gSMwHXgxMlj26ib2Ruoh4WTdPcbAfH9783B1V26j569qL2wEUavJ5hP1vwJt3yZIkj5cF938X4NIpvtZZH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771130298; c=relaxed/simple;
	bh=3/wAbu8rV5ryBRsdN41IzbuoNEcidlKgl+N6grvUhnY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qo93BzcfaR5jRYl3ZIXtSAdFC7C9Q8tA06nQSjs5weu5SZ1yEaUsWyEZmuNq3GeVDKU0fhUXouEzGne8FXDohddKR512YmILDqY/3fUKXx62gsVzIN913pIzSVWLh+KC+cMACh59StVxUnpnB2BDqPmVdAibRr7UQfKBuJmypmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsTqXTHt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsTqXTHt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771130297; x=1802666297;
  h=date:from:to:cc:subject:message-id;
  bh=3/wAbu8rV5ryBRsdN41IzbuoNEcidlKgl+N6grvUhnY=;
  b=FsTqXTHtvvNgts8WCX5wE8enh3QXFwD3BdBTTR4Cue3g8WlughoqdQRn
   a5SuKkzXKe2mFei6ytxDaX5f0obud7k4tC5Luyqch6qPP18PLHE8dpaKr
   ESFyLKKLD48Vd7qTdOciJcLwHFA8ZYIlWRUqcWdBKtTH98yPnqscap56a
   kGLcpEe/NDjSMCknS6HSrifCjusUXh78B6ZHDTiy1tYT2yVCNBk3mpZFW
   6zvg9Le0JNkE5VJvUcigOepcV2MMEMH0H8eVDxM9kK0YiJm/yde2wmoK2
   yn8z2ExgMl20ES2pYScjW0kvxi9afmqXxLEMKuYK0IQW0B3dd79e8+IRE
   Q==;
X-CSE-ConnectionGUID: T5uYxi6ySpCyu5mQWlnO5A==
X-CSE-MsgGUID: hHrNp76lTx28ghC3o2tvDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72302924"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="72302924"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 20:38:15 -0800
X-CSE-ConnectionGUID: JANI0RDwSmeaYzlPjFptMQ==
X-CSE-MsgGUID: KlzTxDujSvSYvlU3m1Q0Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="213122813"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2026 20:38:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrTtb-00000000xQX-13Zw;
	Sun, 15 Feb 2026 04:38:11 +0000
Date: Sun, 15 Feb 2026 12:38:06 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 29/39]
 arch/hexagon/platform/common/sirc.c:27:10: fatal error:
 'asm/platform/comet/comet_iomap.h' file not found
Message-ID: <202602151250.f80I6lm7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   04e61eabbab151166a0cfc4bb76348b0fb7451ce
commit: 55fc64c62c2f4b636e24d978d2d856bc99cf1f5c [29/39] hexagon: add platform infrastructure and common code
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260215/202602151250.f80I6lm7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151250.f80I6lm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151250.f80I6lm7-lkp@intel.com/

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
