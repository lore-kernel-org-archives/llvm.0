Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D7C20C02D;
	Thu, 23 Jan 2025 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737624585; cv=none; b=RBEa/614ndd0lLkzLyn4QmxA3H/yHi6ISFPp1IYRDrOlRJVzR46M1ZDvh+yU2d5lIh6zx4rRrCxprPQ8idNi2yGukRsZcWN2TnZN5QTsM3Egh1Y8CmmyuUv8Ncfpn/3YQv/VVjf0WEiRjmoLwXgzgrzZYg6OW8J2Me+/7VSPR1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737624585; c=relaxed/simple;
	bh=VYe22qgO35AJ8/892ynforS8cQlPvkJyCqycjVMMWZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rMk5y/30U+741udSV8DFMugcv44WDRZgivdxy9MtfuKEKTwpdTbRyjON7pvVIWu1VhtJ8ICk+vI6gVYqEAlyWf5BFSYlwfmfZVhfmZQLitbqkEjv5qEgaHqtQhsEBEnLhNZB/2EiNO08cfXTygLQ2TNNu+wO1Ym1b3vnSqWfgVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A1XJDAok; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1XJDAok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737624584; x=1769160584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VYe22qgO35AJ8/892ynforS8cQlPvkJyCqycjVMMWZY=;
  b=A1XJDAokUNYDeSuXnjbULtrVV1dEL+zV67YgnmxpleoaMFJ6y4IkmGzN
   ClJ2fDeCoRsXtjnftsBJxmo4SKC6BbnHatVjIzyd8oohKOkP1ATVGhsz/
   qclfwXlHlXkA0lKy4itgN9ijKgfASQnDnuSNE/+M/MRccyg1zutxJRHEM
   vE3u/F0RG7e3robYK2RL2JS9TLwlE/5n1Lculwi/qsCnjwucJZjVuNsGk
   qmU64WMkL1Edsk4SnfjcuNvAJ2CO6XF+Kw7CYN0c7cK/c557tRh6TNYp8
   MNHdO73vqC52Lw8OnJh8Mdrur+vN95xQZfDtFhyL0dxtp9KJ3XLEvjO8O
   w==;
X-CSE-ConnectionGUID: xsoTbqgBS5aseaQdVpAliw==
X-CSE-MsgGUID: /7As5aM6Sy6oFA7Wo/bUow==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38144028"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="38144028"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 01:29:44 -0800
X-CSE-ConnectionGUID: 1x3ibS8rQAS67Xr2xp+u5w==
X-CSE-MsgGUID: y6FXSsvYQOOG/Oi+eeEQyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112378101"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jan 2025 01:29:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tatWu-000azH-10;
	Thu, 23 Jan 2025 09:29:40 +0000
Date: Thu, 23 Jan 2025 17:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/crypto/intel/iaa/iaa_crypto.o: warning: objtool:
 .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202501231757.IdHkn8gk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   21266b8df5224c4f677acf9f353eecc9094731f0
commit: 317f2a64618c528539d17fe6957a64106087fbd2 objtool: Convert instrumentation_{begin,end}() to ANNOTATE
date:   7 weeks ago
config: x86_64-randconfig-007-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231757.IdHkn8gk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231757.IdHkn8gk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231757.IdHkn8gk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/intel/iaa/iaa_crypto.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
