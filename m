Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0926819343B;
	Wed, 11 Sep 2024 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726063864; cv=none; b=WbdubfKaMuyu66F9e2kRJFsriBy7xq34lmIyCIKULglcou41jQP81Azx3QWdC6jMaGCQxyVOpGcJ4q3TCdm4qrXkLAUxQ6e47IBXdDCX37n1ucabDTX0ZD4G6fpYDEv5lOuc4bKY9aK+jqC0w31d+xtx3XTY4W3oJ9+eYLfjzBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726063864; c=relaxed/simple;
	bh=9xwPbs+FW8xyLLdAL+II5yA/9QMzxzCjdfhm7LcTA7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNsWrW6q34GkZ2V9PJZV9Xs/RIyD8bMnYLHHw4EzV6YQRcVJmiO0rbw3TriDRi8H7UWd4uD7kNpuMFzgcuA78iqCMQUqqg+M5lZQNuW/4jAOXyUYO20oln4lCeYzfgHzJsyddhv3Ra0adFJGhLzRtEQMUS/F8ukPqzpezO09Jjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZp5eFCM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZp5eFCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726063863; x=1757599863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9xwPbs+FW8xyLLdAL+II5yA/9QMzxzCjdfhm7LcTA7o=;
  b=nZp5eFCMIBAj7Ro5VlTnZ23XTbLQyxaTudtU4n26AdYg+xBNFx8/I2WW
   omVqt4GdxhTcqZyGKR2c9g7QPzF/22PEDS0G1vQ0G/1tqAUvtK2wrmUeY
   FGD2fztfIrqpxZQI4jJ639s3fQJtQpKeBQQTm2ZBkJcll4scM7rHnlRak
   445hqK0u/KvNYMRX7vZX0bV8+DPB58JUlGKU/b5dBKaAzce+gvD7WdXVG
   zpeP12ob5Vrg63NJwNazGvkIl6qeLKYvUkkrGN2SgnXdKTDI/YayJnS+r
   vqpSj64gUPC+bJUt0+jVdGgx+1HTBNDr1GXQ3uwUMpWF60P0EIZHkEx/j
   Q==;
X-CSE-ConnectionGUID: OgmMKiXXRsGuDrA0qkBHYA==
X-CSE-MsgGUID: 3iU/xMJSTBa9ay+cQbZ1WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36253991"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="36253991"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:11:00 -0700
X-CSE-ConnectionGUID: 7DWbzs2sQ2Geo2poq3LZog==
X-CSE-MsgGUID: 63S8/QGLReKP9PGIwC9Vhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67001194"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2024 07:10:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soO3b-0003gi-03;
	Wed, 11 Sep 2024 14:10:55 +0000
Date: Wed, 11 Sep 2024 22:10:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v3] rust: add global lock support
Message-ID: <202409112144.dcfxjqII-lkp@intel.com>
References: <20240910-static-mutex-v3-1-5bebd11bdf3b@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-static-mutex-v3-1-5bebd11bdf3b@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-add-global-lock-support/20240910-222519
base:   93dc3be19450447a3a7090bd1dfb9f3daac3e8d2
patch link:    https://lore.kernel.org/r/20240910-static-mutex-v3-1-5bebd11bdf3b%40google.com
patch subject: [PATCH v3] rust: add global lock support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240911/202409112144.dcfxjqII-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409112144.dcfxjqII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112144.dcfxjqII-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `super::__static_lock_ty_MY_COUNTER`
   --> rust/doctests_kernel_generated.rs:4818:1
   |
   4818 | / kernel::sync::global_lock! {
   4819 | |     // SAFETY: Initialized in module initializer before first use.
   4820 | |     static MY_COUNTER: Mutex<u32> = unsafe { uninit };
   4821 | |     value: 0;
   4822 | | }
   | |_^ no `__static_lock_ty_MY_COUNTER` in the root
   |
   = note: this error originates in the macro `$crate::global_lock` which comes from the expansion of the macro `kernel::sync::global_lock` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0432]: unresolved import `super::__static_lock_ty_MY_MUTEX`
   --> rust/doctests_kernel_generated.rs:4886:1
   |
   4886 | / kernel::sync::global_lock! {
   4887 | |     // SAFETY: Initialized in module initializer before first use.
   4888 | |     static MY_MUTEX: Mutex<()> = unsafe { uninit };
   4889 | |     value: ();
   4890 | |     guard: MyGuard;
   4891 | |     locked_by: LockedByMyMutex;
   4892 | | }
   | |_^ no `__static_lock_ty_MY_MUTEX` in the root
   |
   = note: this error originates in the macro `$crate::global_lock` which comes from the expansion of the macro `kernel::sync::global_lock` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
