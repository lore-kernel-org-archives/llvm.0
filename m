Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C0E2F658F;
	Tue, 12 Aug 2025 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755013984; cv=none; b=YJbBgRirfJ4EetgwePnXo8hAuVVKMX7gMU3Pe1ek0aL/FQ9AAu61cDT59iXH4k1s382a/bXiWQ2yPdsuopIn/6j21ZgV/iSRi10h7l81dVr3mKv07XoUzo0TKam9WVzC5AxqyDDgmsYWKNDI44Pa7Jy7AyI/mNscwyhR+osmsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755013984; c=relaxed/simple;
	bh=xGqRUdnbzPC+ihtI7x1CKaRb+bb/xRHekZu9g4Xe/HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/9+APCLQovdUZsnp1TKoN6T2vLzuqNBTsqfTXm+jJdf/xIoYS33SZHMU/tNXokHGJ0QkXNV1S2hiXRlD2+nDlSAwX8CO/oC+qUs4OgqEMzrrwnoNyWx5ku+o9AbxpNfjTjTvNpVlhpRc+KwdkdjaXuOhXPkc17tgUUZwJdJFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l+DFmsxl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l+DFmsxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755013983; x=1786549983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xGqRUdnbzPC+ihtI7x1CKaRb+bb/xRHekZu9g4Xe/HU=;
  b=l+DFmsxlm2qGuRebkASNvHxkHW+e9/BEzUAvgjdzohXZ/lQwykP9yFEj
   /VQu7RJNCi2zcvKXQoIWRzfwaBd3UgXnfDIQ/FUVHntc0QSiaHB6C2128
   Qw6gkLoTbm6UOhSmHCL/LNmh052E9SCwY14nQvbCDQ2lua6bWOq+8IVZ1
   Kb+RlYDcl24U+VbMre7Pn/lNWXO78E3eLXWG3rxZegqqnLrDuBgrTDQE9
   o2FJ8PeKZTvjOR+OLD1rVeiydg0GNrGSBi+tlu8duxjlp34+YYFWHBH5Z
   cNvad8+4KAh8OKFtbhaj+qMIG8hhqW7XHRu8yyI9WVSy5B6DLSEf+6oHk
   A==;
X-CSE-ConnectionGUID: Z38+DWx/Qr6gtzd1m3aWPA==
X-CSE-MsgGUID: IliqBXHJT3KecpNwoaHX0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57214434"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57214434"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 08:52:49 -0700
X-CSE-ConnectionGUID: 0bsw4FC6RT6UhF2rBBn1Xw==
X-CSE-MsgGUID: V+pW2tW4R/SxfVbWnVAIWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165862736"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2025 08:52:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulrIp-0006wd-2S;
	Tue, 12 Aug 2025 15:52:43 +0000
Date: Tue, 12 Aug 2025 23:52:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ritvik Gupta <ritvikfoss@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4] rust: kernel: introduce `unsafe_precondition_assert!`
 macro
Message-ID: <202508122341.rb7U1Q2P-lkp@intel.com>
References: <20250808192005.209188-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808192005.209188-1-ritvikfoss@gmail.com>

Hi Ritvik,

kernel test robot noticed the following build errors:

[auto build test ERROR on 37816488247ddddbc3de113c78c83572274b1e2e]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritvik-Gupta/rust-kernel-introduce-unsafe_precondition_assert-macro/20250809-032122
base:   37816488247ddddbc3de113c78c83572274b1e2e
patch link:    https://lore.kernel.org/r/20250808192005.209188-1-ritvikfoss%40gmail.com
patch subject: [PATCH v4] rust: kernel: introduce `unsafe_precondition_assert!` macro
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250812/202508122341.rb7U1Q2P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508122341.rb7U1Q2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508122341.rb7U1Q2P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0423]: cannot initialize a tuple struct which contains private fields
   --> rust/doctests_kernel_generated.rs:8841:5
   |
   8841 |     CpuId(id)
   |     ^^^^^
   |
   note: constructor is not visible here due to private fields
   --> rust/kernel/cpu.rs:47:18
   |
   47   | pub struct CpuId(u32);
   |                  ^^^ private field
   help: you might have meant to use an associated function to build this type
   |
   8841 -     CpuId(id)
   8841 +     CpuId::from_i32_unchecked(_)
   |
   8841 -     CpuId(id)
   8841 +     CpuId::from_u32_unchecked(_)
   |
   8841 -     CpuId(id)
   8841 +     CpuId::current()
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
