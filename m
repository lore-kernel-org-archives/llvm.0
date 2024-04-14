Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D4134CCA;
	Sun, 14 Apr 2024 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713112018; cv=none; b=oTlAfUKVuCc0QmGzdReszQ1NCFt2FSvvx8EdpR5p2Vig2FkOwlyBnWfKERHSNIUE894B0WNdhoAN7VLE2f6Hwi62CoBvc1pzhLiVDzBWiEpe0SfHLdyk205qbyaIQSvjZRqwcz4oSPUeTtI60W0BGQ070tGfDduEHRsUX/VsssI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713112018; c=relaxed/simple;
	bh=G+VqUT84LBaggCfULJTiLTzfsvLv9IeU/joI2avxV2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkvNr+bEgzoE3l+DocFvYGIp7UKW0NdmA2tYYYPa78qMHx0A31uZ5T1MrVy0rDYMT421UkUJLnv6254lceT6XCTAHYOIujEAWbUsuVD09sWP+uTTggmrvldHovRJGYHwxRkHuBtk4pp2a8IgdEdCI69tVHuPVsFpK5Io4ElRoN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpUzCAn4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpUzCAn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713112016; x=1744648016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+VqUT84LBaggCfULJTiLTzfsvLv9IeU/joI2avxV2Y=;
  b=CpUzCAn4OB/IUyFGXVbgxfD21b9BC/p4pDz5cQlh7QYfnYQTL2Bz5BFD
   2Xpb0hZL+OhB/QmpF85Y08BEgCCQEhfiiRVzB5yTluXsEKKvWz7AFJa5i
   tb6Jq0eB12k/6HfRmem2Mfll1pKdhT1o7qRCt55plI36DSs6fZxQp8Cra
   BM7KUnytMGk7ha8q7gOmC9FzFo+VG84pafXlpDVCgWRlqCx9ctrm070pl
   4lT9cnIU5RIwWSqqcdLkNbLrycTvQo4UMpsLxCEBouAa8PkLGS/gu9bo6
   4ZxvKxRMWb2jAqp30jG41pt92O8szsLxZ2nNZzFJwCZt8Dobtmlwr8OyP
   A==;
X-CSE-ConnectionGUID: Yhdaan5PS5WnXWouWGlbSg==
X-CSE-MsgGUID: QhqT5+szRu2mULIEXyQ/tQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8672327"
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="8672327"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 09:26:55 -0700
X-CSE-ConnectionGUID: UNEYBkeUTXaCj2GJtueJhg==
X-CSE-MsgGUID: 0oanF0LhQSeBemwolAmMCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,201,1708416000"; 
   d="scan'208";a="21747460"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2024 09:26:54 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rw2gq-0003ge-1k;
	Sun, 14 Apr 2024 16:26:50 +0000
Date: Mon, 15 Apr 2024 00:26:07 +0800
From: kernel test robot <lkp@intel.com>
To: Qiang Zhang <qiang4.zhang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:bootconfig/fixes 4/4] lib/bootconfig.c:911: warning: Function
 parameter or struct member 'early' not described in '_xbc_exit'
Message-ID: <202404150036.kPJ3HEFA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace bootconfig/fixes
head:   89f9a1e876b5a7ad884918c03a46831af202c8a0
commit: 89f9a1e876b5a7ad884918c03a46831af202c8a0 [4/4] bootconfig: use memblock_free_late to free xbc memory to buddy
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240415/202404150036.kPJ3HEFA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240415/202404150036.kPJ3HEFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404150036.kPJ3HEFA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/bootconfig.c:911: warning: Function parameter or struct member 'early' not described in '_xbc_exit'
>> lib/bootconfig.c:911: warning: expecting prototype for xbc_exit(). Prototype was for _xbc_exit() instead


vim +911 lib/bootconfig.c

f3668cde856299 Masami Hiramatsu 2021-09-17  902  
76db5a27a827c2 Masami Hiramatsu 2020-01-11  903  /**
115d4d08aeb942 Masami Hiramatsu 2021-09-17  904   * xbc_exit() - Clean up all parsed bootconfig
76db5a27a827c2 Masami Hiramatsu 2020-01-11  905   *
76db5a27a827c2 Masami Hiramatsu 2020-01-11  906   * This clears all data structures of parsed bootconfig on memory.
76db5a27a827c2 Masami Hiramatsu 2020-01-11  907   * If you need to reuse xbc_init() with new boot config, you can
76db5a27a827c2 Masami Hiramatsu 2020-01-11  908   * use this.
76db5a27a827c2 Masami Hiramatsu 2020-01-11  909   */
89f9a1e876b5a7 Qiang Zhang      2024-04-14  910  void __init _xbc_exit(bool early)
76db5a27a827c2 Masami Hiramatsu 2020-01-11 @911  {
89f9a1e876b5a7 Qiang Zhang      2024-04-14  912  	xbc_free_mem(xbc_data, xbc_data_size, early);
76db5a27a827c2 Masami Hiramatsu 2020-01-11  913  	xbc_data = NULL;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  914  	xbc_data_size = 0;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  915  	xbc_node_num = 0;
89f9a1e876b5a7 Qiang Zhang      2024-04-14  916  	xbc_free_mem(xbc_nodes, sizeof(struct xbc_node) * XBC_NODE_MAX, early);
a91e4f12ffc42f Masami Hiramatsu 2020-02-07  917  	xbc_nodes = NULL;
ead1e19ad905b9 Masami Hiramatsu 2020-09-21  918  	brace_index = 0;
76db5a27a827c2 Masami Hiramatsu 2020-01-11  919  }
76db5a27a827c2 Masami Hiramatsu 2020-01-11  920  

:::::: The code at line 911 was first introduced by commit
:::::: 76db5a27a827c2c89e5120a3d486472da847863b bootconfig: Add Extra Boot Config support

:::::: TO: Masami Hiramatsu <mhiramat@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
