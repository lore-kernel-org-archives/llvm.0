Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2279C44D6A9;
	Wed,  6 May 2026 16:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086703; cv=none; b=gzRFy8yHu+wYM9JWGouJsfo4kUqv5T6Ap6Ca59Tk9Lic0Ibwy4Spwo5EWkWmSrTGn60IcFKQhxNroO9TvvgOAKEXBjWYAmczK/fjPw1fMnXy4qSed6/XG91dZh0xzmNYjIV2H/FqqdtCLoNKsNcS/q0aB+PZHCpMMMKyjqlo/PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086703; c=relaxed/simple;
	bh=xw8CSpBXmzjOPb4QYrtCM3h9d09lYCM8gzUFtUB9Wo0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nQYfS9/HQPVVKUqu268Zow1RgFUXmwuPHHRtX/OCWjXPjef3U2A9/QS0fXu5NuO6LDasMcaTNs9iNptDA3G+DhHzYjtoXXA3YWYq9SmlwljqRPGAK+sV+cC0H9JRtxPDcspdiqRG07sPRJlVLYC8AXjd5a3A9SbWX9EoV4UaXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CWR906o+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CWR906o+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778086701; x=1809622701;
  h=date:from:to:cc:subject:message-id;
  bh=xw8CSpBXmzjOPb4QYrtCM3h9d09lYCM8gzUFtUB9Wo0=;
  b=CWR906o+IE7b32yT1LbES+38C4kes+OTWld96V3863U4cY6toIY2gWcp
   W0mT4eqNzWevqu3Rz2cEWwDEvYoiTGX7Gnl9nd58F2WR7Mgb1RmM3fCzw
   equy8gJ5LM/H4imIr0kr/aiXrVuPBi9eHO4sutC/t+UHjXf6IDP4qN+GE
   Uylzpy+J3pBAiEJwhMBfzNBziqCrKEqeUAuucHZCguSGUGA85zXkS4gYp
   ZufJ51uNYkkpWlh1+6ssI/Y1WoJtXyaNxJEFv9lUVStBzWCU6BQQDQc4J
   vT7M9USsl57RwpjU+9KZV4LDEOh1cLP/CY8UxkbFjVBfoBH4xz71kKvtS
   Q==;
X-CSE-ConnectionGUID: XaCUSYfvTqmyGy/M/UF/+Q==
X-CSE-MsgGUID: jBKuWbSsTkiuJntA6O6XhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78877359"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78877359"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 09:58:20 -0700
X-CSE-ConnectionGUID: XPD1lIp6Q7+8w4HWheOiJQ==
X-CSE-MsgGUID: p87F0gF8TWGao6fwFE2CKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="233547679"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2026 09:58:18 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKfZg-0000000015N-12EC;
	Wed, 06 May 2026 16:58:16 +0000
Date: Thu, 07 May 2026 00:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Anuj Gupta <anuj20.g@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Kanchan Joshi <joshi.k@samsung.com>
Subject: [axboe:nvme-raw-queues 5/16]
 drivers/nvme/host/core.c:3900:30: error: no member named 'register_queue' in
 'struct blk_mq_ops'
Message-ID: <202605070059.sqyr11Zd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: e85c56d3378904ba7950d8880e93df4f219b058f [5/16] nvme: wire-up register/unregister queue f_op callback
config: hexagon-randconfig-001-20260506 (https://download.01.org/0day-ci/archive/20260507/202605070059.sqyr11Zd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070059.sqyr11Zd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070059.sqyr11Zd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/core.c:3900:30: error: no member named 'register_queue' in 'struct blk_mq_ops'
    3900 |         if (q->mq_ops && q->mq_ops->register_queue)
         |                          ~~~~~~~~~  ^
   drivers/nvme/host/core.c:3901:21: error: no member named 'register_queue' in 'struct blk_mq_ops'
    3901 |                 return q->mq_ops->register_queue(ns);
         |                        ~~~~~~~~~  ^
   drivers/nvme/host/core.c:3893:5: warning: no previous prototype for function 'nvme_register_queue' [-Wmissing-prototypes]
    3893 | int nvme_register_queue(struct file *file)
         |     ^
   drivers/nvme/host/core.c:3893:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3893 | int nvme_register_queue(struct file *file)
         | ^
         | static 
>> drivers/nvme/host/core.c:3912:30: error: no member named 'unregister_queue' in 'struct blk_mq_ops'
    3912 |         if (q->mq_ops && q->mq_ops->unregister_queue)
         |                          ~~~~~~~~~  ^
   drivers/nvme/host/core.c:3913:21: error: no member named 'unregister_queue' in 'struct blk_mq_ops'
    3913 |                 return q->mq_ops->unregister_queue(ns, qid);
         |                        ~~~~~~~~~  ^
   drivers/nvme/host/core.c:3905:5: warning: no previous prototype for function 'nvme_unregister_queue' [-Wmissing-prototypes]
    3905 | int nvme_unregister_queue(struct file *file, int qid)
         |     ^
   drivers/nvme/host/core.c:3905:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3905 | int nvme_unregister_queue(struct file *file, int qid)
         | ^
         | static 
   2 warnings and 4 errors generated.
--
>> drivers/nvme/host/ioctl.c:785:30: error: no member named 'register_queue' in 'struct blk_mq_ops'
     785 |         if (q->mq_ops && q->mq_ops->register_queue)
         |                          ~~~~~~~~~  ^
   drivers/nvme/host/ioctl.c:786:20: error: no member named 'register_queue' in 'struct blk_mq_ops'
     786 |                 ret = q->mq_ops->register_queue(ns);
         |                       ~~~~~~~~~  ^
>> drivers/nvme/host/ioctl.c:809:30: error: no member named 'unregister_queue' in 'struct blk_mq_ops'
     809 |         if (q->mq_ops && q->mq_ops->unregister_queue)
         |                          ~~~~~~~~~  ^
   drivers/nvme/host/ioctl.c:810:20: error: no member named 'unregister_queue' in 'struct blk_mq_ops'
     810 |                 ret = q->mq_ops->unregister_queue(ns, qid);
         |                       ~~~~~~~~~  ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +3900 drivers/nvme/host/core.c

  3892	
  3893	int nvme_register_queue(struct file *file)
  3894	{
  3895		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  3896				struct nvme_ns, cdev);
  3897		struct nvme_ctrl *ctrl = ns->ctrl;
  3898		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  3899	
> 3900		if (q->mq_ops && q->mq_ops->register_queue)
  3901			return q->mq_ops->register_queue(ns);
  3902		return -EINVAL;
  3903	}
  3904	
  3905	int nvme_unregister_queue(struct file *file, int qid)
  3906	{
  3907		struct nvme_ns *ns = container_of(file_inode(file)->i_cdev,
  3908				struct nvme_ns, cdev);
  3909		struct nvme_ctrl *ctrl = ns->ctrl;
  3910		struct request_queue *q = ns ? ns->queue : ctrl->admin_q;
  3911	
> 3912		if (q->mq_ops && q->mq_ops->unregister_queue)
  3913			return q->mq_ops->unregister_queue(ns, qid);
  3914		return -EINVAL;
  3915	}
  3916	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
