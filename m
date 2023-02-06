Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573C28E2;
	Mon,  6 Feb 2023 08:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675671036; x=1707207036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jERXFZ05CA+SiCU+ApEUP1hq3dwMwuYlJqdjmihuAOM=;
  b=MCJZY1ZcvYPa/SRtr1Tu4K0iAGkkRjemt+jcJW3ECYZchhDyPBfGS3eS
   /77VCAYLe0m7bMWv0KIWdrAV9ZFTV5RgNlD2Qyp0jPmDK4yLIV2fNEBBL
   VRYUqLiZHhdC6G0KtcBNfz8kWM05zOLHG4y1Nx1v7HpswGO4ImFKf/6Ms
   osrFlJ7E4nJ8X9o7EzM940trr50P5YVdI4FmOWL5OrQP7nOZlqZu64D2y
   Ts5Z67bmx4DH5JnPS9f5yYwppnF9Y+GQX7GgJFEE+JFjky2SjO7RtRGUi
   vHjEtrmuiPAzFqyihQZOUaUKkmQxBCO4dUmI2X/NOKLM6zCGr065HXkNV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="309486838"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309486838"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 00:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="698763134"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="698763134"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Feb 2023 00:09:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOwZT-0002Rw-1L;
	Mon, 06 Feb 2023 08:09:51 +0000
Date: Mon, 6 Feb 2023 16:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Chandan Babu R <chandan.babu@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chandanr:dio-inode-completion-chain 1/1] fs/xfs/xfs_aops.c:177:21:
 warning: unknown attribute 'optimize' ignored
Message-ID: <202302061644.RRCrgJQf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/chandanr/linux dio-inode-completion-chain
head:   5f08e3ed4dcab37394794c13e3b79402ca05f3ca
commit: 5f08e3ed4dcab37394794c13e3b79402ca05f3ca [1/1] changes
config: x86_64-randconfig-a006-20230206 (https://download.01.org/0day-ci/archive/20230206/202302061644.RRCrgJQf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/chandanr/linux/commit/5f08e3ed4dcab37394794c13e3b79402ca05f3ca
        git remote add chandanr https://github.com/chandanr/linux
        git fetch --no-tags chandanr dio-inode-completion-chain
        git checkout 5f08e3ed4dcab37394794c13e3b79402ca05f3ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_aops.c:177:21: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
   void __attribute__((optimize("O0")))
                       ^~~~~~~~~~~~~~
   1 warning generated.


vim +/optimize +177 fs/xfs/xfs_aops.c

   176	
 > 177	void __attribute__((optimize("O0")))
   178	xfs_end_dio(
   179		struct work_struct	*work)
   180	{
   181		struct xfs_inode	*ip =
   182			container_of(work, struct xfs_inode, i_dio_work);
   183		struct iomap_dio	*dio;
   184		struct list_head	tmp;
   185		unsigned long		flags;
   186		int			nr_entries = 0;
   187	
   188		spin_lock_irqsave(&ip->i_dio_lock, flags);
   189		list_replace_init(&ip->i_dio_list, &tmp);
   190		spin_unlock_irqrestore(&ip->i_dio_lock, flags);
   191	
   192		/* chandan: do we have to sort dios? */
   193		while ((dio = list_first_entry_or_null(&tmp, struct iomap_dio,
   194								dio_list))) {
   195			struct kiocb *iocb = dio->iocb;
   196	
   197			++nr_entries;
   198			list_del_init(&dio->dio_list);
   199			iocb->ki_complete(iocb, iomap_dio_complete(dio));
   200		}
   201	
   202		return;
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
