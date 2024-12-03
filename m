Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321CF148300;
	Tue,  3 Dec 2024 02:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733194631; cv=none; b=b8Lx4XPrVWsFCBNu1MrAvzEbQSmLJagaUk5pVr2VErLsMKOacWW8YtKAbek5hDTIGGjwPksfcMDkpzlLKf6bNebk3tTNct6Q/X9OasWaCLb1EqWzn0foAhtCR4TmiccIuljEWSQbxlSZPN7SOkQUlbEALc1hrOSP/KqJ1OhDiSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733194631; c=relaxed/simple;
	bh=syFxIHxtNJgeDxHxRvIG0iGkaC5umZ5tr+vQW1iEZME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGqDGrB5KGtpa+0x4TZ/gGJZu3QJeSV6lB/GPIP3Mp41qOA4aDcZEokZ0PfDXXsTAHd3rx01ZIOsf/P3TZ60lFWGJlUyhimxb1b0dQ3eLoCR8QqshIAqRdt2ly4ifZ6eOdVveasrFjRIwQcNhoUHLnGucWM7YWc8sDbJFt78nYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaOdO6Of; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaOdO6Of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733194629; x=1764730629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=syFxIHxtNJgeDxHxRvIG0iGkaC5umZ5tr+vQW1iEZME=;
  b=IaOdO6Of0I+u3vVPcK4u+qBIEj4l4bOtm232ZdXJtplNFI0H3xui0ouL
   o3uhw9wvyRDjZM6L56bxjREW+TIP+r0nN8bKohVdH/WZkjP/N1rWArZES
   2R5rXyX6Ci2FQ664+iEliuFgW2vKdVuMi2uG7WLGEOmjXVevnkSIxBeiG
   KDSsBVilWjjKWfIsAERuoD/evwydJ8OCqaWYUFxShMYTrEqqIl2lFSch4
   rsQ7LIBdrYwY7oNF3NdXr3Fbh8rosahIbEjOSNT/O2aR868J/L4to1NcV
   SOX3d6L2sZsgQd1d/qggJpu5HpQd4Iq3SZgZ7gS/qiDJoZKg5U8bDJSrD
   w==;
X-CSE-ConnectionGUID: dJicq05TTCm9bFvB4W75fw==
X-CSE-MsgGUID: d5QROvr8QiG8UL4IqJfo/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44001434"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44001434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 18:57:09 -0800
X-CSE-ConnectionGUID: IBOa30MVS5OBnVxf6a7gpw==
X-CSE-MsgGUID: k1UdZNj5RC+qn/mHt8evDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93206831"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Dec 2024 18:57:07 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIJ5X-0003CT-0B;
	Tue, 03 Dec 2024 02:56:43 +0000
Date: Tue, 3 Dec 2024 10:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Bernhard Kauer <bk@alpico.io>, Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, Bernhard Kauer <bk@alpico.io>
Subject: Re: [PATCH] rust: introduce KVec::pop()
Message-ID: <202412031055.b3nviKAQ-lkp@intel.com>
References: <20241202085758.67319-1-bk@alpico.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202085758.67319-1-bk@alpico.io>

Hi Bernhard,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.13-rc1 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernhard-Kauer/rust-introduce-KVec-pop/20241202-170049
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20241202085758.67319-1-bk%40alpico.io
patch subject: [PATCH] rust: introduce KVec::pop()
config: x86_64-buildonly-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031055.b3nviKAQ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031055.b3nviKAQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031055.b3nviKAQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the `?` operator can only be used in a function that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> rust/doctests_kernel_generated.rs:752:22
   |
   750 | fn main() { #[allow(non_snake_case)] fn _doctest_main__kbuild_src_consumer_rust_kernel_alloc_kvec_rs_309_0() {
   |                                      ----------------------------------------------------------------------- this function should return `Result` or `Option` to accept `?`
   751 | let mut v = KVec::new();
   752 | v.push(1, GFP_KERNEL)?;
   |                      ^ cannot use the `?` operator in a function that returns `()`
   |
   = help: the trait `FromResidual<core::result::Result<Infallible, rust_doctest_kernel_alloc_kbox_rs_4::kernel::alloc::AllocError>>` is not implemented for `()`
--
>> error[E0277]: the `?` operator can only be used in a function that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> rust/doctests_kernel_generated.rs:753:22
   |
   750 | fn main() { #[allow(non_snake_case)] fn _doctest_main__kbuild_src_consumer_rust_kernel_alloc_kvec_rs_309_0() {
   |                                      ----------------------------------------------------------------------- this function should return `Result` or `Option` to accept `?`
   ...
   753 | v.push(2, GFP_KERNEL)?;
   |                      ^ cannot use the `?` operator in a function that returns `()`
   |
   = help: the trait `FromResidual<core::result::Result<Infallible, rust_doctest_kernel_alloc_kbox_rs_4::kernel::alloc::AllocError>>` is not implemented for `()`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
