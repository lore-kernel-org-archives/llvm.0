Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1510D2DE713;
	Fri,  4 Jul 2025 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751601365; cv=none; b=TJ+YwBMEyQQ2XiqL+Uki1TIDr98Qk3KbjBayrbxQktjQ6QuAEaI4FmGmo3PFQUSqYNfFv7PMozxDoxQvmSH4A78fisSl4s93cFbcUDkgb4TH9i290lm055oC4B/x8KJ+du+evDVI3Ykjl1WJIBWwfaA7xRsiuzpb67wmDjDl1a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751601365; c=relaxed/simple;
	bh=KstNbzMs/J3KHGYFA2v6hwJxUDGdF6tWsQM5qrBVMds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dJXTFpY+fE+ZQH33sbRgMDokOjAFNLSL99uQrYzry6pR099NSU5FIrO9pzrxWCNZ8VDsLskgW6SwY1MMEcz9mTR0hhQZhye0LXCxz4guYK2Y8AvKxOvxjcemDqC6w6JvzfyWvkWk1xooL+40ALYYIZte1PdBLTikFjPrgFzBpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mp4rtPED; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mp4rtPED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751601363; x=1783137363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KstNbzMs/J3KHGYFA2v6hwJxUDGdF6tWsQM5qrBVMds=;
  b=Mp4rtPEDa3lLnoEydhpMJsefoxejtPWoJGGr+dn7m6fyPoNuKN+704wJ
   pQAY4KpZb5jSQdcBMxBEATJzOlvs0UolbJ6y0Is3B0z3WERqzpx7kP34L
   qS9LRCshCgrjqPDopsLPT/+IPHhtGnDeVfttiLtbaGi2+Qri8fEKOLcSk
   q7cBqV+hBo5Tar3RwmvvBi/dN0V4BX5GF1ofPDwHS1GoHQPXy9e9J2n0e
   m/UahycJih2fQWlF7xPerBGuRRChf+SIiCxZ+iY2tzsQZKEGpjzvDGBO8
   H5wqx9tWy0TYItshYKkftOQ6z4aCrU9+J79TeZw8mAQSH8eBPdtEu1G4M
   w==;
X-CSE-ConnectionGUID: LPmeh8zaQTugCl5gyCXi4w==
X-CSE-MsgGUID: 7MVX+Y5aToaq8w62cqfQGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57609343"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="57609343"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 20:56:02 -0700
X-CSE-ConnectionGUID: HilF+oP5T9a3bEDSU+4jyw==
X-CSE-MsgGUID: aQsKg9DoSq6+rvZNg+oCsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154187277"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2025 20:56:02 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXXWq-0003J1-09;
	Fri, 04 Jul 2025 03:56:00 +0000
Date: Fri, 4 Jul 2025 11:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 111/113]
 fs/bcachefs/btree_node_scan.c:221:6: warning: variable 'bio' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202507041136.b4W35ySi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   47a0870f51568651eb580080e6a729fd5593ff99
commit: 21151f74d342f89a3c422c8664193276f6f3d23f [111/113] bcachefs: btree node scan no longer uses btree cache
config: x86_64-buildonly-randconfig-001-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041136.b4W35ySi-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041136.b4W35ySi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041136.b4W35ySi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_node_scan.c:221:6: warning: variable 'bio' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     221 |         if (!b) {
         |             ^~
   fs/bcachefs/btree_node_scan.c:257:10: note: uninitialized use occurs here
     257 |         bio_put(bio);
         |                 ^~~
   fs/bcachefs/btree_node_scan.c:221:2: note: remove the 'if' if its condition is always false
     221 |         if (!b) {
         |         ^~~~~~~~~
     222 |                 bch_err(c, "read_btree_nodes_worker: error allocating buf");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     223 |                 w->f->ret = -ENOMEM;
         |                 ~~~~~~~~~~~~~~~~~~~~
     224 |                 goto err;
         |                 ~~~~~~~~~
     225 |         }
         |         ~
   fs/bcachefs/btree_node_scan.c:227:2: note: variable 'bio' is declared here
     227 |         struct bio *bio = bio_alloc(NULL, buf_pages(b->data, c->opts.btree_node_size), 0, GFP_KERNEL);
         |         ^
   fs/bcachefs/btree_node_scan.c:68:19: warning: unused function 'bkey_journal_seq' [-Wunused-function]
      68 | static inline u64 bkey_journal_seq(struct bkey_s_c k)
         |                   ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +221 fs/bcachefs/btree_node_scan.c

   212	
   213	static int read_btree_nodes_worker(void *p)
   214	{
   215		struct find_btree_nodes_worker *w = p;
   216		struct bch_fs *c = container_of(w->f, struct bch_fs, found_btree_nodes);
   217		struct bch_dev *ca = w->ca;
   218		unsigned long last_print = jiffies;
   219	
   220		struct btree *b = __bch2_btree_node_mem_alloc(c);
 > 221		if (!b) {
   222			bch_err(c, "read_btree_nodes_worker: error allocating buf");
   223			w->f->ret = -ENOMEM;
   224			goto err;
   225		}
   226	
   227		struct bio *bio = bio_alloc(NULL, buf_pages(b->data, c->opts.btree_node_size), 0, GFP_KERNEL);
   228		if (!bio) {
   229			bch_err(c, "read_btree_nodes_worker: error allocating bio");
   230			w->f->ret = -ENOMEM;
   231			goto err;
   232		}
   233	
   234		for (u64 bucket = ca->mi.first_bucket; bucket < ca->mi.nbuckets; bucket++)
   235			for (unsigned bucket_offset = 0;
   236			     bucket_offset + btree_sectors(c) <= ca->mi.bucket_size;
   237			     bucket_offset += btree_sectors(c)) {
   238				if (time_after(jiffies, last_print + HZ * 30)) {
   239					u64 cur_sector = bucket * ca->mi.bucket_size + bucket_offset;
   240					u64 end_sector = ca->mi.nbuckets * ca->mi.bucket_size;
   241	
   242					bch_info(ca, "%s: %2u%% done", __func__,
   243						 (unsigned) div64_u64(cur_sector * 100, end_sector));
   244					last_print = jiffies;
   245				}
   246	
   247				u64 sector = bucket * ca->mi.bucket_size + bucket_offset;
   248	
   249				if (c->sb.version_upgrade_complete >= bcachefs_metadata_version_mi_btree_bitmap &&
   250				    !bch2_dev_btree_bitmap_marked_sectors(ca, sector, btree_sectors(c)))
   251					continue;
   252	
   253				try_read_btree_node(w->f, ca, b, bio, sector);
   254			}
   255	err:
   256		__btree_node_data_free(b);
   257		bio_put(bio);
   258		enumerated_ref_put(&ca->io_ref[READ], BCH_DEV_READ_REF_btree_node_scan);
   259		closure_put(w->cl);
   260		kfree(w);
   261		return 0;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
