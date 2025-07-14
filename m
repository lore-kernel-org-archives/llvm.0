Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3706B221FB1;
	Mon, 14 Jul 2025 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752525312; cv=none; b=k5JqKXgI/sKG2yg/knfsl+ZvOE3wRHtNIjGGbHUuHTWULyWBAIbSAVYxrtdwz5O412AvY0raLmh+FtX+JtjujUCtVJl9BTNIY6wGca65dqbz508T0Ihg/upycax1IlffW3hPRylEF1ppwnxP+czfnDhVc4YDHqMpEyV5otdQUXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752525312; c=relaxed/simple;
	bh=P3G+5HJ8Rd8lg06Ac/rN8qKNL1uVRByU9FkqJRNzaoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FHr847It4dc0z+IAElJoMXib1EFZGXOlqn3mzSyB0KylkL2nL8a+Bm5D5uwq6CnDil727EkKKGUGRfTy9kYbjatgsMm7t+fRsXOIw5XfWTPk8s6zJeXcYoEflUn3WrSwdm+OcUduOJ5wm4Tbr2HVxhY4obkmfxMB+PZRDt8iIs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXYg/lHs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXYg/lHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752525309; x=1784061309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P3G+5HJ8Rd8lg06Ac/rN8qKNL1uVRByU9FkqJRNzaoo=;
  b=CXYg/lHsoLc1Q/gNKRj+yhcUUwjMP5+9Ryss7deYsVHA5Q09iDb+iMIQ
   0flwFimqxhNmlM0OnUL5NkzQseO7T2aUhADHFvJnEKopXxZogKh8U3jjo
   VWjPCG8doxsza/QDHY0CsGvV1oSfDpX9as8Db0wMm9GRVsuDtoJzfzjId
   5RZ9R3ieju7wfUjY9n0y9Otg9g7o+YfeJ+LMhoua6/q/Jj3IBGEqoz3xy
   iMDskfgzGylWxJFR0gCt8CrSdgymqTz/vltG5JlVWDgVD4SEUuEPx6A7I
   xTPB5GSij4YRo5+NAkPilDJaqjmbv8OLQXzGhvkGto39Lsl7e4LzT8dpd
   Q==;
X-CSE-ConnectionGUID: XAA6a+egR8CW0l22OVnKpg==
X-CSE-MsgGUID: eflmZ+18QYylbW+R9QQ21Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72180343"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="72180343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 13:35:09 -0700
X-CSE-ConnectionGUID: FOfTnYXMSQG25ccRJe5Hrw==
X-CSE-MsgGUID: n6/OWT81RYekewfYKr8XIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="161347671"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jul 2025 13:35:08 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubPtB-0009JJ-0J;
	Mon, 14 Jul 2025 20:35:05 +0000
Date: Tue, 15 Jul 2025 04:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 92/119] fs/bcachefs/super.c:2269:3:
 error: cannot jump from this goto statement to its label
Message-ID: <202507150440.yJNwET08-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   482cb3b5cb54b04f17d439174a6a8d1298da5b9e
commit: f8492388d02294b021e0f85cf14784d2a26e3785 [92/119] bcachefs: convert super.c to CLASS/guards
config: arm-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250715/202507150440.yJNwET08-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150440.yJNwET08-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150440.yJNwET08-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/super.c:2269:3: error: cannot jump from this goto statement to its label
    2269 |                 goto unlock;
         |                 ^
   fs/bcachefs/super.c:2282:18: note: jump bypasses initialization of variable with __attribute__((cleanup))
    2282 |         CLASS(printbuf, buf)();
         |                         ^
   1 error generated.


vim +2269 fs/bcachefs/super.c

