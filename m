Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1427B1EEE6;
	Sat, 23 Nov 2024 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732366908; cv=none; b=fjBLjci/xTohU5t+sEYktORXOFF24z1vTr/IhEW3Xjo/rbUJHQ9vFXMm5FwJo7YIv+QeVdvHZzCQwdGOcuJdsvU8RJAa9ovnPvdj7KI2xxqej2UFezOoipjgFWklPuip9CeP1ekqqq3gLWDvxLpUvMxdVSrDp59zZGPRpeUrH7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732366908; c=relaxed/simple;
	bh=PkLB2EKMGfyeA0YWK2imyVpgrz3ZuahKh7V3yLXuF7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7fGoHBHdkLURBXU+Ydeyx3Cp/gNJMZtuxGdSa5bSOF0Vj6+ULjJojFkrzSaApi8Saw2kHJxHITmT2+ufaLNF8XG9gVZVkEWbWIuVc8UX3VDCr4y2KSBMiI/SHTjz6WpRT+/mQVKVaPyuOWlTGtCMbKpmqW3ucxfm3cFUBtmXsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfbxGn30; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfbxGn30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732366907; x=1763902907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PkLB2EKMGfyeA0YWK2imyVpgrz3ZuahKh7V3yLXuF7U=;
  b=LfbxGn30xwrJJPiINoEylmZtZrgpzvXngSWNn0hmmXkaiXauPhZPdscw
   VlyqQyaVz/85LomG7ctxoeMjbh5ATePZsJIDrQRcNzB6FAwybgNyR60SZ
   s3yxfQUAlbP22yDBDcdVnYq/r+i7j0XoJoaJAm7+QDbquhsHFWXIfiU0i
   h2vfd5deJC8zweeq5MDtXKYo6VfpYY2zqG7YlOck7g+daTJxIv6QRcixE
   6a5RYpTl4gA/w1MNyFS5dncFQExJSpj9eVoxyGrAlTpCHtyh0K3Z4Nkv/
   cMUK1tw2k2S/ZmK5DIaRCU9cbNVuCW7XeqHZpN58f0+z3Psh6xOpVnY99
   A==;
X-CSE-ConnectionGUID: ObDB7Vu+TXuJvW539lgnuw==
X-CSE-MsgGUID: subfek+KQ1+/RaE6fXdF4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="32666657"
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="32666657"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 05:01:46 -0800
X-CSE-ConnectionGUID: iSEaPX3HRcOGPo0MnEatzA==
X-CSE-MsgGUID: qIyHfDzUSdyRcG/OTmVASA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,178,1728975600"; 
   d="scan'208";a="91619818"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Nov 2024 05:01:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEple-0004dT-1o;
	Sat, 23 Nov 2024 13:01:42 +0000
Date: Sat, 23 Nov 2024 21:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/190-rust 96/170] error: cannot find macro `vec` in
 this scope
Message-ID: <202411232001.pjkAkjgA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/190-rust
head:   d2162ac6537bde95fc68fe4ec97d67c43846231c
commit: 4083ae246e9f06bcf4c1e1e9208cd82c18ca6e48 [96/170] rust: alloc: Vec: Implement .clear()/.truncate()
config: x86_64-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241123/202411232001.pjkAkjgA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411232001.pjkAkjgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411232001.pjkAkjgA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1127:15
   |
   1127 | let mut vec = vec![1, 2, 3];
   |               ^^^
--
>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1079:15
   |
   1079 | let mut vec = vec![1, 2, 3];
   |               ^^^
--
>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:1031:15
   |
   1031 | let mut vec = vec![1, 2, 3, 4, 5];
   |               ^^^
--
>> error: cannot find macro `vec` in this scope
   --> rust/doctests_kernel_generated.rs:981:13
   |
   981 | let mut v = vec![1, 2, 3];
   |             ^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
