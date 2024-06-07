Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC3B8831;
	Fri,  7 Jun 2024 06:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717740932; cv=none; b=HYyrIipBgRWvxqdhGl+nsZfZpz3ynHH6boLtPJF/INSS7q/dByS24cg14HOE8PNN9tUjpAk8v+2/i9u97Mj0REHlzM+gVcELjUkTXPqbeD+qmRxAJRYuu02CSZTBAh+GUugUVjruSp9JlP7tLbDNFGjf59sNmNXzCdU0GDZSzYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717740932; c=relaxed/simple;
	bh=JAs6g8ylzif5KnIpABCEzzwi86l7HcwixPQidBJ4ohc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IK2COC5J3Z5sbxeSTsveLjkRDOLauEwekY00Uff6pzyxDi267FbNJiYQEZZYLjQsYbA/qhxk9gi1OrhfSMwfypW8gsZc8rdatOBbIQG0ShbuGlVZLx+xPetmowjxJnp0YDijBAv7VLIuHV46wKDBM2nUxk/ecJwdfTW/V7l2qRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YJfeStaC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YJfeStaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717740931; x=1749276931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JAs6g8ylzif5KnIpABCEzzwi86l7HcwixPQidBJ4ohc=;
  b=YJfeStaCTmSNE1AfZUvqPvzFarc77MQtNbF9aA1T6RcsnRKuYL4DcVLP
   Sdru914Bb1QOzIk7BskWlLEGd/rkM/asGdS9ii/mcrZftBzy6v5E/9r7q
   J+w5sZAv8H1+hO07IJ6yuCXbO4oqTFyM+/iqe52Skltw6QR+rL4HRttF8
   jVHRj/dwviN0JIzMh9dJv8E0vjESlv+J3rokuX9XwdhORgmOCfN8OAvH3
   hoQvFHhBd8heG0pobQwNE+vxhf/swowkXHGip9xH5kx8l8vT3sP56Y3qB
   puJAc1znkJxodxoY2Blr+WOSx2DpcWI4zLKj/MPY1Cw4AHzvJ+9S5A9IG
   w==;
X-CSE-ConnectionGUID: 9xp2TibHRyGS5qRQGhkCeA==
X-CSE-MsgGUID: JAD5mEuuREu+fnVcb5Bgxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25851631"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="25851631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 23:15:30 -0700
X-CSE-ConnectionGUID: LUo6rGR4STK/AYYiqGCVug==
X-CSE-MsgGUID: mIRbYBwHQEWGnxphjIFMTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="38206671"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 06 Jun 2024 23:15:27 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFSsn-00049Z-3D;
	Fri, 07 Jun 2024 06:15:26 +0000
Date: Fri, 7 Jun 2024 14:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Akiva Goldberger <agoldberger@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 34/40]
 drivers/infiniband/sw/siw/siw_verbs.c:1130:5: error: conflicting types for
 'siw_create_cq'
