Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E539420E6;
	Sun, 30 Mar 2025 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743375437; cv=none; b=OPWDE+mu5PFz5NMp1RgxXTSN/GmYvTbQKHCM7s7ao3qHIc1SXBJ6ZcY9Uwv9tiurq14KrhkIdzeYxLU/52iRJJzGn277iLC9lxnVx1nm3TdJvMDYI/OMWZjZtp1s2Ex4P2HFr0siMEU5lQ8CXFUZVv8l0+g8I5DUAx7tnr5Va3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743375437; c=relaxed/simple;
	bh=gjxedMQ41MoCDQnK+MvIwaRMTqJLgSBdXjruxPY5h6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SYy4K6mDfyRiVA8I5xMLGLwsGMP86+GEk04/z5PPzxml0Q/BRizwvPhJ/6vg61AnKcotFzApiMli2uzZZIzC/jQZdwL+mI7a1x1qj4c07WPPdJkPyd84gX2HPbWTTAPEL3phqjMcMyT+xcjAwYEJMMnVs+z01UtqgL9HXteDam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOqecLzc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOqecLzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743375435; x=1774911435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gjxedMQ41MoCDQnK+MvIwaRMTqJLgSBdXjruxPY5h6E=;
  b=MOqecLzcJq5+tru+sX+VV5bSibjVhvTQiKDLTGr2WM9gCBdo+6YQFBq3
   Mag/Zi/TgD5/b7eZH5+e8zdwWU6oIKH4odsreUOn6cu1/kYO8daJkXHle
   ZNuISckQhaHuKzm44OkzWOb5rXgxxcOKvFzozshDeflHVNqgs+8+luHdc
   YK6kei6tBQsC9bgZmuPaXaG2oM6dce2I92hXN8dbG53crfpksyBeVQWPG
   mQPTDk9YhNt6eVVgPJGXDMgbfdUOxVrE4s7CslfqHsPGz6D5h+kc24Sii
   fG3d7CptOML+VmCJc6O3gA3kn+YbrfGGYJPcrBuPkRIsI7z5+11CyZscm
   Q==;
X-CSE-ConnectionGUID: KhfdNtJ4TqCyL8ZYmiyENw==
X-CSE-MsgGUID: AQ5aXULTRpquncT5RHq4VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="43907088"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="43907088"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 15:57:14 -0700
X-CSE-ConnectionGUID: mwW0p2c8Ry66ov9e8sdG0g==
X-CSE-MsgGUID: qkw7sUBoTIma1OBvf8zGgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="131154893"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Mar 2025 15:57:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz1aT-0008v0-37;
	Sun, 30 Mar 2025 22:57:07 +0000
Date: Mon, 31 Mar 2025 06:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-crypto 12/12] ERROR: modpost:
 "__kcfi_typeid_sha256_block_data_order_neon" [arch/arm/crypto/sha256-arm.ko]
 undefined!
Message-ID: <202503310608.Sfq1hKkn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-crypto
head:   5e0c73a309dc89400fca72e888f4879582465293
commit: 5e0c73a309dc89400fca72e888f4879582465293 [12/12] crypto: arm - add missing CFI annotations
config: arm-randconfig-003-20250331 (https://download.01.org/0day-ci/archive/20250331/202503310608.Sfq1hKkn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250331/202503310608.Sfq1hKkn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503310608.Sfq1hKkn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__kcfi_typeid_sha256_block_data_order_neon" [arch/arm/crypto/sha256-arm.ko] undefined!
>> ERROR: modpost: "__kcfi_typeid_sha512_block_data_order_neon" [arch/arm/crypto/sha512-arm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
