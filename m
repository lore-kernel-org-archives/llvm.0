Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5822D2F691C;
	Sat, 31 Jan 2026 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769862073; cv=none; b=Yr+pJFcbk/rPq1yKx0Nb5lQkIKTFy+MuUm2sSRDZ5zZp5c5EC5YaeflxLfIonRAQFL5kQhPkpeQ3mqM+D+cw52MMJd3Q9itVXW8sRuJ4gyLxPjqznx3K4AvuOmJ+9EZqz9jnFTz9jWswBoy06OW2wq8VEzOjc2s8NyccTimSPCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769862073; c=relaxed/simple;
	bh=kd87Wt1pwH6yUqPgMsUqBal2JLrp7cDEV8zSiYivhCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SJ2BEvEbNFF45WQFp+9niizonkoiFElL25sS6ASvraDbb+iu0asS512XBz+IsiJn5zLfEsZY8O0D4VsuQH5IGhuvjElDjrkZoUq6f/WqjIfHSCuPmK1NlyuJ30iqLHfEHk5FXXwy+Wm4iGnf791mJ+cY3Pc/QzczHVM3/GfDqsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWQlystS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWQlystS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769862072; x=1801398072;
  h=date:from:to:cc:subject:message-id;
  bh=kd87Wt1pwH6yUqPgMsUqBal2JLrp7cDEV8zSiYivhCE=;
  b=iWQlystSTvp41a5yg04EaG5hmPZFWcW16Zq46LhcY4AWg+5Mx9m/ora+
   DWk0e5xEL08OU/pHnWVsEM4OM1rSf7flQlDX8bcPnR4Jef1M8WMK7hZh2
   HxajwE8XpyzBH5aMM5GAfh74MDc9vjSA1uJfx5ujbpJMFHisV+aYdqe9X
   qop1KOrhWcx4tFkSg30k9QV7vPr++LAnsyOLggvUBAP2Mm7Hxw4wq+U5s
   k6Fq1f+rt4OrTB+Q+DdKEpJ8N1+kAs7JmfLlAGd6ZcOduXxYE4MG1auv2
   nP3ZndZ5A9dbRvKkobLNdx+lGxaNW0gR2WuwbwmykGHm3RkQjvaDLTRAr
   Q==;
X-CSE-ConnectionGUID: te06aeH8S8KAgxoHk3OjXQ==
X-CSE-MsgGUID: /oiLn8vfSz6UoJ5oZGKzmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="81828386"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="81828386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 04:21:10 -0800
X-CSE-ConnectionGUID: SeDkD/T3RuuUHp6Pz02/AQ==
X-CSE-MsgGUID: H/d+y4qoQkWduV+4a2X9Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="209431426"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2026 04:21:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm9yM-00000000e10-1xe2;
	Sat, 31 Jan 2026 12:21:06 +0000
Date: Sat, 31 Jan 2026 20:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 267/268] fs/bcachefs/data/extents.c:1544:9:
 warning: variable 'd' is used uninitialized whenever 'if' condition is false
Message-ID: <202601312058.G8N29qqa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   861815d780d271d652cdc5eb7301c3723898c043
commit: bdfe44454dbbfff11a2bacbb6706c262fcf02ecc [267/268] bcachefs: redo drop_extra_durability, data_update_index_update_key()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260131/202601312058.G8N29qqa-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601312058.G8N29qqa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601312058.G8N29qqa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/data/extents.c:1544:9: warning: variable 'd' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1544 |                                 if (d < 0)
         |                                     ^~~~~
   fs/bcachefs/data/extents.c:1552:28: note: uninitialized use occurs here
    1552 |                         if (durability.online - d >= opts->data_replicas) {
         |                                                 ^
   fs/bcachefs/data/extents.c:1544:5: note: remove the 'if' if its condition is always true
    1544 |                                 if (d < 0)
         |                                 ^~~~~~~~~~
    1545 |                                         return d;
   fs/bcachefs/data/extents.c:1541:9: note: initialize the variable 'd' to silence this warning
    1541 |                         int d;
         |                              ^
         |                               = 0
   fs/bcachefs/data/extents.c:124:19: warning: unused function 'dev_failed' [-Wunused-function]
     124 | static inline int dev_failed(struct bch_dev *ca)
         |                   ^~~~~~~~~~
   2 warnings generated.


vim +1544 fs/bcachefs/data/extents.c

  1523	
  1524	int bch2_bkey_drop_extra_ec_durability(struct btree_trans *trans,
  1525					       struct bch_inode_opts *opts,
  1526					       struct bkey_i *k, unsigned mask)
  1527	{
  1528		if (!mask)
  1529			return 0;
  1530	
  1531		struct bkey_durability durability;
  1532		try(bch2_bkey_durability(trans, bkey_i_to_s_c(k), &durability));
  1533	
  1534		struct bch_fs *c = trans->c;
  1535		union bch_extent_entry *entry;
  1536		struct extent_ptr_decoded p;
  1537		unsigned ptr_bit = 1;
  1538	
  1539		bkey_for_each_ptr_decode(&k->k, bch2_bkey_ptrs(bkey_i_to_s(k)), p, entry) {
  1540			if (mask & ptr_bit) {
  1541				int d;
  1542				if (bch2_dev_idx_is_online(c, p.ptr.dev)) {
  1543					int d = bch2_extent_ptr_durability(trans, &p);
> 1544					if (d < 0)
  1545						return d;
  1546	
  1547					d -= bch2_dev_durability(c, p.ptr.dev);
  1548				} else {
  1549					d = 0;
  1550				}
  1551	
  1552				if (durability.online - d >= opts->data_replicas) {
  1553					durability.online -= d;
  1554					bch2_bkey_drop_ec(c, k, p.ptr.dev);
  1555				}
  1556			}
  1557			ptr_bit <<= 1;
  1558		}
  1559	
  1560		return 0;
  1561	}
  1562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
