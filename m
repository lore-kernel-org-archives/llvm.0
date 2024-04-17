Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B387747F;
	Wed, 17 Apr 2024 03:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713323238; cv=none; b=rsVlhQygY8Tj5dt0Mpd8xqg6fDHSbpLt1ZP/7IKhZ4BwVSCzSakjYADonGuO71fkvlBstfyDpOw8cOpszvz8EMK59mXBgHg8t09S/G4tP0bDz23Yp3xnmS4t8YtHdybLjQDrIw8DGtLUaXwd0oy/uZyxp9FAyB2g4LY+yywhBpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713323238; c=relaxed/simple;
	bh=j9nshaIORGuE610NnMjpGfqzlb1Bfz8aY7WRMFfNLc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cFPN+eIKk1T/DMryE+i9IDdYJRcKvXWQ1HUYj6kKEdrNhsBb4GEfqWBYlGENzmYVCOWhbgdWVdMd0tRL7Te4US9credxbXeGQ3QtZSVX35RPq0TaHjmMRKXxMw+18VtHi7Jyj2WpMRqIIzTZQCgIqQLvjqUOrnR08OqwjF5EAks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9SV3VCI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9SV3VCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713323237; x=1744859237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j9nshaIORGuE610NnMjpGfqzlb1Bfz8aY7WRMFfNLc8=;
  b=M9SV3VCIPWGnbGTYmidaqaqOa9KOkrrAzmPeG64O7TgLHX8EUjpWN10P
   EUoqtoxmBdfRDBmRr3whM0vbCxSZkfFbR5VdEVUmezPagU/Gd4Jlz4neQ
   11T2Kd4ulfezWsmr3k3pzToFwC5tStOWb0E/SA0qBcLyalDkOFWD06Yp3
   T4kgPcIzXWy+Zltf2q55gz4xrSe+gzuiGZHa6YfeTpd9r5HJ7SMKYry66
   B14KNzY6K8hYx287ubghxapeJ8bFmdBd5T99/kXyBvIUiLK3zqniLY3qW
   tNVVEoDObQCArbkgC3kajc03/M7Ej3JXa1ham8cYQoxxWkVPSqoa02kWB
   Q==;
X-CSE-ConnectionGUID: mKI1jRBFQ4ibzTwedxoexA==
X-CSE-MsgGUID: 4G5M3NOLQpCyYASvhHQmfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8721182"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8721182"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 20:07:16 -0700
X-CSE-ConnectionGUID: fKKpmX5sTxu0Xir/0wFgiQ==
X-CSE-MsgGUID: Js6du7JHR+aJjTwVbMLMNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22340676"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Apr 2024 20:07:15 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwvdf-00064K-2B;
	Wed, 17 Apr 2024 03:07:11 +0000
Date: Wed, 17 Apr 2024 11:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jeongjun Park <aha310510@gmail.com>
Subject: [akpm-mm:mm-unstable 16/409] lib/bootconfig.c:909: warning:
 expecting prototype for _xbc_exit(). Prototype was for xbc_exit() instead
Message-ID: <202404171107.X3xWzt1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   6723e3b1a668df6b8f305dea8fb62789155d965f
commit: 408d784e0b9f1a6e30c262b48e1b29aff69690f4 [16/409] bootconfig-use-memblock_free_late-to-free-xbc-memory-to-buddy-fix
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240417/202404171107.X3xWzt1i-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171107.X3xWzt1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171107.X3xWzt1i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/bootconfig.c:909: warning: expecting prototype for _xbc_exit(). Prototype was for xbc_exit() instead


vim +909 lib/bootconfig.c

f3668cde856299 Masami Hiramatsu 2021-09-17  899  
76db5a27a827c2 Masami Hiramatsu 2020-01-11  900  /**
408d784e0b9f1a Andrew Morton    2024-04-16  901   * _xbc_exit() - Clean up all parsed bootconfig
408d784e0b9f1a Andrew Morton    2024-04-16  902   * @early: in early xbc init error
76db5a27a827c2 Masami Hiramatsu 2020-01-11  903   *
76db5a27a827c2 Masami Hiramatsu 2020-01-11  904   * This clears all data structures of parsed bootconfig on memory.
76db5a27a827c2 Masami Hiramatsu 2020-01-11  905   * If you need to reuse xbc_init() with new boot config, you can
76db5a27a827c2 Masami Hiramatsu 2020-01-11  906   * use this.
76db5a27a827c2 Masami Hiramatsu 2020-01-11  907   */
115d4d08aeb942 Masami Hiramatsu 2021-09-17  908  void __init xbc_exit(void)
76db5a27a827c2 Masami Hiramatsu 2020-01-11 @909  {
4ee1b4cac23665 Masami Hiramatsu 2021-09-17  910  	xbc_free_mem(xbc_data, xbc_data_size);
76db5a27a827c2 Masami Hiramatsu 2020-01-11  911  	xbc_data = NULL;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  912  	xbc_data_size = 0;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  913  	xbc_node_num = 0;
4ee1b4cac23665 Masami Hiramatsu 2021-09-17  914  	xbc_free_mem(xbc_nodes, sizeof(struct xbc_node) * XBC_NODE_MAX);
a91e4f12ffc42f Masami Hiramatsu 2020-02-07  915  	xbc_nodes = NULL;
ead1e19ad905b9 Masami Hiramatsu 2020-09-21  916  	brace_index = 0;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  917  }
76db5a27a827c2 Masami Hiramatsu 2020-01-11  918  

:::::: The code at line 909 was first introduced by commit
:::::: 76db5a27a827c2c89e5120a3d486472da847863b bootconfig: Add Extra Boot Config support

:::::: TO: Masami Hiramatsu <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
