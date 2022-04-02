Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6081366
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648893302; x=1680429302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fumi06v94/9zaz4RBho5ukKgkj7u7ZGJ7nmUzExiwAY=;
  b=Cam4TAfuN6hSRmRnDVHLY78ucm2VF16e+MjThFT6+D8U4jwZvmBz1v5n
   ldhXugzUeM/wBoL0TlaL2UovaXeZfwmLDfe4TGtbS6/yRijC6H68NkrKX
   Lw8EbsS8LxX1UxyKykQJY8MPgpJuP/LvrmlG8c76mxg0hlN1fBYn5CcgZ
   WhV3Ac72nqfXrs0MuvLZJh1xEJ81DzHqDs+K5v/OOwvxHfwke7A03TJnX
   BYME3CUZiBTCWeFcWhpF4DYWlQAP25x1xum7gPHm55OnPlPgzvdItLc0U
   sVxj+OBWlqLGRLvML9q8R5B9uby9ZGrkxcJEsYgepys1I/I2I3n/SGvOi
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10304"; a="259991685"
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="259991685"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2022 02:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,229,1643702400"; 
   d="scan'208";a="568163583"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 02 Apr 2022 02:55:00 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1naaTD-00028l-Ss;
	Sat, 02 Apr 2022 09:54:59 +0000
Date: Sat, 2 Apr 2022 17:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] rbd: add support for sparse reads
Message-ID: <202204021752.t09US76l-lkp@intel.com>
References: <20220401170535.57853-1-jlayton@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401170535.57853-1-jlayton@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jeff,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on ceph-client/for-linus]
[also build test ERROR on v5.17 next-20220401]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/rbd-add-support-for-sparse-reads/20220402-010754
base:   https://github.com/ceph/ceph-client.git for-linus
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220402/202204021752.t09US76l-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1af6e49fa0bc1a2d7fdc8a400512ca8b6361eab6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeff-Layton/rbd-add-support-for-sparse-reads/20220402-010754
        git checkout 1af6e49fa0bc1a2d7fdc8a400512ca8b6361eab6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/block/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/block/rbd.c:1387:54: error: no member named 'sparse_read' in 'struct ceph_msg'
           else if (osd_req->r_result > 0 && osd_req->r_reply->sparse_read)
                                             ~~~~~~~~~~~~~~~~  ^
   drivers/block/rbd.c:1388:12: error: implicit declaration of function 'ceph_sparse_ext_map_end' [-Werror,-Wimplicit-function-declaration]
                   result = ceph_sparse_ext_map_end(&osd_req->r_ops[0]);
                            ^
   drivers/block/rbd.c:2775:9: error: implicit declaration of function 'ceph_alloc_sparse_ext_map' [-Werror,-Wimplicit-function-declaration]
                   ret = ceph_alloc_sparse_ext_map(&osd_req->r_ops[0]);
                         ^
   drivers/block/rbd.c:4787:9: error: implicit declaration of function 'ceph_alloc_sparse_ext_map' [-Werror,-Wimplicit-function-declaration]
                   ret = ceph_alloc_sparse_ext_map(&req->r_ops[0]);
                         ^
   drivers/block/rbd.c:6101:17: warning: result of comparison of constant 2305843009213693948 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
               ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.


vim +1387 drivers/block/rbd.c

  1371	
  1372	static void rbd_osd_req_callback(struct ceph_osd_request *osd_req)
  1373	{
  1374		struct rbd_obj_request *obj_req = osd_req->r_priv;
  1375		int result;
  1376	
  1377		dout("%s osd_req %p result %d for obj_req %p\n", __func__, osd_req,
  1378		     osd_req->r_result, obj_req);
  1379	
  1380		/*
  1381		 * Writes aren't allowed to return a data payload.  In some
  1382		 * guarded write cases (e.g. stat + zero on an empty object)
  1383		 * a stat response makes it through, but we don't care.
  1384		 */
  1385		if (osd_req->r_result > 0 && rbd_img_is_write(obj_req->img_request))
  1386			result = 0;
> 1387		else if (osd_req->r_result > 0 && osd_req->r_reply->sparse_read)
  1388			result = ceph_sparse_ext_map_end(&osd_req->r_ops[0]);
  1389		else
  1390			result = osd_req->r_result;
  1391	
  1392		rbd_obj_handle_request(obj_req, result);
  1393	}
  1394	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
