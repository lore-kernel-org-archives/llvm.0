Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAB0243956;
	Sun,  4 Oct 2026 04:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791086869; cv=none; b=RvvVki8sZ7eKMAMafFgkRH50B6cNXAFuB/wfY4k0MJvm95CBHTmYlao/J/sVFGlYcagbzGh+xawO8ANzDB7v9emefKTsTDB5Rn/zMv88WxsN8Wfy2xNcuiIOlOHQqHfuxhgX4+5SSY2sPDb7dNZnlsqP5O+ia7g9nxu6NuJety0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791086869; c=relaxed/simple;
	bh=8HQJr2QEyQMraJ3mh4bm0Lknr2yqYpaSMrC22G/ty8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AmbIwfeorEXxJ1xnUZ5i1oqUM9549s1TcC93MN5AOvkG9IZWRDJcTlRC9roJXk6mn42CW0lWWDXvEvn6JPy/DzMU98a3TrnKDGQRZs1k+xgcSeJHsLEh/XgOvDoWEI+cj4fBb9w0vkqxvbCpdMGb4Zs6pVIo2SzKmfQMOKu8KdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UC5Midex; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UC5Midex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791086867; x=1822622867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8HQJr2QEyQMraJ3mh4bm0Lknr2yqYpaSMrC22G/ty8c=;
  b=UC5Midex6RvEnzoC2cKTbMgB0Gaq+yrQvFOepBHar9bYuPkTfy4Kv1Cf
   GiuJuMHEeGMSwQuHd6yIGwus9m28D5ivUQy1FGsItvi5ZSthmxvjf1NwE
   m1JSD1bCaCtiVj27EwyjN43aQbT5AVJrw22H8V78GpZfQrp7v6E0pGsHh
   ZKJ0SpQ+zUi8u4WuSzLe1sWWXrj5+VK0ZMYKcBdhIro7RG7vWDnY7BC8x
   nin32W6/SL1oynDkXCIQdpDpM9eaDgSQGoqhXEVjrycLGJI0Nu9pXiW7o
   yRAQZhnll25skSYDi/VineiCi+OHPkuNfNE++8LSYEOlbhhsasspGTGuS
   w==;
X-CSE-ConnectionGUID: 0PSFdKTaTCGuznjxY8Rw+g==
X-CSE-MsgGUID: PKpNR1ehRYGecYvJDfQFGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90693282"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90693282"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 21:07:46 -0700
X-CSE-ConnectionGUID: 4BprZQPXTqWofE4Ny9djLA==
X-CSE-MsgGUID: Qnr9kLuLRqS2fsz76kXY+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="570113"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 03 Oct 2026 21:07:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDDVn-00000000URb-0co0;
	Sun, 04 Oct 2026 04:07:43 +0000
Date: Sun, 04 Oct 2026 12:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rust-kunit-assertion 15/15] error:
 literal out of range for `i32`
Message-ID: <202610041200.BnpXhO0V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rust-kunit-assertion
head:   694018da3a2ec9356bb827e371b124feaad71569
commit: 694018da3a2ec9356bb827e371b124feaad71569 [15/15] kunit: msg
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261004/202610041200.BnpXhO0V-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041200.BnpXhO0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041200.BnpXhO0V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: literal out of range for `i32`
   --> rust/kernel/drm/gem/shmem.rs:686:39
   |
   686 |         assert_eq!(vmap.read32(0x20), 0xFEDCBA98);
   |                                       ^^^^^^^^^^
   |
   = note: the literal `0xFEDCBA98` (decimal `4275878552`) does not fit into the type `i32` and will become `-19088744i32`
   = help: consider using the type `u32` instead
   = note: `#[deny(overflowing_literals)]` on by default
   help: to use as a negative number (decimal `-19088744`), consider using the type `u32` for the literal and cast it to `i32`
   |
   686 |         assert_eq!(vmap.read32(0x20), 0xFEDCBA98u32 as i32);
   |                                                 ++++++++++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
