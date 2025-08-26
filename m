Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62700304980;
	Tue, 26 Aug 2025 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756215809; cv=none; b=lsAPm4CVEcyU18hZI94eJaqAroYctUkLwK1ShHnEn5bL/9wE0Rf0rBRV7W7qWf+1Hkn3IxmGgGKqhpUBOy9A6iIcxhxp8D44e+etw0Gt4dJaH8Z27SccSkk4LR2geDzXLWGkDqbnZyEFzYHaRPDXpgpbAASmJk+gm7DTcW2oMKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756215809; c=relaxed/simple;
	bh=NErWfNr60CGvNKZamAWAKiWya2kYPp3d/wXEQeWhqfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyklxpfTTeokmAfi0gfGsS1SFxWk2KvuQxM2y8mF7pd4MOUfnHBKXWA4LnDz5BRV6Tdm3pGVb1rj95DtEcyeUXqwQ64TpkEaFOE1j08aGJ4BbnLFbvt5wwcRrgghkPNijR82m0gQRWASGCOxdxCxtjXZ0dVyR6zEJ4opVOPzLUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OC9sOJQN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OC9sOJQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756215808; x=1787751808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NErWfNr60CGvNKZamAWAKiWya2kYPp3d/wXEQeWhqfI=;
  b=OC9sOJQNv/QblUiC7kD0Pz21VETQTIBXvA9lelwOzkBQWoLkD5xuaf4y
   hMd5jWHvsBp4W2Qp/vyPql1Ro+a0Dvwcqa0fsYL4Pywx/h7E0Idmi0KPY
   jnyYkjeJU1m2YVQvr9vd/Wxb9k+xbxJxgsrFI9VSJK/JyMa03fXBj4vrf
   SESFjbGwMWoEFtJWOchpth2mRLA6ZLVjxDF2VI2bz8Wmu3n0ZVmqCL1RC
   kzGWiqUBIYVRZTLhZwToID1xPngoHhQD+DBxudoUbwbNZ5vsheTOGPBD9
   FmbRXuNxnYLRzBMVQ1MS0nUSouuS3NOAhqCPi3ys0kbr0SQDbNUsaAbX4
   A==;
X-CSE-ConnectionGUID: +IMOomLUQgetfGQQnEj0yQ==
X-CSE-MsgGUID: JalGGojmSoKAXLy2mj/P9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58369494"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58369494"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 06:43:27 -0700
X-CSE-ConnectionGUID: cKGDnZhnTk2ffagtjTUoQg==
X-CSE-MsgGUID: PBAuvIT2Tu+wh6ivVtdWtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200470962"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Aug 2025 06:43:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqtxJ-000QNf-1G;
	Tue, 26 Aug 2025 13:43:21 +0000
Date: Tue, 26 Aug 2025 21:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Gent Binaku <binakugent@gmail.com>, rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Gent Binaku <binakugent@gmail.com>
Subject: Re: [PATCH] Rust associative function
Message-ID: <202508262139.1Dvu37Cy-lkp@intel.com>
References: <20250820210225.124288-1-binakugent@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820210225.124288-1-binakugent@gmail.com>

Hi Gent,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on driver-core/driver-core-linus akpm-mm/mm-everything linus/master v6.17-rc3]
[cannot apply to driver-core/driver-core-testing driver-core/driver-core-next next-20250825]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gent-Binaku/Rust-associative-function/20250821-050335
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250820210225.124288-1-binakugent%40gmail.com
patch subject: [PATCH] Rust associative function
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250826/202508262139.1Dvu37Cy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508262139.1Dvu37Cy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508262139.1Dvu37Cy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0185]: method `inc_ref` has a `&self` declaration in the impl, but not in the trait
   --> rust/doctests_kernel_generated.rs:10624:5
   |
   10624 |     fn inc_ref(&self) {}
   |     ^^^^^^^^^^^^^^^^^ `&self` used in impl
   |
   = note: `inc_ref` from trait: `fn(&Self)`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
