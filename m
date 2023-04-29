Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8582617CB;
	Sat, 29 Apr 2023 12:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682771044; x=1714307044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fpMuFoVRFhUUZZYl1Xo88KjS58XRNJ9haqAwn46qxcI=;
  b=APsACuzufc58hUuy9ArMPO9PupltS/ZBIWgHTlWkSSb6082zVGggqd8c
   TpGA5j85ymYkcOyIWWTQ1UnVyDw2D0S5lbxoIEQ/v66/TiNt2YuSSDaWk
   GFM4fYdcxJu1LWwkX3JozQsRh24oSpppasDSnUzg3hvIOivxjCQiLKBWq
   KwISiNzX4f2kRi2kuQoqVwDiT+LoKr2sJho1NG+Y6MJZ0kMAydRK3LpsP
   wa/BTeAGHvb7QGnIv3BoFUjCdiu0KT/ZotK6uL6/O1Il5ZFVSdnZKKU8K
   ldusztUqqFLD7frem+4bsBxfqg/EfYRC4Aoebc/tV41b9DksKRE+jccC6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="346720522"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="346720522"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="806795797"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="806795797"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Apr 2023 05:24:02 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psjcQ-00018L-0M;
	Sat, 29 Apr 2023 12:24:02 +0000
Date: Sat, 29 Apr 2023 20:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 10/12] nvme: submisssion/completion of uring_cmd
 to/from the registered queue
Message-ID: <202304292012.oxeNukfB-lkp@intel.com>
References: <20230429093925.133327-11-joshi.k@samsung.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429093925.133327-11-joshi.k@samsung.com>

Hi Kanchan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master next-20230428]
[cannot apply to v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230429093925.133327-11-joshi.k%40samsung.com
patch subject: [RFC PATCH 10/12] nvme: submisssion/completion of uring_cmd to/from the registered queue
config: arm-randconfig-r032-20230429 (https://download.01.org/0day-ci/archive/20230429/202304292012.oxeNukfB-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/e06694e83e548757cf886b603579ce384d95b3ab
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kanchan-Joshi/pci-enable-raw_queues-N-module-parameter/20230429-183933
        git checkout e06694e83e548757cf886b603579ce384d95b3ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304292012.oxeNukfB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvme/host/ioctl.c:812:5: warning: no previous prototype for function 'nvme_uring_cmd_iopoll_qid' [-Wmissing-prototypes]
   int nvme_uring_cmd_iopoll_qid(struct request_queue *q,
       ^
   drivers/nvme/host/ioctl.c:812:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nvme_uring_cmd_iopoll_qid(struct request_queue *q,
   ^
   static 
>> drivers/nvme/host/ioctl.c:1037:28: warning: variable 'q' is uninitialized when used here [-Wuninitialized]
                           if (!percpu_ref_tryget(&q->q_usage_counter))
                                                   ^
   drivers/nvme/host/ioctl.c:1021:25: note: initialize the variable 'q' to silence this warning
           struct request_queue *q;
                                  ^
                                   = NULL
   2 warnings generated.


vim +/q +1037 drivers/nvme/host/ioctl.c

  1010	
  1011	int nvme_ns_head_chr_uring_cmd_iopoll(struct io_uring_cmd *ioucmd,
  1012					      struct io_comp_batch *iob,
  1013					      unsigned int poll_flags)
  1014	{
  1015		struct cdev *cdev = file_inode(ioucmd->file)->i_cdev;
  1016		struct nvme_ns_head *head = container_of(cdev, struct nvme_ns_head, cdev);
  1017		int srcu_idx = srcu_read_lock(&head->srcu);
  1018		struct nvme_ns *ns = nvme_find_path(head);
  1019		struct bio *bio;
  1020		int ret = 0;
  1021		struct request_queue *q;
  1022	
  1023		if (ns) {
  1024			if (!(ioucmd->flags & IORING_URING_CMD_DIRECT)) {
  1025				rcu_read_lock();
  1026				bio = READ_ONCE(ioucmd->cookie);
  1027				q = ns->queue;
  1028				if (test_bit(QUEUE_FLAG_POLL, &q->queue_flags) && bio
  1029						&& bio->bi_bdev)
  1030					ret = bio_poll(bio, iob, poll_flags);
  1031				rcu_read_unlock();
  1032			} else {
  1033				int qid = io_uring_cmd_import_qid(ioucmd);
  1034	
  1035				if (qid <= 0)
  1036					return 0;
> 1037				if (!percpu_ref_tryget(&q->q_usage_counter))
  1038					return 0;
  1039				ret = nvme_uring_cmd_iopoll_qid(q, ioucmd, qid, iob,
  1040								poll_flags);
  1041				percpu_ref_put(&q->q_usage_counter);
  1042			}
  1043		}
  1044		srcu_read_unlock(&head->srcu, srcu_idx);
  1045		return ret;
  1046	}
  1047	#endif /* CONFIG_NVME_MULTIPATH */
  1048	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
