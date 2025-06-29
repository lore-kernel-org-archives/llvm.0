Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643E1220680;
	Sun, 29 Jun 2025 13:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751204493; cv=none; b=EMFYN3Ul0IZZVAbzFiKd/zhO/Mha59P7E5YCXgr6wAOS9YIRrbUz1P1NfDz6JJx37+ca30znmlkl/nNou7oNO4UWFPBR6RgdeYE16rc70lrsSqcAwvk2MqkifYyplgS86zVLJa2sct93J0b/u2O4pOG2sD3ZfCXit8rOJ3bqrHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751204493; c=relaxed/simple;
	bh=6pH6Jrus+isDRInRJC5Z5etu0I3dqpdkTpbdprAOHWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPkEMeWaBDpLEkJa2clDBvo5s8CquuJqJgFuP162QL0DAGvR0XVxlihFCAAUWLD+nqOvUqsFq/fDGfvVmbqe7wTlLUtKo6Ucjc3Ml52eQhXkNSNGh/5sXTZ9LoF9wjKc98UPi9WMd3yaDDR9Q/yIu60oXsbNxeM0vvXKIzA4ypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fanw32p+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fanw32p+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751204491; x=1782740491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6pH6Jrus+isDRInRJC5Z5etu0I3dqpdkTpbdprAOHWA=;
  b=fanw32p+3rrzs1C/Ef9qEk241a1JqgH1AwRjJc1vQoIHI2h16woWSgXa
   CeOmC4lWg6fXfZwsxU6hLhSli7Y/ke6hb7V8SUOOoXIUBkGnuixImauog
   pZCE0NMsDGhHereOOi9So27g71Sh2eMRbS2ARfdsQx5pcx6kKuR6fb9li
   eU17UenUtBGCuxmxvGLA5GvUVsMAjlfDitJ+0zpthu3rBWUh9g055tkZ+
   F6H0IMpXLK7OPQADR9GFIy2R6Ftp9V6ZMw6X4pU4xQkGPLYMmZ0a1t/PQ
   jmhnnclM5K9gegbZoPz4bRROppYrOQTlAs0i7OYSHf+FohXBC237if5Nd
   A==;
X-CSE-ConnectionGUID: PwiTryCSTtmv7idkT68vcQ==
X-CSE-MsgGUID: 9FMlzAU+R/CxqhxsVPKfcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52559270"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="52559270"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 06:41:30 -0700
X-CSE-ConnectionGUID: Fcu/cX/tT7yl7jctrZs1SA==
X-CSE-MsgGUID: 7AK8iye2RRWg4U15YIMQNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="157251116"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2025 06:41:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVsHe-000Xyg-00;
	Sun, 29 Jun 2025 13:41:26 +0000
Date: Sun, 29 Jun 2025 21:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5] rust: introduce sfile macro for succinct code tracing
Message-ID: <202506292116.f6SHoUIX-lkp@intel.com>
References: <20250626203535.331219-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626203535.331219-1-ttabi@nvidia.com>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on c4dce0c094a89b1bc8fde1163342bd6fe29c0370]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-introduce-sfile-macro-for-succinct-code-tracing/20250627-043731
base:   c4dce0c094a89b1bc8fde1163342bd6fe29c0370
patch link:    https://lore.kernel.org/r/20250626203535.331219-1-ttabi%40nvidia.com
patch subject: [PATCH v5] rust: introduce sfile macro for succinct code tracing
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506292116.f6SHoUIX-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506292116.f6SHoUIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506292116.f6SHoUIX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: `Option::<T>::unwrap` is not yet stable as a const fn
   --> rust/doctests_kernel_generated.rs:5969:29
   |
   5969 | const SFILE: &'static str = sfile!();
   |                             ^^^^^^^^
   |
   = help: add `#![feature(const_option)]` to the crate attributes to enable
   = note: this error originates in the macro `sfile` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error: `Option::<T>::unwrap` is not yet stable as a const fn
   --> rust/doctests_kernel_generated.rs:5915:20
   |
   5915 | pr_err!("{}:{}n", sfile!(), line!());
   |                    ^^^^^^^^
   |
   = help: add `#![feature(const_option)]` to the crate attributes to enable
   = note: this error originates in the macro `sfile` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
