Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1257239E97;
	Thu, 13 Nov 2025 17:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763054446; cv=none; b=szp9tS/nVHiVxxAxgdwY9BFUkUpxCUj0spcush7w35lGs0wlJrm9KAoGeg2j02wxmum99RXMPZFiMtvznXh4y7QK+oYtM1QTsHborUqWpV7cCc8R6wmqwmcKeFHzeNN5sbMquI0of8479Rur2WlXXyHD37jgQuoCNnFQTHiK3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763054446; c=relaxed/simple;
	bh=aDj1OoGhJvvGvsKsa6KBqks1p2Eq0FXv/NvW8anZhfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hfzEkJ1EwL4YucHqRxZ/WXY0hqTVuweLcHjjJBHE1I+hh7cZ/aUbv9rvcSkfS4GDuN48xwMW7gZmxLkucHUY97aFNRcG0o83CQb9WTMQb14Z159hxnP96an8b9KbyrYkdrQkGJB0wA/6HClVmVtMoyUuBTPpI1mHoNYtgVFT9ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nj4H5Wx9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nj4H5Wx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763054445; x=1794590445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aDj1OoGhJvvGvsKsa6KBqks1p2Eq0FXv/NvW8anZhfs=;
  b=Nj4H5Wx9K4WSmyASphtg4JZhizF8opv/Nf6NfV6T5jDExcHwlGp4gy8v
   Raxjw7UkuVKF4tFTN2+DEqmGTVXJ8K7KjfheyYcWu4CLxnqzRMVDpAAyy
   NqBHJhQoVkIaQUE7QGHUnSwGixkiFwROAXed0D1tcFNoH/Iit2lagG1oA
   YgnZ8eutau5Pi6edI84MMHI3uCLLfqHKqxIsPNoJc0TSAwSUS3dE7pmCm
   nZJUCqzw5l/wBq9YfVslBpp24Qc7rjDad/ny9XqyJOZlhrMjb0QOaNJIL
   K8gn5SXjov0zm7lO1tAHrVjSZ83/DoUl6Qk7Sd1/2AGzE/j77lCtDsDlv
   g==;
X-CSE-ConnectionGUID: uvFi/sO7RiaF52LdW9cX5w==
X-CSE-MsgGUID: pybO6XjuT4GJpJXZowLm4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64346367"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="64346367"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 09:20:44 -0800
X-CSE-ConnectionGUID: WOrQ+05PSYalNge60HLevg==
X-CSE-MsgGUID: uphhhZN1SdGJp3Vr5OFfdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="194706365"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 09:20:42 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJazw-0005eV-1H;
	Thu, 13 Nov 2025 17:20:40 +0000
Date: Fri, 14 Nov 2025 01:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:scratch/gourry/isolation/linus 4/11]
 mm/memory-tiers.c:735:11: warning: variable 'err' is used uninitialized
 whenever 'if' condition is false
Message-ID: <202511140128.JLF0OvJQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/linus
head:   d328d5f5e18e61a0572af00ed3707179b6aa78d5
commit: 96bc1584e93242e2b4a7a015d21e8089880b12ba [4/11] memory-tiers: Introduce SysRAM and Specific Purpose Memory Nodes
config: loongarch-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251114/202511140128.JLF0OvJQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140128.JLF0OvJQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140128.JLF0OvJQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory-tiers.c:735:11: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     735 |         else if (type == MT_NODE_TYPE_SPM)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/memory-tiers.c:737:6: note: uninitialized use occurs here
     737 |         if (err)
         |             ^~~
   mm/memory-tiers.c:735:7: note: remove the 'if' if its condition is always true
     735 |         else if (type == MT_NODE_TYPE_SPM)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     736 |                 err = node_isset(node, mt_sysram_nodelist) ? -EBUSY : 0;
   mm/memory-tiers.c:730:9: note: initialize the variable 'err' to silence this warning
     730 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +735 mm/memory-tiers.c

   708	
   709	/**
   710	 * mt_set_node_type() - Set a NUMA Node's Memory type.
   711	 * @node: The node type to set
   712	 * @type: The type to set
   713	 *
   714	 * This is a one-way setting, once a type is assigned it cannot be cleared
   715	 * without resetting the system.  This is to avoid race conditions associated
   716	 * with moving nodes from one type to another during memory hotplug.
   717	 *
   718	 * Once a node is added as a SysRAM node, it will be used by default in
   719	 * the page allocator as a valid target when the calling does not provide
   720	 * a node or nodemask.  This is safe as the page allocator iterates through
   721	 * zones and uses this nodemask to filter zones - if a node is present but
   722	 * has no zones the node is ignored.
   723	 *
   724	 * Return: 0 if the node type is set successfully (or it's already set)
   725	 *         -EBUSY if the node has a different type already
   726	 *         -ENODEV if the type is invalid
   727	 */
   728	int mt_set_node_type(int node, int type)
   729	{
   730		int err;
   731	
   732		mutex_lock(&memory_tier_lock);
   733		if (type == MT_NODE_TYPE_SYSRAM)
   734			err = node_isset(node, mt_spm_nodelist) ? -EBUSY : 0;
 > 735		else if (type == MT_NODE_TYPE_SPM)
   736			err = node_isset(node, mt_sysram_nodelist) ? -EBUSY : 0;
   737		if (err)
   738			goto out;
   739	
   740		if (type == MT_NODE_TYPE_SYSRAM)
   741			node_set(node, mt_sysram_nodelist);
   742		else if (type == MT_NODE_TYPE_SPM)
   743			node_set(node, mt_spm_nodelist);
   744		else
   745			err = -ENODEV;
   746	out:
   747		mutex_unlock(&memory_tier_lock);
   748		return err;
   749	}
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
