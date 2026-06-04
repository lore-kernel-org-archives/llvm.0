Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C087843C04D;
	Thu,  4 Jun 2026 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583260; cv=none; b=GvKa60xBWsweibn+gAsvkZvIAkQes19OU7VXSJ8JtpB1D7GCa0XMZJ12sAWBPz5rnkZRM5jUVyqaEnbO5ahWzKTpRq7JCT7OluOO67GlduNdGrVdBvkIEwigOEKSscsqjb3aLWdngnriQK7K8oqzwqu+rBhXOtpOyAdlIUG6noQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583260; c=relaxed/simple;
	bh=KzsOARcUHy5Z95ChsqhLFWb0tnMhBmaxAQFtWj+plgk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mErDFVaGAwaCJhpSlE/zfO5pgZ/OnVuQWEYW7XkG+BVfdiMyHtMQjZ/r1nIuBEgQrtv79LFQqoND5nmIastDjuzm9ljfOu63+ArhDO7Rij80UkMtdzJXW2Hw3qXE7LwgokPlKTwr9vBKR0+o3duPYhw1Y4YuuLw9dT1zgHvwJZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JpcDKNb2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JpcDKNb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780583258; x=1812119258;
  h=date:from:to:cc:subject:message-id;
  bh=KzsOARcUHy5Z95ChsqhLFWb0tnMhBmaxAQFtWj+plgk=;
  b=JpcDKNb2CJl85/chBlr6CvtSx+RpXipc1L7tIad8u9ND0TB1KmfDUQ01
   2nMjR4u4hPAlXyCMhOGncNXspW75ycvOz+QpfKjT1BrYbZ2QLjMObw5KC
   nV8L1Pj5WvltK0R79sUNjCb9KSZx46ZtyEXMhSAyDKKVHkOqrZdplFfTh
   J2YiYS48aL6mLLfdqLurv83uEJnuKABjHbK2csazInVrq0MZ0+JE8GkO8
   /QatZEIxlqIbjFbz2soahXBASZ3YgGYvnF6NS/FY/li0SApr6i7tDpC4b
   yNl3gVH2Td5T8XO/47yJS4c6HpHYtcE5zYI0eHj0KSqN9fGsY6xBcR3G4
   A==;
X-CSE-ConnectionGUID: 8BxUa13hRK6JqT69uOtAmQ==
X-CSE-MsgGUID: tfduBLGtRQ+YG7tM0uxndQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80550179"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="80550179"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 07:27:38 -0700
X-CSE-ConnectionGUID: sLOtSunmTuaPxzyhkGlZ/A==
X-CSE-MsgGUID: +Q3XDrCAQL+G/wwfQUed2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="243482529"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jun 2026 07:27:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV92i-00000000EoQ-46G7;
	Thu, 04 Jun 2026 14:27:32 +0000
Date: Thu, 04 Jun 2026 22:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [jirislaby:next_master 96/223] Warning: fs/fuse/cuse.c:324
 Excess function parameter 'fm' description in 'cuse_process_init_reply'
Message-ID: <202606042221.yazkgFun-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git next_master
head:   550604d6c9b9efc8d068aff94dc301694a7afdee
commit: 2fc247190dcde0aee3596b0fb87a0b5afa600941 [96/223] Merge branch 'docs-next' of git://git.lwn.net/linux.git
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260604/202606042221.yazkgFun-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606042221.yazkgFun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606042221.yazkgFun-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/fuse/cuse.c:324 Excess function parameter 'fm' description in 'cuse_process_init_reply'
>> Warning: fs/fuse/cuse.c:324 Excess function parameter 'fm' description in 'cuse_process_init_reply'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
