Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04FF239E76;
	Sun, 22 Feb 2026 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771758403; cv=none; b=k7f8nCd6e0gigyicuqWKnU9/elyrEQC+Wh458X5hU2vPAYbRaGrfXH19FEdrW1I34JX9b4LD/ZWa9tBNQ6dETYwISETXnqWB04DhUfWG3U4N6XYTPe0dsEp8cN71A5K/FmLOW2Oy4F4pcZt4BekTP9KREIjCPqPiHJrE9Q2Sgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771758403; c=relaxed/simple;
	bh=dWU+5Rltfo28WI53hCExgqsAOzPs+XWcsJuabj1Ta64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q2Q9U25gaEIgzizUBwrcdgYtjB8EGqmOxpklV0IEQU9nJCO6gXfTPB99A0QPcFbL5xYJYHzfDtMD0WldMhYGQmYJ+QrdHeZ8jPWcOb/OWxnbMN/95ot3qWqmzl8wtOh137BU51rePozMeFVhvoCzKV9HFlKDwoTY3nhKG9q81Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpCPQhpt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpCPQhpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771758401; x=1803294401;
  h=date:from:to:cc:subject:message-id;
  bh=dWU+5Rltfo28WI53hCExgqsAOzPs+XWcsJuabj1Ta64=;
  b=CpCPQhptx+9EVUzfDxB6aIx1B259bf6u5/L4gkgpSJpPd+XD1NVp/cw3
   FMJGm/iSOWwnKeD/ptTWQmBGOUohM9Lg3CYuml29SsVGDGigUEff06V59
   r90euN4MAY7vXsBrbQW+1PG8/Q0gDjToTDfyyMgJEskZAuSuJ83aMszJY
   iXejj+BT0Lc85YRo20AmQzIzp1bZEHadiVJyDATrZxShwoj1G9b0BPOGk
   ccOybZxVSt8Me4fJiJCdb0owVJaGrPSV4bUOJhxseNcjHi4nOFW0f/C/s
   uQ84scMzhpjfLgOcT0Rhxj4yflRwhPruDYgXRzOjbTSYFC9lXLxdIPahC
   w==;
X-CSE-ConnectionGUID: kCLAtrq3SjqhmrebVmYIXw==
X-CSE-MsgGUID: PZQOf0nLTUe7TWHVFMguGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72959566"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="72959566"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 03:06:40 -0800
X-CSE-ConnectionGUID: VW8XmLjCRiepoXIJqcolgg==
X-CSE-MsgGUID: qpSDZbwhR9ajL9bDfENEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="220282911"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2026 03:06:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu7IJ-000000015Rs-47q9;
	Sun, 22 Feb 2026 11:06:35 +0000
Date: Sun, 22 Feb 2026 19:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:private_compression 34/60]
 drivers/base/node.c:1205:2: error: use of undeclared identifier
 'node_private_initialized'
Message-ID: <202602221942.LEjWOb9G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux private_compression
head:   9fa5ffee4fd4726e31f05deebb938cccfa0b460f
commit: f03127df4a84bc148a92a8a8607acfa1ff47c6a2 [34/60] numa: introduce N_MEMORY_PRIVATE node state
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260222/202602221942.LEjWOb9G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221942.LEjWOb9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221942.LEjWOb9G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/node.c:1205:2: error: use of undeclared identifier 'node_private_initialized'
    1205 |         node_private_initialized = true;
         |         ^
   1 error generated.


vim +/node_private_initialized +1205 drivers/base/node.c

  1183	
  1184	void __init node_dev_init(void)
  1185	{
  1186		int ret, i;
  1187	
  1188	 	BUILD_BUG_ON(ARRAY_SIZE(node_state_attr) != NR_NODE_STATES);
  1189	 	BUILD_BUG_ON(ARRAY_SIZE(node_state_attrs)-1 != NR_NODE_STATES);
  1190	
  1191		ret = subsys_system_register(&node_subsys, cpu_root_attr_groups);
  1192		if (ret)
  1193			panic("%s() failed to register subsystem: %d\n", __func__, ret);
  1194	
  1195		/*
  1196		 * Create all node devices, which will properly link the node
  1197		 * to already created cpu devices.
  1198		 */
  1199		for_each_online_node(i) {
  1200			ret =  register_node(i);
  1201			if (ret)
  1202				panic("%s() failed to add node: %d\n", __func__, ret);
  1203		}
  1204	
> 1205		node_private_initialized = true;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
