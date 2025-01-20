Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B040363D;
	Mon, 20 Jan 2025 03:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737343862; cv=none; b=PlEZdqjLC6cir+Z1VWOWDVenceILhdhCzBS4ZEo2tsfrVyiQj8iNysLbkwwPusn2LztAjzdtXv9P/u/ncgMFOEo1OIuksaVl9URqeD4Xifxmcy6QkYE+We8223T6ZkKDiU8PfwcuHzqwwblyb8xQIOBB3dGdcrKCWvmNDNe7nDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737343862; c=relaxed/simple;
	bh=x+2KSvh3kW5Y8A8PaOdALEEnkRD/r7vNxQyUcUgCXDg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVbOcjALBHG8PAbZ28HdyRIxFPuAOie3EXRGl5MuN1IKW00YiQiXyICU6vrHO35qbBup/tokJm8OHeKCo2Oqm0Fonq6GY+vJeNYESBQURuW7Wo661lTCBTg1wzdOXOu3kVYy23A9CZkaLHP+unWjK9o9Q2pvHi8p1XGWNQwC8rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q442lsYo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q442lsYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737343861; x=1768879861;
  h=date:from:cc:subject:message-id:mime-version;
  bh=x+2KSvh3kW5Y8A8PaOdALEEnkRD/r7vNxQyUcUgCXDg=;
  b=Q442lsYoHQqcWzI+66GDsDJkf/8qNwopgvYHFWVtCW9wnk4G/kqagZS0
   BuvV2TVIn4P1/p98ekXs9mhAsBZB21pjpV/IrE80puWNn0fRAJYLfUVhi
   7UNxKt1t8lcHHPpjxZfFrh3PLiWYKd06w5W0Z3odVY59aVd0OQbBOa28V
   yylzvmpAvNuKBNAEQL0wImnQsUfTNrq+TS2yaaWsWacXzNQySYQT7tyUY
   C4ZPN49ltjw88vZulWQQOElG5bcKCQMz+tRcP6eUkmg/YPmR2AiPBc04Q
   Cs8hfq4+8Q/u0ffH2bdw/DTAm8UugSaWvD8GPGPW+AQV5aaFSppZqIX7K
   Q==;
X-CSE-ConnectionGUID: K9oIglPnSkCNtKyINCHG3A==
X-CSE-MsgGUID: j+4OMVXYTQSXL1U0REKLBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48367177"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="48367177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 19:31:00 -0800
X-CSE-ConnectionGUID: IBsAnFNWQK+qeIBUIX3X3g==
X-CSE-MsgGUID: 2aKeDDPwShawsP9izppKIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129620551"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2025 19:30:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZiV7-000W83-12;
	Mon, 20 Jan 2025 03:30:57 +0000
Date: Mon, 20 Jan 2025 11:30:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 284/287] ld.lld: error:
 vmlinux.o:(function __i2c_transfer: .text.__i2c_transfer+0x88): relocation
 R_RISCV_HI20 out of range: 528388 is not in [-524288, 524287]; references
 '.L.str.163'
Message-ID: <202501201130.nXIfW1E3-lkp@intel.com>
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
head:   52053481537e7029801317de832078cb40a82f17
commit: 6e297c556d1c4419bb5610f1a3a462a78c655fc6 [284/287] bcachefs: Bail out early on alloc_nowait data updates
config: riscv-randconfig-002-20250120 (https://download.01.org/0day-ci/archive/20250120/202501201130.nXIfW1E3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201130.nXIfW1E3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201130.nXIfW1E3-lkp@intel.com/

Note: the koverstreet-bcachefs/bcachefs-testing HEAD 52053481537e7029801317de832078cb40a82f17 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.o:(function __i2c_transfer: .text.__i2c_transfer+0x88): relocation R_RISCV_HI20 out of range: 528388 is not in [-524288, 524287]; references '.L.str.163'
   >>> referenced by i2c-core-base.c:2216 (drivers/i2c/i2c-core-base.c:2216)
   >>> defined in vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
