Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41B0258EE9;
	Sat, 17 Oct 2026 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792250852; cv=none; b=qCsz1NnE8HOum5F43n9sibRGd2tE4EtkKibOoUFnwG3zdajwmtD7WNoEwqzZYCUjc7cjKlbuB1hG+6qpJ+vVNVqgPbFaBj8GneRMvwjURLt5P/PUUEoOlPiqSWGExK9grU21nLG86CTrgIGs14sk6EqBBtIO7icZuwc+AZRan2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792250852; c=relaxed/simple;
	bh=G/CnlScgoBaEkuoGLZhBTW+lIDcsMvUG0Fr2nLXyon4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGxsPZodG2g+78Zc2JoSF7oSKqTIb7XbE3WYS/iaxrySnSvZ7MD4jVOEmR8Ozgg93b2J5H8HMNh3WI+EC1ZmGRnMkI4rDtsmKj6ztAh8evCv+NAWNXZLgUlewA9hKWV9nSa85NDe+tdBDLfoVEssIxCcS76+KZNIeBF+JOSIbJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqJjM2q2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqJjM2q2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792250850; x=1823786850;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G/CnlScgoBaEkuoGLZhBTW+lIDcsMvUG0Fr2nLXyon4=;
  b=EqJjM2q26ZPnHJtgJcqhvXo4qFDS0rA07BeOO9KBF/y1DTwIy9a5Mvks
   DslDNpWLUSrpgc3gt7P4AUsm6sNkshahOAb/BCm5qpEh05wCJPWEBdpU4
   YFnimAevvQJsU3A0SvRx/mnHvjlOvLIT870smiai3FrfoQCnFlosruru9
   0BicWdgCPgBovU0RndxEX1/9OxKeUoBdI4zgHGqFIPPuQ33jwUqN/DGXp
   JrraPpcuYzStlAtHCyb7trZw9r8MeXc+tsBRMHcdWiCxHO1MhYo9qIlwH
   YWWihoSvqQMgWflVpiIN2DO696Nbfz8KXaD+KOMhAumwtKU/5vs7d4Qon
   w==;
X-CSE-ConnectionGUID: H/kFtRRQTX+3t+ZcJC5vjQ==
X-CSE-MsgGUID: GQjT/bpFTu2ZzKPjUXPgjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1011090"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1011090"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 08:27:29 -0700
X-CSE-ConnectionGUID: 6aa6gFQoRh6pfuBRo684dA==
X-CSE-MsgGUID: Mv1IisU8Q5yO+0DvaDlbWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2636337"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Oct 2026 08:27:22 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI6Jb-00000000JRu-0B03;
	Sat, 17 Oct 2026 15:27:19 +0000
Date: Sat, 17 Oct 2026 23:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ayush Singh <ayush@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Markus Probst <markus.probst@posteo.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	greybus-dev@lists.linaro.org
Subject: Re: [PATCH v3 4/7] rust: kernel: Add greybus abstractions
Message-ID: <202610172306.ttuZsLWg-lkp@intel.com>
References: <20261013-gb-uart-transport-v3-4-81d0a8a1acf7@beagleboard.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-gb-uart-transport-v3-4-81d0a8a1acf7@beagleboard.org>

Hi Ayush,

kernel test robot noticed the following build warnings:

[auto build test WARNING on becb95e45ef0dda9ffb35156d909d3da7a2789c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Ayush-Singh/greybus-connection-Export-gb_connection_get-and-gb_connection_put/20261013-173039
base:   becb95e45ef0dda9ffb35156d909d3da7a2789c3
patch link:    https://lore.kernel.org/r/20261013-gb-uart-transport-v3-4-81d0a8a1acf7%40beagleboard.org
patch subject: [PATCH v3 4/7] rust: kernel: Add greybus abstractions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261017/202610172306.ttuZsLWg-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610172306.ttuZsLWg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610172306.ttuZsLWg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated function `new` is never used
   --> rust/kernel/alloc.rs:42:19
   |
   40 | impl Flags {
   | ---------- associated function in this implementation
   41 |     /// Create from gfp_t
   42 |     pub(crate) fn new(v: bindings::gfp_t) -> Self {
   |                   ^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
