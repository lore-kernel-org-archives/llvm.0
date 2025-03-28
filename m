Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C534A35;
	Fri, 28 Mar 2025 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743204402; cv=none; b=RGa5hzkvbs4ZvdpSxhvVR6gKP2umBhNOY4zIuQUAzsIqEUmSldwpbkAF4M0GkeKFbsXyoynML0DcK+DVpcgIzBZH2uJL87hqcS6HWarmzwdd8NsyqOOShngNQub69uUfxd6CYuTZEXwt/8Nz+Y6KcStP9DMPBvDDjS/U8UM9aLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743204402; c=relaxed/simple;
	bh=wJ1iRY61tChRVBNcXnvf2MCnNzp9aVplePSljqyURug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXky7Fi+FK9MrDM1j18YuB+hfLEwQtUqRZ8uaeieY4Cn+wLMZQYIyQK8LpnM3/3aozWEfGO3SGd2c2ajzEsntQXNiXXdLzwvi8FhSN0Qrkio3yZWgR9gBDxZNv4qls2GhmZNm1pkrcDLg14rTN9czI3btwDFcs8WAS38TKCmMbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFoSO+iD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFoSO+iD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743204400; x=1774740400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJ1iRY61tChRVBNcXnvf2MCnNzp9aVplePSljqyURug=;
  b=GFoSO+iDMG/hTrm4Riy9eGyURXJ3YlXVj+QSZyCssgxHDd5q0vQxQQH/
   mI/sAUyfmG4k2+dHfMi+L1fbcA3rYogipiFMZnydjEX9OJz+G49Mnn9ko
   WGr8yIpvmWJPuDUckP3n9rBOHj/yKqLxGT/+ewFRNVQHJeCiwkqeAgosq
   bhY+nc3Kp7tfURaoehUx/L/oq/vdA0fesuGA8v6Qacs+czZx2UfkuzPPZ
   tmjshAHQVEBzfAP5VDgXMEsbi8cvSZ/yJT7JY5aGWuDjwFpeE+c+CbvWK
   76X1+BvaXpMkOugRKuptFlhKV4ehgd5xqQP1ThmysBdn0RLfhLyx3laRe
   A==;
X-CSE-ConnectionGUID: foGtBKsCQ8KsBn3GKhqe+g==
X-CSE-MsgGUID: dEvbKWTWSc2NdjAm5cNqpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48357571"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="48357571"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 16:26:39 -0700
X-CSE-ConnectionGUID: u+FKNMmiT5CZP1/8Cu64Cw==
X-CSE-MsgGUID: ud7Tf8GMSVqtnasN/OXifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="126494113"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2025 16:26:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyJ5w-0007li-09;
	Fri, 28 Mar 2025 23:26:36 +0000
Date: Sat, 29 Mar 2025 07:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 221/222] fs/bcachefs/sysfs.c:400:2: error:
 unterminated function-like macro invocation
