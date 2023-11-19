Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E6418E15;
	Sun, 19 Nov 2023 22:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdHDpQXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700432576; x=1731968576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z712roQ+Z3IjAHPPRhYNaGg0I5PFx2mMvhm4YZIMOME=;
  b=UdHDpQXW6h3vEb0jxBKenkrfP/uQ5ISVjzPZmY5MMktF0z9GbMkReeJO
   BgHYMKuceLrgjE/Gkt63UnvUxK0UfsmALGpZhOolxwb4U0gkVMsCT8NWb
   5ithpFKNFCtO2H/jP9c0nOB4iD/IcT20YzxsNqUt+c7/ug260ztRGqKlw
   8bfAzugwCtRbIv21NvDWoGxkTST7BRF3wcoBdMcr/P4W3gbjop1IzxnOQ
   yHbAaBvwlRrVHtJovr+2P3UXte/vcJWYOpeOr5/dahGxuSugiIu5jl9wg
   UY1hW7ODbVKVHGscQT7zmOk1lUNWRdBL53zG/oVcRgfNx2LffrKBAjJin
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="4700779"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="4700779"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 14:22:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="7521964"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2023 14:22:53 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4qBm-0005db-2s;
	Sun, 19 Nov 2023 22:22:50 +0000
Date: Mon, 20 Nov 2023 06:22:12 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: warning: unused import: `ffi::c_void`
Message-ID: <202311200633.01qo6GEu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: ae6df65dabc3f8bd89663d96203963323e266d90 rust: upgrade to Rust 1.72.1
date:   6 weeks ago
config: x86_64-buildonly-randconfig-006-20231120 (https://download.01.org/0day-ci/archive/20231120/202311200633.01qo6GEu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200633.01qo6GEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200633.01qo6GEu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `ffi::c_void`
   --> rust/kernel/kunit.rs:9:12
   |
   9 | use core::{ffi::c_void, fmt};
   |            ^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused variable: `args`
   --> rust/kernel/kunit.rs:15:12
   |
   15 | pub fn err(args: fmt::Arguments<'_>) {
   |            ^^^^ help: if this is intentional, prefix it with an underscore: `_args`
   |
   = note: `#[warn(unused_variables)]` on by default
--
>> warning: unused variable: `args`
   --> rust/kernel/kunit.rs:31:13
   |
   31 | pub fn info(args: fmt::Arguments<'_>) {
   |             ^^^^ help: if this is intentional, prefix it with an underscore: `_args`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
