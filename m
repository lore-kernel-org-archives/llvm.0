Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790CA1E7660;
	Fri, 25 Oct 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729864514; cv=none; b=LbJK6giar8JhcJb7WNdJKtrSIrmfzfoh+C99coCOEKBA62GmGQw+EH8uJqWRk/BTX7jb3SOXO3WDg2J+4EfF+BBHBGo4tiSnNeKxRnRzuJpHK7xh5loGhqIRXNPeL9pmTAEj/JyLM5rRWMLVYND5lxKvNw62FJNSwSx56hiAOWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729864514; c=relaxed/simple;
	bh=7NqT3649F1dXeuQNWNY44V3yXWIYCEWHbVLE10r7iAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dia0vElGiGkjOXh2FSYPIO7C61kcfzOinkf3HZJc7jkLm2QjYHtjyl6+gsccdClKgzZutPlcAN2qsVglOZLJUCqanM+67a/o1yzLcpi80XL0Wg1TVq4NJRBVAq4zk2jT0GkLIsey8nQlHHEcUhCHhN2FG1YJQryGxSgD1ZQqs7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcBA7oKU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcBA7oKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729864510; x=1761400510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7NqT3649F1dXeuQNWNY44V3yXWIYCEWHbVLE10r7iAE=;
  b=mcBA7oKU0yGnldiSiv2oCxlJWhopjigMRv1oN1wpOap/Bjes6zzL99BQ
   haO6eTRWcM+jsAM0kEOSfy48bOTvbvSA3PafY6iDMna4tQJIdnaL2qryD
   Je0bCz3joJalvlGLOyit4Qm5RAnXKt6bhTXXiZgBEKhPnEwhCM7Wn8xNb
   8o92LUKFOJAP8qNKMZWqOpFWWKE23lx5HNRRSzKFXOfIhe63OsDIE2MFC
   eWMo2HilD9Y51nzPHQpbl5+ZRaVo+1mxZVYtO3GTSO1y3ISIgFYAcNRal
   7SM6+bqMPmjx5TY++J8o4ablL0aJdXdJhzYvo5ZIT//DNCXi5x245UhwS
   Q==;
X-CSE-ConnectionGUID: 2AKTtIh3R8iQwUvK+07P7Q==
X-CSE-MsgGUID: fbxnqqtFSfKmuDaZCttF+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46997862"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46997862"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 06:55:10 -0700
X-CSE-ConnectionGUID: 6qxGZX07Trmb36yDd1F4OQ==
X-CSE-MsgGUID: 4rqoCvHUTzWLQ6lBj85Wqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85499018"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Oct 2024 06:55:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4KmO-000YK2-2V;
	Fri, 25 Oct 2024 13:55:04 +0000
Date: Fri, 25 Oct 2024 21:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH v2] rust: kernel: add support for bits/genmask macros
Message-ID: <202410252126.lJKyvEk1-lkp@intel.com>
References: <20241024-topic-panthor-rs-genmask-v2-1-85237c1f0cea@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-topic-panthor-rs-genmask-v2-1-85237c1f0cea@collabora.com>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 91e21479c81dd4e9e22a78d7446f92f6b96a7284]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Almeida/rust-kernel-add-support-for-bits-genmask-macros/20241024-222614
base:   91e21479c81dd4e9e22a78d7446f92f6b96a7284
patch link:    https://lore.kernel.org/r/20241024-topic-panthor-rs-genmask-v2-1-85237c1f0cea%40collabora.com
patch subject: [PATCH v2] rust: kernel: add support for bits/genmask macros
config: x86_64-buildonly-randconfig-003-20241025 (https://download.01.org/0day-ci/archive/20241025/202410252126.lJKyvEk1-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252126.lJKyvEk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252126.lJKyvEk1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0015]: cannot call non-const fn `kunit_get_current_test` in constants
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = note: calls in constants are limited to constant functions, tuple structs and tuple variants
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error: `core::ptr::mut_ptr::<impl *mut T>::is_null` is not yet stable as a const fn
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = help: add `#![feature(const_ptr_is_null)]` to the crate attributes to enable
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0015]: cannot call non-const fn `Arguments::<'_>::new_v1` in constants
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = note: calls in constants are limited to constant functions, tuple structs and tuple variants
   = note: this error originates in the macro `format_args` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0015]: cannot call non-const fn `err` in constants
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = note: calls in constants are limited to constant functions, tuple structs and tuple variants
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error: `Arguments::<'a>::new_const` is not yet stable as a const fn
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = help: add `#![feature(const_fmt_arguments_new)]` to the crate attributes to enable
   = note: this error originates in the macro `format_args` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0658]: referencing statics in constants is unstable
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = note: see issue #119618 <https://github.com/rust-lang/rust/issues/119618> for more information
   = help: add `#![feature(const_refs_to_static)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
   = note: `static` and `const` variables can refer to other `const` variables. A `const` variable, however, cannot refer to a `static` variable.
   = help: to fix this, the value can be extracted to a `const` and then used.
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0015]: cannot call non-const fn `__kunit_do_failed_assertion` in constants
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = note: calls in constants are limited to constant functions, tuple structs and tuple variants
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0015]: cannot call non-const fn `__kunit_abort` in constants
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = note: calls in constants are limited to constant functions, tuple structs and tuple variants
   = note: this error originates in the macro `kernel::kunit_assert` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0015]: cannot call non-const formatting macro in constants
   --> rust/doctests_kernel_generated.rs:317:16
   |
   317 |     let mask = genmask!(39, 21);
   |                ^^^^^^^^^^^^^^^^
   |
   = note: calls in constants are limited to constant functions, tuple structs and tuple variants
   = note: this error originates in the macro `format_args` which comes from the expansion of the macro `genmask` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
