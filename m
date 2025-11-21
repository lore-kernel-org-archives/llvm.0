Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFFB28851C;
	Fri, 21 Nov 2025 04:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763698511; cv=none; b=GjJHK8aDFsFoEohfdsnlUkJUbkcvqwILQtHSdT6DTE2LO+LIC7iXVS0AtIu/lImgkKLG8AAhwtUVSjaySgewUqhXqiEHxbssVPgyP6cWc6Y8f/mCkQaZEhPy7/H2aM4KJn4JN8Sibwq/CY8liYrj/sw94qFWC8c6Nh+vbl09mRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763698511; c=relaxed/simple;
	bh=3lCCtmjZYFingQ5CIytDS/doJ3SFWEzbOiT8aJmfmxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2ofeDgvJAc29gDemQdxSywCO3VcElogPvUeVNfCR1MgsixNvKp7ZPK3hoERMLp+lHUJn/8w+TgcB6K28rin33eyCKFsi4w1+nL8UH5XFsDUbWPNqkiZ1nanAF0Yxkj1l5FDcThPFCuaV4eKr4nmyWQc3w6eNP8hOel3qoEAflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeLc9boo; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeLc9boo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763698509; x=1795234509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3lCCtmjZYFingQ5CIytDS/doJ3SFWEzbOiT8aJmfmxE=;
  b=WeLc9bookEFQzcNy/ZsUwpm7mXc4jJ+EdpC0UTmT9FqzVMUFCiwO59Qz
   VPXpC9jj/Pb4nvPNFZ2x1LRDdjR3YU3UMWQm0XVeWuXW1PtX+ZNQn5fQc
   bDaYANsYGlBaVZZ7vFXMkS1Gq9DjK4y+UNBAge/zBL2ZlBlla4hHgwm7F
   rTXu7qX5cDGPfoXfixCX++9X2weOQIDs2SS6LMXx8YJfvkmcKIHuEVFiA
   gg6XmC0sytsgATeORvP/Hf8xV3LgBnXOmsCCYsKlrdJf4f6KTNuzxqoSZ
   wTY+ef8Xu/oa/oMngKXluvFJUkNptkjdgbrZx0hnYtbkQ6q9M0SIV7Y6q
   g==;
X-CSE-ConnectionGUID: tWhGgG7PS7+l27t5fRJ+bQ==
X-CSE-MsgGUID: L8v3wdCwT6KCZrdnfnqYig==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69653444"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="69653444"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 20:15:07 -0800
X-CSE-ConnectionGUID: X9JaqSNMRSOwx5AbIwD5mg==
X-CSE-MsgGUID: 9JFDp9TjSvuvaYu/IIF8oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="192008763"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2025 20:15:05 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMIY3-0004w9-1c;
	Fri, 21 Nov 2025 04:15:03 +0000
Date: Fri, 21 Nov 2025 12:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-next:master 4075/10599] error[E0609]: no field `p` on type
 `bindings::device`
Message-ID: <202511211216.EUD1BISe-lkp@intel.com>
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
commit: 6f61a2637abe4f89877da3280775565baedb60e0 [4075/10599] rust: device: introduce Device::drvdata()
config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211216.EUD1BISe-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211216.EUD1BISe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211216.EUD1BISe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `p` on type `bindings::device`
   --> rust/kernel/device.rs:206:49
   |
   206 |         let private = unsafe { (*self.as_raw()).p };
   |                                                 ^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `p` on type `bindings::device`
   --> rust/kernel/device.rs:291:49
   |
   291 |         let private = unsafe { (*self.as_raw()).p };
   |                                                 ^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
