Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960F81AFB28;
	Thu, 26 Sep 2024 23:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727395076; cv=none; b=NbFfQuOxoTYDx/9255fyrOWz16xaA4SPOU0rVF7z7ZlxPhsifVXPbUosLdh1IAU2a0+K9QMqrR/RYsCi084iROR83BNk9kdSzB7dzcWVd8JVXGRZtcv83TllxVK4jnJdgqlqTSmzGDvAa/mq8PJCXcy0I9+CRM0GRjhxuUg3+P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727395076; c=relaxed/simple;
	bh=MziFS2olNob6SKEOSye5xeUa8x2Ru9zW+Bw+Q0Ibvxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGA43Hsdx9Fv4xZoj974pHv607Z+hgjQa0Ogqo1dG9Ps9dmDnrXLazseoj2Eznt/4HEFRumzZjQ8OARnhZNkmL9shwAHaSoG596y10KeMsL01mkg4mr8YmFvYiTj/FEtKVK6p9+tyDoEIOHzMr9sH8AAOWz2oJoj5BuXkIHDWGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AehBvmsT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AehBvmsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727395074; x=1758931074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MziFS2olNob6SKEOSye5xeUa8x2Ru9zW+Bw+Q0Ibvxs=;
  b=AehBvmsTT7y5AaZQkPdHpdkWJ5bpltrdjBtWXOMHMmsM23LPQvCLeb+U
   mMaQQK14FeV0D0sjCMs84H7ZOuCdQjDbarhsIehK0gv+caBZHN2H5GllF
   Kociu1U4oT2dJI5vUdGi0OghpcFT73QwjrkB3OC53daXLG5/0+LTL3vXT
   /27NMbrHdB8FdCE2vw+6RQoEFeMUbU02zj6OPnq3i9NT6ciiiJMrBaYbn
   HhUsxSlyO65JkxntC7YKylhC3GAKQyQYC1Vok9mGxu2qkw6loyBkK7Jcx
   rTpst8pn88KBT+melBUMIncSaPXfgd+CMn3LukhLapqf047SXb9nffgnq
   Q==;
X-CSE-ConnectionGUID: JE4jm8Y+S7+m8RtINbiAwg==
X-CSE-MsgGUID: QD45w7AcRiObHVckDjpGkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="49057529"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="49057529"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 16:57:53 -0700
X-CSE-ConnectionGUID: JX2snRnHQR6FGfk0ZnLrIQ==
X-CSE-MsgGUID: VuRW/SDuQcaCk130p9fogg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="71930803"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2024 16:57:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1styMk-000LJN-2b;
	Thu, 26 Sep 2024 23:57:46 +0000
Date: Fri, 27 Sep 2024 07:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg KH <greg@kroah.com>, Simona Vetter <simona.vetter@ffwll.ch>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rust: switch uaccess to untrusted data API
Message-ID: <202409270711.g9QhxwTf-lkp@intel.com>
References: <20240925205244.873020-3-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925205244.873020-3-benno.lossin@proton.me>

Hi Benno,

kernel test robot noticed the following build errors:

[auto build test ERROR on a2f11547052001bd448ccec81dd1e68409078fbb]

url:    https://github.com/intel-lab-lkp/linux/commits/Benno-Lossin/rust-add-untrusted-data-abstraction/20240926-045445
base:   a2f11547052001bd448ccec81dd1e68409078fbb
patch link:    https://lore.kernel.org/r/20240925205244.873020-3-benno.lossin%40proton.me
patch subject: [PATCH v2 2/2] rust: switch uaccess to untrusted data API
config: x86_64-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409270711.g9QhxwTf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270711.g9QhxwTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270711.g9QhxwTf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0658]: use of unstable library feature 'slice_ptr_len'
   --> rust/kernel/uaccess.rs:214:27
   |
   214 |             let len = ptr.len();
   |                           ^^^
   |
   = note: see issue #71146 <https://github.com/rust-lang/rust/issues/71146> for more information
   = help: add `#![feature(slice_ptr_len)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date
--
>> error[E0658]: use of unstable library feature 'slice_ptr_len'
   --> rust/kernel/uaccess.rs:339:28
   |
   339 |         let len = data_ptr.len();
   |                            ^^^
   |
   = note: see issue #71146 <https://github.com/rust-lang/rust/issues/71146> for more information
   = help: add `#![feature(slice_ptr_len)]` to the crate attributes to enable
   = note: this compiler was built on 2024-04-29; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
