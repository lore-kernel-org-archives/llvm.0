Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC9313E34;
	Sun, 12 Jul 2026 16:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873318; cv=none; b=uF3grJXESClvdkxkD8ybjgrnuVBt405Q4RzeKS8r3YmdcYPtgWD4PfbYb6ciNBcPOvtxo/uOTtoCroTHxT1PWJ4+qlSxiavs+yxPBIIYO+VgEviId8eL2yP953MIHUi43nc5ZBeuWgnyP14SNUMRc9wMk2mFmYnxfFD540Op2eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873318; c=relaxed/simple;
	bh=HHaeIMOJcDfJT6YMP+7QFmxgOconXrfDDjnvzr4C8+M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OHEVbXLtUfKEHXjdgDgjVQN2tejMFN8DjJP8W6S6nXJDaFfpoL9PoR3XUP8shRAiNQtGo49dhH8jacK8t54dYQSug6hJqMAHy1VaFP6S+i0HXBJWBbuTxrL11+mp2NhFjRq+AgWVtKOuOPqSWX8B7XHbALVE3ksZcOipXJSawzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ehrcYw6U; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehrcYw6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783873316; x=1815409316;
  h=date:from:to:cc:subject:message-id;
  bh=HHaeIMOJcDfJT6YMP+7QFmxgOconXrfDDjnvzr4C8+M=;
  b=ehrcYw6UAF1w7Dn9Ja8HDepzZ2cUgqePNluIPj6PFqefR22F6QGlTSxm
   PK7MBnYoDnP2z1VruGLxy8guDSRaFhdm02HC9dTLt2ZV8k8YBSJ7NeNBV
   DasUjv8YBUHHbFtUBmkP1r82LG9mh48q6MPTCEz4LD1ERp5Q6zIca0TWZ
   pnBHXu5TV6bOBkxYqXDlG+i0oAn++VKsjYD+x+B7Ax0HDazDJTbrrjk9G
   o5zQI7xm8nJlhGkmhr0FOjKMytmrm0sdEGsGX+w7ArVcplc8GQfNWXwhL
   R6B6GijaDd0VQb5OTumdsPGO0Ju8A5gn0agbNr6WB1QmebUtMUzOY5wE8
   Q==;
X-CSE-ConnectionGUID: M23yvOtqSd+hRxmPnmK5PA==
X-CSE-MsgGUID: mjCy1H+oQw+7sDo1N/fHoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87042916"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87042916"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 09:21:55 -0700
X-CSE-ConnectionGUID: 1aNiY4zFSPSlNn6Qq8ADpA==
X-CSE-MsgGUID: NeZZXnMYT5GC9wPNKR03Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253592856"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Jul 2026 09:21:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiwwB-00000000KzO-1ieI;
	Sun, 12 Jul 2026 16:21:51 +0000
Date: Mon, 13 Jul 2026 00:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/frpc_demo 29/88]
 arch/hexagon/platform/common/sirc.c:27:10: fatal error:
 'asm/platform/comet/comet_iomap.h' file not found
Message-ID: <202607130034.XNR8HsFg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/frpc_demo
head:   c465ecabc7dee9cfb5640b25a4d75a5cad9f33da
commit: 12fd46955be7f61de60817e37d783304e9c43241 [29/88] hexagon: add platform infrastructure and common code
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260713/202607130034.XNR8HsFg-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130034.XNR8HsFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130034.XNR8HsFg-lkp@intel.com/

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
