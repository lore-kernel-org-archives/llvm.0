Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1443122D4C3;
	Tue, 10 Feb 2026 02:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689654; cv=none; b=WnrCaWDT5h0uWTgTZmKTJ61B9yycqX/PICD29R1K4jZ5L8G78Oqo1QjnNygDuvVm+hrEh2AWGhHrXZz5FSBV3QVdxI+lL5dDR9cTXcgi4mE4wsY1U4AcK9OHa/NXPuxM6HUKfj9+Km9QvkCh8x0j/sYXwD55OuJaNj9zADGw0s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689654; c=relaxed/simple;
	bh=KqpPNRuJOqMq9UeSsEX9Bncq6eMe+R1v6yCoeEyB1mY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oaJ/eQdjUbeblf2tHv92HIryG/yKVgZC43+4AhMG826NrBL8z+w/WVs4DgzzIakN4XVs14LN6Nh97O36hjRZYG0zxFxZFrQ/E+ZOwOakQNqSzGehh+A1mtRvnzTPqoa0Sj7Szqi0xBncoVBkpdV7vu5iIVMrRl58IpXqiZjZPKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joUEfMDC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joUEfMDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770689653; x=1802225653;
  h=date:from:to:cc:subject:message-id;
  bh=KqpPNRuJOqMq9UeSsEX9Bncq6eMe+R1v6yCoeEyB1mY=;
  b=joUEfMDCS33eyCe2CMzCap1r4KiCOCAw5JZOa7LZIxvlylWdCXeZfznc
   Qhw3FUZjLuJcasT7j/Ga04PckcSiTP6QUU+NIoWnIP44pFlDiRyVNvJo8
   b5R77AebXkHDA4vmJT5W+2adsTNZupLhMXPP7E0fR75kpls4QOq9yYoQf
   jCqT91prNH7Wj6hTGEApx83RjKYmTbK+8blywCfhgXUoHjiFTZq/q7ke8
   xgL5V/oTztE0EnRvky+e8vc0zJ/uH3MPB+3+dzQpIwjT2VQsUFaHavN29
   ReStXpUwPx9acLw37jBfFw3EAvf4gyZOto/kqB035x9YlVi4zxUFZ+jQo
   A==;
X-CSE-ConnectionGUID: QUABLPT2QvWN4hRRQMdFKQ==
X-CSE-MsgGUID: 380u26A0QgWhndo+gUdZjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89393588"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89393588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:14:12 -0800
X-CSE-ConnectionGUID: 83Pr4ssfRcGR8s60vn8Xtw==
X-CSE-MsgGUID: WTAzt5MnQy6e6j8G7tfL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210879779"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Feb 2026 18:14:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpdGS-00000000oWM-3oC4;
	Tue, 10 Feb 2026 02:14:08 +0000
Date: Tue, 10 Feb 2026 10:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 2/3] ld.lld: error: undefined symbol:
 nfsd_nl_svc_export_rsp_doit
Message-ID: <202602101051.Ik74zHQC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   c85f01c61c12fb4d6f368ae8e37e83a9d6fd0305
commit: 0e13ddc5e80de4eb58edd0a542ece89747043045 [2/3] nfsd: add new netlink spec for svc_export upcall
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260210/202602101051.Ik74zHQC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101051.Ik74zHQC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101051.Ik74zHQC-lkp@intel.com/

Note: the jlayton/kdevops HEAD c85f01c61c12fb4d6f368ae8e37e83a9d6fd0305 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nfsd_nl_svc_export_rsp_doit
   >>> referenced by netlink.c
   >>>               fs/nfsd/netlink.o:(nfsd_nl_ops) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
