Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A002906
	for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658096504; x=1689632504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C7DhG1gCRyqut4/oukU31slxrs5oJt4SJ1WqTZDrCxU=;
  b=mW7tZx4eMNOFnfLJQ+Hrn1GHxaxDiJ3dmNFXk0BFp6cunxOmfEkxgPx4
   AH01wIycgXifq08c6x9IA+NQGS8LEmigiJqg3oVvp2LScG7pH7QeQt429
   sVq02blkPoOrRShGbgWg/vEBLx/sa4hgGl2Qin8ldkaFUZPl5yOOmByb7
   DKzvAOB+5+XY7D43qre6raqQ4hQBlhBIB7S/x/u0hCqWudxtFr8rqnYH3
   z+Y2eTCHPpX7DtlzbQ/onlo147lVXWLs8LQ0QQB22F2vUNE0P2WhyKSsF
   +9tQc60yyiSldDIEyO5K8Vq0rj/mpPEKdjGtSn8rzraEVReKUR7ga++Dq
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="284852137"
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="284852137"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 15:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,279,1650956400"; 
   d="scan'208";a="664803449"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jul 2022 15:21:42 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDCdy-0003kE-2M;
	Sun, 17 Jul 2022 22:21:42 +0000
Date: Mon, 18 Jul 2022 06:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] ublk_drv: fix request queue leak
Message-ID: <202207180650.FHQQqTxN-lkp@intel.com>
References: <20220714103201.131648-1-ming.lei@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714103201.131648-1-ming.lei@redhat.com>

Hi Ming,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[cannot apply to linus/master v5.19-rc7 next-20220715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/ublk_drv-fix-request-queue-leak/20220714-183546
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220718/202207180650.FHQQqTxN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/98d681f8eed174b29ee9e72ed6a7d04e1a77835b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ming-Lei/ublk_drv-fix-request-queue-leak/20220714-183546
        git checkout 98d681f8eed174b29ee9e72ed6a7d04e1a77835b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/block/ drivers/media/i2c/ drivers/net/pcs/ drivers/pinctrl/nuvoton/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/block/ublk_drv.c:890:6: warning: variable 'io' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (tag >= ubq->q_depth)
               ^~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
           io->flags &= ~UBLK_IO_FLAG_ACTIVE;
           ^~
   drivers/block/ublk_drv.c:890:2: note: remove the 'if' if its condition is always false
           if (tag >= ubq->q_depth)
           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:887:6: warning: variable 'io' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (ubq->ubq_daemon && ubq->ubq_daemon != current)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
           io->flags &= ~UBLK_IO_FLAG_ACTIVE;
           ^~
   drivers/block/ublk_drv.c:887:2: note: remove the 'if' if its condition is always false
           if (ubq->ubq_daemon && ubq->ubq_daemon != current)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:884:6: warning: variable 'io' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!ubq || ub_cmd->q_id != ubq->q_id)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
           io->flags &= ~UBLK_IO_FLAG_ACTIVE;
           ^~
   drivers/block/ublk_drv.c:884:2: note: remove the 'if' if its condition is always false
           if (!ubq || ub_cmd->q_id != ubq->q_id)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:884:6: warning: variable 'io' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
           if (!ubq || ub_cmd->q_id != ubq->q_id)
               ^~~~
   drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
           io->flags &= ~UBLK_IO_FLAG_ACTIVE;
           ^~
   drivers/block/ublk_drv.c:884:6: note: remove the '||' if its condition is always false
           if (!ubq || ub_cmd->q_id != ubq->q_id)
               ^~~~~~~
   drivers/block/ublk_drv.c:880:6: warning: variable 'io' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (ub_cmd->q_id >= ub->dev_info.nr_hw_queues)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
           io->flags &= ~UBLK_IO_FLAG_ACTIVE;
           ^~
   drivers/block/ublk_drv.c:880:2: note: remove the 'if' if its condition is always false
           if (ub_cmd->q_id >= ub->dev_info.nr_hw_queues)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:877:6: warning: variable 'io' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!(issue_flags & IO_URING_F_SQE128))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
           io->flags &= ~UBLK_IO_FLAG_ACTIVE;
           ^~
   drivers/block/ublk_drv.c:877:2: note: remove the 'if' if its condition is always false
           if (!(issue_flags & IO_URING_F_SQE128))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:868:20: note: initialize the variable 'io' to silence this warning
           struct ublk_io *io;
                             ^
                              = NULL
