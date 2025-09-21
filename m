Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E498217A5BE;
	Sun, 21 Sep 2025 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758488230; cv=none; b=fxNDm1NJEDo5yMfp0kw74cR+uuUM7G9c5z3ORDHUTwjbtz8bgbKLNMWjGkDx/r/nRpt7/0xNhrpKh5RiEWO/Riq3ETXPvd0QbikJCpnc8m45d26Z1XKcDQHDo3nGvRdBKvevKw9sbVrPNzvotDpKm9xjG6ryZWbrxj+dOO8c2Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758488230; c=relaxed/simple;
	bh=i09wc8NXq6PotjxqjMuSQHv+u6f7Q0gcxiSIZOBbbYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+cZ7rfVFnrlXUnPGZViNp12xIP/XqcOAKFgg2MgznBrBK17QQwl9rjMbTXtJ0Ofw5BJfxuNO08ReZQ+laBlSG3AEIqCJWuayGQdMS1djot7nocrrdMH1vz+wec9kVtAYEnO+A4ZPDA8QP9tairkfRfSLGFIwmp6GDSKt6DeLg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CHwo8BXl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CHwo8BXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758488228; x=1790024228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i09wc8NXq6PotjxqjMuSQHv+u6f7Q0gcxiSIZOBbbYo=;
  b=CHwo8BXlwV60NE9/jDBqrPfaps6ZrltqWe9EgxymdsjsgBX73VNNETdi
   tU+nUeQAMTo+jHtZs1xnCJb8m7Lgv4qTKE6hMZf7ySpxFS0Qnjl4oOjDY
   Isv5dIPCNZWfRQ+zrm7P6b8bvxKR/GWfpB4jG5k2hWWfM7g6z6U7ltBTD
   KjQJBgcBqywL4OF4sAMr0Uj+7MjzMhjyMP+nd/h/ykwi9Fp074MK43P04
   yx5EqSapsVK6uILlF1PH8N/8mxvbr1THuXfU5GOCRjmcUjKH3T29acaBh
   0PwS9DIlJq0q6//pYljX1CeB4g/d+Opd6cn6jTe9C3uSp9kBQO6FLKmdn
   w==;
X-CSE-ConnectionGUID: R+FPAGd2SKiIrY/9uI0+hw==
X-CSE-MsgGUID: KIlw9YLtSZ+4MoDUXVqQgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60643311"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="60643311"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 13:57:07 -0700
X-CSE-ConnectionGUID: IW0SUcRoSWqvrIzykSVpHA==
X-CSE-MsgGUID: U9+NSOYjT/m1JIabRKXizw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="175914597"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Sep 2025 13:57:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0R7E-000109-2l;
	Sun, 21 Sep 2025 20:57:00 +0000
Date: Mon, 22 Sep 2025 04:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: print: Fix issue with rust_build_error
Message-ID: <202509220423.4d1foVAO-lkp@intel.com>
References: <20250920161958.2079105-1-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920161958.2079105-1-joelagnelf@nvidia.com>

Hi Joel,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.17-rc6 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-print-Fix-issue-with-rust_build_error/20250921-002215
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250920161958.2079105-1-joelagnelf%40nvidia.com
patch subject: [PATCH] rust: print: Fix issue with rust_build_error
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250922/202509220423.4d1foVAO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220423.4d1foVAO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509220423.4d1foVAO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the `?` operator can only be used in a closure that returns `Result` or `Option` (or another type that implements `FromResidual`)
   --> rust/doctests_kernel_generated.rs:3446:70
   |
   3446 |     pr_info!("The frequency at index 0 is: {:?}n", table.freq(index)?);
   |     -----------------------------------------------------------------^-
   |     |                                                                |
   |     |                                                                cannot use the `?` operator in a closure that returns `()`
   |     this function should return `Result` or `Option` to accept `?`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
