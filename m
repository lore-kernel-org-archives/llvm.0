Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118421DA3D;
	Sun, 19 Jan 2025 23:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737330313; cv=none; b=YOLCOl/iFuHixkO9up8JFKfYZSt9b8uw6Gd9Zx/ba336fpxpAteJ/v2nnZpXI5GmHi3FZBTYjrb8MFm9k+6VZkJOr6YARxVyzskNbauJnJABxiECdUkBeE4PZd881d5aK+ori8r2GXnkxHz3uT82udvuOPX392Ehtu8s1fNTelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737330313; c=relaxed/simple;
	bh=uUmhubNNFxN+xfbYQaQrybpCS6eqao5e1kLN4Y0NHHg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3CKoGZ6I43LIGBV/ViegUbZ31qPy2pv4cU3/pHfAjFtoBtGxDPeV5q2KXzunXr2Pp/SgIGUVB9yZuScNaxugnzxwyQs9OoWxuhZ46H67zmFuHQ+ie+p1S+zg2wTNR8j4YDiWFNhBZtRhKBPeJYkPhenJqgki1jNb9uLGekpEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/ejXuOA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/ejXuOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737330312; x=1768866312;
  h=date:from:cc:subject:message-id:mime-version;
  bh=uUmhubNNFxN+xfbYQaQrybpCS6eqao5e1kLN4Y0NHHg=;
  b=V/ejXuOARf3joVev3syXnGts5q+GW5IleW8CJFy0zkZps95DQyPE56ms
   PX9AdqdNqDJlutvVaFQ4UO1TL/kcYwYx10FklEhmaV9vN4Cr+UIQWialp
   t8oIIay2u5KHlgbZb7iGp/2QWgfzKSSE23klT2oMOZcK10R97ZwOw4NwD
   NKJmcFUkRmU9h551FBmKwaHh5H+T0jxERPnh+ClBKQcOAdWwqPAeeOFtt
   X6cEAQbK0yfEvH47iRcqAA530VwjIRIJRZZZm4rYnVzWXR1Nn0FteDMoN
   cjYyvqoM61F/8A3HtO4o+YTgvMKzm8Tp5UCZzov0fBlxLO1KBpblEGxun
   g==;
X-CSE-ConnectionGUID: pYCdwKGDS7arloyCv64wgA==
X-CSE-MsgGUID: R114oRqfSS6WONU1gvrJ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="40491439"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="40491439"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 15:45:11 -0800
X-CSE-ConnectionGUID: 7wrtMRVgTbukwbHUojKHIg==
X-CSE-MsgGUID: 2WYm7BSuRZuOd0xty5Mztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110930983"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2025 15:45:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZeya-000Vx1-1v;
	Sun, 19 Jan 2025 23:45:08 +0000
Date: Mon, 20 Jan 2025 07:45:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 178/285] ld.lld: error:
 vmlinux.o:(function __try_alloc_bucket: .text.__try_alloc_bucket+0xa0):
 relocation R_RISCV_HI20 out of range: 528416 is not in [-524288, 524287];
 references '.Lswitch.table.__try_alloc_bucket'
Message-ID: <202501200720.5uX04dAE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   625e0595113de10c6c8500be08fe27e7d6fbe1a8
commit: fbd152bf9469873b5d2a9aba2373e624eaa22a9f [178/285] bcachefs: Minor bucket alloc optimization
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250120/202501200720.5uX04dAE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501200720.5uX04dAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501200720.5uX04dAE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function __try_alloc_bucket: .text.__try_alloc_bucket+0xa0): relocation R_RISCV_HI20 out of range: 528416 is not in [-524288, 524287]; references '.Lswitch.table.__try_alloc_bucket'
   >>> referenced by alloc_foreground.c:161 (fs/bcachefs/alloc_foreground.c:161)
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
