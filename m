Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097E2AD32;
	Thu,  7 Aug 2025 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754552403; cv=none; b=HgtQ24A4If80613HJ3zNRft4kicpogcxV+qRbXm1y7Fqca3CSopHfr2hU6RTCKHUpc5aiDyDddhXMd5CN72HxkNjeqeCXoLZYKGNCpe8FHQwVnXAzFCqXnlzyZ9YK4E6qjSRLE+taoaNUgF5ib/yWfVe97NxcM/MWEcq1Zz1C2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754552403; c=relaxed/simple;
	bh=+vnw7Y8QHeZb2z5Kwmj5Lj/Gz/kTb+ZlxbkFgKV3Efo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NFfMUU42/3eyiZVY4+1V6i65dgmiSeRffkNA1cBQDcinxQMcrH+gfAMwL6WrQQ9pKXbUXBmAUQ0t/enRC7NpiBheJYwwkwJq2aslgf5HzeVmUWwAKtqu49fu+SnR3GvbTyFSv3WANoZMIVO1H5Magjn6XnRP22rq6uvwZL+Ve8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHjlRhdR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHjlRhdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754552403; x=1786088403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vnw7Y8QHeZb2z5Kwmj5Lj/Gz/kTb+ZlxbkFgKV3Efo=;
  b=FHjlRhdRRdl0chmNoIRAt/wmwTbFrQKi30D/BcXGFP0/olYIEA9oel3A
   iqBUqG8sX/fxSs5XUPilfUIngoyiO9JzbNRK2AuEwhU0/BW0q+w2Szni2
   2ElLEpwhR1Jp8xxXAga9SSR4C4gqXJlIqbM/9cZ84ayVdmFsnMYttTMqR
   qDJfdemcY0jPIFICdpPbctFkr5jDwWkr9XanDZwEhAxcoyWnQ5FWuctRR
   HlP9JrJsloKCbzWu54Z3W1ODNLDtye3Xs0YKzYTCHAkazBhxBx7jSBxcV
   LYX4b1uzKuFSqxjANwo5MGV2FGD1ZMGzn1Nva0bU+X4jIYy67/VcFAdPE
   Q==;
X-CSE-ConnectionGUID: RftzruiKTJ+H1MZea3nQpQ==
X-CSE-MsgGUID: p/5ptJ8YRyiMOO33HML4yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79425237"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="79425237"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 00:40:02 -0700
X-CSE-ConnectionGUID: YTJ23XlxRhGG1TY8cnDn2w==
X-CSE-MsgGUID: ZsaQENNVQN6q0+1z7fic1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="188666148"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Aug 2025 00:40:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujvDo-0002We-2y;
	Thu, 07 Aug 2025 07:39:44 +0000
Date: Thu, 7 Aug 2025 15:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [btrfs:inode-refcnt 11/13] fs/inode.c:1932:40: warning: use of
 logical '&&' with constant operand
Message-ID: <202508071531.Hye67X6N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git inode-refcnt
head:   a1d8560a03d8121944d447a9bf373a344d5e83a0
commit: 3f401162cacd05e18ed2b3beae5612a29e1e66e3 [11/13] fs: rework iput logic
config: arm-randconfig-001-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071531.Hye67X6N-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071531.Hye67X6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071531.Hye67X6N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/inode.c:1932:40: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    1932 |         if (inode->i_nlink && (inode->i_state && I_DIRTY_TIME)) {
         |                                               ^  ~~~~~~~~~~~~
   fs/inode.c:1932:40: note: use '&' for a bitwise operation
    1932 |         if (inode->i_nlink && (inode->i_state && I_DIRTY_TIME)) {
         |                                               ^~
         |                                               &
   fs/inode.c:1932:40: note: remove constant to silence this warning
    1932 |         if (inode->i_nlink && (inode->i_state && I_DIRTY_TIME)) {
         |                                               ^~~~~~~~~~~~~~~
>> fs/inode.c:1932:43: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
    1932 |         if (inode->i_nlink && (inode->i_state && I_DIRTY_TIME)) {
         |                                                  ^
   include/linux/fs.h:2592:26: note: expanded from macro 'I_DIRTY_TIME'
    2592 | #define I_DIRTY_TIME            (1 << 11)
         |                                    ^
   2 warnings generated.


vim +1932 fs/inode.c

  1911	
  1912	/**
  1913	 *	iput	- put an inode
  1914	 *	@inode: inode to put
  1915	 *
  1916	 *	Puts an inode, dropping its usage count. If the inode use count hits
  1917	 *	zero, the inode is then freed and may also be destroyed.
  1918	 *
  1919	 *	Consequently, iput() can sleep.
  1920	 */
  1921	void iput(struct inode *inode)
  1922	{
  1923		if (!inode)
  1924			return;
  1925		BUG_ON(inode->i_state & I_CLEAR);
  1926	
  1927		if (atomic_add_unless(&inode->i_count, -1, 1)) {
  1928			iobj_put(inode);
  1929			return;
  1930		}
  1931	
> 1932		if (inode->i_nlink && (inode->i_state && I_DIRTY_TIME)) {
  1933			trace_writeback_lazytime_iput(inode);
  1934			mark_inode_dirty_sync(inode);
  1935		}
  1936	
  1937		spin_lock(&inode->i_lock);
  1938		if (atomic_dec_and_test(&inode->i_count))
  1939			iput_final(inode);
  1940		else
  1941			spin_unlock(&inode->i_lock);
  1942	
  1943		iobj_put(inode);
  1944	}
  1945	EXPORT_SYMBOL(iput);
  1946	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
