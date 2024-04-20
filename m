Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EE818AE0;
	Sat, 20 Apr 2024 22:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713653652; cv=none; b=Xs4koajUX7n7nNtNgLKY5sxO7/Y2Y+hNzWHyEHNYqiEg2SCXg3mow87rXQpz4JNqBv1cryV3xm+HIrd7Pt20kVDxzlH4nwMvSbZ5Vc1gwPtgfsxBvRrB25pzdtUAXdJCTX8hks4PZBJwV0GHh87xJiIP/1zMoKe5zPWO3s6c7ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713653652; c=relaxed/simple;
	bh=TVB/AB5A05UBqie/7QUwbSzO9LKaKjFbj/QxUG9qIQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anGeZGYnaSu2XgqBCUf+wQq88TpznKWu3dg5AslOs40TqfOAUDMcAwsh8cXsglBUH0HYY9KEMjRfmReO4DVIrzsz2yYET4q0j4I+zVhpVpG6eHyqoVWGW0HeOQYq0qiV9rmZcFz67KBtrVrXaOMX03hRVAdbbCbaK4fctbeMpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hneQmvZ5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hneQmvZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713653650; x=1745189650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TVB/AB5A05UBqie/7QUwbSzO9LKaKjFbj/QxUG9qIQw=;
  b=hneQmvZ5Cjy6SyAGa2WkiSdRviDhHgqJWlYcnfNk+Gr0m5Q7zviGrGu0
   DvgXrvkWk9m3NMTKjFtL1eY57kptVtAfAVSg2GizDCg0UOaC97YyiTAjs
   tyir2kwvLNRJcOVtoaX0PSy/jK9i3KlP8MYDm2OmwTbwr/EJpazA4Pz+6
   ee3sECPf2mABNa5DzyfWFh0zd5DpT60javWvtn52rifPNqkpxKOIgSmDX
   d4AzNIIV0k663jC3mj4/PrGIlSoIAQjZHuqDYJNf7YOZIWcfaNiAHBsri
   ZxelnPU7PfesRwukoSbesWzU8ay13oZGv8idWOCBOby5UpJYoMoHwiDIx
   w==;
X-CSE-ConnectionGUID: OwAhe6BYTMGo/pEvL3AMdg==
X-CSE-MsgGUID: XybVkx4dRtqpnfaQAoYUhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9398541"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="9398541"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 15:54:10 -0700
X-CSE-ConnectionGUID: 2wukTucNQGOyEedX1/TW3Q==
X-CSE-MsgGUID: 9kS/f/wMSZCBSLyEZKsCxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="23701546"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Apr 2024 15:54:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryJaw-000BY2-2U;
	Sat, 20 Apr 2024 22:54:06 +0000
Date: Sun, 21 Apr 2024 06:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 177/177] fs/bcachefs/btree_key_cache.c:1055:64:
 error: no member named 'srcu_sup' in 'struct srcu_struct'
Message-ID: <202404210640.c8U58dNE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   1be1637797fc37118b08b8528d8f2ede8e0c7f1e
commit: 1be1637797fc37118b08b8528d8f2ede8e0c7f1e [177/177] bcachefs: Btree key cache instrumentation
config: i386-buildonly-randconfig-002-20240421 (https://download.01.org/0day-ci/archive/20240421/202404210640.c8U58dNE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404210640.c8U58dNE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404210640.c8U58dNE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_key_cache.c:1044:48: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    1044 |         prt_printf(out, "nonpcpu freelist:\t%lu\r\n",   bc->nr_freed_nonpcpu);
         |                                             ~~~         ^~~~~~~~~~~~~~~~~~~~
         |                                             %zu
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   fs/bcachefs/btree_key_cache.c:1045:45: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    1045 |         prt_printf(out, "pcpu freelist:\t%lu\r\n",      bc->nr_freed_pcpu);
         |                                          ~~~            ^~~~~~~~~~~~~~~~~
         |                                          %zu
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
>> fs/bcachefs/btree_key_cache.c:1055:64: error: no member named 'srcu_sup' in 'struct srcu_struct'
    1055 |         prt_printf(out, "srcu seq:\t%lu\r\n",           c->btree_trans_barrier.srcu_sup->srcu_gp_seq);
         |                                                         ~~~~~~~~~~~~~~~~~~~~~~ ^
   fs/bcachefs/util.h:192:54: note: expanded from macro 'prt_printf'
     192 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
         |                                                               ^~~~~~~~~~~
   2 warnings and 1 error generated.


vim +1055 fs/bcachefs/btree_key_cache.c

  1033	
  1034	void bch2_btree_key_cache_to_text(struct printbuf *out, struct btree_key_cache *bc)
  1035	{
  1036		struct bch_fs *c = container_of(bc, struct bch_fs, btree_key_cache);
  1037	
  1038		printbuf_tabstop_push(out, 24);
  1039		printbuf_tabstop_push(out, 12);
  1040	
  1041		prt_printf(out, "keys:\t%lu\r\n",		atomic_long_read(&bc->nr_keys));
  1042		prt_printf(out, "dirty:\t%lu\r\n",		atomic_long_read(&bc->nr_dirty));
  1043		prt_printf(out, "freelist:\t%lu\r\n",		atomic_long_read(&bc->nr_freed));
> 1044		prt_printf(out, "nonpcpu freelist:\t%lu\r\n",	bc->nr_freed_nonpcpu);
  1045		prt_printf(out, "pcpu freelist:\t%lu\r\n",	bc->nr_freed_pcpu);
  1046	
  1047		prt_printf(out, "\nshrinker:\n");
  1048		prt_printf(out, "requested_to_free:\t%lu\r\n",	bc->requested_to_free);
  1049		prt_printf(out, "freed:\t%lu\r\n",		bc->freed);
  1050		prt_printf(out, "moved_to_freelist:\t%lu\r\n",	bc->moved_to_freelist);
  1051		prt_printf(out, "skipped_dirty:\t%lu\r\n",	bc->skipped_dirty);
  1052		prt_printf(out, "skipped_accessed:\t%lu\r\n",	bc->skipped_accessed);
  1053		prt_printf(out, "skipped_lock_fail:\t%lu\r\n",	bc->skipped_lock_fail);
  1054	
> 1055		prt_printf(out, "srcu seq:\t%lu\r\n",		c->btree_trans_barrier.srcu_sup->srcu_gp_seq);
  1056	
  1057		struct bkey_cached *ck;
  1058		unsigned iter = 0;
  1059		list_for_each_entry(ck, &bc->freed_nonpcpu, list) {
  1060			prt_printf(out, "freed_nonpcpu:\t%lu\r\n", ck->btree_trans_barrier_seq);
  1061			if (++iter > 10)
  1062				break;
  1063		}
  1064	
  1065		iter = 0;
  1066		list_for_each_entry(ck, &bc->freed_pcpu, list) {
  1067			prt_printf(out, "freed_pcpu:\t%lu\r\n", ck->btree_trans_barrier_seq);
  1068			if (++iter > 10)
  1069				break;
  1070		}
  1071	}
  1072	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
