Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137EA7A
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 20:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647375972; x=1678911972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ls7lKjOAJ2PZW785QDqhExtmNt+2ayudEMPqPJhng/4=;
  b=oEi4YuM9tTgyhEn27orCz++Pb/suObFdUoeuoaDsgBdOSlt+7yTkHpwG
   gVxtnsk206KdcbbjZRH/Cga1x6gDOKER4bDVwVIqb4X8f9Zsa/1AWen38
   nT/qvA1BAQrhb1v+VkzNmDbnW20bA22QUDcd1IV94OxrIfzqzOAoVKApY
   S6Qy/isKzgR65/c+2BDof3+RMx82Wrq4aeqxj2cIPGO4kTjlcQgSBcI9x
   21THATVFFpDr9/ucdHdv2m7rUjcfi6dth3B8pJTiMxYifHqdGnUkXwrl/
   4h1l5G1osQTsuszFCUzVO/qeczBfFqKCE6pSCo0sO5rbu/Oc18/NtciPi
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="319635665"
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="319635665"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2022 13:26:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,184,1643702400"; 
   d="scan'208";a="516030518"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Mar 2022 13:26:10 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUDk9-000BTk-Mh; Tue, 15 Mar 2022 20:26:09 +0000
Date: Wed, 16 Mar 2022 04:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.garry@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 2/2] libata: Use scsi cmnd budget token for qc tag
 for SAS host
Message-ID: <202203160450.G7KPHd4L-lkp@intel.com>
References: <1647340746-17600-3-git-send-email-john.garry@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647340746-17600-3-git-send-email-john.garry@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi John,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mkp-scsi/for-next]
[also build test ERROR on jejb-scsi/for-next linus/master v5.17-rc8 next-20220315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/John-Garry/scsi-libata-A-potential-tagging-fix-and-improvement/20220315-185159
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
config: arm-cns3420vb_defconfig (https://download.01.org/0day-ci/archive/20220316/202203160450.G7KPHd4L-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/c0fc60bbc4ec38b12bba06e9ee97cd8bd10f72ca
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review John-Garry/scsi-libata-A-potential-tagging-fix-and-improvement/20220315-185159
        git checkout c0fc60bbc4ec38b12bba06e9ee97cd8bd10f72ca
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/ata/libata-core.c:4578:34: error: too many arguments to function call, expected single argument 'ap', have 2 arguments
                   tag = ata_sas_allocate_tag(ap, scmd);
                         ~~~~~~~~~~~~~~~~~~~~     ^~~~
   drivers/ata/libata.h:99:19: note: 'ata_sas_allocate_tag' declared here
   static inline int ata_sas_allocate_tag(struct ata_port *ap)
                     ^
   1 error generated.


vim +/ap +4578 drivers/ata/libata-core.c

  4556	
  4557	/**
  4558	 *	ata_qc_new_init - Request an available ATA command, and initialize it
  4559	 *	@dev: Device from whom we request an available command structure
  4560	 *	@tag: tag
  4561	 *
  4562	 *	LOCKING:
  4563	 *	None.
  4564	 */
  4565	
  4566	struct ata_queued_cmd *ata_qc_new_init(struct ata_device *dev, struct scsi_cmnd *scmd)
  4567	{
  4568		int tag = scsi_cmd_to_rq(scmd)->tag;
  4569		struct ata_port *ap = dev->link->ap;
  4570		struct ata_queued_cmd *qc;
  4571	
  4572		/* no command while frozen */
  4573		if (unlikely(ap->pflags & ATA_PFLAG_FROZEN))
  4574			return NULL;
  4575	
  4576		/* libsas case */
  4577		if (ap->flags & ATA_FLAG_SAS_HOST) {
> 4578			tag = ata_sas_allocate_tag(ap, scmd);
  4579			if (tag < 0)
  4580				return NULL;
  4581		}
  4582	
  4583		qc = __ata_qc_from_tag(ap, tag);
  4584		qc->tag = qc->hw_tag = tag;
  4585		qc->scsicmd = NULL;
  4586		qc->ap = ap;
  4587		qc->dev = dev;
  4588	
  4589		ata_qc_reinit(qc);
  4590	
  4591		return qc;
  4592	}
  4593	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
