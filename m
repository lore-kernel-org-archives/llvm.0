Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751710F9;
	Mon, 25 Nov 2024 01:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732498905; cv=none; b=NvIiTgSR1EvIwFS74hHnfWwtVvSyGc0vwCuCgue/W7dEiIrFOQcwPDSU8Z3krD1SNo5maXr40zI2IgvMTqAf3l675wAtLJg3F2ql8pBTTrci0kxDsiGdNOu2GAu9bxddTPyZymNsSeJQ7ZIU1gbhQ2hti493Mwxnvi05KqhMFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732498905; c=relaxed/simple;
	bh=EJ6NSZ+OjT01E57w2xfT+4UcKJe96GzEgj6YezZX7XY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pFOJFKxiirLBARYKu5iZd7FcuRat3eDFPbHi0K74tN0SG+5zimcBY+1ouFNTf18djKuUgRJucbE87y2teDxgHKxNCCJsQqSqwFSLBtqlUEES7wnKAwDhI9BI5A3On2JJHFbmpqXoBZSkHKx2GgS8mU0RK+wbEDhijSFMsrn1XmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lq92///d; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lq92///d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732498904; x=1764034904;
  h=date:from:cc:subject:message-id:mime-version;
  bh=EJ6NSZ+OjT01E57w2xfT+4UcKJe96GzEgj6YezZX7XY=;
  b=lq92///dMGHAFbHV/9HZVxSncUOUUepOPVhF68lCJkQrnK6uJJ4dzbsO
   A8Zmy4YMPY/1VJ0g2Gx3GGZ/nOO1+SzBevaf/ng3clJBGSMgRtw1NEKAu
   Nes6hcqdiNB1tkqAV3waeMVbP/O9IusTAQy2XO0+h6jYKGeb2CHNQB9c/
   1rvKZmJkSDJ2d7AH/P3nGssHG7NdCVDSYVd56f4rgqa77cxY00HVVg6l2
   JTB8NOPO1JFv8iXPdbNxvz9BK1opxOZiGag1jBgpFqVWfPLNFrZ1/5nzO
   JuAx7qYKzA0iBw1jSKaL+ALerVjrb0C1v9DpsuRYgPsWXJOZmAIPi7Bpk
   A==;
X-CSE-ConnectionGUID: MLvB/uaSQ6O/+8QGP8f43w==
X-CSE-MsgGUID: z/uAAzesQ0iSl1O9Iek4+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43245437"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43245437"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 17:41:43 -0800
X-CSE-ConnectionGUID: AVc/8Km4RC6R+c4xAZR4ng==
X-CSE-MsgGUID: 9sh2KyQbQByaQtsC5wKnMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="128624560"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Nov 2024 17:41:42 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFO6d-0005Lr-2h;
	Mon, 25 Nov 2024 01:41:39 +0000
Date: Mon, 25 Nov 2024 09:41:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x55: relocation to
 !ENDBR: machine_kexec_prepare+0x675
Message-ID: <202411250911.heNa5SI9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: d88e7b3e35cff2c318042990d70828f64c3ae296 x86/mm: Introduce kernel_ident_mapping_free()
date:   5 months ago
config: x86_64-buildonly-randconfig-006-20241125 (https://download.01.org/0day-ci/archive/20241125/202411250911.heNa5SI9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250911.heNa5SI9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250911.heNa5SI9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x55: relocation to !ENDBR: machine_kexec_prepare+0x675

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
