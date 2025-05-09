Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819A5136672;
	Fri,  9 May 2025 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746803800; cv=none; b=jKyFdPF6THM74VLdic1FP0nhmw2B5Bcu0BT139QpTKWGIIhp0Ffl6ho4BNi9hjVBCyGKb9YFfuz8cSyrwfD9IGha+w/8EvbYhQaYIsTN06cg8I+lhu8QjIA8C7wBu2uVu0AVyZStU1JCLRMHaM2lYEg94msH7gRlvFx6+Ep/IRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746803800; c=relaxed/simple;
	bh=Aie6GCrY+YI2H/JMMs9QD40dN4UFOF8qV5VBKKVNoH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAsRvgf0Ygtp4ezBkE3boUHwtp1VSraHGV5NmAnb0VrjXjENwzLyuV3KQo5oIUg5fjM2ErdEYOILA7/+AaeSy1yhfVYHZL68jKlQfzrozebvkVKYNDP2aj1EsQMKIlJL2Fk815gBi/99J997KDydNU8yyBceu8L17vPHS9Xbc/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2TVCZCf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2TVCZCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746803799; x=1778339799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Aie6GCrY+YI2H/JMMs9QD40dN4UFOF8qV5VBKKVNoH4=;
  b=P2TVCZCf9lKSo9KvyzDB7i4qKQGvl7g3TCXFndL6KTCD3olsD5qlbFwD
   vHwai9Ch3zEf0cZ/ZfpSGkqKHafhihTmLXKAjSQUyjAFAxI4dIzTGgX8/
   n5U07WBNW27nDzpeaWs605JbOPDXgRP3i9pV6SOu41IkYT3RFvthHo/Yr
   QmRv5ILsc4hVl0XmA92Ls11y1LjQSA8LG/SPWGQxTIFEMnENJyweHpLS5
   w2Lrm7isPQ4P+gluTW08to0DhNqNgyPg61K9oBORhUZYmnP8NJ5Cs6u5j
   zZfucs/ZoPEbA0Yb1uhSy5+udJ2ZRNpqlSSteeT7qu6yBBXO0zI2v0kms
   A==;
X-CSE-ConnectionGUID: 3SASMM7jS/Oi2p3Aq6PnNg==
X-CSE-MsgGUID: /iA4pBD1SoGkDqkumo8bUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59980805"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="59980805"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 08:16:27 -0700
X-CSE-ConnectionGUID: cg+1LDv/RXq/BvmKqF3D5A==
X-CSE-MsgGUID: ERcTfwMLSa6QnpDXKUd2Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="167727776"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 May 2025 08:16:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDPSZ-000CCJ-2W;
	Fri, 09 May 2025 15:16:23 +0000
Date: Fri, 9 May 2025 23:16:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH iwl-net v2 3/3] ice: fix rebuilding the Tx scheduler tree
 for large queue counts
Message-ID: <202505092344.1eUfv4i4-lkp@intel.com>
References: <20250509094233.197245-4-michal.kubiak@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509094233.197245-4-michal.kubiak@intel.com>

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-net-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Kubiak/ice-fix-Tx-scheduler-error-handling-in-XDP-callback/20250509-174401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20250509094233.197245-4-michal.kubiak%40intel.com
patch subject: [PATCH iwl-net v2 3/3] ice: fix rebuilding the Tx scheduler tree for large queue counts
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250509/202505092344.1eUfv4i4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092344.1eUfv4i4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505092344.1eUfv4i4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_sched.c:2113: warning: Function parameter or struct member 'vsi_node' not described in 'ice_sched_rm_vsi_subtree'
>> drivers/net/ethernet/intel/ice/ice_sched.c:2113: warning: Excess function parameter 'vsi_handle' description in 'ice_sched_rm_vsi_subtree'


vim +2113 drivers/net/ethernet/intel/ice/ice_sched.c

  2097	
  2098	/**
  2099	 * ice_sched_rm_vsi_subtree - remove all nodes assigned to a given VSI
  2100	 * @pi: port information structure
  2101	 * @vsi_handle: software VSI handle
  2102	 * @owner: LAN or RDMA
  2103	 * @tc: TC number
  2104	 *
  2105	 * Return: Zero in case of success, or -EBUSY if the VSI has leaf nodes in TC.
  2106	 *
  2107	 * This function removes all the VSI support nodes associated with a given VSI
  2108	 * and its LAN or RDMA children nodes from the scheduler tree.
  2109	 */
  2110	static int
  2111	ice_sched_rm_vsi_subtree(struct ice_port_info *pi,
  2112				 struct ice_sched_node *vsi_node, u8 owner, u8 tc)
> 2113	{
  2114		u16 vsi_handle = vsi_node->vsi_handle;
  2115		bool all_vsi_nodes_removed = true;
  2116		int j = 0;
  2117	
  2118		while (vsi_node) {
  2119			struct ice_sched_node *next_vsi_node;
  2120	
  2121			if (ice_sched_is_leaf_node_present(vsi_node)) {
  2122				ice_debug(pi->hw, ICE_DBG_SCHED, "VSI has leaf nodes in TC %d\n", tc);
  2123				return -EBUSY;
  2124			}
  2125			while (j < vsi_node->num_children) {
  2126				if (vsi_node->children[j]->owner == owner) {
  2127					ice_free_sched_node(pi, vsi_node->children[j]);
  2128	
  2129					/* reset the counter again since the num
  2130					 * children will be updated after node removal
  2131					 */
  2132					j = 0;
  2133				} else {
  2134					j++;
  2135				}
  2136			}
  2137	
  2138			next_vsi_node = ice_sched_find_next_vsi_node(vsi_node);
  2139	
  2140			/* remove the VSI if it has no children */
  2141			if (!vsi_node->num_children)
  2142				ice_free_sched_node(pi, vsi_node);
  2143			else
  2144				all_vsi_nodes_removed = false;
  2145	
  2146			vsi_node = next_vsi_node;
  2147		}
  2148	
  2149		/* clean up aggregator related VSI info if any */
  2150		if (all_vsi_nodes_removed)
  2151			ice_sched_rm_agg_vsi_info(pi, vsi_handle);
  2152	
  2153		return 0;
  2154	}
  2155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
