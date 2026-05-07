Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F032E6BC;
	Thu,  7 May 2026 06:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135815; cv=none; b=OekFnIING4TcIPe4ZsTdvlSzuTSWye3YMcpfYinxRqB516kdYQ8tokae/dAmJeqAKlkByXApEEqhZyg5J2IF6bwI6HK1ZbgENeYPGfpe0K6miQ0+CENR3m38a0NJb/XYuhCyTmL/r28L2owYje9PWZmZL6Qf7XbfwSc/GLiX3ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135815; c=relaxed/simple;
	bh=Nt8qZRQ9LxLWU0QqWKt3nKIYo5b0nj0Jh0Vhxvt+lmc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kMbwIgILA9EJpW4Owxq1Hcwr9TeTfD+J/I8JWcooJhxAVf5rIQrf2SS5CRmduMJJqMEkb1IIahrLpYtZGYsQtKlXAdBFTsNDbD63ioucm2OCS3IsyhD8ky7EspCNDAAAZDGrdrgEOoTqzadQusL91Wjs0gH0wonBBeDZjk29rDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTaocJcZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTaocJcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778135814; x=1809671814;
  h=date:from:to:cc:subject:message-id;
  bh=Nt8qZRQ9LxLWU0QqWKt3nKIYo5b0nj0Jh0Vhxvt+lmc=;
  b=OTaocJcZ1M726vJ7UOxcBYwxtbU+XKe/ZQjS1SvNf8ZESaIAa4AaaYna
   5U7bAkAQBzQXk6H69vac9XvXNdc7iB6ABV637+ezb6sl/x10XrooEP8da
   dpnRw2+DLZat0KrRKLWk3/XW16c63t8/hsoTo+lt8d/Nb0s/pkxm2iaa6
   GRYHV+XKhdPcgOi5bTnXp947vQWY7yDaFlOJvN97Xgkj9RaS7qToQr2l1
   iUv/AE7BFVQmEaSg1G4QJr7lQ5SHS+c/HTYl7RTsAq2MyIWVneQnxFgTo
   HZJ4A5yFSUlggov0fG0C97rMKBv1Ztd7WzPMRSu0/T8QLJ5zUbzp7n1uu
   Q==;
X-CSE-ConnectionGUID: nScislDMQm+/f/woNr3tlw==
X-CSE-MsgGUID: oaqEDb16QSyATuuLo1yYLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90455752"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="90455752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 23:36:53 -0700
X-CSE-ConnectionGUID: i8nFIvC/RM+As57pPbphPw==
X-CSE-MsgGUID: rFLqrTsGT5yXAYp7FmDjbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="235377569"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2026 23:36:51 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKsLo-0000000003J-1ljq;
	Thu, 07 May 2026 06:36:48 +0000
Date: Thu, 07 May 2026 14:36:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>
Subject: [axboe:nvme-raw-queues 10/16]
 drivers/nvme/host/ioctl.c:566:30: error: no member named 'queue_uring_cmd' in
 'struct blk_mq_ops'
