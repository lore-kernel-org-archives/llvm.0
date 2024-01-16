Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16877208C9;
	Tue, 16 Jan 2024 22:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705442976; cv=none; b=osJO4SrdbarJgTMJahU7WEHsbzew5EiG+VJcElXe+2TjBv7LXzUgRs8p3r0BT3A9ZKRsPXkDmyBpio6Iqf22FbdgJyiS5jlahTVpkJ2K1OXGPh63x8cSKxPy+JDK5R3ayv3X+2E8w1bWIgj00TcMt2gUWtOPk2uFJxfG5HP6XLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705442976; c=relaxed/simple;
	bh=cTBOQ8xLo0aU4Q2sOpnEG6nOijFnvIs/L0iwNg38sRA=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=ND/sXOUmHrnW5n8qbaC9dVw1L1GWp1LqP+0edEr7tNIC+hcfb1ZN7hov6S6N/Adtsrkjzrj6SGdF4ToKM4u/pNsvD6sesK1bMj7ho3KVRdQlVsKXG55cs7eG9JdgYCGbxDF/021wo8Ll1ZZaOYuL2dwWoebLqXvo4vFXMel4S4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZk48XS8; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZk48XS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705442975; x=1736978975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cTBOQ8xLo0aU4Q2sOpnEG6nOijFnvIs/L0iwNg38sRA=;
  b=IZk48XS8cQrmfjULqeu1H+tO1/Z2uUI19hNIYL4HvR0IKDZjieGxvWYv
   s9HYYINsmcA/3LaXi+72bt81Mc6qC/N+p+oWzvwq/6HyWqQMQSwraX1m3
   3Ol09BZbSEL5I6hz7jZEADw9H6+hlOas4R/LHm/HH8P+n8CwOySMEYoAT
   9LUwlivCh73meePVE20fZjPi1GuFBMN/6nv3Oe+/d59fjgYGOxakNz8Bn
   I9mpSaVUOjVvJl8+wMwxT4n3dZl5mH1fxGipSfszh5vucgFKp3t9QGepm
   kyETCf23kuvxzCNwUykZDjnRW2lqLSKQHvRMbcd9hHNia0TxdvrgStQds
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="431164279"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="431164279"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 14:09:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="760336493"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="760336493"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Jan 2024 14:09:32 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPrcg-0001IA-0A;
	Tue, 16 Jan 2024 22:09:30 +0000
Date: Wed, 17 Jan 2024 06:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 87/105] drivers/block/rbd.c:2745:3: warning:
 needs fixing
Message-ID: <202401170626.BIWS97iW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   2cf82c6e7baf6d3a2adc0692707028da395f1553
commit: 858dfc3957679d91f48571bff69fa6ea4ecaea2f [87/105] [INCOMPLETE] rbd: Switch from using bvec_iter to iov_iter
config: i386-randconfig-006-20240116 (https://download.01.org/0day-ci/archive/20240117/202401170626.BIWS97iW-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401170626.BIWS97iW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401170626.BIWS97iW-lkp@intel.com/

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
