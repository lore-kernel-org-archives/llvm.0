Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F300FC9D
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645648731; x=1677184731;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BU0GOWTUhF9yJXXVIV+UeYaKiM/2sV3bpXc7BZH9FDo=;
  b=E5Vft63d8FBPgr9m0gkQKiFPEmXyKl45pH13YQaAXA5VUWMl2Mk+avV4
   /3tok/nmKfZanDcWAA1iJbJp/pwwewgcDmMNBi6UCKKoODJqBc33sNiXF
   pwAFEAmaCIxQhH4Z1zuep1JJs3c6dNCD51fddKcrcBi3csVXB30p+TUBp
   yduR4RbLLXeUL7wpfIgg1mFSsEta+BA08maI3cAJgMKjxwcIX2wpQIF9S
   kDrDpZi3rwCYs3KBuTOTHyKo+0SyaaM7OOeRoMBxioqL2YlylYVMwfWOO
   c37X2BDPS71ShQCdcb98BvS/wzTS1PliBw6cKGPJKTPv6ANjYvPthmfD6
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="251995298"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="251995298"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 12:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="591842134"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Feb 2022 12:38:47 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMyPO-0001oE-Q8; Wed, 23 Feb 2022 20:38:46 +0000
Date: Thu, 24 Feb 2022 04:38:32 +0800
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
Message-ID: <202202240422.NUeO1V58-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Quinn,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c1ee569660d4a205dced9cb4d0306b907fb7599
commit: 7878f22a2e03b69baf792f74488962981a1c9547 scsi: qla2xxx: edif: Add getfcinfo and statistic bsgs
date:   7 months ago
config: arm-randconfig-r033-20220223 (https://download.01.org/0day-ci/archive/20220224/202202240422.NUeO1V58-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7878f22a2e03b69baf792f74488962981a1c9547
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7878f22a2e03b69baf792f74488962981a1c9547
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag as appropriate
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