>> drivers/block/ublk_drv.c:1081:2: error: call to undeclared function 'blk_cleanup_queue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           blk_cleanup_queue(ub->ub_queue);
           ^
>> drivers/block/ublk_drv.c:1177:23: error: call to undeclared function '__alloc_disk_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           disk = ub->ub_disk = __alloc_disk_node(ub->ub_queue, NUMA_NO_NODE,
                                ^
   drivers/block/ublk_drv.c:1177:23: note: did you mean '__alloc_pages_node'?
   include/linux/gfp.h:582:1: note: '__alloc_pages_node' declared here
   __alloc_pages_node(int nid, gfp_t gfp_mask, unsigned int order)
   ^
>> drivers/block/ublk_drv.c:1177:21: warning: incompatible integer to pointer conversion assigning to 'struct gendisk *' from 'int' [-Wint-conversion]
           disk = ub->ub_disk = __alloc_disk_node(ub->ub_queue, NUMA_NO_NODE,
                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/ublk_drv.c:1215:2: error: call to undeclared function 'blk_cleanup_queue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           blk_cleanup_queue(ub->ub_queue);
           ^
   7 warnings and 3 errors generated.


vim +/blk_cleanup_queue +1081 drivers/block/ublk_drv.c

  1076	
  1077	static void ublk_cdev_rel(struct device *dev)
  1078	{
  1079		struct ublk_device *ub = container_of(dev, struct ublk_device, cdev_dev);
  1080	
> 1081		blk_cleanup_queue(ub->ub_queue);
  1082	
  1083		put_disk(ub->ub_disk);
  1084	
  1085		blk_mq_free_tag_set(&ub->tag_set);
  1086	
  1087		ublk_deinit_queues(ub);
  1088	
  1089		__ublk_destroy_dev(ub);
  1090	}
  1091	
  1092	static int ublk_add_chdev(struct ublk_device *ub)
  1093	{
  1094		struct device *dev = &ub->cdev_dev;
  1095		int minor = ub->ub_number;
  1096		int ret;
  1097	
  1098		dev->parent = ublk_misc.this_device;
  1099		dev->devt = MKDEV(MAJOR(ublk_chr_devt), minor);
  1100		dev->class = ublk_chr_class;
  1101		dev->release = ublk_cdev_rel;
  1102		device_initialize(dev);
  1103	
  1104		ret = dev_set_name(dev, "ublkc%d", minor);
  1105		if (ret)
  1106			goto fail;
  1107	
  1108		cdev_init(&ub->cdev, &ublk_ch_fops);
  1109		ret = cdev_device_add(&ub->cdev, dev);
  1110		if (ret)
  1111			goto fail;
  1112		return 0;
  1113	 fail:
  1114		put_device(dev);
  1115		return ret;
  1116	}
  1117	
  1118	static void ublk_stop_work_fn(struct work_struct *work)
  1119	{
  1120		struct ublk_device *ub =
  1121			container_of(work, struct ublk_device, stop_work);
  1122	
  1123		ublk_stop_dev(ub);
  1124	}
  1125	
  1126	static void ublk_update_capacity(struct ublk_device *ub)
  1127	{
  1128		unsigned int max_rq_bytes;
  1129	
  1130		/* make max request buffer size aligned with PAGE_SIZE */
  1131		max_rq_bytes = round_down(ub->dev_info.rq_max_blocks <<
  1132				ub->bs_shift, PAGE_SIZE);
  1133		ub->dev_info.rq_max_blocks = max_rq_bytes >> ub->bs_shift;
  1134	
  1135		set_capacity(ub->ub_disk, ub->dev_info.dev_blocks << (ub->bs_shift - 9));
  1136	}
  1137	
  1138	/* add disk & cdev, cleanup everything in case of failure */
  1139	static int ublk_add_dev(struct ublk_device *ub)
  1140	{
  1141		struct gendisk *disk;
  1142		int err = -ENOMEM;
  1143		int bsize;
  1144	
  1145		/* We are not ready to support zero copy */
  1146		ub->dev_info.flags[0] &= ~UBLK_F_SUPPORT_ZERO_COPY;
  1147	
  1148		bsize = ub->dev_info.block_size;
  1149		ub->bs_shift = ilog2(bsize);
  1150	
  1151		ub->dev_info.nr_hw_queues = min_t(unsigned int,
  1152				ub->dev_info.nr_hw_queues, nr_cpu_ids);
  1153	
  1154		INIT_WORK(&ub->stop_work, ublk_stop_work_fn);
  1155		INIT_DELAYED_WORK(&ub->monitor_work, ublk_daemon_monitor_work);
  1156	
  1157		if (ublk_init_queues(ub))
  1158			goto out_destroy_dev;
  1159	
  1160		ub->tag_set.ops = &ublk_mq_ops;
  1161		ub->tag_set.nr_hw_queues = ub->dev_info.nr_hw_queues;
  1162		ub->tag_set.queue_depth = ub->dev_info.queue_depth;
  1163		ub->tag_set.numa_node = NUMA_NO_NODE;
  1164		ub->tag_set.cmd_size = sizeof(struct ublk_rq_data);
  1165		ub->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
  1166		ub->tag_set.driver_data = ub;
  1167	
  1168		err = blk_mq_alloc_tag_set(&ub->tag_set);
  1169		if (err)
  1170			goto out_deinit_queues;
  1171	
  1172		ub->ub_queue = blk_mq_init_queue(&ub->tag_set);
  1173		if (IS_ERR(ub->ub_queue))
  1174			goto out_cleanup_tags;
  1175		ub->ub_queue->queuedata = ub;
  1176	
> 1177		disk = ub->ub_disk = __alloc_disk_node(ub->ub_queue, NUMA_NO_NODE,
  1178				&ublk_bio_compl_lkclass);
  1179		if (IS_ERR(disk)) {
  1180			err = PTR_ERR(disk);
  1181			goto out_free_request_queue;
  1182		}
  1183	
  1184		blk_queue_logical_block_size(ub->ub_queue, bsize);
  1185		blk_queue_physical_block_size(ub->ub_queue, bsize);
  1186		blk_queue_io_min(ub->ub_queue, bsize);
  1187	
  1188		blk_queue_max_hw_sectors(ub->ub_queue, ub->dev_info.rq_max_blocks <<
  1189				(ub->bs_shift - 9));
  1190	
  1191		ub->ub_queue->limits.discard_granularity = PAGE_SIZE;
  1192	
  1193		blk_queue_max_discard_sectors(ub->ub_queue, UINT_MAX >> 9);
  1194		blk_queue_max_write_zeroes_sectors(ub->ub_queue, UINT_MAX >> 9);
  1195	
  1196		ublk_update_capacity(ub);
  1197	
  1198		disk->fops		= &ub_fops;
  1199		disk->private_data	= ub;
  1200		disk->queue		= ub->ub_queue;
  1201		sprintf(disk->disk_name, "ublkb%d", ub->ub_number);
  1202	
  1203		mutex_init(&ub->mutex);
  1204	
  1205		/* add char dev so that ublksrv daemon can be setup */
  1206		err = ublk_add_chdev(ub);
  1207		if (err)
  1208			return err;
  1209	
  1210		/* don't expose disk now until we got start command from cdev */
  1211	
  1212		return 0;
  1213	
  1214	out_free_request_queue:
  1215		blk_cleanup_queue(ub->ub_queue);
  1216	out_cleanup_tags:
  1217		blk_mq_free_tag_set(&ub->tag_set);
  1218	out_deinit_queues:
  1219		ublk_deinit_queues(ub);
  1220	out_destroy_dev:
  1221		__ublk_destroy_dev(ub);
  1222		return err;
  1223	}
  1224	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
