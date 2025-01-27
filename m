Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468C1FE453;
	Mon, 27 Jan 2025 10:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737974092; cv=none; b=mMUH4PJIemk3BpZhWfc6G+z+kgjcRNv4zrYlbZiJvK1eKWdmfXSkM27hHx2mQuPXiPRPkWvvzmMD55/QiOt6zRMybLTbRbcfWLxpf0U0azjL/L5zq8cf5cX5q+PHwPM0oWaofXcslS6AcqxjsNA5QSHeDbkb7CvI9kCfcsyWDl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737974092; c=relaxed/simple;
	bh=mUZay5IiXW2YtIggeL+MHf0YudbPrgFUBrC//JC1IfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n9vX3AoqyTiSM5FRIAhrHowJyadftBeVXXiQ3kgS5sYELlV2FTsyiu+0Xs4I2srvEFx/sm0wV+T+8ddtL2LyEqqU+18C8owqdYjJNIgEnuqg+1LqOOuA09EAgI813AVRSgz0We+djiZSH/eV3SB4LjvOlpGoUYYAUQEhmLBtXXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ilu93KBM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ilu93KBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737974091; x=1769510091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mUZay5IiXW2YtIggeL+MHf0YudbPrgFUBrC//JC1IfA=;
  b=Ilu93KBMHRkzBCgJNCBph2+EOW1PS0vrIQ9eyAuzHvyo/92KbeSfkc/c
   n5mQ4rlQXnYCX1y9DIlBc+tCqWks/bS2QWG2BUkO5iGYqoASm4tTHKYLY
   gXzGgJsBwAiZrbvDiMSqZxzVua3XaP4uDaCaB6XhZ6Z7q6YQBlyaDrDLV
   So/S7oLAStoXHx1sCjrR1vkVnmObPUcWvxH6aUUQBGfa5/ZrUQqQk/3VJ
   SSUDcCOfej9hMid9yOWFz2V4tIePkLfxrF85GdYV2xh6+CevoufIKtTyC
   lzq3vt/sNFFO41OC/4RzwUaDXAmoiUHe2WNmkrlSOLBUMboBKqxJfYkCR
   w==;
X-CSE-ConnectionGUID: 8U+NLjbvTiqiRh7pLLZTtQ==
X-CSE-MsgGUID: Xj+rvvRvSluoLLi5zohTqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38318730"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="38318730"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 02:34:48 -0800
X-CSE-ConnectionGUID: NsJg9pPaQ6KC13UDoOAVOg==
X-CSE-MsgGUID: OIEZA3osSDe3bjOTR7haTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="108927684"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jan 2025 02:34:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcMS4-000gfN-22;
	Mon, 27 Jan 2025 10:34:44 +0000
Date: Mon, 27 Jan 2025 18:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 16/17]
 fs/hpfs/anode.c:248:44: error: use of undeclared identifier 'ranode_btree'
