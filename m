Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A1F18CBF0;
	Mon,  9 Sep 2024 23:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725923207; cv=none; b=kX2gS7kGvFc+FsdEZgPelqNY61ESMaTiLOpEqCqTboaCwkQndmhTnosxTqfCQCienwIabfeXLD36YmrjizgdT3yzqi2Hhdeu21Vaay+lvNmwWybCtK55RSuKPMk2acEwOuLs+fZW46t9+8VNqp/92wtbZ+VhHxN9F/CL8e5wYCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725923207; c=relaxed/simple;
	bh=d6sQfdMd/TRtHc//UGkxb+8WTJvSlnDR9/Dt0jbt5JU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/LzBNdw8IUMrJ4arniz9GWyWSzWCslJSW/7vYT0ImT16CIcJ94Dkbre8EYcBN1NM1iE4HO2cR8JZbXeXZOf3Xo3HnuCCx9zUQLhXjVne5qmigwXg1aDHq1gSZz1UY3hXvnriwDr/s22rFSv/NlwZk22hGrz63SaVUEjQtjgHLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7Ox8NJN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7Ox8NJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725923205; x=1757459205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6sQfdMd/TRtHc//UGkxb+8WTJvSlnDR9/Dt0jbt5JU=;
  b=C7Ox8NJNmXKuYLveDy/KmuCk9WUFqER2neI9qegL8NHMuecI4HN8CHXz
   7vL5qpzauFxWlFikjSdvb3xQQOLO6F+VI5WyRbJVnL1W00O1ZNMbOR6AL
   zuSgnlEY9Frz5hyg1/fD0z/3tmDUzZMvf/IuiVs/C9BpdZrp7jKb2p1Bo
   xh2uOaNa8wonpqpen3gH/uWWBNhQC+eP6Rzcb0bFgX93rLHxKYE6HOG7T
   OUOC/fA8l8WgC6hz6TDQJnaz0SeoicU08AEe6HrmruKTHrc9vgM8A8+F6
   f9atkxkSeUpzkYGkLkyBO5pGfrtk2llz9WZ2BcpgZwjQrHUz3oQw6+yUP
   w==;
X-CSE-ConnectionGUID: bx+QSuaiTcGXajpuPG5nMQ==
X-CSE-MsgGUID: EYcbFTXlRY+PZ3vHcCHvJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24806662"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24806662"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 16:06:44 -0700
X-CSE-ConnectionGUID: Dt4vttWWTP+tKGdvbSUHjw==
X-CSE-MsgGUID: E0A85fuYSyO7FJwOKHmjWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="97625971"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2024 16:06:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snnSz-000FK0-0g;
	Mon, 09 Sep 2024 23:06:41 +0000
Date: Tue, 10 Sep 2024 07:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-garbage 169/258]
 fs/bcachefs/ec.c:899:2: error: expected expression
Message-ID: <202409100726.g9xGizIl-lkp@intel.com>
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
config: powerpc64-randconfig-003-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100726.g9xGizIl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100726.g9xGizIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100726.g9xGizIl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/ec.c:899:2: error: expected expression
           struct printbuf msgbuf = PRINTBUF;
           ^
>> fs/bcachefs/ec.c:900:25: error: use of undeclared identifier 'msgbuf'
           bch2_bkey_val_to_text(&msgbuf, c, orig_k);
                                  ^
   fs/bcachefs/ec.c:902:55: error: use of undeclared identifier 'msgbuf'
                               "error doing reconstruct read: %s\n  %s", msg, msgbuf.buf);
                                                                              ^
   fs/bcachefs/ec.c:903:17: error: use of undeclared identifier 'msgbuf'
           printbuf_exit(&msgbuf);;
                          ^
   4 errors generated.


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
 > 900		bch2_bkey_val_to_text(&msgbuf, c, orig_k);
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
