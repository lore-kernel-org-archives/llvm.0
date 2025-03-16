Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726A42E338B;
	Sun, 16 Mar 2025 00:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742085957; cv=none; b=M711PJ/W/+W1ZHrkJ6SmK1k7x5acs07JkbhG+s5ksWunyalt+DXiT/hXFiecdujFrE68Ffi7lfj5i73EN6PXn3f94+K3wlbm3uXIH+AeSETVIF8GXNu/VPbih83AZdprENLJU9Brolsm/yKkiRxKX1aR1qvcRVUw+R31C8OXRA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742085957; c=relaxed/simple;
	bh=GnyUQ2wzxa/zIaLr5CDvqAQ+fJHVEE3Z3q1vbpSMHHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttKHoJC7tLZoLxfQABYPqm4nqdJ/Mayev5IWr0e7m6TPw/RwYWI3IKFdWau8/DHxgoyyA0MaLIoqcAEtSgkeU5CqqvdDkyraNnIlU8SllqblmvoXeKlCnqsq7xFdlW9UyywUkOtTBL4oL39817Vj5Brf81gmnO+M37MtBUUb/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PcfMlY4N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PcfMlY4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742085955; x=1773621955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GnyUQ2wzxa/zIaLr5CDvqAQ+fJHVEE3Z3q1vbpSMHHU=;
  b=PcfMlY4Nhb6BTikxI8jvv2NbESnZ3m70/mY0mFxb+avxb3iQ9pzMAv4S
   cAKMn1iQWw1FZ8IvNTWorM92hrJvFkS8mwiF/cose67shWXUltI5E8Zew
   1GLSG3u4FLWm8YuRiGAvDuZlPUFlTLDj7l9C2sKNFwvje7vx9wTloxMjG
   bYLw8kahVDtD5T1g8WdEGGHM3y0Ah7yY0Ms16XDrzTOnpD+NWQKIMmOHP
   9BzgayU11N2BYkpXQzzHWoiO8f3ZKKeoEsLag+N0KM28wUn3HIlHtRPsr
   LsUFh0UkZ7XNKuh/Li9og+svviA2YIufeUp3dZ0UOXGbSlBotjJk5zlw8
   A==;
X-CSE-ConnectionGUID: dMJx1kosTE++KZIxiQ5xYw==
X-CSE-MsgGUID: r1w1p1/eQfiLOFY3ZCE8kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="54585249"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="54585249"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 17:45:54 -0700
X-CSE-ConnectionGUID: JmLpDbQjSsWEoUx0b7+C1Q==
X-CSE-MsgGUID: sbKP2K/STvaNmmC9lAXcgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="126803570"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Mar 2025 17:45:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttc8U-000Bjz-2J;
	Sun, 16 Mar 2025 00:45:50 +0000
Date: Sun, 16 Mar 2025 08:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 86/105] ld.lld: error: duplicate symbol:
 acp63_rsrc
Message-ID: <202503160801.yExt0K2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   d9a06936ee9e64952e161849059f6cf096b33e4a
commit: d08220b6e32e88655f54b497fd45a3982b59093c [86/105] ASoC: amd: acp: Refactor acp63 platform resource structure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250316/202503160801.yExt0K2E-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160801.yExt0K2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160801.yExt0K2E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: acp63_rsrc
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(acp63_rsrc) in archive vmlinux.a
   >>> defined at acp-i2s.c
   >>>            sound/soc/amd/acp/acp-i2s.o:(.data+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: acp63_rsrc
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(acp63_rsrc) in archive vmlinux.a
   >>> defined at acp-legacy-common.c
   >>>            sound/soc/amd/acp/acp-legacy-common.o:(.data+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: acp63_rsrc
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(acp63_rsrc) in archive vmlinux.a
   >>> defined at acp-pdm.c
   >>>            sound/soc/amd/acp/acp-pdm.o:(.data+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
