Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8503E1865A;
	Thu, 27 Jun 2024 04:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719461436; cv=none; b=MQBO5XQieUZprsQCl4te66bR/By8hP2Fp2V1Sz45TIOTVQmcjEi23vyS/n/QTjDjTcPUpgFp0pL/r9M3g08nmEwa3LQjQ2+y2zRVO0f8hnYk9+l7oq8jZoK1HVOThbsESo5X4euk116bRLcw6Q4VWsc1puMYe+UNXZpeePXCrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719461436; c=relaxed/simple;
	bh=K4rcz6O4VYgldp53s0CRdlh0ptRW7838kaWgWvHF6Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQLYMQrI14K9Di3Q/Lx7OyVf0yb2TKo3Y0PgEMO1SJ5B2SAgczLTaK8lLBCeKlYhZuMj/j7zZ7z/7e9A7AI4KQH9VESBA5TYEoA8dOtk6cUJ1Wr5juhp6hOe/GwGvDx4NNtlVIDjKT0ueHgcQHe9/gHlAZpfHV5c8xUxN8/vu3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arh1LAle; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arh1LAle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719461434; x=1750997434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K4rcz6O4VYgldp53s0CRdlh0ptRW7838kaWgWvHF6Yc=;
  b=arh1LAleYLmqLumRVTsW9YnODQLbE3Q3PuFR+xDlpC7qFYXCW6YDJby0
   uDqAcKIdENx8Ps5PSb1UshYt6pAr6nvf7Koe9esmjHdeMCTGX/6Hm/CWX
   gKOdeAus3p+8pDlbD/Lrd2IOiw5wjsU7aVXwzD0irG1SMRdf9nhHJBlkw
   hXTp4vVILuYrNH98uLppulBzqtkZUsxpebNMJlJ+1U+uGhKZUVHMnVu1O
   6PZp5RJFN6QDfaDkoxCi9cRHsYR2UyG1UcyxoxeA3u/asTWQAe13vNuZ0
   m39p3S1UOCir4baVokUfNtEzcAa3AGAHsC71RC6hC4DdAwxP1DuDbWIvd
   A==;
X-CSE-ConnectionGUID: rgWD4SunQimCuTUMZW0uBg==
X-CSE-MsgGUID: 2r4sgBGWSaWylAnBNUcyyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16244232"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16244232"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 21:10:34 -0700
X-CSE-ConnectionGUID: f3npAXEMQM+xOFWinGO/lQ==
X-CSE-MsgGUID: OAAA24S0Q96aYLcdvSo05g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44301114"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jun 2024 21:10:33 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMgSs-000Frk-2n;
	Thu, 27 Jun 2024 04:10:30 +0000
Date: Thu, 27 Jun 2024 12:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
Message-ID: <202406271232.5Diop86q-lkp@intel.com>
References: <20240625110029.606032-3-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625110029.606032-3-mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on viro-vfs/for-next]
[cannot apply to brauner-vfs/vfs.all linus/master vfs-idmapping/for-next v6.10-rc5 next-20240626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/vfs-add-CLASS-fd_raw/20240625-233347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
patch link:    https://lore.kernel.org/r/20240625110029.606032-3-mjguzik%40gmail.com
patch subject: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240627/202406271232.5Diop86q-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271232.5Diop86q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271232.5Diop86q-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/stat.c:8:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/stat.c:744:32: error: call to undeclared function 'vfs_empty_path'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     744 |         if (flags == AT_EMPTY_PATH && vfs_empty_path(dfd, filename))
         |                                       ^
   fs/stat.c:744:32: note: did you mean 'vfs_statx_path'?
   fs/stat.c:217:12: note: 'vfs_statx_path' declared here
     217 | static int vfs_statx_path(struct path *path, int flags, struct kstat *stat,
         |            ^
   1 warning and 1 error generated.
--
   In file included from io_uring/statx.c:11:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/statx.c:41:38: error: call to undeclared function 'vfs_empty_path'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      41 |         if (!(sx->flags == AT_EMPTY_PATH && vfs_empty_path(sx->dfd, path))) {
         |                                             ^
   1 warning and 1 error generated.


vim +/vfs_empty_path +744 fs/stat.c

   724	
   725	/**
   726	 * sys_statx - System call to get enhanced stats
   727	 * @dfd: Base directory to pathwalk from *or* fd to stat.
   728	 * @filename: File to stat or "" with AT_EMPTY_PATH
   729	 * @flags: AT_* flags to control pathwalk.
   730	 * @mask: Parts of statx struct actually required.
   731	 * @buffer: Result buffer.
   732	 *
   733	 * Note that fstat() can be emulated by setting dfd to the fd of interest,
   734	 * supplying "" as the filename and setting AT_EMPTY_PATH in the flags.
   735	 */
   736	SYSCALL_DEFINE5(statx,
   737			int, dfd, const char __user *, filename, unsigned, flags,
   738			unsigned int, mask,
   739			struct statx __user *, buffer)
   740	{
   741		int ret;
   742		struct filename *name;
   743	
 > 744		if (flags == AT_EMPTY_PATH && vfs_empty_path(dfd, filename))
   745			return do_statx_fd(dfd, flags, mask, buffer);
   746	
   747		name = getname_flags(filename, getname_statx_lookup_flags(flags), NULL);
   748		ret = do_statx(dfd, name, flags, mask, buffer);
   749		putname(name);
   750	
   751		return ret;
   752	}
   753	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
