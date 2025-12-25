Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B432ABF7;
	Thu, 25 Dec 2025 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766676171; cv=none; b=O0/VIHmGVS8KbDh9410qKPPAFgL3+otLHTAOLZ+ekNy2vJ4WIhqYCbzxXqzICM81m3p24reQGFb91Q9gYEhjEYbLxLZyEx7XrhCc/3R2zMUcr6TEFhTo+oUKUiYF1FJJuHlCJ0h56wlO3v66vHaIhCJwvn0rJU8We1ZzXPivvGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766676171; c=relaxed/simple;
	bh=Mua5PcFuFTdif7xns+l4a0Wzx/++maU7a5zH11eSc5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3CtCpghHHmIRlUEq+mFNBI6Al9fkk7ZXb5lDK0gEVRM6szEm90KJ+e7tTPUV1xBxgn2/SgzBVD41qChb49Xv/oKk8ZMi9DnyXYZsMfDFs6SEMOKPjYDosAe/0k94Pg7XEYv/TDGXqFHCjGLYXA7LDy+OxFWR8ZKvSfzgBgSJQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Joaqmpro; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Joaqmpro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766676169; x=1798212169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mua5PcFuFTdif7xns+l4a0Wzx/++maU7a5zH11eSc5Y=;
  b=JoaqmproLs6huuxA3K41v88jo/eWE7rnd0zGis0TJ15dMtwxFEt7floP
   xgY0L4riSaNNIHcnTq9EzZLu1NSSA0rzzdmo4rpHedOW9BB4tXNyYC/n8
   ht8QGvj6D1bJ9tDw3KbY76043vsWgQLS4LqYTXeJQWcoiw6MG8xm7/+0U
   iAGYpghdnndKS+ffU7pAaPipoaBcvzi43hgaEKbco6g83t/CTVlqqZdvX
   B6AAPn+BY0lB0yPyqRHN+Jn9XZxlk/+vAn5mXSeulJvl2yu+QLy9zAFtK
   aRi24VOrKE2hA8PDAzF70iGa3K2pt4XlFJ6ZQruu566CyPz4PM11t6hk8
   w==;
X-CSE-ConnectionGUID: eJQ1PDzOQUmKCpXLaEBx2A==
X-CSE-MsgGUID: V6GFwDTiR62i2LPMMNGs7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68547245"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68547245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 07:22:48 -0800
X-CSE-ConnectionGUID: 2W6vjGClTKWQvvkL/AtQuA==
X-CSE-MsgGUID: T0cUWfwpRrew/1M6cK+N+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="199475155"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Dec 2025 07:22:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYnAn-000000004C1-0YjF;
	Thu, 25 Dec 2025 15:22:41 +0000
Date: Thu, 25 Dec 2025 23:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: Re: [PATCH v3 2/4] rust: kernel: Add pointer wrapper types for safe
 pointer formatting
Message-ID: <202512252338.UQxvMW2X-lkp@intel.com>
References: <20251224081315.729684-3-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224081315.729684-3-sunke@kylinos.cn>

Hi Ke,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/lib-vsprintf-Export-ptr_to_hashval-for-Rust-use/20251224-161946
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251224081315.729684-3-sunke%40kylinos.cn
patch subject: [PATCH v3 2/4] rust: kernel: Add pointer wrapper types for safe pointer formatting
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251225/202512252338.UQxvMW2X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252338.UQxvMW2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512252338.UQxvMW2X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `seq_print` in this scope
   --> rust/doctests_kernel_generated.rs:12267:1
   |
   12267 | seq_print!(seq_file, "Pointer: {:p}n", ptr);
   | ^^^^^^^^^
   |
   help: consider importing this macro
   |
   3     + use kernel::seq_print;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
