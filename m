Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEF12AD00;
	Sat,  5 Jul 2025 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751728360; cv=none; b=O8POyyttZfjsO5v7W4kf0mnlcS5XQD4t9Nxct3a0CBwDLwkxQELLDgrQFHM7utyAB/fEqxE7DneL8b2GgFxc9wUBfU3jkH5Hz10OzfeJwxMW4rszUTq4EKlTH+c4/2OIchUCkOp+vSmYumzGhXuOfHjP6loySd41Vk2BN35JAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751728360; c=relaxed/simple;
	bh=IB9nl7319cY+0cL9PqevjHLdbb13k85S9gBNOs4msQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N21IF+reI0VUZ87y+c9/Ze60+za4Mr08MnzAqJzqOBDOOkkX7oXhniTtQ8T+CAcXD0VG+4auvdWYZWweQC+ExeJPW+PJJuaULsrM74/Qv/k4+3T1I8InEvQF4cqOYtAMimKtujlxKRDKbsq2K+C/lZVM+6VSz5r1Xx9aZMhdUtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKwQrdWG; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKwQrdWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751728358; x=1783264358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IB9nl7319cY+0cL9PqevjHLdbb13k85S9gBNOs4msQs=;
  b=EKwQrdWG+vEWkjBjV+Waws14kGHuPVqxEaHwy/EzMSSWHZu32bVXRR80
   1qJDkJxOvoudWrX7aSVNAnEfn6XUVMfXW+VqJ8t8Lcm7xVidtdhC86mGo
   GvM0/m6mi3jR45yiUM825Ak5Z8z83I8hITC//kKBClcgNnR2wlfJzygm4
   GCGe7Vwv18wNY128SFUsiGJlXDRueS2TuFbSmaizMiz12yOdNozoF+5sZ
   zNyCJ5iA0ouDmaEQzgN0XADfJrygLJOJ8iriGCWoavMfI1wctTQ/OpkuA
   pzJGgwGj37gCv2GR+8jbJud7kwAmjrHPQC5WqCDpU7WHuFz/tkxA3G6bR
   w==;
X-CSE-ConnectionGUID: qkMzuxQ7TCOqAgzXY7tlIg==
X-CSE-MsgGUID: 5EKAUeq2SvK0PTSsSylN7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="71449477"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="71449477"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 08:12:37 -0700
X-CSE-ConnectionGUID: +p5Iv0URThSpU7xvbT0jyQ==
X-CSE-MsgGUID: 71aFyogfQ8mYwd/xaDy/hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="158860536"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jul 2025 08:12:36 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY4Z6-0000qf-0r;
	Sat, 05 Jul 2025 15:12:32 +0000
Date: Sat, 5 Jul 2025 17:12:16 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Nikita Ofitserov <himikof@gmail.com>
Subject: [bcachefs:bcachefs-testing 61/115]
 fs/bcachefs/btree_node_scan.c:229:6: warning: variable 'bio' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202507051757.KRkB4I2y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   00f57187e818a61b0a8ac65c62d15a344bbf3d3a
commit: fb75bc573b1b0dc6168dd48e7c93fadd10ad7be9 [61/115] bcachefs: btree node scan no longer uses btree cache
config: x86_64-buildonly-randconfig-2003-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051757.KRkB4I2y-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051757.KRkB4I2y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051757.KRkB4I2y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_node_scan.c:229:6: warning: variable 'bio' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     229 |         if (!b) {
         |             ^~
   fs/bcachefs/btree_node_scan.c:267:10: note: uninitialized use occurs here
     267 |         bio_put(bio);
         |                 ^~~
   fs/bcachefs/btree_node_scan.c:229:2: note: remove the 'if' if its condition is always false
     229 |         if (!b) {
         |         ^~~~~~~~~
     230 |                 bch_err(c, "read_btree_nodes_worker: error allocating buf");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     231 |                 w->f->ret = -ENOMEM;
         |                 ~~~~~~~~~~~~~~~~~~~~
     232 |                 goto err;
         |                 ~~~~~~~~~
     233 |         }
         |         ~
   fs/bcachefs/btree_node_scan.c:235:2: note: variable 'bio' is declared here
     235 |         struct bio *bio = bio_alloc(NULL, buf_pages(b->data, c->opts.btree_node_size), 0, GFP_KERNEL);
         |         ^
   fs/bcachefs/btree_node_scan.c:68:19: warning: unused function 'bkey_journal_seq' [-Wunused-function]
      68 | static inline u64 bkey_journal_seq(struct bkey_s_c k)
         |                   ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +229 fs/bcachefs/btree_node_scan.c

   220	
   221	static int read_btree_nodes_worker(void *p)
   222	{
   223		struct find_btree_nodes_worker *w = p;
   224		struct bch_fs *c = container_of(w->f, struct bch_fs, found_btree_nodes);
   225		struct bch_dev *ca = w->ca;
   226		unsigned long last_print = jiffies;
   227	
   228		struct btree *b = __bch2_btree_node_mem_alloc(c);
 > 229		if (!b) {
   230			bch_err(c, "read_btree_nodes_worker: error allocating buf");
   231			w->f->ret = -ENOMEM;
   232			goto err;
   233		}
   234	
   235		struct bio *bio = bio_alloc(NULL, buf_pages(b->data, c->opts.btree_node_size), 0, GFP_KERNEL);
   236		if (!bio) {
   237			bch_err(c, "read_btree_nodes_worker: error allocating bio");
   238			w->f->ret = -ENOMEM;
   239			goto err;
   240		}
   241	
   242		for (u64 bucket = ca->mi.first_bucket; bucket < ca->mi.nbuckets; bucket++)
   243			for (unsigned bucket_offset = 0;
   244			     bucket_offset + btree_sectors(c) <= ca->mi.bucket_size;
   245			     bucket_offset += btree_sectors(c)) {
   246				if (time_after(jiffies, last_print + HZ * 30)) {
   247					u64 cur_sector = bucket * ca->mi.bucket_size + bucket_offset;
   248					u64 end_sector = ca->mi.nbuckets * ca->mi.bucket_size;
   249	
   250					bch_info(ca, "%s: %2u%% done", __func__,
   251						 (unsigned) div64_u64(cur_sector * 100, end_sector));
   252					last_print = jiffies;
   253				}
   254	
   255				u64 sector = bucket * ca->mi.bucket_size + bucket_offset;
   256	
   257				if (c->sb.version_upgrade_complete >= bcachefs_metadata_version_mi_btree_bitmap &&
   258				    !bch2_dev_btree_bitmap_marked_sectors(ca, sector, btree_sectors(c)))
   259					continue;
   260	
   261				try_read_btree_node(w->f, ca, b, bio, sector);
   262			}
   263	err:
   264		if (b)
   265			__btree_node_data_free(b);
   266		kfree(b);
   267		bio_put(bio);
   268		enumerated_ref_put(&ca->io_ref[READ], BCH_DEV_READ_REF_btree_node_scan);
   269		closure_put(w->cl);
   270		kfree(w);
   271		return 0;
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
