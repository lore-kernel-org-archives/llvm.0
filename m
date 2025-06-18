Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BAD1C8FBA;
	Wed, 18 Jun 2025 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245707; cv=none; b=g8O7h5i0J/ZgIyM7FgF5Nvkl4cThISxkWEr4wJKWoBtRfI8YfINkScPYyi1pRwo9fgGjKO/igsunyzY9U+YoHRM6Ev4IOiTbqcSDTxDJ4UKYjZ9dpf6HUxgEBIv/J6/BepqfzSVkVNWnCE4gLRzUeKZtX2v6dnxyTrUUvK8H0Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245707; c=relaxed/simple;
	bh=md4pBp3+yvPSIRW+B9VI6Ty3LcXwqFQVUKPPV8B75KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ux3cW2czbCosyjB05KTQ8FLai8JUzFotbeaS/RFHbdoSMgR7LG8pD8SMxp1A4c477l+6y0peDWW8T6RDywYQ2FFUtMnjqPnVT6wC2QA02A1Iuzxvvw2kdGm3RpKOJTwCsyZ4YugoWlDopJfLqdlBy31N1AIIX60kx8DgI4iXt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BY2FaFLT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BY2FaFLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750245705; x=1781781705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=md4pBp3+yvPSIRW+B9VI6Ty3LcXwqFQVUKPPV8B75KE=;
  b=BY2FaFLTi+eSuD9Z1G6bkMfUtDIQBgp3wzcHp0d+bknGIU73nrOalGMj
   elJdeu/cMYeMG06EUAQKtSNd4Cc9JtxYma/3qgQhF68eOu1Jpr8rzC8k0
   axRb81pEA4+0kWP1H1vEO8bre02njBdx2CIAweWuW2y0EqnExnlEV4p41
   x87b/TMvn3ypZPhkJNTtG+mS5rrLVZj0/kl8+dRM3S7JymqB/TAuSrjJg
   IpujasVy9jrZeEPIpFqwBWUHBh9W7hsEniBLukM4zobvYW7esLBZHlWyP
   hxW+VxDwJkHZFDWbat9CAVk+3zzkLFBPFLCe1l9KSYhEKRgKikYz8aNEV
   w==;
X-CSE-ConnectionGUID: 9Jm4ott1QN+IWK7LOPKWlQ==
X-CSE-MsgGUID: jw12eyUATBqZdwL4oIx8Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="62735026"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="62735026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 04:20:37 -0700
X-CSE-ConnectionGUID: E4bP0IW1Sd+aixw2hRpBnQ==
X-CSE-MsgGUID: fMi03lhaTuS8TeTat2AzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149306455"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Jun 2025 04:20:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRqqH-000Jhu-0Q;
	Wed, 18 Jun 2025 11:20:33 +0000
Date: Wed, 18 Jun 2025 19:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] rust: introduce sfile macro for succinct code tracing
Message-ID: <202506181849.TxpYI9gO-lkp@intel.com>
References: <20250616193433.2643407-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616193433.2643407-1-ttabi@nvidia.com>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on 27605c8c0f69e319df156b471974e4e223035378]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-introduce-sfile-macro-for-succinct-code-tracing/20250617-034332
base:   27605c8c0f69e319df156b471974e4e223035378
patch link:    https://lore.kernel.org/r/20250616193433.2643407-1-ttabi%40nvidia.com
patch subject: [PATCH v4] rust: introduce sfile macro for succinct code tracing
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250618/202506181849.TxpYI9gO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181849.TxpYI9gO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181849.TxpYI9gO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::print::rfind_const`
   --> rust/doctests_kernel_generated.rs:7755:5
   |
   7755 | use kernel::print::rfind_const;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^ no `rfind_const` in `print`
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:5834:29
   |
   5834 | const SFILE: &'static str = sfile!();
   |                             ^^^^^^^^
   |                             |
   |                             expected `&str`, found `&CStr`
   |                             arguments to this function are incorrect
   |
   = note: expected reference `&str`
   found reference `&'static rust_doctest_kernel_alloc_kbox_rs_7::kernel::prelude::CStr`
   note: method defined here
   --> /opt/cross/rustc-1.78.0-bindgen-0.65.1/rustup/toolchains/1.78.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/str/mod.rs:2446:18
   |
   2446 |     pub const fn is_ascii(&self) -> bool {
   |                  ^^^^^^^^
   = note: this error originates in the macro `sfile` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0308]: mismatched types
   --> rust/doctests_kernel_generated.rs:5833:20
   |
   5833 | pr_err!("{}:{}n", sfile!(), line!());
   |                    ^^^^^^^^
   |                    |
   |                    expected `&str`, found `&CStr`
   |                    arguments to this function are incorrect
   |
   = note: expected reference `&str`
   found reference `&'static rust_doctest_kernel_alloc_kbox_rs_7::kernel::prelude::CStr`
   note: method defined here
   --> /opt/cross/rustc-1.78.0-bindgen-0.65.1/rustup/toolchains/1.78.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/str/mod.rs:2446:18
   |
   2446 |     pub const fn is_ascii(&self) -> bool {
   |                  ^^^^^^^^
   = note: this error originates in the macro `sfile` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
