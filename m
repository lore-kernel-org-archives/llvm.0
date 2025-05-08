Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153DC263F4E;
	Thu,  8 May 2025 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697364; cv=none; b=q8O1KawN2zYGthLP4suDxi8M1+5wPlib6TdQ9BCwSskFxyk/l1onYO5BjRHCxPwVg1onz+KAoiN2fnrsIxaXIlzpQfY5NvIvOLvOqkkeW5F12fbJAy5Fi+D1gvxFnc3w3Axby81+lptCxoK1Z1sJ37REJjz6tjNjBbn/F1rXXC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697364; c=relaxed/simple;
	bh=wJHaLHjDZ5fJHuFoIcCFCRV9D3PiY+1aJDZU8bnbZf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=judGqXwo+pYT7x4EFfy++kzkaD1Xu4JMqvU2UvJIWN58fialWey+MXA+HSt0lMzoJz7Jgk7xBf/hh4GNzHlz/iDQ1cd+OsCOFujVR/U6Vbya8rZCbWpuqR/9rD3aOS9g013lxA5NWtxI91i3Bm6vX0cu3YW/He+qXdIDZ0hQ0TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8v7pWM8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8v7pWM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746697363; x=1778233363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJHaLHjDZ5fJHuFoIcCFCRV9D3PiY+1aJDZU8bnbZf8=;
  b=R8v7pWM8thTnf6cKdGXXJDcqfIKD8VqAWnLhrExjxurQwho7cA4Ehuk6
   HN1+lPW/bnVsDo2ppTQLtf3W8OjT1v8cUDSVj1sLZS4YGn5z+APD0oqiz
   Bj5pZjpW+hjXFbmJIzi6zHwJS2teUcb+w8h1qjkOpOAyFfwn6cnZ5ajuU
   V7DeVd4Rt3GfKMAUElWDSUWu/2CDykPAwiQ7oI7nCCa+sPBAOYi1+tgiq
   4LF95DbaW5/ow/xGKRZEdPydVrp4FqzLuxIWP559geZOnlZ6vXTJwNqHk
   OvA08GgdtpSoNZI9GeBIbOwVfdzzBfOTiZcqbJmJ3azAfychYBPqcBaVf
   A==;
X-CSE-ConnectionGUID: 1ieDXqcOS/GZEqKkChwA/w==
X-CSE-MsgGUID: ssPrQ2ELSIKR4iMqCGGWsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59100304"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59100304"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 02:42:42 -0700
X-CSE-ConnectionGUID: nqnUUVcgSNO6g+ilVp52ZA==
X-CSE-MsgGUID: BGcWXIeqRyKHP4axh/kNxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="140278516"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 May 2025 02:42:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCxm3-000Apt-0l;
	Thu, 08 May 2025 09:42:39 +0000
Date: Thu, 8 May 2025 17:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 3/9] fs/f2fs/node.c:315:23: error: passing
 'const struct folio *' to parameter of type 'struct folio *' discards
 qualifiers
Message-ID: <202505081731.c3NMzlsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   5c0d3e30440de65110257a38163686110f8f230a
commit: 0d36032e3b1c316a0afaaefec82720597fda20b0 [3/9] f2fs: introduce is_{meta,node}_folio
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250508/202505081731.c3NMzlsv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081731.c3NMzlsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081731.c3NMzlsv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/node.c:315:23: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     315 |         return is_node_folio(folio) && IS_DNODE(&folio->page) &&
         |                              ^~~~~
   fs/f2fs/f2fs.h:2103:48: note: passing argument to parameter 'folio' here
    2103 | static inline bool is_node_folio(struct folio *folio)
         |                                                ^
   1 error generated.


vim +315 fs/f2fs/node.c

   312	
   313	bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, const struct folio *folio)
   314	{
 > 315		return is_node_folio(folio) && IS_DNODE(&folio->page) &&
   316						is_cold_node(&folio->page);
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
