Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295D344042;
	Thu, 20 Nov 2025 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763656902; cv=none; b=mGmSZQ1Y3nzN03Sn8rSz8a6CqGeS63GD8hJjZBVx1B3uSXKOHvA++eNP4BVC2lc0tpahPPOM5igGDls1QNOwCEZvx1NP4GheynZSegYI3fvbaBI7xzgZQm6GL6Pk42ROu5wE50jibpKIfx3blmIlwp0TF0sUxDdMvCaER4jtRiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763656902; c=relaxed/simple;
	bh=Q4wph/mMZjjd77B72cncj35YfQ2DBSpBOYDGuwtCsi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J1UqDSGafJLgmmUTlSAZ9HL42/RXdoBojE/dtkF29eYjRfdHZVyV47OenJaIWAy4OtuvxSGa468++2g+UWTWng068/FJIgtALltaTGDT22C0DVQl9/TWgvAEf3iBQIJX4y0f95jk85uX+ZtZrtxiPLP2owi5hbDKvIMzGLTP3YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FNVS1lEr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNVS1lEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763656901; x=1795192901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q4wph/mMZjjd77B72cncj35YfQ2DBSpBOYDGuwtCsi0=;
  b=FNVS1lEroDU/49GMKXPwjNz+hQDDggRvA5eFlkeeIw2N+rVFZA1KL4YN
   qZvL0ITaeSJez3qK+vq0lQeOkwYB/oFWbRGMiQiWYPT0i9ZwrrI7M532r
   IYm+nTHrPq3RX4yvHsOA/XwyT56m854k8ruotR3Uup+9HGtf9EltM26jb
   aAPz6i+ffspPzqddJVK0dGzAm/2bYKvFUh4mALxsmJr7taHO5CnSdMSLD
   /BmE/f8UFJILs7zKmjUEAxXo+ggHayhO89xsTVL3aqiJRTv8BVk79DQlb
   gwkI3Jt4HQ+worr+cJL2EFg32xoCrTvCdq3zs0WJgXAjNIOvyRPeZ2qLP
   Q==;
X-CSE-ConnectionGUID: h0WNmTdZQXO8X5YkYG/Ahg==
X-CSE-MsgGUID: RBRsZX/VSEq+WfW+qKa5NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65822674"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65822674"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:41:40 -0800
X-CSE-ConnectionGUID: yddx26sQTD+fr7hr+owRjA==
X-CSE-MsgGUID: sok7ZA0CT2O1OL3LHsbXiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222363181"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Nov 2025 08:41:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM7iy-0004HR-2W;
	Thu, 20 Nov 2025 16:41:36 +0000
Date: Fri, 21 Nov 2025 00:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Subject: [linux-next:master 9676/10599] ld.lld: error: undefined symbol:
 rust_build_error
Message-ID: <202511210055.RUsFNku1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: 01e345e82ec3a5a7edeb9fa0dcb7fd4b0e5c534e [9676/10599] rust: num: add Bounded integer wrapping type
config: loongarch-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251121/202511210055.RUsFNku1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210055.RUsFNku1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210055.RUsFNku1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rust_build_error
   >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
   >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u8, 1>>::from_expr) in archive vmlinux.a
   >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
   >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u32, 4>>::from_expr) in archive vmlinux.a
   >>> referenced by build_assert.rs:83 (rust/kernel/build_assert.rs:83)
   >>>               rust/doctests_kernel_generated.o:(<kernel::num::bounded::Bounded<u16, 8>>::from_expr) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
