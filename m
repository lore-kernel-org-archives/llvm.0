Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5304C17BD6;
	Sat, 14 Dec 2024 05:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734153466; cv=none; b=tPSvg5J2PG4DnGuBSxr7HcG0VvfkKqz0WFR0o6/yComirzBeaT0mezF139N+I9AxOkxH3EdcrOn5Zli7JKt9tpfs46+XNoeKtCKC5NfQsRnbqla9c6QPSzQOo9YkD9GlhuZpdMG/A+i4YszbtohpSOJJ+3s/PH6CcuHfE1cAPxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734153466; c=relaxed/simple;
	bh=n0L/EzZ/fBUvD7PlZzH2BdiPBabHIzQn60JtVHuKSXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1D3/CeOFeRzaUEFa+2WRlm+0fBV5qwVmRSDW4NT7V7PHykmG02lfzixsI0037zkcGZixAjBO2o9RwbTtBXXW8AJNHXvnkgGdnQKHBO3Neh5m/A7WHAxRc8Dn/tkEDyL2xhm3dQA+g8plud7XZpQsTNBpMvMWp1TI1xzH9AA2p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiYZU4gw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiYZU4gw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734153464; x=1765689464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0L/EzZ/fBUvD7PlZzH2BdiPBabHIzQn60JtVHuKSXs=;
  b=FiYZU4gw0navvaJFjCatdBf2+D+C/zpJ2CZ1iVU8u1sBxPUySwwuqifA
   hvaupZ7QeN5igLN7b2HDoHOtvsgNVJFm8zn52oAmJgPja9jM+GgedSr3I
   BNIhDfMWsw9otpVl4X1uK0C/bY/BlT5Y49rt8dCtirPcMfVZcXx/+EzER
   m5am1ictO36mhGOJ08rz7iGq9Jl9iF/fKhuu4NAhHxmSTPD39jGW8GV4c
   EkjedjwKSbHsIsqdMxrD1bOU0e2M0aQeU4aKh9a2kPI33NRA2M7+oD+Xe
   jRtFGlblP+46iQMNFClMwJD1QVzgDq7nBpopncKOxNHjKG91JWYxqxG4D
   A==;
X-CSE-ConnectionGUID: Ax2tkK4aT2Cec4h+NIDmqg==
X-CSE-MsgGUID: 4R831HXdTxKgFmIPn3RHXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45618523"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45618523"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 21:17:44 -0800
X-CSE-ConnectionGUID: L6DK/VMNTfShIqNJUZbJpQ==
X-CSE-MsgGUID: sVLwHiPfR72GK1XSOqABaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100874120"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2024 21:17:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMKX6-000Cit-1i;
	Sat, 14 Dec 2024 05:17:40 +0000
Date: Sat, 14 Dec 2024 13:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 23/28] drivers/cxl/features.c:60:10: warning:
 expression which evaluates to zero treated as a null pointer constant of
 type 'struct cxl_feat_entry *'
Message-ID: <202412141339.84yarl3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   c3c1ca00092765212f4eb49d2aaffb2003beb33b
commit: 7f7c30b7dbd79802299899bb011fe4e37a30c12c [23/28] cxl: Add support for fwctl RPC command to enable CXL feature commands
config: i386-buildonly-randconfig-004-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141339.84yarl3c-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141339.84yarl3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141339.84yarl3c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/features.c:5:
   In file included from include/linux/pci.h:1650:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/cxl/features.c:60:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct cxl_feat_entry *' [-Wnon-literal-null-conversion]
      60 |                 return false;
         |                        ^~~~~
   drivers/cxl/features.c:64:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct cxl_feat_entry *' [-Wnon-literal-null-conversion]
      64 |                 return false;
         |                        ^~~~~
   3 warnings generated.


vim +60 drivers/cxl/features.c

    51	
    52	static struct cxl_feat_entry *
    53	get_support_feature_info(struct cxl_features_state *cfs,
    54				 const struct fwctl_rpc_cxl *rpc_in)
    55	{
    56		struct cxl_feat_entry *feat;
    57		uuid_t uuid;
    58	
    59		if (rpc_in->op_size < sizeof(uuid))
  > 60			return false;
    61	
    62		if (copy_from_user(&uuid, u64_to_user_ptr(rpc_in->in_payload),
    63				   sizeof(uuid)))
    64			return false;
    65	
    66		for (int i = 0; i < cfs->num_features; i++) {
    67			feat = &cfs->entries[i];
    68			if (uuid_equal(&uuid, &feat->uuid))
    69				return feat;
    70		}
    71	
    72		return ERR_PTR(-ENOENT);
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
