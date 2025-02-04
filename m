Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78626155743;
	Tue,  4 Feb 2025 03:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639689; cv=none; b=YhzkbM4zUjH+D0r2lMcY3myhyP1fYRVb/NlOTy14PPJFFFuWK01EwXx+eKIFisiMsMYNc6Rk3faKRI8aoHAuuQ2VhGUmH+0IiEjaRw8cm2saP5xtUvHZPocVBrED4sDjgA7lgiWSF8jAHoKUkj/6nmfpTYi/Hxpl7gjdfYe2zuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639689; c=relaxed/simple;
	bh=/iCfBzo+S2AtKCBLKbFVOrYbMuPDz3FSMs2H2WnLRVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+lzsIWaaa+wvt/9bJwsm6DulRHL+/E1hqqOziPrSu5o8aKH15trNaO5lJOufmoOk+kdrIrQ1GXa7DEl9mIBcItUM6jPb1t+Mbal1Cg1nftU+NBUwITzdmW063g4ev87fiAvkS8kPfalVoUzbkRznFbIU5PTyilj2jlCI/ABMDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4uHo2Gt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4uHo2Gt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738639687; x=1770175687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/iCfBzo+S2AtKCBLKbFVOrYbMuPDz3FSMs2H2WnLRVQ=;
  b=R4uHo2GtpIJ6bTuliAuv1lDBMTkWXhnCDlCv9c01ntoLHZTrrHlpZl7N
   +VfJ4Yh/aHzSlmGDhKApTfCtuR4kNbpr4PP3h9TI1ZMxk+yQJnOsPqH2S
   Da7uoBChLJ21Hb7VSyemElbFDhvdm54IO3iBJmdoLslR0hPjG2++p/fKg
   Sj/2FF28eCHpkJIT3PDvn26yikzoci1KEsHNhbnt+s+d1ieP1R2e8854K
   7KwyibqTZWGINDOQZMbqsIX1H/xTV4im4HM22dLJB+l4JENWVvkfWLXCg
   iNM4lCFBkO4I1iIyUFicVw87LBXzoQsrLV53psJ+sbxmHSkLI9ttJlOac
   A==;
X-CSE-ConnectionGUID: WgBtfHVWQ6OFfOXpN0fCXQ==
X-CSE-MsgGUID: fcy0mGa5Q2ik7JsN0MXNmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39252393"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39252393"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 19:28:07 -0800
X-CSE-ConnectionGUID: NOfc1CI2Teiv6MwWCcIgeA==
X-CSE-MsgGUID: bk2Xqfy1SP6CIFp8WI34lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115084800"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2025 19:28:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf9bW-000ruq-1l;
	Tue, 04 Feb 2025 03:28:02 +0000
Date: Tue, 4 Feb 2025 11:27:15 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Taranov <kotaranov@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>,
	Shiraz Saleem <shirazsaleem@microsoft.com>,
	Long Li <longli@microsoft.com>
Subject: [leon-rdma:rdma-next 9/75] drivers/infiniband/hw/mana/qp.c:549:73:
 warning: variable 'err' is uninitialized when used here
Message-ID: <202502041114.n6Yv6u7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   10565c5cadcb629f7780d24dd351878de9f46db5
commit: bf3f6576bbbd511bbf30244ef82b3e48b7ae0331 [9/75] RDMA/mana_ib: UD/GSI QP creation for kernel
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250204/202502041114.n6Yv6u7p-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502041114.n6Yv6u7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502041114.n6Yv6u7p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/infiniband/hw/mana/qp.c:6:
   In file included from drivers/infiniband/hw/mana/mana_ib.h:9:
   In file included from include/rdma/ib_verbs.h:15:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/hw/mana/qp.c:549:73: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
     549 |                 ibdev_dbg(&mdev->ib_dev, "User-level UD QPs are not supported, %d\n", err);
         |                                                                                       ^~~
   include/rdma/ib_verbs.h:80:37: note: expanded from macro 'ibdev_dbg'
      80 |         dynamic_ibdev_dbg(__dev, format, ##args)
         |                                            ^~~~
   include/linux/dynamic_debug.h:282:19: note: expanded from macro 'dynamic_ibdev_dbg'
     282 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/infiniband/hw/mana/qp.c:546:12: note: initialize the variable 'err' to silence this warning
     546 |         int i, err;
         |                   ^
         |                    = 0
   4 warnings generated.


vim +/err +549 drivers/infiniband/hw/mana/qp.c

   538	
   539	static int mana_ib_create_ud_qp(struct ib_qp *ibqp, struct ib_pd *ibpd,
   540					struct ib_qp_init_attr *attr, struct ib_udata *udata)
   541	{
   542		struct mana_ib_dev *mdev = container_of(ibpd->device, struct mana_ib_dev, ib_dev);
   543		struct mana_ib_qp *qp = container_of(ibqp, struct mana_ib_qp, ibqp);
   544		struct gdma_context *gc = mdev_to_gc(mdev);
   545		u32 doorbell, queue_size;
   546		int i, err;
   547	
   548		if (udata) {
 > 549			ibdev_dbg(&mdev->ib_dev, "User-level UD QPs are not supported, %d\n", err);
   550			return -EINVAL;
   551		}
   552	
   553		for (i = 0; i < MANA_UD_QUEUE_TYPE_MAX; ++i) {
   554			queue_size = mana_ib_queue_size(attr, i);
   555			err = mana_ib_create_kernel_queue(mdev, queue_size, mana_ib_queue_type(attr, i),
   556							  &qp->ud_qp.queues[i]);
   557			if (err) {
   558				ibdev_err(&mdev->ib_dev, "Failed to create queue %d, err %d\n",
   559					  i, err);
   560				goto destroy_queues;
   561			}
   562		}
   563		doorbell = gc->mana_ib.doorbell;
   564	
   565		err = mana_ib_gd_create_ud_qp(mdev, qp, attr, doorbell, attr->qp_type);
   566		if (err) {
   567			ibdev_err(&mdev->ib_dev, "Failed to create ud qp  %d\n", err);
   568			goto destroy_queues;
   569		}
   570		qp->ibqp.qp_num = qp->ud_qp.queues[MANA_UD_RECV_QUEUE].id;
   571		qp->port = attr->port_num;
   572	
   573		for (i = 0; i < MANA_UD_QUEUE_TYPE_MAX; ++i)
   574			qp->ud_qp.queues[i].kmem->id = qp->ud_qp.queues[i].id;
   575	
   576		return 0;
   577	
   578	destroy_queues:
   579		while (i-- > 0)
   580			mana_ib_destroy_queue(mdev, &qp->ud_qp.queues[i]);
   581		return err;
   582	}
   583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
