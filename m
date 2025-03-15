Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B706A1F3BBC;
	Sat, 15 Mar 2025 11:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742037034; cv=none; b=G1yzkshX5fbKaVDRilVQC7D9Ok/78Jkl2d8T4rDIbX2cJ/cYW2AjanvA+DrNEwGqnmWnalpgF4FmG3sr/C5uvyFW4j5YYMCX04xS+IeLkO7k8I1wa6dxYTS6yJC+PzBrNF8iKo6nAUNtBHUM7l+gNawe0PBJUNDRezfe6WNPekU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742037034; c=relaxed/simple;
	bh=Vlexr4j79kviA7oP0TzI3WJzUGXEvlQPGsrdOayLrEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BsvW6Mc6PvB4RN0BzdAkucPBTicq7iesgRXh7HmL6IzhNuu8fcPlF+91OpLJulwsF68w1aKNS1SNfGN12qBgLT95Ic3uXcX/MkwGjurS4SwBLgr4otrlJj7FBUXhW1eMo3+KSHSkhQLtwCzl+As+aWZQD4MUUT3VwKdf+4N4aVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+gWdOMb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+gWdOMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742037032; x=1773573032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vlexr4j79kviA7oP0TzI3WJzUGXEvlQPGsrdOayLrEU=;
  b=V+gWdOMbaZDq5nBUr4cW0Z/dbdxwdXKoSHdw17lgddpL2uWzFnTNVOiL
   G5Ov3sQ3FkhyAY3ODQRHNg6wPUN9/RDZhX6ZS6a3tizbiUA6UPzN7dY/d
   Ri/HYhVvbCrt0gJUn0hVVvWEV9QmFOqqzAOMRc2UGG79vN+Jlm4Me3vB/
   j0uv6mq/EnWWYyW+R1y+1BifdQt+8IeUc+vVPYTtFkHs4BCBRURCWGEku
   YA/oF+KWGn9HTp/CQhdXyr23NFcuvpJLIUepEDM8v53fa0fJkYvBOwkQZ
   GlY7QCWQYwWOYaRWNPOlgAjr6i8y83poL60NK6nwFLyGugWyJxcDNjkwD
   Q==;
X-CSE-ConnectionGUID: f0eQnUbrTbuZ+b2fMPMgJg==
X-CSE-MsgGUID: 42GV1VI3R7yrs4nr64Ohnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43056825"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43056825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 04:10:32 -0700
X-CSE-ConnectionGUID: RFNbAvbXSouS1wUiaeokmQ==
X-CSE-MsgGUID: KWEhhl8WS+6AoDvHHL+whw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="126377075"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 15 Mar 2025 04:10:31 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttPPM-000BIX-1U;
	Sat, 15 Mar 2025 11:10:26 +0000
Date: Sat, 15 Mar 2025 19:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:netns-debugfs 1/1] fs/debugfs/netns.c:111:1: warning: no
 previous prototype for function 'debugfs_net_init'
Message-ID: <202503151941.zNw2k4Vz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git netns-debugfs
head:   e06d7dd780ab4a50f85115f8ee988e588e4aad57
commit: e06d7dd780ab4a50f85115f8ee988e588e4aad57 [1/1] net: add a debugfs directory for showing refcount tracking info
config: x86_64-buildonly-randconfig-002-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151941.zNw2k4Vz-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151941.zNw2k4Vz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151941.zNw2k4Vz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/debugfs/netns.c:14:1: error: unknown type name 'unisgned'; did you mean 'unsigned'?
      14 | unisgned int debugfs_net_id;
         | ^~~~~~~~
         | unsigned
   fs/debugfs/netns.c:100:27: error: use of undeclared identifier 'dnet'
     100 |         debugfs_remove_recursive(dnet->netdir);
         |                                  ^
>> fs/debugfs/netns.c:111:1: warning: no previous prototype for function 'debugfs_net_init' [-Wmissing-prototypes]
     111 | debugfs_net_init(void)
         | ^
   fs/debugfs/netns.c:110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     110 | int __init
         | ^
         | static 
>> fs/debugfs/netns.c:120:1: warning: no previous prototype for function 'debugfs_net_exit' [-Wmissing-prototypes]
     120 | debugfs_net_exit(void)
         | ^
   fs/debugfs/netns.c:119:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     119 | void __exit
         | ^
         | static 
   2 warnings and 2 errors generated.


vim +/debugfs_net_init +111 fs/debugfs/netns.c

   109	
   110	int __init
 > 111	debugfs_net_init(void)
   112	{
   113		topdir = debugfs_create_dir("netns", NULL);
   114		if (IS_ERR(topdir))
   115			return PTR_ERR(topdir);
   116		return 0;
   117	}
   118	
   119	void __exit
 > 120	debugfs_net_exit(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
