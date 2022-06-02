Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACC5627
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 03:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654142173; x=1685678173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nwysou9JGYymVHzee3Bbjl1yq1mcNWaO2DEpXd0tiLU=;
  b=f5FI2AXWtzV+cecxrbsdSa8N2b+RAuAmv9CWsaqJPuv8CmNX8Utstgny
   MrmFTaFCl5NzIvVv/8wXnEheUVxy1bC21aVZPIQhNCFWP1ebi/YrdDL5Q
   wbcJRUzAqB0uGY00Xm2Tl/d+LdfJljs+nicb01X6yLzwbDN7SpFGO/thG
   B9FKv0hMVWslXRuEXKMc22MtloYbRlMAnOITxJrpJs4nx86ZfT4Bge17+
   3kStD4VjbZ15hcsLnOZftxW86JmZlAEvbUjx4q64ddFnFu3azKrWOSfzi
   qJiXtZRwe7nyNfFGabpJ2irEHd5jYXtJgif30ZOH0IwLECkjMnEQ8GZFf
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="275821156"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="275821156"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 20:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="633844773"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jun 2022 20:56:10 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwbwP-0004iJ-8h;
	Thu, 02 Jun 2022 03:56:09 +0000
Date: Thu, 2 Jun 2022 11:55:33 +0800
From: kernel test robot <lkp@intel.com>
To: Quinn Tran <qutran@marvell.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Hannes Reinecke <hare@suse.de>,
	Himanshu Madhani <himanshu.madhani@oracle.com>,
	Larry Wisneski <Larry.Wisneski@marvell.com>,
	Duane Grigsby <duane.grigsby@marvell.com>,
	Rick Hicksted Jr <rhicksted@marvell.com>,
	Nilesh Javali <njavali@marvell.com>
Subject: drivers/scsi/qla2xxx/qla_edif_bsg.h:93:12: warning: field remote_pid
 within 'struct app_pinfo_req' is less aligned than 'port_id_t' and is
 usually due to 'struct app_pinfo_req' being packed, which can lead to
 unaligned accesses
Message-ID: <202206021148.wcw2WbrV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quinn,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d1dc87763f406d4e67caf16dbe438a5647692395
commit: 7878f22a2e03b69baf792f74488962981a1c9547 scsi: qla2xxx: edif: Add getfcinfo and statistic bsgs
date:   10 months ago
config: arm-randconfig-r022-20220602 (https://download.01.org/0day-ci/archive/20220602/202206021148.wcw2WbrV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c76683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7878f22a2e03b69baf792f74488962981a1c9547
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7878f22a2e03b69baf792f74488962981a1c9547
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/qla2xxx/qla_edif.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:34:
   include/uapi/scsi/scsi_bsg_fc.h:280:4: warning: field rqst_data within 'struct fc_bsg_request' is less aligned than 'union (unnamed union at include/uapi/scsi/scsi_bsg_fc.h:271:2)' and is usually due to 'struct fc_bsg_request' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           } rqst_data;
             ^
   In file included from drivers/scsi/qla2xxx/qla_edif.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:74:
   In file included from drivers/scsi/qla2xxx/qla_bsg.h:298:
>> drivers/scsi/qla2xxx/qla_edif_bsg.h:93:12: warning: field remote_pid within 'struct app_pinfo_req' is less aligned than 'port_id_t' and is usually due to 'struct app_pinfo_req' being packed, which can lead to unaligned accesses [-Wunaligned-access]
           port_id_t remote_pid;
                     ^
   2 warnings generated.


vim +93 drivers/scsi/qla2xxx/qla_edif_bsg.h

7ebb336e45ef1c Quinn Tran 2021-06-23  89  
7ebb336e45ef1c Quinn Tran 2021-06-23  90  struct app_pinfo_req {
7ebb336e45ef1c Quinn Tran 2021-06-23  91  	struct app_id app_info;
7ebb336e45ef1c Quinn Tran 2021-06-23  92  	uint8_t	 num_ports;
7ebb336e45ef1c Quinn Tran 2021-06-23 @93  	port_id_t remote_pid;
7ebb336e45ef1c Quinn Tran 2021-06-23  94  	uint8_t	 reserved[VND_CMD_APP_RESERVED_SIZE];
7ebb336e45ef1c Quinn Tran 2021-06-23  95  } __packed;
7ebb336e45ef1c Quinn Tran 2021-06-23  96  

:::::: The code at line 93 was first introduced by commit
:::::: 7ebb336e45ef1ce23462c3bbd03779929008901f scsi: qla2xxx: edif: Add start + stop bsgs

:::::: TO: Quinn Tran <qutran@marvell.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
