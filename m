Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2F44963C;
	Sat,  7 Sep 2024 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725730688; cv=none; b=hyDndxb2AA/YccUyEuXcYEKlPBUBsZO+MwY73Xj+uZUeZLnlMkfYNGT79OLSdvCL8kTqruy/i10Q2X2HJrtLW25D4kl9wUOZjqtAGkMZO3Blx3cOG049zB8CD14KQIqtxSNiLEGb5FnDKlL9uMU9yryqw0lU9SqMhhSl+A1vadA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725730688; c=relaxed/simple;
	bh=TrrKpsUATTQC3x/ziXInCHeZnGPkFY7bLBBxEbXjLLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LAvU4PhEmt00+kl+lYl1Zb7WUHA+008xPQO3/U0LQidQjW+39+m9lruWLSsgGMg+8fWYM1nNdjKEnMbLimMa1QHzf4Dw1nE3alpjhVpmNsbv+aT7pNF2issxSz+XzuWKpL+Je183WUWrSaAMi2laxSNE3qVfgKWmnGpsbhjDAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PC82WI/U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PC82WI/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725730687; x=1757266687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TrrKpsUATTQC3x/ziXInCHeZnGPkFY7bLBBxEbXjLLE=;
  b=PC82WI/UeOBegUVsn7LEnu/Z7YlxYe3JapBc4N7tnMOkIApmzHhkaj/W
   Gn5UrwiatKg2o7bh/VVVwhe0j9G5iOGPf5tcXaX71EXcia4rcRIOzdyQd
   76SUV/WEKVXLipugHGFl8g1tU9sZfuOhwRuI3lU7yIc571vmrUgrXuw+J
   dPwtt+3i8KGW4BnYoEXWGNcAkSzmqn5Bj3TOUqRx7oen4XcS+WD/UGwp1
   f87UHNfvE0GfX6DROHFhWeAcShLEn99nE+W7f+dhuxL5/srojmcva84H4
   LPV1vLDkyL8kWDvZrE1B+aIhzm+RUT+zpvHfzc6AUSMn0BiZySqBouTx/
   A==;
X-CSE-ConnectionGUID: V5jHC1anRyWQSBCuPxF6Og==
X-CSE-MsgGUID: K/XP2QWsQ6mRTWDY1ZPKlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24613419"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24613419"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 10:38:05 -0700
X-CSE-ConnectionGUID: dRDNUHmsRPK9zVNZ/nLRrQ==
X-CSE-MsgGUID: yg9IpP+JQdmgGfrZVE6FUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="89513002"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Sep 2024 10:38:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smzNp-000CnB-2G;
	Sat, 07 Sep 2024 17:38:01 +0000
Date: Sun, 8 Sep 2024 01:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 43/61] drivers/block/rbd.c:2745:3: warning:
 needs fixing
Message-ID: <202409080127.T3IuQqZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   6c59f154a1d493b31755ac17326124d804172fb2
commit: 7c05d26d256ee374483db177836b744874562f1b [43/61] [INCOMPLETE] rbd: Switch from using bvec_iter to iov_iter
config: i386-randconfig-016-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080127.T3IuQqZ7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080127.T3IuQqZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080127.T3IuQqZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/rbd.c:2745:3: warning: needs fixing [-W#warnings]
    2745 |         #warning needs fixing
         |          ^
   1 warning generated.


vim +2745 drivers/block/rbd.c

  2709	
  2710	static int rbd_obj_read_from_parent(struct rbd_obj_request *obj_req)
  2711	{
  2712		struct rbd_img_request *img_req = obj_req->img_request;
  2713		struct rbd_device *parent = img_req->rbd_dev->parent;
  2714		struct rbd_img_request *child_img_req;
  2715		int ret;
  2716	
  2717		child_img_req = kmem_cache_alloc(rbd_img_request_cache, GFP_NOIO);
  2718		if (!child_img_req)
  2719			return -ENOMEM;
  2720	
  2721		rbd_img_request_init(child_img_req, parent, OBJ_OP_READ);
  2722		__set_bit(IMG_REQ_CHILD, &child_img_req->flags);
  2723		child_img_req->obj_request = obj_req;
  2724	
  2725		down_read(&parent->header_rwsem);
  2726		rbd_img_capture_header(child_img_req);
  2727		up_read(&parent->header_rwsem);
  2728	
  2729		dout("%s child_img_req %p for obj_req %p\n", __func__, child_img_req,
  2730		     obj_req);
  2731	
  2732	#if 0 //////////////////// TODO
  2733		if (!rbd_img_is_write(img_req)) {
  2734			ret = rbd_img_fill_request(child_img_req,
  2735						   obj_req->img_extents,
  2736						   obj_req->num_img_extents,
  2737						   &obj_req->iter);
  2738		} else {
  2739			ret = rbd_img_fill_request(img_req,
  2740						   obj_req->img_extents,
  2741						   obj_req->num_img_extents,
  2742						   &obj_req->copyup_buf->iter);
  2743		}
  2744	#else
> 2745		#warning needs fixing
  2746		ret = -ENOMEM;
  2747		BUG();
  2748	#endif
  2749		if (ret) {
  2750			rbd_img_request_destroy(child_img_req);
  2751			return ret;
  2752		}
  2753	
  2754		/* avoid parent chain recursion */
  2755		rbd_img_schedule(child_img_req, 0);
  2756		return 0;
  2757	}
  2758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
