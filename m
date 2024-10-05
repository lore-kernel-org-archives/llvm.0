Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E2013DBA0;
	Sat,  5 Oct 2024 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728126852; cv=none; b=LmuQWInx/LUfFAKCkQy1kAzEgLGSTI8pEm3MGzltVqrDHkNrYI66novo4fy45uRHVB4ZQFNrvGv/kfBRSd7zgpXogpizF2mjAgny2eaVaXIb+fEhf5VJ2Ww2DDjyPLl2JMLH/QXOuCyM2D0/mMjG4I5bP3drTQVPRbYdakN30yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728126852; c=relaxed/simple;
	bh=kcnDRn1JTz1kpSpOTsikUkMK3BTEzEPCzXh0hANNwO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLRa6c1nAVbXheoiW+xLqJdt7igWa5Osc0Qxu+Gp8JnAUghZSvhY2063O82rBJ4q1S7UfD+yPGNwHUr4o+6u+/tA/nKmkoyV8Dk8lQdIuGNNz7bTY/Z3RDqZf8adw6lECuqJA/2HBp/J4nKDW6iup1odeK/0pYKavXk2h9ySdns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpwqZHDQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpwqZHDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728126850; x=1759662850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kcnDRn1JTz1kpSpOTsikUkMK3BTEzEPCzXh0hANNwO8=;
  b=NpwqZHDQ2VRLz5vRe2pJD5rHWcswMhk/4GrFbnV6ASqGnMjLaKHS+rDw
   SjPa2KhNLo4cHmbkcCoWqJlfau3TilY8qgg7UgGMgM4nZkU0Q1S0GcdjH
   DVLtU8KxM3B7mNNPYsK+Hf9TL/bqvL0KjTsEw+U1AZXJYHd7UVfqDD7BS
   K8SL74ciDrTTCYU6z3Ton9upA6tjpIEYzM7LhipOxFzbR8RMVTSL/qCAH
   sqlQDhEMtj1tOLPyBCkoGOLb2XFozZlEGbGi9uZCGK8GawcZIMSlX2Ryx
   HjweKNdJlRKypE682lLtEsy2w23KLxq6302QTJKK4febQuni7nNTo6uiW
   g==;
X-CSE-ConnectionGUID: hnwwDUHxRES23mnavWF5zQ==
X-CSE-MsgGUID: LAaBLNswQwKlnsptHj2B0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27471189"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="27471189"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 04:14:08 -0700
X-CSE-ConnectionGUID: 2ha6zSn2S1KEfnS+iPMJqw==
X-CSE-MsgGUID: 6aEu8y0hRDW+2T1JHAGiTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="74963687"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2024 04:14:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx2jc-0002sy-1n;
	Sat, 05 Oct 2024 11:14:04 +0000
Date: Sat, 5 Oct 2024 19:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Benno Lossin <benno.lossin@proton.me>, Gary Guo <gary@garyguo.net>
Subject: [rust:rust-dev 17/25] error[E0107]: struct takes 2 generic arguments
 but 1 generic argument was supplied
Message-ID: <202410051918.NQT4lxAj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux rust-dev
head:   5073a77b6f60610ba3d2add41b6b743e4b05b53b
commit: 45e28f135821b99aa094fb78af769532128e4ca9 [17/25] rust: alloc: add `Vec` to prelude
config: um-randconfig-001-20241004 (https://download.01.org/0day-ci/archive/20241005/202410051918.NQT4lxAj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051918.NQT4lxAj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051918.NQT4lxAj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0107]: struct takes 2 generic arguments but 1 generic argument was supplied
   --> mm/kasan/kasan_test_rust.rs:14:16
   |
   14 |     let mut v: Vec<u8> = Vec::new();
   |                ^^^ -- supplied 1 generic argument
   |                |
   |                expected 2 generic arguments
   |
   note: struct defined here, with 2 generic parameters: `T`, `A`
   --> rust/kernel/alloc/kvec.rs:92:12
   |
   92 | pub struct Vec<T, A: Allocator> {
   |            ^^^ -  -
   help: add missing generic argument
   |
   14 |     let mut v: Vec<u8, A> = Vec::new();
   |                      +++

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
