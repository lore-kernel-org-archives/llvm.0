Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B217A2E8;
	Fri,  1 May 2026 23:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777678327; cv=none; b=LTJ3C2iG55AbML4+0UEOT9eDdh6sdp5cNGP5GicTkIbwkcl+g7ZuvxaN3dEApnLFJpq63xJXHeye6mZBpuN4itqmos4Bh5e6xW0QXYfxEDO7GuXvZ3rKpY+uV6Uv2VbBPn+pORt0c4t9y9dgA6/cIDXOBpTu5pEFecZsV2SVUms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777678327; c=relaxed/simple;
	bh=DeEnZ9wH+nwwQfH2YdPfigVfX6s4de61PvGhKOpWn48=;
	h=Date:From:To:Cc:Subject:Message-ID; b=INTvkSyzjNddCkBS1241ervavwrm/puvGsFXQ5vXKnDz7DV9rSSx5FJbRDk3C3RTT9iL9v+qdtpjCmvlWd84Hh3wauhaQe0Q+5L0YziRyxBGQtNzpCM+dNHmVLAtwFWlsa+As5LWVuXydOl4hOrAJzvmBx0HQacwld3tbyQY+ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+AYuPDV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+AYuPDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777678325; x=1809214325;
  h=date:from:to:cc:subject:message-id;
  bh=DeEnZ9wH+nwwQfH2YdPfigVfX6s4de61PvGhKOpWn48=;
  b=f+AYuPDVF15TVrQ2isBr8bD/VRKzHtfsLFvSG0iZN5X5wnGOj8JUStaz
   RoUBnwQKLM1aObtWFJo9X5TTgiHi7WrpQHQm9N6Exyr00HWdbGVFdGy8T
   epfkSBYHxhPwvn/6XociXUg4ZT2y/sAj+l5c1dEIIz0zPtfGJxWnn3++b
   paQLPjH0hC0D3m2WCNLJahiopMMYuc/VE4tZaJFv8vbBZP6BxMPICKPFq
   joIRvSlQ5OYfoM6IffPPi8VoDH20wV04Z9/B79bRUewuGS3J/EuQrDeH1
   1inb0kHQ9QsKUBTtzJoVwtAeBmGShdDsZhpkc6PFLSaOMLP2GoTYlXh1g
   g==;
X-CSE-ConnectionGUID: u2fqIqCbQYuMrCZMgmZlIg==
X-CSE-MsgGUID: dqfvNQmfSHqGODDLMv3fKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78691821"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78691821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:32:04 -0700
X-CSE-ConnectionGUID: 8U/mqc8mRvK1mVlF/3sMRQ==
X-CSE-MsgGUID: 3UZLaT9fTXGllpvpOZSw6A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 May 2026 16:32:02 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIxKy-000000000wr-19kO;
	Fri, 01 May 2026 23:32:00 +0000
Date: Sat, 02 May 2026 07:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs-7.2.procfs 1/12] fs/proc/generic.c:849:6:
 warning: no previous prototype for function 'impl_proc_make_permanent'
Message-ID: <202605020725.KvLbjBLv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.2.procfs
head:   16b3565414446449677ec503a8a25d802c7512a7
commit: b26811a2ab5878e84275d8ad8e709bba9147c62c [1/12] proc: allow to mark /proc files permanent outside of fs/proc/
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260502/202605020725.KvLbjBLv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020725.KvLbjBLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020725.KvLbjBLv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/generic.c:849:6: warning: no previous prototype for function 'impl_proc_make_permanent' [-Wmissing-prototypes]
     849 | void impl_proc_make_permanent(struct proc_dir_entry *pde)
         |      ^
   fs/proc/generic.c:849:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     849 | void impl_proc_make_permanent(struct proc_dir_entry *pde)
         | ^
         | static 
   1 warning generated.


vim +/impl_proc_make_permanent +849 fs/proc/generic.c

   844	
   845	/*
   846	 * Not exported to modules:
   847	 * modules' /proc files aren't permanent because modules aren't permanent.
   848	 */
 > 849	void impl_proc_make_permanent(struct proc_dir_entry *pde)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
