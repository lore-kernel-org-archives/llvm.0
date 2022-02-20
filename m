Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD015EBF
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 19:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645384069; x=1676920069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zsQhKBKlCJcznhe7mFrC0c4fnSZI3vB+KnX51VQBYjs=;
  b=GNdFQ9wBfevQpRolQ8KcyLFjYBuPaGRtufAj4qAFjyc/+pi2/92LxflY
   DycwYNOvvSlT355qxMjrSVjwt+OS4ObupmQFi1UyJh3dFYXDIiX99ztMA
   la+P/oYon/MCOi3g0QgyidNYqHGO3C7y+yea4VhZBSLQ8ncZLkPiAiDDg
   81vA5a5qczMM+vsOk1S55oLQm/8g0XH7l7zah7djIMBbaF45WVB8G+rTj
   MO6SokOrtW9K07bPVB0aNmWkYINf1R98GZNg2WUAtThtkgAM1TtL46WlX
   Ql6y+smebXDjp6ltWqWA29x69EMrB6AhsiY/MJ/SPhvVx5iSHhLyRfV8X
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="251148206"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="251148206"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 11:07:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="542409487"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2022 11:07:47 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLrYh-0000cP-3M; Sun, 20 Feb 2022 19:07:47 +0000
Date: Mon, 21 Feb 2022 03:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Melanie Plageman (Microsoft)" <melanieplageman@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC v1 2/5] scsi: map_queues() takes tag set instead of
 host
Message-ID: <202202210247.G728msgj-lkp@intel.com>
References: <20220218184157.176457-3-melanieplageman@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218184157.176457-3-melanieplageman@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Melanie,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on v5.17-rc4]
[also build test ERROR on next-20220217]
[cannot apply to mkp-scsi/for-next jejb-scsi/for-next powerpc/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Melanie-Plageman-Microsoft/Add-SCSI-per-device-tagsets/20220220-182321
base:    754e0b0e35608ed5206d6a67a791563c631cec07
config: riscv-randconfig-c006-20220220 (https://download.01.org/0day-ci/archive/20220221/202202210247.G728msgj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/bf42e0d6e85e5f78470f952213d0cfcd20c7461d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Melanie-Plageman-Microsoft/Add-SCSI-per-device-tagsets/20220220-182321
        git checkout bf42e0d6e85e5f78470f952213d0cfcd20c7461d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/scsi/ufs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/scsi/ufs/ufshcd.c:8188:17: error: incompatible function pointer types initializing 'int (*)(struct blk_mq_tag_set *)' with an expression of type 'int (struct Scsi_Host *)' [-Werror,-Wincompatible-function-pointer-types]
           .map_queues             = ufshcd_map_queues,
                                     ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +8188 drivers/scsi/ufs/ufshcd.c

90b8491c003391 Stanley Chu        2020-05-09  8183  
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8184  static struct scsi_host_template ufshcd_driver_template = {
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8185  	.module			= THIS_MODULE,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8186  	.name			= UFSHCD,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8187  	.proc_name		= UFSHCD,
eaab9b57305496 Bart Van Assche    2021-12-03 @8188  	.map_queues		= ufshcd_map_queues,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8189  	.queuecommand		= ufshcd_queuecommand,
eaab9b57305496 Bart Van Assche    2021-12-03  8190  	.mq_poll		= ufshcd_poll,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8191  	.slave_alloc		= ufshcd_slave_alloc,
eeda47499f0187 Akinobu Mita       2014-07-01  8192  	.slave_configure	= ufshcd_slave_configure,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8193  	.slave_destroy		= ufshcd_slave_destroy,
4264fd613a6a4b Sujit Reddy Thumma 2014-06-29  8194  	.change_queue_depth	= ufshcd_change_queue_depth,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8195  	.eh_abort_handler	= ufshcd_abort,
3441da7ddbdedf Sujit Reddy Thumma 2014-05-26  8196  	.eh_device_reset_handler = ufshcd_eh_device_reset_handler,
3441da7ddbdedf Sujit Reddy Thumma 2014-05-26  8197  	.eh_host_reset_handler   = ufshcd_eh_host_reset_handler,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8198  	.this_id		= -1,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8199  	.sg_tablesize		= SG_ALL,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8200  	.cmd_per_lun		= UFSHCD_CMD_PER_LUN,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8201  	.can_queue		= UFSHCD_CAN_QUEUE,
552a990ca16688 Christoph Hellwig  2019-06-17  8202  	.max_segment_size	= PRDT_DATA_BYTE_COUNT_MAX,
1ab27c9cf8b63d Sahitya Tummala    2014-09-25  8203  	.max_host_blocked	= 1,
c40ecc12cfdb63 Christoph Hellwig  2014-11-13  8204  	.track_queue_depth	= 1,
d829fc8a105885 Stanislav Nijnikov 2018-02-15  8205  	.sdev_groups		= ufshcd_driver_groups,
4af14d113bcf95 Christoph Hellwig  2018-12-13  8206  	.dma_boundary		= PAGE_SIZE - 1,
49615ba144a092 Stanley Chu        2019-09-16  8207  	.rpm_autosuspend_delay	= RPM_AUTOSUSPEND_DELAY_MS,
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8208  };
7a3e97b0dc4bba Santosh Yaraganavi 2012-02-29  8209  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
