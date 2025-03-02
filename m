Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95841ACED2;
	Sun,  2 Mar 2025 23:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740959330; cv=none; b=T7OiQUV+H2lqnVBOFI5pXTUYpF7n0aLy0GweBX6KQruQMCv7gZiW492WPZGkZUvobDdOJMJufq96nlv5RtTnVf3VToJlpLMbbDiGEr932F1eS3F55NjXVfD6YcU9ps00ot0bh9jEdNTgragyVU7IjKjW1viP1glh9xGdq9YOxLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740959330; c=relaxed/simple;
	bh=P4P5q1j0BL73vsYBvmhK3iqresZKXum9b4feznRvNN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BWw1YP2R3rWJE+0OOaqtQXbayfgc8omGHzCM0IL8ZFtnLBF6ims1+9SX1VzJ8dRQjlFg1d8pv8veYFxvNHZFmcY91QpNhxnP7LjjOmw8kxZc1K1W7/mg5Ar0P2L8DXq69e78o/33K6YU7WdQ7qvc0j7K24HAhYLa0LCwZy4g6ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqaXGsFP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqaXGsFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740959329; x=1772495329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P4P5q1j0BL73vsYBvmhK3iqresZKXum9b4feznRvNN0=;
  b=VqaXGsFPeujVlnYiLQ8MHSCK5R6kkRdNVOAVzHRDxqrnGHbcQjaFUDLi
   bDdjR5WxmTRZ/cr3c0QFTqvyxRjn6CV0DTAEz+4B4n+pPzMmUnoRUVCAn
   /kHzYGNqcjD/0JIyQtf384S6h9vC6aHeoWRrWp47Aqm/88F+5Vi7sQqeM
   xT8jo8uR+wxNPD9HEMZCtXOStX26fypl0sa2HiTF9a+pag6/BvID/6ELa
   fLkOkxWgkOxZK3Zwt8a1y1gqYc8H/Hagg7/7AbX/tgLAJsL1PCZ2HXpDw
   sD5brY5B5x6aTnwgS8A9t29PKht6kWzctMcS4Vh73fekJwIL4gWwC5tBB
   A==;
X-CSE-ConnectionGUID: dz2EhGLLSl+i68wvF8PhtQ==
X-CSE-MsgGUID: ApWEGFAYSRWNtynN35GEQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41711352"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41711352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 15:48:48 -0800
X-CSE-ConnectionGUID: NPdWhZQ8SCeyG7Fp4Arkjw==
X-CSE-MsgGUID: ZtKe+IP2Qmi9vteJez5jKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="118542825"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Mar 2025 15:48:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tot35-000HjG-2j;
	Sun, 02 Mar 2025 23:48:43 +0000
Date: Mon, 3 Mar 2025 07:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>
Subject: [tip:x86/core 16/17] vmlinux.o: warning: objtool: do_jit+0x276:
 relocation to !ENDBR: .noinstr.text+0x6a60
Message-ID: <202503030704.H9KFysNS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
head:   dfebe7362f6f461d771cdb9ac2c5172a4721f064
commit: 0c92385dc05ee9637c04372ea95a11bbf6e010ff [16/17] x86/ibt: Implement FineIBT-BHI mitigation
config: x86_64-randconfig-071-20250303 (https://download.01.org/0day-ci/archive/20250303/202503030704.H9KFysNS-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030704.H9KFysNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030704.H9KFysNS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_jit+0x276: relocation to !ENDBR: .noinstr.text+0x6a60

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
