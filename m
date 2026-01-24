Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE83273D75;
	Sat, 24 Jan 2026 23:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769297687; cv=none; b=aU7iom4+RsvIj6hAIuUgyueey/RrDNKc8Gt3CGlVGgMZgTS7Phu8qxHD7aUySi56mSLj307IOfbD0bjPDSmRNSDNrisBAb1s97ej4+5OMBTPgugE4w4vHT30KePEr1mzMku5EaElX2bMI0x+PAy/QTybmmdNxbKo5timBbxtrNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769297687; c=relaxed/simple;
	bh=EWN4xNB119Z/+NecSLgJCEK3zbzesU7Du2xNMGy3VP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAyUE/Q5ma7BNbTH4TytdcXmF+/e+WqbiPEUS0WMB99DbXqRVLkXCfsIE7eWKxvpefRJ4QE9oI0HX6CPz4f3Pv4FxUcrFBGo861kURq5CBForrCARJV2JA/OWJ8UJHMQOp+TYW5oJmiU/JMeTCL2hkf+mA2V1eIw1PIVkJPR6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dX09DhdU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dX09DhdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769297685; x=1800833685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EWN4xNB119Z/+NecSLgJCEK3zbzesU7Du2xNMGy3VP0=;
  b=dX09DhdUDrUiVCUcLRNT7/OBeVAOiwqIpmuUjVUYbDtmgl1ge2VrmDVQ
   JFS2kYhDjVIq+Z202Grz4gk+142TQSDrKj7YN+ZyuFPktPavDHTkG0DCg
   z2KP5w5l0nh4Ri0c+HHjOy5io7WM5rqRfjCJr4Px3WbxdSNYRXqAo5Beh
   jW4J6fu2jcR/7r+bbYcbHBXBByHMvtkjRYDAgDZjCwY0yZXmVa+wL4cL3
   6FBW83tobhI/07YEtPdMBHpuJNxnoBdivXGD+nLTMtBnD5hs/AtHi8drC
   im+J7kpxcOuWb2lvUxG3U9krP97svg1BZt93A+7APx+tMOD7KhpsObDpY
   Q==;
X-CSE-ConnectionGUID: Db54txJxSyurX+rqykSNlQ==
X-CSE-MsgGUID: uGveOpgMTIaEx99rpeBLzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81140535"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="81140535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 15:34:45 -0800
X-CSE-ConnectionGUID: Nx37DjhqQ4C+N7BzDdeiWA==
X-CSE-MsgGUID: p6eLt8xxSGyTwPlWacsevg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="237994332"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2026 15:34:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjn9I-00000000Vc2-3cdF;
	Sat, 24 Jan 2026 23:34:36 +0000
Date: Sun, 25 Jan 2026 07:33:52 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of
 `as_ptr().cast()`
Message-ID: <202601250701.wXxtGd9z-lkp@intel.com>
References: <20260122144444.265412-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122144444.265412-1-gary@kernel.org>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 053966c344dbd346e71305f530e91ea77916189f]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-disallow-use-of-CStr-as_ptr/20260122-224657
base:   053966c344dbd346e71305f530e91ea77916189f
patch link:    https://lore.kernel.org/r/20260122144444.265412-1-gary%40kernel.org
patch subject: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of `as_ptr().cast()`
config: x86_64-buildonly-randconfig-004-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250701.wXxtGd9z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250701.wXxtGd9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250701.wXxtGd9z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `str::CStrExt`
   --> rust/kernel/task.rs:12:5
   |
   12 |     str::CStrExt,
   |     ^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
