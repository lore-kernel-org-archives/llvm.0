Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8574EE864;
	Fri,  9 Oct 2026 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791564185; cv=none; b=AUl8R06kkgAKaqyI+Hk6QPgEWwhHccZFJdCnjmbi5jrtRW0BthBuKV2CWjT2OPfhGsOTWo0gKcZuyeFn0RBaA7HQx3CHFltiBMUyfJcUOdghSO24CXJ8po+9w2Hi805A+yy0+7vFnTnfRDi5U5lRa50qhQ5nY3VOsK0g7PeNYw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791564185; c=relaxed/simple;
	bh=K/cajdbtsIt9U5lXvxI7xYePbmdBQQVQc1yd4hMG8kY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=grM2J0bZNRUVXWQpjmcTxWWx4Dm8wPJQlR4YOOHLMMKtY1aEtP94Rn8fEZh9W2P/fy+5FISCKOXJ0W761p+bo1bZToSvaKLIcKXhSp1YbN/GXr8cosb+jK7PQis1p8bbZ4gbBVjmQwgvqADv6u9Hqh3NbJwnx7DdxzDuheq0yBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6Sr/5uW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6Sr/5uW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791564184; x=1823100184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/cajdbtsIt9U5lXvxI7xYePbmdBQQVQc1yd4hMG8kY=;
  b=P6Sr/5uWTGiRu4KMGje6sGQjGSHggQcLKcAC+YZUaL1H0iYaOzE7emR6
   1tOzKAgAj74WlxSNCLuRvltEIcmKxcC0wK6hY8P9rFny7zhL0ysZPB+Du
   rLingLc30N5uVddnTps+/4FJn1qk4lDd+gBEi3Uz6tTGHexE/aRF7VTAp
   DrEO5/gNMVzXrBQh3dCgHx5eSBFZMJwriKnvsjL2CMUQiG/tElQsWQfsE
   Nj8PIJSnxOzen/xqjFFKPZnksNqKQQ0t0PMT6HFWjstr2002870PeCIQO
   +bOLbDbo+9RO3ATepEDrGWE5k73u2autuCRUwAzKCLtUPrtZ5wUQZRgEY
   g==;
X-CSE-ConnectionGUID: yaZwc7/lRxq8x04IJZskog==
X-CSE-MsgGUID: u08l+LKoROqbJR6ra1xddA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="381231"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="381231"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 09:43:03 -0700
X-CSE-ConnectionGUID: xugH/SOWTLmRLqCns8NYGw==
X-CSE-MsgGUID: qz2JKaP0Ss6tHysRo5SVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="668523"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2026 09:43:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFDgR-0000000061h-1nKZ;
	Fri, 09 Oct 2026 16:42:59 +0000
Date: Sat, 10 Oct 2026 00:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-kunit-assertion 15/16] ld.lld:
 error: undefined symbol: kunit_string_stream_add
Message-ID: <202610100031.yvgHqzdD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-kunit-assertion
head:   e8ef2ab596ea6cb29ff501ab4abf4757bf950871
commit: b1f6b44f2151569e88b5bb5e652e31aebffa0d19 [15/16] kunit: msg
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261010/202610100031.yvgHqzdD-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 80cd965b6323b208519f8ab1d5ee86e4ea9862f4)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610100031.yvgHqzdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100031.yvgHqzdD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_string_stream_add
   >>> referenced by kunit.rs:57 (rust/kernel/kunit.rs:57)
   >>>               rust/kernel.o:(kernel::kunit::kunit_rust_assert_format) in archive vmlinux.a
   >>> referenced by kunit.rs:57 (rust/kernel/kunit.rs:57)
   >>>               rust/kernel.o:(kernel::kunit::kunit_rust_assert_format) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: kunit_assert_print_msg
   >>> referenced by kunit.rs:64 (rust/kernel/kunit.rs:64)
   >>>               rust/kernel.o:(kernel::kunit::kunit_rust_assert_format) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