Message-ID: <202503290708.UUwRkQ5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   3720faca3701df3bb8f5cd2a12061664d01ce817
commit: cd655e59f1431415e0170664506952e595bddcde [221/222] bcachefs: read_fua_test
config: arm-randconfig-004-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290708.UUwRkQ5g-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290708.UUwRkQ5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290708.UUwRkQ5g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/sysfs.c:400:2: error: unterminated function-like macro invocation
     400 |         prt_printf(out, "fua support advertized: %s\n", str_yes_no(bdev_fua(bdev));
         |         ^
   fs/bcachefs/util.h:88:9: note: macro 'prt_printf' defined here
      88 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |         ^
>> fs/bcachefs/sysfs.c:1001:33: error: expected '}'
    1001 | #endif  /* _BCACHEFS_SYSFS_H_ */
         |                                 ^
   fs/bcachefs/sysfs.c:315:1: note: to match this '{'
     315 | {
         | ^
>> fs/bcachefs/sysfs.c:338:8: error: use of undeclared label 'err'
     338 |                 goto err;
         |                      ^
   3 errors generated.


vim +400 fs/bcachefs/sysfs.c

   313	
   314	static int bch2_read_fua_test(struct printbuf *out, struct bch_dev *ca)
   315	{
   316		struct bch_fs *c = ca->fs;
   317		struct bio *bio = NULL;
   318		void *buf = NULL;
   319		unsigned bs = c->opts.block_size, iters;
   320		u64 end, test_duration = NSEC_PER_SEC * 2;
   321		struct bch2_time_stats stats_nofua, stats_fua, stats_random;
   322		int ret = 0;
   323	
   324		bch2_time_stats_init_no_pcpu(&stats_nofua);
   325		bch2_time_stats_init_no_pcpu(&stats_fua);
   326		bch2_time_stats_init_no_pcpu(&stats_random);
   327	
   328		if (!bch2_dev_get_ioref(c, ca->dev_idx, READ)) {
   329			prt_str(out, "offline\n");
   330			return 0;
   331		}
   332	
   333		struct block_device *bdev = ca->disk_sb.bdev;
   334	
   335		bio = bio_kmalloc(1, GFP_KERNEL);
   336		if (!bio) {
   337			ret = -ENOMEM;
 > 338			goto err;
   339		}
   340	
   341		buf = kmalloc(bs, GFP_KERNEL);
   342		if (!buf)
   343			goto err;
   344	
   345		end = ktime_get_ns() + test_duration;
   346		for (iters = 0; iters < 1000 && time_before64(ktime_get_ns(), end); iters++) {
   347			bio_init(bio, bdev, bio->bi_inline_vecs, 1, READ);
   348			bch2_bio_map(bio, buf, bs);
   349	
   350			u64 submit_time = ktime_get_ns();
   351			ret = submit_bio_wait(bio);
   352			bch2_time_stats_update(&stats_nofua, submit_time);
   353	
   354			if (ret)
   355				goto err;
   356		}
   357	
   358		end = ktime_get_ns() + test_duration;
   359		for (iters = 0; iters < 1000 && time_before64(ktime_get_ns(), end); iters++) {
   360			bio_init(bio, bdev, bio->bi_inline_vecs, 1, REQ_FUA|READ);
   361			bch2_bio_map(bio, buf, bs);
   362	
   363			u64 submit_time = ktime_get_ns();
   364			ret = submit_bio_wait(bio);
   365			bch2_time_stats_update(&stats_fua, submit_time);
   366	
   367			if (ret)
   368				goto err;
   369		}
   370	
   371		u64 dev_size = ca->mi.nbuckets * bucket_bytes(ca);
   372	
   373		end = ktime_get_ns() + test_duration;
   374		for (iters = 0; iters < 1000 && time_before64(ktime_get_ns(), end); iters++) {
   375			bio_init(bio, bdev, bio->bi_inline_vecs, 1, READ);
   376			bio->bi_iter.bi_sector = (bch2_get_random_u64_below(dev_size) & ~((u64) bs - 1)) >> 9;
   377			bch2_bio_map(bio, buf, bs);
   378	
   379			u64 submit_time = ktime_get_ns();
   380			ret = submit_bio_wait(bio);
   381			bch2_time_stats_update(&stats_random, submit_time);
   382	
   383			if (ret)
   384				goto err;
   385		}
   386	
   387		u64 ns_nofua		= mean_and_variance_get_mean(stats_nofua.duration_stats);
   388		u64 ns_fua		= mean_and_variance_get_mean(stats_fua.duration_stats);
   389		u64 ns_rand		= mean_and_variance_get_mean(stats_random.duration_stats);
   390	
   391		u64 stddev_nofua	= mean_and_variance_get_stddev(stats_nofua.duration_stats);
   392		u64 stddev_fua		= mean_and_variance_get_stddev(stats_fua.duration_stats);
   393		u64 stddev_rand		= mean_and_variance_get_stddev(stats_random.duration_stats);
   394	
   395		printbuf_tabstop_push(out, 8);
   396		printbuf_tabstop_push(out, 12);
   397		printbuf_tabstop_push(out, 12);
   398		prt_printf(out, "This test must be run on an idle drive for accurate results\n");
   399		prt_printf(out, "%s\n", dev_name(&ca->disk_sb.bdev->bd_device));
 > 400		prt_printf(out, "fua support advertized: %s\n", str_yes_no(bdev_fua(bdev));
   401		prt_newline(out);
   402		prt_printf(out, "ns:\tlatency\rstddev\r\n");
   403		prt_printf(out, "nofua\t%llu\r%llu\r\n",	ns_nofua,	stddev_nofua);
   404		prt_printf(out, "fua\t%llu\r%llu\r\n",		ns_fua,		stddev_fua);
   405		prt_printf(out, "random\t%llu\r%llu\r\n",	ns_rand,	stddev_rand);
   406	
   407		bool read_cache = ns_nofua * 2 < ns_rand;
   408		bool fua_cached	= read_cache && ns_fua < (ns_nofua + ns_rand) / 2;
   409	
   410		if (!read_cache)
   411			prt_str(out, "reads don't appear to be cached - safe\n");
   412		else if (!fua_cached)
   413			prt_str(out, "fua reads don't appear to be cached - safe\n");
   414		else
   415			prt_str(out, "fua reads appear to be cached - unsafe\n");
   416	err:
   417		kfree(buf);
   418		kfree(bio);
   419		percpu_ref_put(&ca->io_ref);
   420		bch_err_fn(c, ret);
   421		return ret;
   422	}
   423	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
