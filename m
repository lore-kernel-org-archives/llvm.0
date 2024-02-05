Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B671BC3A;
	Mon,  5 Feb 2024 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707134569; cv=none; b=DAhARyVaoLhPhGw+mdEPbgl+MSLVAr2dIBISeRd0wTgMWfhjuJk5SAW3qhy54ZJzYQ66rvM0qMUo+4GC/7bot+rFYTveP8kznrlK6+GkkcHswLraz7PXP+dcoBKvk3A8cUrS+sJT6fdvw9iL+HHEJXJT9i6oqbq4j5f8YV8HSo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707134569; c=relaxed/simple;
	bh=MJvPEVoxJPArqhz8BvYFTco6vSqCPY2LAOZzS4KBWnA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZLePFP7oxhJkQiN3yiJV5JRDT7ezwjTShMxinlmLgHvmL7xGgDUcgcwcLyH6GfFEh+sa3a/uOoNyol3TORmKpiBrf3a96wuPH0CAKXvFFulNSLhzqzm13gR/mPZPzhFS3pK4l3BvQdnRg5jldJyeL736Qxc5601GTZlMAYxHUQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUMj0q0t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUMj0q0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707134568; x=1738670568;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MJvPEVoxJPArqhz8BvYFTco6vSqCPY2LAOZzS4KBWnA=;
  b=nUMj0q0tSFwP+R33vYm7vOi7Owzg6fzOmIlaLPxAaQ8xBYp+eiXUbJx1
   QtXUXAr2x9oRjbBKvRI7KsZsS5e7e/y/OEhPCBOYcVZohfVUwWN1vEE4A
   tK9Mdw4fRrToth7N/CFEzOluiWLabS1MN2tgb+07fH+4aNvTMjtLPl8oa
   IoLoFUW9rIhdq15dqJ0bBAsXYs+Q+c/C3xaThb3FYY8n6jXvYCatzPvqN
   Z7t3a5TmipLm605eao6y1f7CPg4bT1jJIqSYv0fdgBKDhDT/5b/rCANgF
   mbKY9gjicO8wB+ZfY3iYLVDMqwivYJVlHiK0ln/I6O4p7WFc9jhT0UXMV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11094868"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11094868"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 04:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="757103"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Feb 2024 04:02:27 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWxg9-0000Ui-0T;
	Mon, 05 Feb 2024 12:02:25 +0000
Date: Mon, 5 Feb 2024 20:01:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: pwm_mediatek_apply() falls through to
 next function __cfi_ntxec_pwm_probe()
Message-ID: <202402051921.Xbc264Js-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sami Tolvanen <samitolvanen@google.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478
commit: 3c516f89e17e56b4738f05588e51267e295b5e63 x86: Add support for CONFIG_CFI_CLANG
date:   1 year, 4 months ago
config: x86_64-buildonly-randconfig-003-20240112 (https://download.01.org/0day-ci/archive/20240205/202402051921.Xbc264Js-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051921.Xbc264Js-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051921.Xbc264Js-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fault_in_readable+0xd8: call to __tsan_volatile_write1() with UACCESS enabled
>> vmlinux.o: warning: objtool: pwm_mediatek_apply() falls through to next function __cfi_ntxec_pwm_probe()
   vmlinux.o: warning: objtool: fixup_bad_iret+0x25: call to memset() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
