Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9C41C64;
	Thu, 22 Feb 2024 12:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708606236; cv=none; b=Uz+2MtIe+6YNtAu278N1msHGUZgviSuusErTvUhutlq6RftJ0UGJOP1xF8ZVr+lanvZ1K9qit8+Th1k0wkzDwquc8sdHBGOzK4ByLyC1SYknUYFevZ7uBlDkSA30lzq+EA8W9+1VjhTwUoyRro/FddmY5CWHDMwbIGAljiJXKcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708606236; c=relaxed/simple;
	bh=fmW6JCu4dfPyL8pYJXr5AFlDgTiKx+jNbSuNXAh3mYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5ph7l3jgv3gzFVkd0d3yXzh0ZxMm0cZ4/XmAae4H2BE5umccwTmVFnwL2Cl84+gSB/Z5Le7iPDR9cade9FxO7KEhQVyBYklv/FVHN2ErgMMDZNwabMG8fLqv9CcsDTCAZh6C0M1Sta29gJu4XBiDAoCGOxTF7t5jmfXYgbazBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuYjnULe; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuYjnULe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708606234; x=1740142234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fmW6JCu4dfPyL8pYJXr5AFlDgTiKx+jNbSuNXAh3mYI=;
  b=BuYjnULe9xh82IsPYwb56C0n6L46+71LhI+Ai3uhj8R5RW26Bqpug3Tc
   aE8PkvUZxpz3KdUJmA3YA0mx+ODnzI85DPDdd21KeW7/BK1gIlZUdHNvp
   53y28tx98L4CtMSRFfMMbFRRecx83yhkLTQAm28HUeYk6I40cqXOHqr6d
   9k73Qp3qUYTlf1EjSzFlbLF1gTa46eQE2Q1/5vtFrf5TpRKgtL5ux32D/
   CMrJ4xK3A+d7W7M1jjIlOms+uc9Cs9ws7IxrVBUo06nd1KJD/uZdKLo2j
   5cfReCseEErSi7LIq3ccOo6z0GzVgJJwhHpL2O6A3p5AwnhW7ILGFilDT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="5779613"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5779613"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 04:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5794827"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2024 04:50:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd8Wx-0006Jk-2A;
	Thu, 22 Feb 2024 12:50:29 +0000
Date: Thu, 22 Feb 2024 20:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2-iomap-rebase-v1 18/20] fs/ext2/inode.c:981:17:
 error: incompatible function pointer types initializing 'int (*)(struct
 iomap_writepage_ctx *, struct inode *, loff_t, unsigned int)' (aka 'int
 (*)(struct iomap_writepage_ctx *, struct inode *, long long, unsigned int)')
 with an ex...
Message-ID: <202402222000.SiLfZNqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext2-iomap-rebase-v1
head:   15e7b48cbf2af2424d794e3cffd1e49d4144d995
commit: ff07adc7c4187eb7ea9ce174d8d9207d8a46c869 [18/20] ext2: Convert ext2 regular file buffered I/O to use iomap
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240222/202402222000.SiLfZNqG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222000.SiLfZNqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222000.SiLfZNqG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ext2/inode.c:981:17: error: incompatible function pointer types initializing 'int (*)(struct iomap_writepage_ctx *, struct inode *, loff_t, unsigned int)' (aka 'int (*)(struct iomap_writepage_ctx *, struct inode *, long long, unsigned int)') with an expression of type 'int (struct iomap_writepage_ctx *, struct inode *, loff_t)' (aka 'int (struct iomap_writepage_ctx *, struct inode *, long long)') [-Wincompatible-function-pointer-types]
     981 |         .map_blocks             = ext2_write_map_blocks,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +981 fs/ext2/inode.c

   979	
   980	static const struct iomap_writeback_ops ext2_writeback_ops = {
 > 981		.map_blocks		= ext2_write_map_blocks,
   982	};
   983	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
