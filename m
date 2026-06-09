Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A653350D7D;
	Tue,  9 Jun 2026 22:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781045956; cv=none; b=Xl+K7xDQEzSW5b9YJEcPuYJQkclfG9CAmC/TKTEh7gIyxnSmFA6G59yMHr/x4TaA1o4uaET+mJ0JA+kWRoLJ6IQhJGEkWb+RMG7ftULLfktk/hnBWPoYXP77GzGem69Qs8MUFgpTaIXHbDRiS+glvvrnZPe6frhoiCb9GBxPyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781045956; c=relaxed/simple;
	bh=J2MD9Brt9R+jVdunqmgZpnQzi5vQphTnRKoect46U24=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UQz5GckHBDtsbPrnCwaCC0bVKWU1n9ESaCJJbG4ABj+FsP/Wmt3MoV2jGgb9B2g4x4IZ6WlvifUoiVj0PJAS4Oy9aQPx+gk7miiWnJDhchlgrcZyN/5kkwjZvLJu32FvGb52eB5n8oVfKgViQqKVEXd0FUSrvD6deMmg8Iyqptk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frLC9rfm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frLC9rfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781045954; x=1812581954;
  h=date:from:to:cc:subject:message-id;
  bh=J2MD9Brt9R+jVdunqmgZpnQzi5vQphTnRKoect46U24=;
  b=frLC9rfmuYD5ae/qFHe/c9GO9gFlO+j3qihVlpbXhpMWlGjxeGYunWXF
   BikaOv9DEUO5OFEIHGSDUeNzV6JPU3+6J51V+qzBHGMSNpuBO96oYgHFt
   iU88F/4fhpqQUud5TlSjVaqu7z8PaTMcnwgLm1zfkC+WYeIDLYy+Isee9
   +3Oo4tGGNoKWLIieRK0q8IZRDbDn0PqN4+PTTO1QNfvVvbCdd2K7ldHhr
   P1GPUswfSZpQn/d+UBGBOcg6s3Ps6okYa9eyq9ZPgdCXeS2gA6Y4qhoug
   T6x7mChcQmdkXQn18YLolR6+4Oz3s5JiPGikcdH4OqadbDljhZX1jwWwA
   Q==;
X-CSE-ConnectionGUID: RsMySjPfTe6oNYp3JVxvpg==
X-CSE-MsgGUID: q+CrtVPGQkaDRUL0OSuF9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="107264583"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="107264583"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 15:59:14 -0700
X-CSE-ConnectionGUID: UzVcAJ5xQfOPq+ALeze/bA==
X-CSE-MsgGUID: YHZKDrVjQqqlBpQ6d3QYxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245854785"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2026 15:59:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX5PZ-00000000Ke6-2ZGD;
	Tue, 09 Jun 2026 22:59:09 +0000
Date: Wed, 10 Jun 2026 06:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 16/51] make[3]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by
 'arch/hexagon/boot/dts/dtbs-list'.
Message-ID: <202606100649.5cvzLk1r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   c850792455fb50ac41c7100e7d6f5f834d3141ee
commit: 92ffe54f0f99ec61fbcf52c66862fb29d279ac9a [16/51] hexagon: add device tree support
config: hexagon-randconfig-002-20260610 (https://download.01.org/0day-ci/archive/20260610/202606100649.5cvzLk1r-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100649.5cvzLk1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606100649.5cvzLk1r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/dtbs-list'.
   make[3]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
