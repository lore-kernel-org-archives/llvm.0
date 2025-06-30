Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2E22259D;
	Mon, 30 Jun 2025 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321855; cv=none; b=WlhhFUr9AHG8f37FI+c/WumolMwGptdUB2fq1f92Eva8SWketFnDpcqzzaJC25H6bzOkx7vhSw0madWJiY0ipODHUpjYbZB5Ov5gRSdSs9E+SJo7FK4BEbByGh9EAuK/AcDmf9Q2x4e5Khl49hsd6u99UvXEzuKAtoRGJqbUh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321855; c=relaxed/simple;
	bh=4y+pyeVIPNtUR08xo4fM6DvsRfoRZvH4hvR81MsagnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LoamuZR4GZ6tZwd8O4Y6yMwgx8j7nITgNN67CXq4nVE6GGEpsJ6G4AUmuYFSqCAr+AE3FGqX1EaGL1VnuPMuiEECK1oPjpbEG3fchI9JgWGi/pgAe1WtLkZGZiS/llk49S1qE/UJPE9w4byTdY/l1lfjuhAIlbXdAf2ipEGqy5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUS32zEL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUS32zEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751321853; x=1782857853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4y+pyeVIPNtUR08xo4fM6DvsRfoRZvH4hvR81MsagnM=;
  b=AUS32zELGne0Ahuc1SmUN5vac40oJz3OUZ1fsqLSdJUek3aToY//rBK7
   ohvFdX5UGChNTwgljUqplObFpH/NQMMLfwE87kHAc4en5RfJ/HTNW4w6n
   tL3tQ12KZ7Z7LULbWoFpkDYv/uQKUocCfoq/2JTJxarrUL6nwLjIs0gLM
   UX2U9nuse67EWxEENjJCUNFZH9hMla9A+Gq30t4Fa5Hgc/tBHYjRmcQLs
   w2QG8zLxd9OZDq7vlDPCfac2qm1GFF5Ft+TK7M8OtTw2PatoLi7Ccrek1
   L1TZFfWZ58ipgvCG1V8vDTsl/SRa2KxpvNyjX+EajDFDaF8Wv7qNZ0tX+
   Q==;
X-CSE-ConnectionGUID: REmCUj/1Sr+ErOSQx1HbsA==
X-CSE-MsgGUID: MxoBurpnTsOFTeStLyA4eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="76110670"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="76110670"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 15:17:33 -0700
X-CSE-ConnectionGUID: 4j4pd/ZRQ7m8uaQ29Z9MSA==
X-CSE-MsgGUID: 7QCLNpn2R0KLuBrBEyL+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="153061396"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 30 Jun 2025 15:17:31 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWMoa-0001KV-2c;
	Mon, 30 Jun 2025 22:17:28 +0000
Date: Tue, 1 Jul 2025 00:16:56 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.pidfs.setns 8/9] fs/pidfs.c:38:8: error: assigning
 to 'struct path' from incompatible type 'void (struct path *)'
Message-ID: <202507010037.c3Ung7vs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.pidfs.setns
head:   80432e84dc3a17336efd11282d8c5db368ed827b
commit: f7b88122fa711d730ad163427e8da56adee73e33 [8/9] fhandle, pidfs: support open_by_handle_at() purely based on file handle
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20250701/202507010037.c3Ung7vs-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010037.c3Ung7vs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010037.c3Ung7vs-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/pidfs.c:34:20: error: redefinition of 'pidfs_root_path' as different kind of symbol
      34 | static struct path pidfs_root_path = {};
         |                    ^
   fs/internal.h:356:6: note: previous definition is here
     356 | void pidfs_root_path(struct path *path);
         |      ^
>> fs/pidfs.c:38:8: error: assigning to 'struct path' from incompatible type 'void (struct path *)'
      38 |         *path = pidfs_root_path;
         |               ^ ~~~~~~~~~~~~~~~
>> fs/pidfs.c:1077:17: error: member reference base type 'void (struct path *)' is not a structure or union
    1077 |         pidfs_root_path.mnt = pidfs_mnt;
         |         ~~~~~~~~~~~~~~~^~~~
   fs/pidfs.c:1078:17: error: member reference base type 'void (struct path *)' is not a structure or union
    1078 |         pidfs_root_path.dentry = pidfs_mnt->mnt_root;
         |         ~~~~~~~~~~~~~~~^~~~~~~
   4 errors generated.


vim +38 fs/pidfs.c

90c48e2619324e Christian Brauner 2025-06-19  35  
90c48e2619324e Christian Brauner 2025-06-19  36  void pidfs_root_path(struct path *path)
90c48e2619324e Christian Brauner 2025-06-19  37  {
90c48e2619324e Christian Brauner 2025-06-19 @38  	*path = pidfs_root_path;
90c48e2619324e Christian Brauner 2025-06-19  39  	path_get(path);
90c48e2619324e Christian Brauner 2025-06-19  40  }
90c48e2619324e Christian Brauner 2025-06-19  41  

:::::: The code at line 38 was first introduced by commit
:::::: 90c48e2619324e40223af34ff8aed6480b9d19c1 pidfs: add pidfs_root_path() helper

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
