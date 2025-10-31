Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92923A1CD;
	Fri, 31 Oct 2025 19:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761938206; cv=none; b=cebxrdmuPCR8FzSuGsRO7APED4KnBDHbfQDYsRMzWc6Cdt/IBue8e4geaclqbTgpVZGhUhSDTi0pLrHnOkgpDquan+YZfYoVU3SPfIyJYBs9QUW8+AMzz6xyPHg4BT9sz9/YNLhm1zNyLO1O3Hg6Ql2FZJBaNxP3L2L+TknADYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761938206; c=relaxed/simple;
	bh=+9/UpViqJdn5LB/o1uEYW5FCLD3oDji5OcxpxzRAU+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Go03g278Cm5418hGoYMd/bIAUGepDC/ySN9US5UU+ahoJPIsW6Soq1uQMaSJh8zo7ueJXciGEKPZ+qZPAgbwXTFstHyLKhneQD6VA0jXGjBwXJut+OPS45YSnSZArpZEgUdY1GbIdTeCnb2uD3gGrWzZrAEBj3hRx5y9fCcpDAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T079x+KH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T079x+KH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761938205; x=1793474205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+9/UpViqJdn5LB/o1uEYW5FCLD3oDji5OcxpxzRAU+0=;
  b=T079x+KHjvGG8ePA7iWd8RLD58SDJzyEGqefpUzyQbmYOFScjrfGYn4m
   A/McBSBA2BklHvnRBlFwNBiANuLBZnPZERYuodwnA7p9TIfQWWhS3x+eK
   WjOtEaTIDMBcTcL77GmCLgt1SZLtsT2m4rf+mo+CzQrSqq24fhmT62yor
   sLjeWr1VvteW6IDTUaTBaEanQEq4GQMY2xvVXpPQre41H7nYlBaIkINE0
   zyWwpAob7qoFym6tKX7DB5CArnnLioIK6uix5GkPev9/CB9MCpTaIrYTb
   ZOlM+gItF0jGtRWRz/bbzed1MxPZQge66Ynt+77QHbRZrPiIbFvxBkMLl
   A==;
X-CSE-ConnectionGUID: znwFK568R/+xtrvvtPDIiA==
X-CSE-MsgGUID: 4yHXv7BOT2GGofmmrJdsTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64011142"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64011142"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 12:16:44 -0700
X-CSE-ConnectionGUID: Gp27Z5oaT06mygqL4SSVsA==
X-CSE-MsgGUID: syiqhr9ASsWESjVreTgwcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="217148119"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2025 12:16:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEuc4-000NaO-2P;
	Fri, 31 Oct 2025 19:16:40 +0000
Date: Sat, 1 Nov 2025 03:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Xiang Gao <xiang@kernel.org>, linux-erofs@lists.ozlabs.org
Subject: [xiang-erofs:dev-test 2/2] ld.lld: error: relocation R_PPC_ADDR16_HI
 cannot be used against local symbol; recompile with -fPIC
Message-ID: <202511010331.SSF687V8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   3bf692888f2707392872a69cd125c800778e72e2
commit: 3bf692888f2707392872a69cd125c800778e72e2 [2/2] erofs: avoid infinite loop due to incomplete zstd-compressed data
config: powerpc-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511010331.SSF687V8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010331.SSF687V8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010331.SSF687V8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against local symbol; recompile with -fPIC
   >>> defined in vmlinux.a(arch/powerpc/kernel/head_85xx.o)
   >>> referenced by head_85xx.S:186 (arch/powerpc/kernel/head_85xx.S:186)
   >>>               arch/powerpc/kernel/head_85xx.o:(.head.text+0x3ea) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
