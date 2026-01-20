Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CF544BCBC;
	Tue, 20 Jan 2026 16:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925616; cv=none; b=adPdQQKINokb3ZMsmpKkPN4PvrTzB92QVwMkqcTPH0nCpc1lLucP556ILfi5/UjGqMLxtULcUeuFPij73EnzapreKX0ZuoAeKbGdheLiniMBm0KbpY6Gh/gEP96oDJV3KbtEAcWwdVSr1pelKsAstsmQaMZqQqjMt23D7giXgNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925616; c=relaxed/simple;
	bh=jnOSiKFsGXEAWduYH+LrnnhH1GduyoWnKKA2wNJ87aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEVJSaH0jI1eYCM4XaKV/ZvGliW2ghQjcPLqcGNW5ZIv6WsolYe0DxVQYUfSih5pOtYo4Av4NYWh//ZQgZUEzo6kz8uzSbPEpRVwmmlOuktEdUNJZakI2CLQ3dFc90D5oHAFJ5UEvO0NU2oUVY4InDlk9L8nwUZtqqraTLdk0/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoljWEUq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoljWEUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768925614; x=1800461614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jnOSiKFsGXEAWduYH+LrnnhH1GduyoWnKKA2wNJ87aM=;
  b=LoljWEUq0Jsd+WhU0aFqG7xpODzvnzDXGWZbicDiGdi0G9k8PgjqfV5j
   Ex7Xm8vJS+3W7MQG9yyUD3fzVNAr48sM+mQ8OTW6+5IoHCdEjTcFaxX4i
   rJzZjMW60+3QTJ3YBT7grWZ1sI8HG5RWvudRQVHobADWkOgE1rOnvzogW
   /5CmvBAYtgeP/3ktqzBmdbdp7Xf7DKhHQ9d4NHq9xlfX0pYhvWjcL4CTH
   5gnxGl5kkUhG5UEVZJOFBGBTm2UOsUmB4+Q3FBiEXP70xFqmcmeNMEkJS
   YJEPjVl2uC8B3fqTmlREbgWG4qaJgwYOKJtgRN8iwVtdNeq2BkOiQ873A
   A==;
X-CSE-ConnectionGUID: hx582fxhQMuT8D/rN09kuA==
X-CSE-MsgGUID: IrhJ4MtWTiab+W7zauJl3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="73993452"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="73993452"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 08:13:33 -0800
X-CSE-ConnectionGUID: P7eetHbhTsG9+ROlJ6gpoQ==
X-CSE-MsgGUID: OrQ97F9+T+G4UW3Qw1+F1g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2026 08:13:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viEM7-00000000PCH-0KbF;
	Tue, 20 Jan 2026 16:13:23 +0000
Date: Wed, 21 Jan 2026 00:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 1/6] rust: num: add `shr` and `shl` methods to `Bounded`
Message-ID: <202601202328.hnTsogt9-lkp@intel.com>
References: <20260120-register-v1-1-723a1743b557@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-register-v1-1-723a1743b557@nvidia.com>

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2af6ad09fc7dfe9b3610100983cccf16998bf34d]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/rust-num-add-shr-and-shl-methods-to-Bounded/20260120-143042
base:   2af6ad09fc7dfe9b3610100983cccf16998bf34d
patch link:    https://lore.kernel.org/r/20260120-register-v1-1-723a1743b557%40nvidia.com
patch subject: [PATCH 1/6] rust: num: add `shr` and `shl` methods to `Bounded`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260120/202601202328.hnTsogt9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202328.hnTsogt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601202328.hnTsogt9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0658]: const arguments cannot yet be inferred with `_`
   --> rust/doctests_kernel_generated.rs:10572:47
   |
   10572 | let v_shifted: Bounded::<u32, 8> = v.shr::<8, _>();
   |                                               ^
   |
   = note: see issue #85077 <https://github.com/rust-lang/rust/issues/85077> for more information
   = help: add `#![feature(generic_arg_infer)]` to the crate attributes to enable
   = note: this compiler was built on 2025-06-23; consider upgrading it if it is out of date
--
>> error[E0658]: const arguments cannot yet be inferred with `_`
   --> rust/doctests_kernel_generated.rs:10630:48
   |
   10630 | let v_shifted: Bounded::<u32, 16> = v.shl::<8, _>();
   |                                                ^
   |
   = note: see issue #85077 <https://github.com/rust-lang/rust/issues/85077> for more information
   = help: add `#![feature(generic_arg_infer)]` to the crate attributes to enable
   = note: this compiler was built on 2025-06-23; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