Message-ID: <202406071409.NmyPbA0s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   7f47750e7d11705566423836041a6778e01ccb24
commit: fccbaa915853806b5fc4a29cda8429bd97cfc8b3 [34/40] RDMA: Pass entire uverbs attr bundle to create cq function
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240607/202406071409.NmyPbA0s-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071409.NmyPbA0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071409.NmyPbA0s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/sw/siw/siw_verbs.c:11:
   In file included from include/net/addrconf.h:61:
   In file included from include/linux/ipv6.h:101:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/infiniband/sw/siw/siw_verbs.c:11:
   In file included from include/net/addrconf.h:61:
   In file included from include/linux/ipv6.h:101:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/infiniband/sw/siw/siw_verbs.c:11:
   In file included from include/net/addrconf.h:61:
   In file included from include/linux/ipv6.h:101:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/infiniband/sw/siw/siw_verbs.c:11:
   In file included from include/net/addrconf.h:61:
   In file included from include/linux/ipv6.h:101:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/infiniband/sw/siw/siw_verbs.c:1130:5: error: conflicting types for 'siw_create_cq'
    1130 | int siw_create_cq(struct ib_cq *base_cq, const struct ib_cq_init_attr *attr,
         |     ^
   drivers/infiniband/sw/siw/siw_verbs.h:45:5: note: previous declaration is here
      45 | int siw_create_cq(struct ib_cq *base_cq, const struct ib_cq_init_attr *attr,
         |     ^
   7 warnings and 1 error generated.


vim +/siw_create_cq +1130 drivers/infiniband/sw/siw/siw_verbs.c

303ae1cdfdf728 Bernard Metzler  2019-06-20  1119  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1120  /*
303ae1cdfdf728 Bernard Metzler  2019-06-20  1121   * siw_create_cq()
303ae1cdfdf728 Bernard Metzler  2019-06-20  1122   *
303ae1cdfdf728 Bernard Metzler  2019-06-20  1123   * Populate CQ of requested size
303ae1cdfdf728 Bernard Metzler  2019-06-20  1124   *
303ae1cdfdf728 Bernard Metzler  2019-06-20  1125   * @base_cq: CQ as allocated by RDMA midlayer
303ae1cdfdf728 Bernard Metzler  2019-06-20  1126   * @attr: Initial CQ attributes
303ae1cdfdf728 Bernard Metzler  2019-06-20  1127   * @udata: relates to user context
303ae1cdfdf728 Bernard Metzler  2019-06-20  1128   */
303ae1cdfdf728 Bernard Metzler  2019-06-20  1129  
303ae1cdfdf728 Bernard Metzler  2019-06-20 @1130  int siw_create_cq(struct ib_cq *base_cq, const struct ib_cq_init_attr *attr,
fccbaa91585380 Akiva Goldberger 2024-05-15  1131  		  struct ib_udata *udata, struct uverbs_attr_bundle *attrs)
303ae1cdfdf728 Bernard Metzler  2019-06-20  1132  {
303ae1cdfdf728 Bernard Metzler  2019-06-20  1133  	struct siw_device *sdev = to_siw_dev(base_cq->device);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1134  	struct siw_cq *cq = to_siw_cq(base_cq);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1135  	int rv, size = attr->cqe;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1136  
1c407cb5d70568 Jason Gunthorpe  2020-10-03  1137  	if (attr->flags)
1c407cb5d70568 Jason Gunthorpe  2020-10-03  1138  		return -EOPNOTSUPP;
1c407cb5d70568 Jason Gunthorpe  2020-10-03  1139  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1140  	if (atomic_inc_return(&sdev->num_cq) > SIW_MAX_CQ) {
303ae1cdfdf728 Bernard Metzler  2019-06-20  1141  		siw_dbg(base_cq->device, "too many CQ's\n");
303ae1cdfdf728 Bernard Metzler  2019-06-20  1142  		rv = -ENOMEM;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1143  		goto err_out;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1144  	}
303ae1cdfdf728 Bernard Metzler  2019-06-20  1145  	if (size < 1 || size > sdev->attrs.max_cqe) {
303ae1cdfdf728 Bernard Metzler  2019-06-20  1146  		siw_dbg(base_cq->device, "CQ size error: %d\n", size);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1147  		rv = -EINVAL;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1148  		goto err_out;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1149  	}
303ae1cdfdf728 Bernard Metzler  2019-06-20  1150  	size = roundup_pow_of_two(size);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1151  	cq->base_cq.cqe = size;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1152  	cq->num_cqe = size;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1153  
58fb0b5625ac97 Bernard Metzler  2019-12-10  1154  	if (udata)
303ae1cdfdf728 Bernard Metzler  2019-06-20  1155  		cq->queue = vmalloc_user(size * sizeof(struct siw_cqe) +
303ae1cdfdf728 Bernard Metzler  2019-06-20  1156  					 sizeof(struct siw_cq_ctrl));
58fb0b5625ac97 Bernard Metzler  2019-12-10  1157  	else
58fb0b5625ac97 Bernard Metzler  2019-12-10  1158  		cq->queue = vzalloc(size * sizeof(struct siw_cqe) +
58fb0b5625ac97 Bernard Metzler  2019-12-10  1159  				    sizeof(struct siw_cq_ctrl));
58fb0b5625ac97 Bernard Metzler  2019-12-10  1160  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1161  	if (cq->queue == NULL) {
303ae1cdfdf728 Bernard Metzler  2019-06-20  1162  		rv = -ENOMEM;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1163  		goto err_out;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1164  	}
303ae1cdfdf728 Bernard Metzler  2019-06-20  1165  	get_random_bytes(&cq->id, 4);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1166  	siw_dbg(base_cq->device, "new CQ [%u]\n", cq->id);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1167  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1168  	spin_lock_init(&cq->lock);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1169  
2c8ccb37b08fe3 Bernard Metzler  2019-08-09  1170  	cq->notify = (struct siw_cq_ctrl *)&cq->queue[size];
303ae1cdfdf728 Bernard Metzler  2019-06-20  1171  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1172  	if (udata) {
303ae1cdfdf728 Bernard Metzler  2019-06-20  1173  		struct siw_uresp_create_cq uresp = {};
303ae1cdfdf728 Bernard Metzler  2019-06-20  1174  		struct siw_ucontext *ctx =
303ae1cdfdf728 Bernard Metzler  2019-06-20  1175  			rdma_udata_to_drv_context(udata, struct siw_ucontext,
303ae1cdfdf728 Bernard Metzler  2019-06-20  1176  						  base_ucontext);
11f1a75567c43e Michal Kalderon  2019-10-30  1177  		size_t length = size * sizeof(struct siw_cqe) +
11f1a75567c43e Michal Kalderon  2019-10-30  1178  			sizeof(struct siw_cq_ctrl);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1179  
11f1a75567c43e Michal Kalderon  2019-10-30  1180  		cq->cq_entry =
11f1a75567c43e Michal Kalderon  2019-10-30  1181  			siw_mmap_entry_insert(ctx, cq->queue,
11f1a75567c43e Michal Kalderon  2019-10-30  1182  					      length, &uresp.cq_key);
11f1a75567c43e Michal Kalderon  2019-10-30  1183  		if (!cq->cq_entry) {
303ae1cdfdf728 Bernard Metzler  2019-06-20  1184  			rv = -ENOMEM;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1185  			goto err_out;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1186  		}
11f1a75567c43e Michal Kalderon  2019-10-30  1187  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1188  		uresp.cq_id = cq->id;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1189  		uresp.num_cqe = size;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1190  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1191  		if (udata->outlen < sizeof(uresp)) {
303ae1cdfdf728 Bernard Metzler  2019-06-20  1192  			rv = -EINVAL;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1193  			goto err_out;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1194  		}
303ae1cdfdf728 Bernard Metzler  2019-06-20  1195  		rv = ib_copy_to_udata(udata, &uresp, sizeof(uresp));
303ae1cdfdf728 Bernard Metzler  2019-06-20  1196  		if (rv)
303ae1cdfdf728 Bernard Metzler  2019-06-20  1197  			goto err_out;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1198  	}
303ae1cdfdf728 Bernard Metzler  2019-06-20  1199  	return 0;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1200  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1201  err_out:
303ae1cdfdf728 Bernard Metzler  2019-06-20  1202  	siw_dbg(base_cq->device, "CQ creation failed: %d", rv);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1203  
aeea6cc0675251 Andrey Strachuk  2022-07-11  1204  	if (cq->queue) {
303ae1cdfdf728 Bernard Metzler  2019-06-20  1205  		struct siw_ucontext *ctx =
303ae1cdfdf728 Bernard Metzler  2019-06-20  1206  			rdma_udata_to_drv_context(udata, struct siw_ucontext,
303ae1cdfdf728 Bernard Metzler  2019-06-20  1207  						  base_ucontext);
11f1a75567c43e Michal Kalderon  2019-10-30  1208  		if (ctx)
11f1a75567c43e Michal Kalderon  2019-10-30  1209  			rdma_user_mmap_entry_remove(cq->cq_entry);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1210  		vfree(cq->queue);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1211  	}
303ae1cdfdf728 Bernard Metzler  2019-06-20  1212  	atomic_dec(&sdev->num_cq);
303ae1cdfdf728 Bernard Metzler  2019-06-20  1213  
303ae1cdfdf728 Bernard Metzler  2019-06-20  1214  	return rv;
303ae1cdfdf728 Bernard Metzler  2019-06-20  1215  }
303ae1cdfdf728 Bernard Metzler  2019-06-20  1216  

:::::: The code at line 1130 was first introduced by commit
:::::: 303ae1cdfdf7280ff4cfbbe65563b5ff15bb025b rdma/siw: application interface

:::::: TO: Bernard Metzler <bmt@zurich.ibm.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
