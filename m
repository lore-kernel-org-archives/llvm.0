Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FF816EB5D;
	Mon,  9 Sep 2024 17:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725902023; cv=none; b=q41XclW1FNDBDETwijfF0DLuGzOrMSTbwH28f4aW2BWNvVsNIOWSePe4EaS7VvpOpx/P+fwDeH5eETtL4tyC1xgFEHST7IqkcqzJNmiJJKHjemRNFa40G5L+4IaLsHGs0LUbzXKGTP7NEm2rUswND5FPUl90D0e1gCFhNT0wBbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725902023; c=relaxed/simple;
	bh=YSVlrXAb7AcX+DH+ihGVbgbPt8u3y941Cq+J8qS/DLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KLIgQ8oDljyeKBvxxbfGkmF+ecrjXBmiZsUQPkbmlesfKnTf4LqJFgpXLe5Z3uIFO6uDU1VMLZ7KL+8/z9aTXP4HLM02BvsoKkMnNXqy2p75oOi19cm8jR1clmDjlVnmXXWVYcqt2vEM6JyzPApUujGGNv0Mc/2LvLDkBY9491g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2TCucmE; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2TCucmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725902021; x=1757438021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YSVlrXAb7AcX+DH+ihGVbgbPt8u3y941Cq+J8qS/DLg=;
  b=e2TCucmE/klsIq9SkFF9FdB4Ru1boN23oyskodiCCffi+CikeOLKkd5D
   cS5Drh+/6buFJJXJtKr+NE9IbGHQVbuWAcEJSu2t1b5N5Bf3VBK3alovK
   Ht5lf5FHpu3/EQ/jFgTqsqbh1HM65vnR/+kkTff9zi2l02tiIjvBs+ijq
   3f2yIbrwbA7yDBx2lvdteazCLM9o9540RroKKA2eVKZqo/O4qwMVYmY0b
   G9C6OheQdFcrU0fPlMTsMVm4haCNKlhSw9j2cunmFyHTCfubVKOJ9qxUL
   KftOVq6u94rVzAFj7wrkG0KCg7Rr14yW1zq6C74J7zfkyVMh1lkabj8Cn
   Q==;
X-CSE-ConnectionGUID: Vjmc0dObRSiggg8CxGhFNQ==
X-CSE-MsgGUID: Uy/hlgk3Smq6iJNze7zKWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24724159"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24724159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 10:13:39 -0700
X-CSE-ConnectionGUID: dCH2eI3oSIKmv4bUZ7GeWQ==
X-CSE-MsgGUID: GojhYMv+TW2B5vFmqBOxig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="66794031"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2024 10:13:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snhxI-000F1I-0I;
	Mon, 09 Sep 2024 17:13:36 +0000
Date: Tue, 10 Sep 2024 01:13:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 169/258]
 fs/bcachefs/ec.c:899:2: warning: label followed by a declaration is a C23
 extension
Message-ID: <202409100117.c7oyUX0l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-garbage
head:   c88c2220b6b527cec382f06a0ba3feab2a593b37
commit: 1cf183a9fbb35bf1e6544d317fd534d6ff862e0e [169/258] bcachefs: Better error messages in bch2_ec_read_extent()
config: i386-randconfig-003-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100117.c7oyUX0l-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100117.c7oyUX0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100117.c7oyUX0l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/ec.c:899:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     899 |         struct printbuf msgbuf = PRINTBUF;
         |         ^
   1 warning generated.


vim +899 fs/bcachefs/ec.c

   830	
   831	/* recovery read path: */
   832	int bch2_ec_read_extent(struct btree_trans *trans, struct bch_read_bio *rbio,
   833				struct bkey_s_c orig_k)
   834	{
   835		struct bch_fs *c = trans->c;
   836		struct ec_stripe_buf *buf = NULL;
   837		struct closure cl;
   838		struct bch_stripe *v;
   839		unsigned i, offset;
   840		const char *msg = NULL;
   841		int ret = 0;
   842	
   843		closure_init_stack(&cl);
   844	
   845		BUG_ON(!rbio->pick.has_ec);
   846	
   847		buf = kzalloc(sizeof(*buf), GFP_NOFS);
   848		if (!buf)
   849			return -BCH_ERR_ENOMEM_ec_read_extent;
   850	
   851		ret = lockrestart_do(trans, get_stripe_key_trans(trans, rbio->pick.ec.idx, buf));
   852		if (ret) {
   853			msg = "stripe not found";
   854			goto err;
   855		}
   856	
   857		v = &bkey_i_to_stripe(&buf->key)->v;
   858	
   859		if (!bch2_ptr_matches_stripe(v, rbio->pick)) {
   860			msg = "pointer doesn't match stripe";
   861			goto err;
   862		}
   863	
   864		offset = rbio->bio.bi_iter.bi_sector - v->ptrs[rbio->pick.ec.block].offset;
   865		if (offset + bio_sectors(&rbio->bio) > le16_to_cpu(v->sectors)) {
   866			msg = "read is bigger than stripe";
   867			goto err;
   868		}
   869	
   870		ret = ec_stripe_buf_init(buf, offset, bio_sectors(&rbio->bio));
   871		if (ret) {
   872			msg = "-ENOMEM";
   873			goto err;
   874		}
   875	
   876		for (i = 0; i < v->nr_blocks; i++)
   877			ec_block_io(c, buf, REQ_OP_READ, i, &cl);
   878	
   879		closure_sync(&cl);
   880	
   881		if (ec_nr_failed(buf) > v->nr_redundant) {
   882			msg = "unable to read enough blocks";
   883			goto err;
   884		}
   885	
   886		ec_validate_checksums(c, buf);
   887	
   888		ret = ec_do_recov(c, buf);
   889		if (ret)
   890			goto err;
   891	
   892		memcpy_to_bio(&rbio->bio, rbio->bio.bi_iter,
   893			      buf->data[rbio->pick.ec.block] + ((offset - buf->offset) << 9));
   894	out:
   895		ec_stripe_buf_exit(buf);
   896		kfree(buf);
   897		return ret;
   898	err:
 > 899		struct printbuf msgbuf = PRINTBUF;
   900		bch2_bkey_val_to_text(&msgbuf, c, orig_k);
   901		bch_err_ratelimited(c,
   902				    "error doing reconstruct read: %s\n  %s", msg, msgbuf.buf);
   903		printbuf_exit(&msgbuf);;
   904		ret = -BCH_ERR_stripe_reconstruct;
   905		goto out;
   906	}
   907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