Message-ID: <202501271847.rR3cUdYR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   9fcf89847632bd963953b2f945fb3ce2277f1f97
commit: c1fbbea7d32b3cae9916ed886a352bb2daf2779d [16/17] fs: hpfs: Avoid multiple -Wflex-array-member-not-at-end warnings
config: s390-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501271847.rR3cUdYR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501271847.rR3cUdYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501271847.rR3cUdYR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/hpfs/anode.c:248:44: error: use of undeclared identifier 'ranode_btree'
     248 |         ranode->btree.n_free_nodes = (bp_internal(ranode_btree) ? 60 : 40) - ranode->btree.n_used_nodes;
         |                                                   ^
   fs/hpfs/anode.c:249:18: error: use of undeclared identifier 'ranode_btree'
     249 |         if (bp_internal(ranode_btree)) for (n = 0; n < ranode->btree.n_used_nodes; n++) {
         |                         ^
   2 errors generated.


vim +/ranode_btree +248 fs/hpfs/anode.c

    60	
    61	secno hpfs_add_sector_to_btree(struct super_block *s, secno node, int fnod, unsigned fsecno)
    62	{
    63		struct bplus_header *btree;
    64		struct anode *anode = NULL, *ranode = NULL;
    65		struct fnode *fnode;
    66		anode_secno a, na = -1, ra, up = -1;
    67		secno se;
    68		struct buffer_head *bh, *bh1, *bh2;
    69		int n;
    70		unsigned fs;
    71		int c1, c2 = 0;
    72		struct bplus_header *anode_btree = container_of(&anode->btree, struct bplus_header, __hdr);
    73		struct bplus_header *rnode_btree = container_of(&ranode->btree, struct bplus_header, __hdr);
    74		struct bplus_header *fnode_btree = container_of(&fnode->btree, struct bplus_header, __hdr);
    75	
    76		if (fnod) {
    77			if (!(fnode = hpfs_map_fnode(s, node, &bh))) return -1;
    78			btree = fnode_btree;
    79		} else {
    80			if (!(anode = hpfs_map_anode(s, node, &bh))) return -1;
    81			btree = anode_btree;
    82		}
    83		a = node;
    84		go_down:
    85		if ((n = btree->n_used_nodes - 1) < -!!fnod) {
    86			hpfs_error(s, "anode %08x has no entries", a);
    87			brelse(bh);
    88			return -1;
    89		}
    90		if (bp_internal(btree)) {
    91			a = le32_to_cpu(btree->u.internal[n].down);
    92			btree->u.internal[n].file_secno = cpu_to_le32(-1);
    93			mark_buffer_dirty(bh);
    94			brelse(bh);
    95			if (hpfs_sb(s)->sb_chk)
    96				if (hpfs_stop_cycles(s, a, &c1, &c2, "hpfs_add_sector_to_btree #1")) return -1;
    97			if (!(anode = hpfs_map_anode(s, a, &bh))) return -1;
    98			btree = anode_btree;
    99			goto go_down;
   100		}
   101		if (n >= 0) {
   102			if (le32_to_cpu(btree->u.external[n].file_secno) + le32_to_cpu(btree->u.external[n].length) != fsecno) {
   103				hpfs_error(s, "allocated size %08x, trying to add sector %08x, %cnode %08x",
   104					le32_to_cpu(btree->u.external[n].file_secno) + le32_to_cpu(btree->u.external[n].length), fsecno,
   105					fnod?'f':'a', node);
   106				brelse(bh);
   107				return -1;
   108			}
   109			if (hpfs_alloc_if_possible(s, se = le32_to_cpu(btree->u.external[n].disk_secno) + le32_to_cpu(btree->u.external[n].length))) {
   110				le32_add_cpu(&btree->u.external[n].length, 1);
   111				mark_buffer_dirty(bh);
   112				brelse(bh);
   113				return se;
   114			}
   115		} else {
   116			if (fsecno) {
   117				hpfs_error(s, "empty file %08x, trying to add sector %08x", node, fsecno);
   118				brelse(bh);
   119				return -1;
   120			}
   121			se = !fnod ? node : (node + 16384) & ~16383;
   122		}	
   123		if (!(se = hpfs_alloc_sector(s, se, 1, fsecno*ALLOC_M>ALLOC_FWD_MAX ? ALLOC_FWD_MAX : fsecno*ALLOC_M<ALLOC_FWD_MIN ? ALLOC_FWD_MIN : fsecno*ALLOC_M))) {
   124			brelse(bh);
   125			return -1;
   126		}
   127		fs = n < 0 ? 0 : le32_to_cpu(btree->u.external[n].file_secno) + le32_to_cpu(btree->u.external[n].length);
   128		if (!btree->n_free_nodes) {
   129			up = a != node ? le32_to_cpu(anode->up) : -1;
   130			if (!(anode = hpfs_alloc_anode(s, a, &na, &bh1))) {
   131				brelse(bh);
   132				hpfs_free_sectors(s, se, 1);
   133				return -1;
   134			}
   135			if (a == node && fnod) {
   136				anode->up = cpu_to_le32(node);
   137				anode->btree.flags |= BP_fnode_parent;
   138				anode->btree.n_used_nodes = btree->n_used_nodes;
   139				anode->btree.first_free = btree->first_free;
   140				anode->btree.n_free_nodes = 40 - anode->btree.n_used_nodes;
   141				memcpy(&anode->u, &btree->u, btree->n_used_nodes * 12);
   142				btree->flags |= BP_internal;
   143				btree->n_free_nodes = 11;
   144				btree->n_used_nodes = 1;
   145				btree->first_free = cpu_to_le16((char *)&(btree->u.internal[1]) - (char *)btree);
   146				btree->u.internal[0].file_secno = cpu_to_le32(-1);
   147				btree->u.internal[0].down = cpu_to_le32(na);
   148				mark_buffer_dirty(bh);
   149			} else if (!(ranode = hpfs_alloc_anode(s, /*a*/0, &ra, &bh2))) {
   150				brelse(bh);
   151				brelse(bh1);
   152				hpfs_free_sectors(s, se, 1);
   153				hpfs_free_sectors(s, na, 1);
   154				return -1;
   155			}
   156			brelse(bh);
   157			bh = bh1;
   158			btree = anode_btree;
   159		}
   160		btree->n_free_nodes--; n = btree->n_used_nodes++;
   161		le16_add_cpu(&btree->first_free, 12);
   162		btree->u.external[n].disk_secno = cpu_to_le32(se);
   163		btree->u.external[n].file_secno = cpu_to_le32(fs);
   164		btree->u.external[n].length = cpu_to_le32(1);
   165		mark_buffer_dirty(bh);
   166		brelse(bh);
   167		if ((a == node && fnod) || na == -1) return se;
   168		c2 = 0;
   169		while (up != (anode_secno)-1) {
   170			struct anode *new_anode;
   171			if (hpfs_sb(s)->sb_chk)
   172				if (hpfs_stop_cycles(s, up, &c1, &c2, "hpfs_add_sector_to_btree #2")) return -1;
   173			if (up != node || !fnod) {
   174				if (!(anode = hpfs_map_anode(s, up, &bh))) return -1;
   175				btree = anode_btree;
   176			} else {
   177				if (!(fnode = hpfs_map_fnode(s, up, &bh))) return -1;
   178				btree = fnode_btree;
   179			}
   180			if (btree->n_free_nodes) {
   181				btree->n_free_nodes--; n = btree->n_used_nodes++;
   182				le16_add_cpu(&btree->first_free, 8);
   183				btree->u.internal[n].file_secno = cpu_to_le32(-1);
   184				btree->u.internal[n].down = cpu_to_le32(na);
   185				btree->u.internal[n-1].file_secno = cpu_to_le32(fs);
   186				mark_buffer_dirty(bh);
   187				brelse(bh);
   188				brelse(bh2);
   189				hpfs_free_sectors(s, ra, 1);
   190				if ((anode = hpfs_map_anode(s, na, &bh))) {
   191					anode->up = cpu_to_le32(up);
   192					if (up == node && fnod)
   193						anode->btree.flags |= BP_fnode_parent;
   194					else
   195						anode->btree.flags &= ~BP_fnode_parent;
   196					mark_buffer_dirty(bh);
   197					brelse(bh);
   198				}
   199				return se;
   200			}
   201			up = up != node ? le32_to_cpu(anode->up) : -1;
   202			btree->u.internal[btree->n_used_nodes - 1].file_secno = cpu_to_le32(/*fs*/-1);
   203			mark_buffer_dirty(bh);
   204			brelse(bh);
   205			a = na;
   206			if ((new_anode = hpfs_alloc_anode(s, a, &na, &bh))) {
   207				anode = new_anode;
   208				/*anode->up = cpu_to_le32(up != -1 ? up : ra);*/
   209				anode->btree.flags |= BP_internal;
   210				anode->btree.n_used_nodes = 1;
   211				anode->btree.n_free_nodes = 59;
   212				anode->btree.first_free = cpu_to_le16(16);
   213				anode_btree->u.internal[0].down = cpu_to_le32(a);
   214				anode_btree->u.internal[0].file_secno = cpu_to_le32(-1);
   215				mark_buffer_dirty(bh);
   216				brelse(bh);
   217				if ((anode = hpfs_map_anode(s, a, &bh))) {
   218					anode->up = cpu_to_le32(na);
   219					mark_buffer_dirty(bh);
   220					brelse(bh);
   221				}
   222			} else na = a;
   223		}
   224		if ((anode = hpfs_map_anode(s, na, &bh))) {
   225			anode->up = cpu_to_le32(node);
   226			if (fnod)
   227				anode->btree.flags |= BP_fnode_parent;
   228			mark_buffer_dirty(bh);
   229			brelse(bh);
   230		}
   231		if (!fnod) {
   232			if (!(anode = hpfs_map_anode(s, node, &bh))) {
   233				brelse(bh2);
   234				return -1;
   235			}
   236			btree = anode_btree;
   237		} else {
   238			if (!(fnode = hpfs_map_fnode(s, node, &bh))) {
   239				brelse(bh2);
   240				return -1;
   241			}
   242			btree = fnode_btree;
   243		}
   244		ranode->up = cpu_to_le32(node);
   245		memcpy(&ranode->btree, btree, le16_to_cpu(btree->first_free));
   246		if (fnod)
   247			ranode->btree.flags |= BP_fnode_parent;
 > 248		ranode->btree.n_free_nodes = (bp_internal(ranode_btree) ? 60 : 40) - ranode->btree.n_used_nodes;
   249		if (bp_internal(ranode_btree)) for (n = 0; n < ranode->btree.n_used_nodes; n++) {
   250			struct anode *unode;
   251			if ((unode = hpfs_map_anode(s, le32_to_cpu(ranode->u.internal[n].down), &bh1))) {
   252				unode->up = cpu_to_le32(ra);
   253				unode->btree.flags &= ~BP_fnode_parent;
   254				mark_buffer_dirty(bh1);
   255				brelse(bh1);
   256			}
   257		}
   258		btree->flags |= BP_internal;
   259		btree->n_free_nodes = fnod ? 10 : 58;
   260		btree->n_used_nodes = 2;
   261		btree->first_free = cpu_to_le16((char *)&btree->u.internal[2] - (char *)btree);
   262		btree->u.internal[0].file_secno = cpu_to_le32(fs);
   263		btree->u.internal[0].down = cpu_to_le32(ra);
   264		btree->u.internal[1].file_secno = cpu_to_le32(-1);
   265		btree->u.internal[1].down = cpu_to_le32(na);
   266		mark_buffer_dirty(bh);
   267		brelse(bh);
   268		mark_buffer_dirty(bh2);
   269		brelse(bh2);
   270		return se;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