Message-ID: <202605071449.cb0U5rca-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: 3c53a8c35b891c1535f55b6a462bcd8ff74ef8e7 [10/16] nvme: submisssion/completion of uring_cmd to/from the registered queue
config: hexagon-randconfig-001-20260506 (https://download.01.org/0day-ci/archive/20260507/202605071449.cb0U5rca-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071449.cb0U5rca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071449.cb0U5rca-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/ioctl.c:558:12: error: call to undeclared function 'io_uring_cmd_import_qid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     558 |         int qid = io_uring_cmd_import_qid(ioucmd);
         |                   ^
   drivers/nvme/host/ioctl.c:558:12: note: did you mean 'io_uring_cmd_import_fixed'?
   include/linux/io_uring/cmd.h:45:5: note: 'io_uring_cmd_import_fixed' declared here
      45 | int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
         |     ^
>> drivers/nvme/host/ioctl.c:566:30: error: no member named 'queue_uring_cmd' in 'struct blk_mq_ops'
     566 |         if (q->mq_ops && q->mq_ops->queue_uring_cmd)
         |                          ~~~~~~~~~  ^
   drivers/nvme/host/ioctl.c:567:21: error: no member named 'queue_uring_cmd' in 'struct blk_mq_ops'
     567 |                 return q->mq_ops->queue_uring_cmd(ioucmd, qid);
         |                        ~~~~~~~~~  ^
>> drivers/nvme/host/ioctl.c:719:32: error: no member named 'poll_uring_cmd' in 'struct blk_mq_ops'
     719 |         if (!(q->mq_ops && q->mq_ops->poll_uring_cmd))
         |                            ~~~~~~~~~  ^
   drivers/nvme/host/ioctl.c:722:20: error: no member named 'poll_uring_cmd' in 'struct blk_mq_ops'
     722 |                 ret = q->mq_ops->poll_uring_cmd(ioucmd, qid, iob);
         |                       ~~~~~~~~~  ^
   drivers/nvme/host/ioctl.c:711:5: warning: no previous prototype for function 'nvme_uring_cmd_iopoll_qid' [-Wmissing-prototypes]
     711 | int nvme_uring_cmd_iopoll_qid(struct request_queue *q,
         |     ^
   drivers/nvme/host/ioctl.c:711:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     711 | int nvme_uring_cmd_iopoll_qid(struct request_queue *q,
         | ^
         | static 
   drivers/nvme/host/ioctl.c:754:13: error: call to undeclared function 'io_uring_cmd_import_qid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     754 |                 int qid = io_uring_cmd_import_qid(ioucmd);
         |                           ^
   drivers/nvme/host/ioctl.c:864:30: error: no member named 'register_queue' in 'struct blk_mq_ops'
     864 |         if (q->mq_ops && q->mq_ops->register_queue)
         |                          ~~~~~~~~~  ^
   drivers/nvme/host/ioctl.c:865:20: error: no member named 'register_queue' in 'struct blk_mq_ops'
     865 |                 ret = q->mq_ops->register_queue(ns);
         |                       ~~~~~~~~~  ^
   drivers/nvme/host/ioctl.c:888:30: error: no member named 'unregister_queue' in 'struct blk_mq_ops'
     888 |         if (q->mq_ops && q->mq_ops->unregister_queue)
         |                          ~~~~~~~~~  ^
   drivers/nvme/host/ioctl.c:889:20: error: no member named 'unregister_queue' in 'struct blk_mq_ops'
     889 |                 ret = q->mq_ops->unregister_queue(ns, qid);
         |                       ~~~~~~~~~  ^
   1 warning and 10 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +566 drivers/nvme/host/ioctl.c

   553	
   554	static int nvme_uring_cmd_io_direct(struct nvme_ctrl *ctrl, struct nvme_ns *ns,
   555			struct io_uring_cmd *ioucmd, unsigned int issue_flags)
   556	{
   557		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
   558		int qid = io_uring_cmd_import_qid(ioucmd);
   559		struct nvme_uring_direct_pdu *pdu =
   560			(struct nvme_uring_direct_pdu *)&ioucmd->pdu;
   561	
   562		if ((issue_flags & IO_URING_F_IOPOLL) != IO_URING_F_IOPOLL)
   563			return -EOPNOTSUPP;
   564	
   565		pdu->ns = ns;
 > 566		if (q->mq_ops && q->mq_ops->queue_uring_cmd)
   567			return q->mq_ops->queue_uring_cmd(ioucmd, qid);
   568		return -EOPNOTSUPP;
   569	}
   570	
   571	static int nvme_ctrl_ioctl(struct nvme_ctrl *ctrl, unsigned int cmd,
   572			void __user *argp, bool open_for_write)
   573	{
   574		switch (cmd) {
   575		case NVME_IOCTL_ADMIN_CMD:
   576			return nvme_user_cmd(ctrl, NULL, argp, 0, open_for_write);
   577		case NVME_IOCTL_ADMIN64_CMD:
   578			return nvme_user_cmd64(ctrl, NULL, argp, 0, open_for_write);
   579		default:
   580			return sed_ioctl(ctrl->opal_dev, cmd, argp);
   581		}
   582	}
   583	
   584	#ifdef COMPAT_FOR_U64_ALIGNMENT
   585	struct nvme_user_io32 {
   586		__u8	opcode;
   587		__u8	flags;
   588		__u16	control;
   589		__u16	nblocks;
   590		__u16	rsvd;
   591		__u64	metadata;
   592		__u64	addr;
   593		__u64	slba;
   594		__u32	dsmgmt;
   595		__u32	reftag;
   596		__u16	apptag;
   597		__u16	appmask;
   598	} __attribute__((__packed__));
   599	#define NVME_IOCTL_SUBMIT_IO32	_IOW('N', 0x42, struct nvme_user_io32)
   600	#endif /* COMPAT_FOR_U64_ALIGNMENT */
   601	
   602	static int nvme_ns_ioctl(struct nvme_ns *ns, unsigned int cmd,
   603			void __user *argp, unsigned int flags, bool open_for_write)
   604	{
   605		switch (cmd) {
   606		case NVME_IOCTL_ID:
   607			force_successful_syscall_return();
   608			return ns->head->ns_id;
   609		case NVME_IOCTL_IO_CMD:
   610			return nvme_user_cmd(ns->ctrl, ns, argp, flags, open_for_write);
   611		/*
   612		 * struct nvme_user_io can have different padding on some 32-bit ABIs.
   613		 * Just accept the compat version as all fields that are used are the
   614		 * same size and at the same offset.
   615		 */
   616	#ifdef COMPAT_FOR_U64_ALIGNMENT
   617		case NVME_IOCTL_SUBMIT_IO32:
   618	#endif
   619		case NVME_IOCTL_SUBMIT_IO:
   620			return nvme_submit_io(ns, argp);
   621		case NVME_IOCTL_IO64_CMD_VEC:
   622			flags |= NVME_IOCTL_VEC;
   623			fallthrough;
   624		case NVME_IOCTL_IO64_CMD:
   625			return nvme_user_cmd64(ns->ctrl, ns, argp, flags,
   626					       open_for_write);
   627		default:
   628			return -ENOTTY;
   629		}
   630	}
   631	
   632	int nvme_ioctl(struct block_device *bdev, blk_mode_t mode,
   633			unsigned int cmd, unsigned long arg)
   634	{
   635		struct nvme_ns *ns = bdev->bd_disk->private_data;
   636		bool open_for_write = mode & BLK_OPEN_WRITE;
   637		void __user *argp = (void __user *)arg;
   638		unsigned int flags = 0;
   639	
   640		if (bdev_is_partition(bdev))
   641			flags |= NVME_IOCTL_PARTITION;
   642	
   643		if (is_ctrl_ioctl(cmd))
   644			return nvme_ctrl_ioctl(ns->ctrl, cmd, argp, open_for_write);
   645		return nvme_ns_ioctl(ns, cmd, argp, flags, open_for_write);
   646	}
   647	
   648	long nvme_ns_chr_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
   649	{
   650		struct nvme_ns *ns =
   651			container_of(file_inode(file)->i_cdev, struct nvme_ns, cdev);
   652		bool open_for_write = file->f_mode & FMODE_WRITE;
   653		void __user *argp = (void __user *)arg;
   654	
   655		if (is_ctrl_ioctl(cmd))
   656			return nvme_ctrl_ioctl(ns->ctrl, cmd, argp, open_for_write);
   657		return nvme_ns_ioctl(ns, cmd, argp, 0, open_for_write);
   658	}
   659	
   660	static int nvme_uring_cmd_checks(unsigned int issue_flags)
   661	{
   662	
   663		/* NVMe passthrough requires big SQE/CQE support */
   664		if ((issue_flags & (IO_URING_F_SQE128|IO_URING_F_CQE32)) !=
   665		    (IO_URING_F_SQE128|IO_URING_F_CQE32))
   666			return -EOPNOTSUPP;
   667		return 0;
   668	}
   669	
   670	static int nvme_ns_uring_cmd(struct nvme_ns *ns, struct io_uring_cmd *ioucmd,
   671				     unsigned int issue_flags)
   672	{
   673		struct nvme_ctrl *ctrl = ns->ctrl;
   674		int ret;
   675	
   676		ret = nvme_uring_cmd_checks(issue_flags);
   677		if (ret)
   678			return ret;
   679	
   680		switch (ioucmd->cmd_op) {
   681		case NVME_URING_CMD_IO:
   682			if (ioucmd->flags & IORING_URING_CMD_DIRECT) {
   683				ret = nvme_uring_cmd_io_direct(ctrl, ns, ioucmd,
   684						issue_flags);
   685				if (ret == -EIOCBQUEUED)
   686					return ret;
   687				/* in case of any error, just fallback */
   688				ioucmd->flags &= ~(IORING_URING_CMD_DIRECT);
   689			}
   690			ret = nvme_uring_cmd_io(ctrl, ns, ioucmd, issue_flags, false);
   691			break;
   692		case NVME_URING_CMD_IO_VEC:
   693			ret = nvme_uring_cmd_io(ctrl, ns, ioucmd, issue_flags, true);
   694			break;
   695		default:
   696			ret = -ENOTTY;
   697		}
   698	
   699		return ret;
   700	}
   701	
   702	int nvme_ns_chr_uring_cmd(struct io_uring_cmd *ioucmd, unsigned int issue_flags)
   703	{
   704		struct nvme_ns *ns = container_of(file_inode(ioucmd->file)->i_cdev,
   705				struct nvme_ns, cdev);
   706	
   707		return nvme_ns_uring_cmd(ns, ioucmd, issue_flags);
   708	}
   709	
   710	/* similar to blk_mq_poll; may be possible to unify */
   711	int nvme_uring_cmd_iopoll_qid(struct request_queue *q,
   712					 struct io_uring_cmd *ioucmd, int qid,
   713					 struct io_comp_batch *iob,
   714					 unsigned int flags)
   715	{
   716		long state = get_current_state();
   717		int ret;
   718	
 > 719		if (!(q->mq_ops && q->mq_ops->poll_uring_cmd))
   720			return 0;
   721		do {
   722			ret = q->mq_ops->poll_uring_cmd(ioucmd, qid, iob);
   723			if (ret > 0) {
   724				__set_current_state(TASK_RUNNING);
   725				return ret;
   726			}
   727			if (signal_pending_state(state, current))
   728				__set_current_state(TASK_RUNNING);
   729			if (task_is_running(current))
   730				return 1;
   731	
   732			if (ret < 0 || (flags & BLK_POLL_ONESHOT))
   733				break;
   734			cpu_relax();
   735	
   736		} while (!need_resched());
   737	
   738		__set_current_state(TASK_RUNNING);
   739		return 0;
   740	}
   741	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
