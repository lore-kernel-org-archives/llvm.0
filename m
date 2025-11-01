Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879523AE9A;
	Sat,  1 Nov 2025 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761986285; cv=none; b=PwtxlAkCnmujs715oB6j3CHSO52eaGZieoWdvk1f/f39SHZxT6eRA5fXMy9yDjwQ0+gBmAIUc8YBrEkcm6VyTxBxXyJH2YKoSw8LpYknFZT9sf0pOZ/nMgtM+j8qZ7YOUJKgsZs5l6YDzOCVtkzGIlKYs/l5Od77A6waTZsnPfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761986285; c=relaxed/simple;
	bh=z2fEPE9j9n4db2IKRJXhQG3PNmsCCmZeLxpe8ViJFOE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JmmUSBIWbWNIFz1vvvVLyDUrEQcGCfGlDvdxgIyVxj3G4/sQ8aOMEG1x/HnpmYQKBpbHEebfXHsJnFpWZNllPTrNl9PGY6SA9mpXL4i+U489ssE8LkvcOCBzfVORYg2iO4+i8GX1IASR2uyWPdTBWkiHwSwraBQWkXIVFHNIRPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVy2J4xT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVy2J4xT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761986283; x=1793522283;
  h=date:from:cc:subject:message-id:mime-version;
  bh=z2fEPE9j9n4db2IKRJXhQG3PNmsCCmZeLxpe8ViJFOE=;
  b=RVy2J4xTpMLZdLgwalSHULj+DTW+m/w5gq8i9x7SJ5d4qNQ3tsZDbmrC
   mKcT+YPk/BlOLSDnQtzRdlHN+ybcdW/dKMubHgYm9261XGlMN29oTqYCd
   PjnagKw5+zHu4v+b319TIIFfX4XnfEXmYl5GfAinOe4rPndcpT+kRbZZi
   p8yThl6U1Z39+KFu+FyfXD3BumJlliUbEE05fOzyL2KVPe+0LCLImKTeU
   cv2b7AmFAP7lJ8KRLOyfTdgzl6R9tqaOBmoLGzwg+V6S/oUORGKSNy4Sl
   08mvsczd01kTmdGz20TfWN94TeHLNxF000JF8M6AlvUO65GwkbBqpJs83
   w==;
X-CSE-ConnectionGUID: 2hD7o+ApSmKhV5R9x3L6cw==
X-CSE-MsgGUID: TSvPUyOrRVWX+05CrAbGww==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64288720"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="64288720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 01:38:03 -0700
X-CSE-ConnectionGUID: 7rI/VinVRiCBXkt6gS4I8Q==
X-CSE-MsgGUID: Vb9LlHVYQ2yOOXc8VwJIMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="191572727"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2025 01:38:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF77X-000O31-0t;
	Sat, 01 Nov 2025 08:37:59 +0000
Date: Sat, 1 Nov 2025 16:37:25 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [xiang-erofs:dev-test 2/2] ld.lld: error:
 vmlinux.a(mm/vma.o):(function remove_vma: .text+0x34): relocation
 R_LARCH_B26 out of range: 246669740 is not in [-134217728, 134217727];
 references 'dynamic_might_resched'
Message-ID: <202511011651.U3915LM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Xiang Gao <xiang@kernel.org>
CC: linux-erofs@lists.ozlabs.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   3bf692888f2707392872a69cd125c800778e72e2
commit: 3bf692888f2707392872a69cd125c800778e72e2 [2/2] erofs: avoid infinite loop due to incomplete zstd-compressed data
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251101/202511011651.U3915LM4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cc271437553452ede002d871d32abc02084341a8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011651.U3915LM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011651.U3915LM4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(mm/vma.o):(function remove_vma: .text+0x34): relocation R_LARCH_B26 out of range: 246669740 is not in [-134217728, 134217727]; references 'dynamic_might_resched'
   >>> referenced by vma.c
   >>> defined in vmlinux.a(kernel/sched/core.o)
--
>> ld.lld: error: vmlinux.a(mm/vma.o):(function unmap_region: .text+0x14c): relocation R_LARCH_B26 out of range: 246626804 is not in [-134217728, 134217727]; references '__sanitizer_cov_stack_depth'
   >>> referenced by vma.c
   >>> defined in vmlinux.a(kernel/kstack_erase.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