d5308203a85e01 Kent Overstreet 2025-02-25  2248  
d5308203a85e01 Kent Overstreet 2025-02-25  2249  static void bch2_fs_bdev_mark_dead(struct block_device *bdev, bool surprise)
d5308203a85e01 Kent Overstreet 2025-02-25  2250  {
f8492388d02294 Kent Overstreet 2025-07-14  2251  	CLASS(bdev_get_fs, c)(bdev);
d5308203a85e01 Kent Overstreet 2025-02-25  2252  	if (!c)
d5308203a85e01 Kent Overstreet 2025-02-25  2253  		return;
d5308203a85e01 Kent Overstreet 2025-02-25  2254  
d5308203a85e01 Kent Overstreet 2025-02-25  2255  	struct super_block *sb = c->vfs_sb;
d5308203a85e01 Kent Overstreet 2025-02-25  2256  	if (sb) {
d5308203a85e01 Kent Overstreet 2025-02-25  2257  		/*
d5308203a85e01 Kent Overstreet 2025-02-25  2258  		 * Not necessary, c->ro_ref guards against the filesystem being
d5308203a85e01 Kent Overstreet 2025-02-25  2259  		 * unmounted - we only take this to avoid a warning in
d5308203a85e01 Kent Overstreet 2025-02-25  2260  		 * sync_filesystem:
d5308203a85e01 Kent Overstreet 2025-02-25  2261  		 */
d5308203a85e01 Kent Overstreet 2025-02-25  2262  		down_read(&sb->s_umount);
d5308203a85e01 Kent Overstreet 2025-02-25  2263  	}
d5308203a85e01 Kent Overstreet 2025-02-25  2264  
f8492388d02294 Kent Overstreet 2025-07-14  2265  	guard(rwsem_write)(&c->state_lock);
f8492388d02294 Kent Overstreet 2025-07-14  2266  
d5308203a85e01 Kent Overstreet 2025-02-25  2267  	struct bch_dev *ca = bdev_to_bch_dev(c, bdev);
d5308203a85e01 Kent Overstreet 2025-02-25  2268  	if (!ca)
d5308203a85e01 Kent Overstreet 2025-02-25 @2269  		goto unlock;
d5308203a85e01 Kent Overstreet 2025-02-25  2270  
b42fac043f9551 Kent Overstreet 2025-05-13  2271  	bool dev = bch2_dev_state_allowed(c, ca,
b42fac043f9551 Kent Overstreet 2025-05-13  2272  					  BCH_MEMBER_STATE_failed,
b42fac043f9551 Kent Overstreet 2025-05-13  2273  					  BCH_FORCE_IF_DEGRADED);
b42fac043f9551 Kent Overstreet 2025-05-13  2274  
b42fac043f9551 Kent Overstreet 2025-05-13  2275  	if (!dev && sb) {
d5308203a85e01 Kent Overstreet 2025-02-25  2276  		if (!surprise)
d5308203a85e01 Kent Overstreet 2025-02-25  2277  			sync_filesystem(sb);
d5308203a85e01 Kent Overstreet 2025-02-25  2278  		shrink_dcache_sb(sb);
d5308203a85e01 Kent Overstreet 2025-02-25  2279  		evict_inodes(sb);
d5308203a85e01 Kent Overstreet 2025-02-25  2280  	}
d5308203a85e01 Kent Overstreet 2025-02-25  2281  
f8492388d02294 Kent Overstreet 2025-07-14  2282  	CLASS(printbuf, buf)();
b42fac043f9551 Kent Overstreet 2025-05-13  2283  	__bch2_log_msg_start(ca->name, &buf);
b42fac043f9551 Kent Overstreet 2025-05-13  2284  
b42fac043f9551 Kent Overstreet 2025-05-13  2285  	prt_printf(&buf, "offline from block layer");
b42fac043f9551 Kent Overstreet 2025-05-13  2286  
b42fac043f9551 Kent Overstreet 2025-05-13  2287  	if (dev) {
b42fac043f9551 Kent Overstreet 2025-05-13  2288  		__bch2_dev_offline(c, ca);
b42fac043f9551 Kent Overstreet 2025-05-13  2289  	} else {
d5308203a85e01 Kent Overstreet 2025-02-25  2290  		bch2_journal_flush(&c->journal);
b42fac043f9551 Kent Overstreet 2025-05-13  2291  		bch2_fs_emergency_read_only2(c, &buf);
d5308203a85e01 Kent Overstreet 2025-02-25  2292  	}
d5308203a85e01 Kent Overstreet 2025-02-25  2293  
b42fac043f9551 Kent Overstreet 2025-05-13  2294  	bch2_print_str(c, KERN_ERR, buf.buf);
b42fac043f9551 Kent Overstreet 2025-05-13  2295  
d5308203a85e01 Kent Overstreet 2025-02-25  2296  	bch2_dev_put(ca);
d5308203a85e01 Kent Overstreet 2025-02-25  2297  unlock:
d5308203a85e01 Kent Overstreet 2025-02-25  2298  	if (sb)
d5308203a85e01 Kent Overstreet 2025-02-25  2299  		up_read(&sb->s_umount);
d5308203a85e01 Kent Overstreet 2025-02-25  2300  }
d5308203a85e01 Kent Overstreet 2025-02-25  2301  

:::::: The code at line 2269 was first introduced by commit
:::::: d5308203a85e016e9ceb3e38742a1634c77a7706 bcachefs: Implement blk_holder_ops

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
