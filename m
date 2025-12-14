Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6CC21772A;
	Sun, 14 Dec 2025 02:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765679084; cv=none; b=tjTaVa3Lp6f0BS51Lf/wIKfcm4UpWzn+W4N71O2azZwcN/ElErN6TkW6Yu4iPVNf3E5YPe+9RwyseMK6bH9RN3kk+SssirqRtSIRot63Vr2UlA9C7QD3RwgPyto0bDrRHNO6iAr9N9c/bD37FysuuE35oX0fciDAK9k8bGNDfcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765679084; c=relaxed/simple;
	bh=svZGnGb1z0M8JDuDzoFyvS666dKdyR/v6OisOICLuUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc7bQMgCbZnj6ICPn7sB9ufeyHzNI/BRF8taAstZ31Z8jkr2W0JdtHdCVYYFEyi6mzAsW4uGaj/CdRugv+bLObV5Yo4r9ZNc7pV1trV7rrCVeb78YoVY0gumqRlxooJvMFG95w7kUCC7ojbuXXOkfg1VRl69Tk/wDaZ9QIE2dCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KV32Hfan; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KV32Hfan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765679083; x=1797215083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=svZGnGb1z0M8JDuDzoFyvS666dKdyR/v6OisOICLuUE=;
  b=KV32Hfan6NieDxx1PQSRP9Ftb7aIq3+vNeUwwpHTUGiCl6gmCTa1yyMr
   rxVvYShH68iH+BmntVDgCxgVv5fvxQGwKfD97aztr25Tb7iPj7aErU33C
   5gLey1+gRWgfCLO2I41+9vrL2Kvkr1d8HAeY5pTXkLhfuotxERUgqPEPq
   hBwoGoWWHzDeUj39+zeMulxuh6QqJ+P5NiGV8dhmJg8ra19DRKOvwhJ27
   NZJ7LK+6bi6kIHzPl/LZIDAZkReFbyucmLMKCmJw1cJaCk23p6N3CNG3L
   doPmz+56PPCdeBvY2SYY5MY49DdaH5cfeKW4NZE13sGmnUmjFOf3gvnQN
   g==;
X-CSE-ConnectionGUID: L56f86/yT9a1LDxFT3uBsw==
X-CSE-MsgGUID: A2YVY7quROeLKJW4SfXLcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="93106933"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="93106933"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:24:42 -0800
X-CSE-ConnectionGUID: 7yFpZs+kRhG0dlb5+WLBGw==
X-CSE-MsgGUID: VZYezyg6RQ+QrteEdSNYYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197925139"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2025 18:24:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbmn-000000008TV-1guk;
	Sun, 14 Dec 2025 02:24:37 +0000
Date: Sun, 14 Dec 2025 10:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 3/3] rust: Support deriving `AsBytes`/`FromBytes` on
 bindgen types
Message-ID: <202512141048.FYhaUWwX-lkp@intel.com>
References: <20251212-transmute-v1-3-9b28e06c6508@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-transmute-v1-3-9b28e06c6508@google.com>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on 008d3547aae5bc86fac3eda317489169c3fda112]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Maurer/rust-transmute-Support-transmuting-slices-of-AsBytes-FromBytes-types/20251213-074604
base:   008d3547aae5bc86fac3eda317489169c3fda112
patch link:    https://lore.kernel.org/r/20251212-transmute-v1-3-9b28e06c6508%40google.com
patch subject: [PATCH 3/3] rust: Support deriving `AsBytes`/`FromBytes` on bindgen types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251214/202512141048.FYhaUWwX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141048.FYhaUWwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141048.FYhaUWwX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0463]: can't find crate for `core`
   |
   = note: the `target` target may not be installed
   = help: consider downloading the target with `rustup target add target`
   = help: consider building the standard library from source with `cargo build -Zbuild-std`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
