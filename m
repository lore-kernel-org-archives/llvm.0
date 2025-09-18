Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3172C3D984;
	Thu, 18 Sep 2025 03:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758164877; cv=none; b=azNXnRTSeYslOKWFNcbiPc9YpYRUiTDr0q8WhWcS1HsDc0f17EotSZyKrcg813A4nGhMWoFCbzh1FHvA0+u5gCq/duNSKOMxPSjqMuryDHWU6oRQ7mZlMMlksNyhuyk6+o4CDBk+WIgzh6voiqI3rD/CQ9PbZLLZKFA/63WNN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758164877; c=relaxed/simple;
	bh=66JynzNtMtnpwDlFqCoRRWPHuINfphvw/ZfTmpMAVKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iIZLNpYsAmpZNrNoGSyyd0AZvlNSrrQjzRbBdvFcNJ0DObfmwBOAOBUQXCDdRfjVQcmCrItHlhYBXGpRVNd4J4HxUG0sHrbfvRNE6H2oDwcgWO1Ab9FHt+Fs/SwcmDVK1kZB/jMptRdvkCrKN/TAqH5v2/hGtG1w1jfdxs+9AQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDjZHZCp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDjZHZCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758164875; x=1789700875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66JynzNtMtnpwDlFqCoRRWPHuINfphvw/ZfTmpMAVKk=;
  b=eDjZHZCpRm4xg0m4fNNcAVovVvTQkJs2K+K07PAeLAY53JglOZynpelW
   60BzNsjr810WX1tGbyIBOS791sVBtox2wDGq9IKsOSx5OZDfUafpHgcE8
   DDbswbVtm6CRwAEmtGtRhek3OhG/lVf92FreCUi0MU1Gd7wkNzAxH6rHd
   zmb4ZL8+xTpX/G+OLpIMuOVEaRe8KDS27f296TgQY3esQmJCJMLFJ+PaC
   6guVsf8dtLw49heTy3Tz7ly7ZCAWYzTfwkX9lXYmp6g/zS0vNk/EY22Hi
   Bdh/iBKu3vtHv9u4qLrSLWQmIEruA9nnU47BELJ9LgQpND3JpcZrD9+nw
   g==;
X-CSE-ConnectionGUID: EVdqHiGCQaqEl9Qp1TqXgw==
X-CSE-MsgGUID: DFclYrqmSa+HdtAXfirjnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60371998"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="60371998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 20:07:54 -0700
X-CSE-ConnectionGUID: +8i/VD+XQXC3co8Mmg9zWA==
X-CSE-MsgGUID: M/EQe8MLRw+MuSSFSfHSpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="212567326"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Sep 2025 20:07:53 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz4zu-0002gT-3B;
	Thu, 18 Sep 2025 03:07:50 +0000
Date: Thu, 18 Sep 2025 11:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 12/63]
 drivers/infiniband/hw/usnic/usnic_uiom_interval_tree.c:269:1: warning: no
 previous prototype for function 'usnic_uiom_interval_tree_subtree_search'
Message-ID: <202509181041.CWM2tG5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   262d11ae2557639839ede7312ba834817615e0a8
commit: 1e0b4913420f199b3c6d2c536b849e5d79911d21 [12/63] interval_tree: Fix ITSTATIC usage for *_subtree_search()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250918/202509181041.CWM2tG5i-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181041.CWM2tG5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181041.CWM2tG5i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/usnic/usnic_uiom_interval_tree.c:269:1: warning: no previous prototype for function 'usnic_uiom_interval_tree_subtree_search' [-Wmissing-prototypes]
     269 | INTERVAL_TREE_DEFINE(struct usnic_uiom_interval_node, rb,
         | ^
   include/linux/interval_tree_generic.h:80:33: note: expanded from macro 'INTERVAL_TREE_DEFINE'
      80 | ITSTATIC ITSTRUCT *                                                           \
         |                                                                               ^
   <scratch space>:29:1: note: expanded from here
      29 | usnic_uiom_interval_tree_subtree_search
         | ^
   drivers/infiniband/hw/usnic/usnic_uiom_interval_tree.c:269:22: note: declare 'static' if the function is not intended to be used outside of this translation unit
     269 | INTERVAL_TREE_DEFINE(struct usnic_uiom_interval_node, rb,
         |                      ^
         |                      static 
   include/linux/interval_tree_generic.h:80:10: note: expanded from macro 'INTERVAL_TREE_DEFINE'
      80 | ITSTATIC ITSTRUCT *                                                           \
         |          ^
   1 warning generated.


vim +/usnic_uiom_interval_tree_subtree_search +269 drivers/infiniband/hw/usnic/usnic_uiom_interval_tree.c

e3cf00d0a87f02 Upinder Malhi 2013-09-10  268  
e3cf00d0a87f02 Upinder Malhi 2013-09-10 @269  INTERVAL_TREE_DEFINE(struct usnic_uiom_interval_node, rb,

:::::: The code at line 269 was first introduced by commit
:::::: e3cf00d0a87f025db5855a43a67c67a41fa79fef IB/usnic: Add Cisco VIC low-level hardware driver

:::::: TO: Upinder Malhi <umalhi@cisco.com>
:::::: CC: Roland Dreier <roland@purestorage.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
