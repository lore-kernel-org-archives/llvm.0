Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF3A372;
	Mon, 20 Jan 2025 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391310; cv=none; b=PsMYFDCRozrzBus9GRIQnlSAp3dw3NaxTI7/dim7EwLfAF0kQ5ESB2rII2/ylxiPmLj78g1DGGd5icxoqmYxLeUqntSyO5JuPplrtbJ2ZVOXVev9gzbZ8hqlGjZ2UiBlZyjszyXvDYFMm2ufA/2fnC9ArwFUFICc3gvkT+hcKug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391310; c=relaxed/simple;
	bh=HGjHSLa58ahYa0WxJ/17eOcTEIj5p9grhbgc9g4F8zo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=irYTLEvkHiujKx9/wqPbaqHPWEZlt1pL70q7knDdXNHEd1LvPndEES5FgrIQkz4GKmi33KUWVQhuA9YPWy6NaH30K/dQSuAUTMmvtrnY6WSVptHlEyTgZMr7OrXg/oLu3JmSWy/EZLsOqmXNub++oYor4/EALrTeXlRreNHdQaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBk2eUk2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBk2eUk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737391308; x=1768927308;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HGjHSLa58ahYa0WxJ/17eOcTEIj5p9grhbgc9g4F8zo=;
  b=YBk2eUk2GKvHE0DCUlS1b8TxGohApLMfbT4M8tKo81PaNimbEm51nfLC
   IFTPKJLwGuNCWIsRKxj26uETXLCw32aO6rpxeM32h28Qi68L3dGel7x1v
   +YdaVcvxPHb3XG1iVIZSttqj+p30JI7EU6ohgB7bpMc15X5DSPkpE+pBW
   grKzhd6q18BI+oLvmCwG8dNF6TYIWuIbx3WiucefaqQx0n5w0RSTfFzfG
   guS95mQaNX4hGHiwRwsgijRuDI1+XS9s3+N8AM0QGYzWB0+DKpxvNM1w4
   FkGcEM50QWrQH+Bm8pR+0O0s/I1IOuAKm2kqrvQfkCx4gQhCnA2Whl9Nv
   Q==;
X-CSE-ConnectionGUID: MUv5rGcEQI+bJifzvkyofg==
X-CSE-MsgGUID: k7mW0R4BSwuleoxtWuCVaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49209664"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49209664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 08:41:47 -0800
X-CSE-ConnectionGUID: rZMxwB+MSlq0O3Hn50ncnw==
X-CSE-MsgGUID: sQMen0GHTVuzCbkxof7HlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="106692932"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jan 2025 08:41:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZuqO-000WlH-1R;
	Mon, 20 Jan 2025 16:41:44 +0000
Date: Tue, 21 Jan 2025 00:41:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 287/295] ld.lld: error:
 vmlinux.o:(function i2c_default_probe: .text.i2c_default_probe+0xa4):
 relocation R_RISCV_HI20 out of range: 528308 is not in [-524288, 524287];
 references '.L.str.178'
Message-ID: <202501210001.sml2DTtl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   cb4af57eb5a0046c43df9141f8f0cc7aed9f49c0
commit: 52053481537e7029801317de832078cb40a82f17 [287/295] bcachefs: Internal reads can now correct errors
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210001.sml2DTtl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210001.sml2DTtl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210001.sml2DTtl-lkp@intel.com/

Note: the koverstreet-bcachefs/bcachefs-testing HEAD cb4af57eb5a0046c43df9141f8f0cc7aed9f49c0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function i2c_default_probe: .text.i2c_default_probe+0xa4): relocation R_RISCV_HI20 out of range: 528308 is not in [-524288, 524287]; references '.L.str.178'
   >>> referenced by i2c-core-base.c:2420 (drivers/i2c/i2c-core-base.c:2420)
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
