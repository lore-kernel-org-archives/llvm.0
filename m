Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1361FF601;
	Mon, 27 Jan 2025 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982804; cv=none; b=kdq6OaRDrBzzSPybiDkpI++r3mnqMRukhH/BA28KvRBTkGu2uXVtEQpPYSHvBAjIce/ONFOI2amvLfdl5pXXU/D9NAaBu4q2G/yU5feSH7YQDWPzWeZNF+JjvDTGDZzt73SOjfJ5Odi0U2zPy0JtZVukJHTbDoIT/i01AT8fZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982804; c=relaxed/simple;
	bh=6glqbGO0p+pfqzlVF9StTVNp90tv708UBfdJPpoW7/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrZZ8lKT8gO9OrkApyChTwtWXxuFgjDoeghc3MMNhAUkNHN8yjBY4VcJlY5wqqVS8oYiMuylHrIL5SdqY8YvZW2Bo7XQo83S3TIb7y5eMdNf1FWEkansQnzNd4V5tF8fVjMTA4HiYUTNUAE2DDDwQ208pPSBx814v8TlxfUnANw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/un4jtE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/un4jtE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737982803; x=1769518803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6glqbGO0p+pfqzlVF9StTVNp90tv708UBfdJPpoW7/4=;
  b=X/un4jtEgYK6v4RQL+tZeJPFqLBuLI4DGC2zRqz0MPhp0qKEcT2e01bo
   XE2MRk0+FwkMWqLFJwAkY74TyI6kUtX12A2D0gPodfmRGomX6FVsFnsjk
   jKcQwErvbGmtuLlxlPUZvd0tnPS+mhi0lz/oZp7Ki+j+8LTxQje7tBBO2
   64vG2wssX5f5xel92PSRN5HSxZyrLN7JobC7kto6E4Fx7YQDMYDNNo4vO
   SDcman3OnOh43mK6AoQWGCpAO6E68PtnZiogCRTlFevCJTCXkQn/3Vfs4
   n4hvOu6Ze1uQsjal4EV1E+DlECPGmqHk16SsQZ9cHFhC1+mfKKpfYY5OM
   g==;
X-CSE-ConnectionGUID: N4183J9VQoaVquUDxKwZ7w==
X-CSE-MsgGUID: feDwd01cSnGOP1Bexy5f3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="37693414"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="37693414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:00:02 -0800
X-CSE-ConnectionGUID: JqlImJeTQnKimO3Q8lue5g==
X-CSE-MsgGUID: o1kUKZwiSZWFRGeek4uhpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="113418861"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2025 05:00:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcOic-000gmX-2O;
	Mon, 27 Jan 2025 12:59:58 +0000
Date: Mon, 27 Jan 2025 20:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 14/15]
 fs/hpfs/anode.c:74:51: warning: variable 'fnode' is uninitialized when used
 here
Message-ID: <202501272023.VsXcpAT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   86b653e4edef7b0f7b7afe5dd8e0241fc1165238
commit: f66219294267a2fba220f4f3118e11c5cda63d0b [14/15] fs: hpfs: Avoid multiple -Wflex-array-member-not-at-end warnings
config: s390-randconfig-002-20250127 (https://download.01.org/0day-ci/archive/20250127/202501272023.VsXcpAT3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 19306351a2c45e266fa11b41eb1362b20b6ca56d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501272023.VsXcpAT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501272023.VsXcpAT3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/hpfs/anode.c:74:51: warning: variable 'fnode' is uninitialized when used here [-Wuninitialized]
      74 |         struct bplus_header *fnode_btree = container_of(&fnode->btree, struct bplus_header, __hdr);
         |                                                          ^~~~~
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   fs/hpfs/anode.c:65:21: note: initialize the variable 'fnode' to silence this warning
      65 |         struct fnode *fnode;
         |                            ^
         |                             = NULL
   1 warning generated.


vim +/fnode +74 fs/hpfs/anode.c

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
    73		struct bplus_header *ranode_btree = container_of(&ranode->btree, struct bplus_header, __hdr);
  > 74		struct bplus_header *fnode_btree = container_of(&fnode->btree, struct bplus_header, __hdr);
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
   248		ranode_btree->n_free_nodes = (bp_internal(ranode_btree) ? 60 : 40) - ranode_btree->n_used_nodes;
   249		if (bp_internal(ranode_btree)) for (n = 0; n < ranode_btree->n_used_nodes; n++) {
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
