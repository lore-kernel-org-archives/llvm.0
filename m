Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3681106;
	Wed, 30 Aug 2023 03:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693367121; x=1724903121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uMEVXrMiH9BVNZV4yUy9NOesvof8AOqh1/bTKEvD4oU=;
  b=nLUL+3c6c/TW0MunRHEAjKhCIvFkGFtA5iAUVKYhEURCY8FziVRV9wIO
   cnrPzHAtWZ8VmmTImvlrRGIEps0QyE1LbgVfQDvgQ/+U5aHQNySbQQPkj
   dJEAWNt2ayEgFTtWxGIU7N6lyzi+pU3rIkaKKm1W2N02THKg83iCy2EXN
   GcJGWNFy7R+t6KXYqtLTbXWRXYoIBWe/iifJFOUGPuHnEuw7M99ciCgYs
   K1j6rnamfZlM0mx68YXaXUxd3irndP0JCgBTgUtq22yOsIy2BMmtIJqEj
   +E1ANtvj5gXVCR4J3XKFMFXAF3YGQyejc87i0TTpDFEEtVKFND2bziMf0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441903169"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="441903169"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 20:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="742070570"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="742070570"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2023 20:45:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbC8s-0009Nn-0P;
	Wed, 30 Aug 2023 03:45:18 +0000
Date: Wed, 30 Aug 2023 11:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 20/36] drivers/block/rbd.c:2741:3: warning:
 needs fixing
Message-ID: <202308301154.V7mV0beW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d9c2320ef61eb3f02f0f9cbb4b8811c9991160ac
commit: b2bd36460947fa0c092390b079b16fd0903825e4 [20/36] rbd: Switch from using bvec_iter to iov_iter
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230830/202308301154.V7mV0beW-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301154.V7mV0beW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301154.V7mV0beW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/rbd.c:2741:3: warning: needs fixing [-W#warnings]
           #warning needs fixing
            ^
   drivers/block/rbd.c:6036:17: warning: result of comparison of constant 2305843009213693948 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
               ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +2741 drivers/block/rbd.c

  2705	
  2706	static int rbd_obj_read_from_parent(struct rbd_obj_request *obj_req)
  2707	{
  2708		struct rbd_img_request *img_req = obj_req->img_request;
  2709		struct rbd_device *parent = img_req->rbd_dev->parent;
  2710		struct rbd_img_request *child_img_req;
  2711		int ret;
  2712	
  2713		child_img_req = kmem_cache_alloc(rbd_img_request_cache, GFP_NOIO);
  2714		if (!child_img_req)
  2715			return -ENOMEM;
  2716	
  2717		rbd_img_request_init(child_img_req, parent, OBJ_OP_READ);
  2718		__set_bit(IMG_REQ_CHILD, &child_img_req->flags);
  2719		child_img_req->obj_request = obj_req;
  2720	
  2721		down_read(&parent->header_rwsem);
  2722		rbd_img_capture_header(child_img_req);
  2723		up_read(&parent->header_rwsem);
  2724	
  2725		dout("%s child_img_req %p for obj_req %p\n", __func__, child_img_req,
  2726		     obj_req);
  2727	
  2728	#if 0 //////////////////// TODO
  2729		if (!rbd_img_is_write(img_req)) {
  2730			ret = rbd_img_fill_request(child_img_req,
  2731						   obj_req->img_extents,
  2732						   obj_req->num_img_extents,
  2733						   &obj_req->iter);
  2734		} else {
  2735			ret = rbd_img_fill_request(img_req,
  2736						   obj_req->img_extents,
  2737						   obj_req->num_img_extents,
  2738						   &obj_req->copyup_buf->iter);
  2739		}
  2740	#else
> 2741		#warning needs fixing
  2742		ret = -ENOMEM;
  2743		BUG();
  2744	#endif
  2745		if (ret) {
  2746			rbd_img_request_destroy(child_img_req);
  2747			return ret;
  2748		}
  2749	
  2750		/* avoid parent chain recursion */
  2751		rbd_img_schedule(child_img_req, 0);
  2752		return 0;
  2753	}
  2754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
