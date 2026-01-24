Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D53546BF;
	Sat, 24 Jan 2026 05:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769233022; cv=none; b=VcZwbaI0F3ASBMI9WynP0I9r2GivUZmv7ppu0qjfkgfGAcO+X7GTRne6LP8eE3vwPaYceCvzLqPB52Z87T0xCan+spXL/ToqjLbKx3Nut6p37kSnDJXb+ShllLlMLZgDbSKKNJl2SNU04D4hmVDktgCOzR+OXk8+RyB/Ng/26nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769233022; c=relaxed/simple;
	bh=FxT5vpKwk3ZMUCufjNlcGkACv89Jt5O1d4ZBsZ1yDxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWcIuWC61fQiAe8RsCwq9nHyeY0GaRo8hzN3b4koUDSgSq7OkAJcTcJ3hYhFPQ24kIlvKELoBxNj3IT2xsX2REGNmKvgOd5mK3K0LbUm7LmXXjG0lgl1mwUVa4cpOqKzqpeqoZ805NEDe0KD5kUJNkuxKESNbiBKWmz9d+8wsMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPQ7u+OQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPQ7u+OQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769233021; x=1800769021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FxT5vpKwk3ZMUCufjNlcGkACv89Jt5O1d4ZBsZ1yDxg=;
  b=SPQ7u+OQcrXT3D17FTnGq61jDYnnF2vTGLMaGeQx8ECTUG2UHid/EI4A
   9UKNxXsUSdUww+tCOTXhR7ERMUKkyslxHMqJ+4200OK19t7cM8s86ov+E
   FbHcZKB81tv1ztTtvoH4kBXeoKAJCZ6b16HWpgl4n5OU/nHeljnXLS8Pl
   p04b2kdCxTPIUrsFNxvnVNvlwpNP4RIJOKw12nyRryvydLl0Y7E6wRQm6
   5TDPvZyAy/QcOTlEy9KdGQF+YlkvfFr8FgW+fJGPuzZ83YebM69WLpvmf
   ueG2rGdxu2z9rKLHJlPlypDgbEYcccdrONdcQZA5SSUNha/MQEZIOcpGl
   A==;
X-CSE-ConnectionGUID: ITvB9m7eT4+ra/N/RsFkPA==
X-CSE-MsgGUID: v7DpRmp3SqGXaxqqHGltlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74111477"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74111477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 21:37:00 -0800
X-CSE-ConnectionGUID: 6x3QASeiT++S8SXK8ENk+Q==
X-CSE-MsgGUID: NfYX69yHQhK1kQ67fRAoXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207107407"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2026 21:36:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjWKL-00000000UwY-38Yf;
	Sat, 24 Jan 2026 05:36:53 +0000
Date: Sat, 24 Jan 2026 13:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] rust: samples: usb: remove redundant `.as_ref()`
 for `dev_*` print
Message-ID: <202601241311.4vcnMzFr-lkp@intel.com>
References: <20260123175854.176735-6-gary@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123175854.176735-6-gary@kernel.org>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-pci-remove-redundant-as_ref-for-dev_-print/20260124-020452
base:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
patch link:    https://lore.kernel.org/r/20260123175854.176735-6-gary%40kernel.org
patch subject: [PATCH v2 6/8] rust: samples: usb: remove redundant `.as_ref()` for `dev_*` print
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260124/202601241311.4vcnMzFr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241311.4vcnMzFr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241311.4vcnMzFr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `self`
   --> samples/rust/rust_driver_usb.rs:8:9
   |
   8 |         self,
   |         ^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
