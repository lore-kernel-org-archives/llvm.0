Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179BB38F91;
	Sat, 24 May 2025 21:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748123568; cv=none; b=cYGheigYOLZLAooBRfLi2qw9H5iYeiahW/nt/K1rvsWs/j5f5OnQS+ZcWBf4IIGp+hmMyoHsKMxKoXFMjxzr2tBLKc9Ui8wli+U5oo29zuOJCiKaiHC930CVzDmLaIzUrI8Qm75Lnhpk4YQDHfnGY/0R/iXwVXjpdEZjrZa4oJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748123568; c=relaxed/simple;
	bh=F+x5c1Z2I16wMlNL6SkuqAGs4Sn3WQSSAHfo6jV6BUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+3L8SW/7r9jr4JbQEvYWyOoj872bR1JePGBv/l8w8HgjEwnI8wZwnf9gjQHqkrciA01cHVmX6m7S6BMITYNZre3mfk+UyrgHfxCeKtS012WeXpvEYNu2gKWt1EgzciTgROp9lJ7KhmDwMVdBIVX65v484gDma0niGBNV4yrfcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dkv3bmiB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dkv3bmiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748123567; x=1779659567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F+x5c1Z2I16wMlNL6SkuqAGs4Sn3WQSSAHfo6jV6BUs=;
  b=Dkv3bmiBsiYxbgLJKc7kZ6O3CSwfkME7u0agsA3IFerwzNcMRC3OtYma
   gj2Yc7GZJwzWrLTilYpd3k+LmL8goRg71BQsEE/bGKfbfhUQSNlm8P9TZ
   iRPaUH52xKD08hHe0owN8zIixLxShVLexsYIjiqZjB6fXucaMEzqKgdBm
   lA2Wec0e2De/huy8wN+NeKJuBrOpp5ESlY5DOKXI7WX2dWdBQGIYYJ0yc
   RXOorQdXNJlar5VnhAvKHtkrS7aQQ6be3yj4KV9iAiHgO9tBpz8/2JaOX
   tHd18H2ybTvWBt9Y18OZSVQP+DUJAAMQrUow3yx12N698H8v5SFKPpwUo
   g==;
X-CSE-ConnectionGUID: /1vlQuR2Q1a1kAYcQ3JVzw==
X-CSE-MsgGUID: P+njruAmT1ee2xI6THw5qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50065377"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50065377"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 14:52:46 -0700
X-CSE-ConnectionGUID: IYBj/fliRuKrsjTP3G7iMQ==
X-CSE-MsgGUID: rLSHQfO+Rh62UrX/U/PE9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146687469"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 May 2025 14:52:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIwnE-000RTk-27;
	Sat, 24 May 2025 21:52:36 +0000
Date: Sun, 25 May 2025 05:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@gmail.com>,
	Michal Rostecki <vadorovsky@protonmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 2/5] rust: support formatting of foreign types
Message-ID: <202505250501.xjOH8Kco-lkp@intel.com>
References: <20250524-cstr-core-v10-2-6412a94d9d75@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-cstr-core-v10-2-6412a94d9d75@gmail.com>

Hi Tamir,

kernel test robot noticed the following build errors:

[auto build test ERROR on cbeaa41dfe26b72639141e87183cb23e00d4b0dd]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/rust-retitle-Example-section-as-Examples/20250525-043544
base:   cbeaa41dfe26b72639141e87183cb23e00d4b0dd
patch link:    https://lore.kernel.org/r/20250524-cstr-core-v10-2-6412a94d9d75%40gmail.com
patch subject: [PATCH v10 2/5] rust: support formatting of foreign types
config: riscv-randconfig-002-20250525 (https://download.01.org/0day-ci/archive/20250525/202505250501.xjOH8Kco-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250501.xjOH8Kco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250501.xjOH8Kco-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 21.0.0
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> error: expected identifier, found keyword `use`
   --> rust/macros/fmt.rs:110:40
   |
   110 | ) -> impl Iterator<Item = TokenTree> + use<'a, T> {
   |                                        ^^^ expected identifier, found keyword
--
>> error[E0405]: cannot find trait `r#use` in this scope
   --> rust/macros/fmt.rs:110:40
   |
   110 | ) -> impl Iterator<Item = TokenTree> + use<'a, T> {
   |                                        ^^^ not found in this scope

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
