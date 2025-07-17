Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410B91C84CB;
	Thu, 17 Jul 2025 04:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752725664; cv=none; b=fpzqfcl593EJ+srSpTE9NI3m6fERlyHc2VgEoHkLDtV8u2bOsu7SIQWWBeOSNXZecTpbuB+bDFxL4aBE5Bsvdh/9s8RYhc3t4IZuNg2xApSj7wwtDJkUr4isSl3881rT7Gt3ZlCfdjLqAIsbnMg7OnGxIqgdT53+gzBltQ9IZCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752725664; c=relaxed/simple;
	bh=fhMqgnS/McZ1LByuKWgJbApdxbfkqvHJbnUo6T7qJP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJ3yCzPVJnIua7nffpvookz6wPWpkZu8hg95HgOO57Vxzw91CkMqj1n2kVL6allxrM53gRZIJO7DjBE3zxo8CfE5saiVsQh2Irf4hNvEsbLgeBFfwRv1a5YcRR4rf01l0foi5rqhlngAb9LaLlU86Z0s5gLrfbG6SjpEPGGMmzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyRWBawd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyRWBawd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752725664; x=1784261664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fhMqgnS/McZ1LByuKWgJbApdxbfkqvHJbnUo6T7qJP0=;
  b=UyRWBawdPIqBhn3KkdI3nRxr7Z0XWPz6i5BfyTukhCR4UHzr21enEIO5
   5v59e5mh2y5tZHwUMUMACl2QNO2Gw7BP2GcY0GuN9XEnZlt2RcBYj3qVD
   lmWsO19q+/xMyHD8iOrcIjIxSmOUQCquBlPgG8XOG2NQlBvCcz6+RlaPT
   uujidsMrlA6rfGq2+qfyhGLQdbwumua9BKXdN5d7r6EAJihoY7XcFp90o
   vnxULmMO0ijLTEblEuEljxh83uZWYm68ltOu1OiTFAsNQfyIOBah5ghBv
   EIDXaVuGrwDvYaFSOH2v9y9nG5jn+PuF/C9qaXUg652aW9BP/L6b9320S
   w==;
X-CSE-ConnectionGUID: oK205ArbTjmypbmVmvQdhg==
X-CSE-MsgGUID: jgOhH1tcQJ20Ur+7HZVIEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55137472"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="55137472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 21:14:23 -0700
X-CSE-ConnectionGUID: +d1Y+VHLQXGD6zlHnMLSRg==
X-CSE-MsgGUID: GwpvCHB7TL6lQ7zlS7me0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="158152869"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jul 2025 21:14:22 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucG0g-000D8P-2c;
	Thu, 17 Jul 2025 04:14:18 +0000
Date: Thu, 17 Jul 2025 12:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alice Ryhl <aliceryhl@google.com>
Subject: [boqun:rust-atomic-impl 4/11] warning: unused import:
 `core::cell::UnsafeCell`
Message-ID: <202507171221.aJFPI28p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-atomic-impl
head:   9908e69eba39eeef235e409a753621914c6e8926
commit: 1c3238898188d153f6a0c21cf85f8259ef0ab8a4 [4/11] rust: sync: atomic: Add generic atomics
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250717/202507171221.aJFPI28p-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171221.aJFPI28p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171221.aJFPI28p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `core::cell::UnsafeCell`
   --> rust/kernel/sync/atomic/generic.rs:8:5
   |
   8 | use core::cell::UnsafeCell;
   |     ^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
