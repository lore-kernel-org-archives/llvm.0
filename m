Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D12B1BDCF;
	Sat, 19 Apr 2025 22:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745100869; cv=none; b=CHZZ5MeKFbEHFN4g2wPAGE1RA6mxC5exK0CgDgzJEZRfi6yQjHXEBc+cNgrr3TIhQ/w1xzGCZYLPTCygKNB4inphTOLCvz7KK2hBKZUz3DaQ10W6Ipwy9zm/NRjTLEX4sJjNup3Re11cZ2PAVRzVhUQsjPahH5bkHjI0/NcPgIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745100869; c=relaxed/simple;
	bh=R0q9g2e3UmJBhz2y4zIy4bKsKPnDlQVaMzU6kn23UJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dsyhh0azoCZ40JTIyw22eA2BpYiou0CvaOvNwbdU6lKc8AezY6w4TQU91upYKn5O2WtoHcmEFQx3IiLY2ZfXInYvgiz1RyUYMJ+oINZcDn/gYtIxGfE3PsZkNoX2fZH0gfAQF6nXKp+MsZEfWhiv/1j4qrZoghIc4cI8B+aikW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWshNwKU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWshNwKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745100868; x=1776636868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0q9g2e3UmJBhz2y4zIy4bKsKPnDlQVaMzU6kn23UJw=;
  b=KWshNwKUjFJImQooILZQS7oihCiutRVUdkMNI0t4uCAH7JDaSnbyGoys
   xERF7MDG9aaXo734rD8rVsau1oFdHMuFkVRAS2LYg5AWIsIAAl37w1bPB
   c3tXnXaJIA1+0CzWrPFvvwivGwcQLApuo7dPvZE4eLs3BLHzdYUOj8RHL
   OhYYxzrqo871FIAeqEv0aQRdkoyk3fu9Ou4zgOp9uGq62FZMOGOo1f30N
   tdsmcZK7xFFLxxGlf3V6M2iU8ZS2JX7C80zL0Y40xJQ9JyBGBuKKOq71a
   rzxFf/GdvcgpQRfcrPI9RgVZrNjOMDxG1WZVdhtFiaH+ePKIDuAZFw6rm
   A==;
X-CSE-ConnectionGUID: A9iQ4Ht/TOOPl4dJSKkvQg==
X-CSE-MsgGUID: XBc7IYMiQ2GqEjoBbNkHZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46816275"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46816275"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 15:14:27 -0700
X-CSE-ConnectionGUID: kDFt3wwxRiSEAJ8/zmK/RA==
X-CSE-MsgGUID: /5hX3Rg7SsSfZa5uD8TEDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131143681"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2025 15:14:26 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6GS7-0004DN-1D;
	Sat, 19 Apr 2025 22:14:23 +0000
Date: Sun, 20 Apr 2025 06:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 110/113]
 fs/bcachefs/btree_io.c:2115:8: error: no member named 'list_idx' in 'struct
 btree_write_bio'
Message-ID: <202504200640.3GOLBFJz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   71828e366bae44685f703563397c6519751e539c
commit: 34a958d70c294801961c8365e098edcdb48f9df0 [110/113] bcachefs: Make various async objs visible in debugfs
config: powerpc64-randconfig-002-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200640.3GOLBFJz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200640.3GOLBFJz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200640.3GOLBFJz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/btree_io.c:2115:8: error: no member named 'list_idx' in 'struct btree_write_bio'
    2115 |         wbio->list_idx = 0;
         |         ~~~~  ^
   1 error generated.


vim +2115 fs/bcachefs/btree_io.c

  2075	
  2076	static void btree_node_write_work(struct work_struct *work)
  2077	{
  2078		struct btree_write_bio *wbio =
  2079			container_of(work, struct btree_write_bio, work);
  2080		struct bch_fs *c	= wbio->wbio.c;
  2081		struct btree *b		= wbio->wbio.bio.bi_private;
  2082		u64 start_time		= wbio->start_time;
  2083		int ret = 0;
  2084	
  2085		btree_bounce_free(c,
  2086			wbio->data_bytes,
  2087			wbio->wbio.used_mempool,
  2088			wbio->data);
  2089	
  2090		bch2_bkey_drop_ptrs(bkey_i_to_s(&wbio->key), ptr,
  2091			bch2_dev_list_has_dev(wbio->wbio.failed, ptr->dev));
  2092	
  2093		if (!bch2_bkey_nr_ptrs(bkey_i_to_s_c(&wbio->key))) {
  2094			ret = -BCH_ERR_btree_node_write_all_failed;
  2095			goto err;
  2096		}
  2097	
  2098		if (wbio->wbio.first_btree_write) {
  2099			if (wbio->wbio.failed.nr) {
  2100	
  2101			}
  2102		} else {
  2103			ret = bch2_trans_do(c,
  2104				bch2_btree_node_update_key_get_iter(trans, b, &wbio->key,
  2105						BCH_WATERMARK_interior_updates|
  2106						BCH_TRANS_COMMIT_journal_reclaim|
  2107						BCH_TRANS_COMMIT_no_enospc|
  2108						BCH_TRANS_COMMIT_no_check_rw,
  2109						!wbio->wbio.failed.nr));
  2110			if (ret)
  2111				goto err;
  2112		}
  2113	out:
  2114		async_object_list_del(&c->btree_write_bio_list, wbio->list_idx);
> 2115		wbio->list_idx = 0;
  2116		bio_put(&wbio->wbio.bio);
  2117		btree_node_write_done(c, b, start_time);
  2118		return;
  2119	err:
  2120		set_btree_node_noevict(b);
  2121	
  2122		if (!bch2_err_matches(ret, EROFS)) {
  2123			struct printbuf buf = PRINTBUF;
  2124			prt_printf(&buf, "writing btree node: %s\n  ", bch2_err_str(ret));
  2125			bch2_btree_pos_to_text(&buf, c, b);
  2126			bch2_fs_fatal_error(c, "%s", buf.buf);
  2127			printbuf_exit(&buf);
  2128		}
  2129		goto out;
  2130	}
  2131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
