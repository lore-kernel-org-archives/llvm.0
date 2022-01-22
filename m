Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30792168
	for <llvm@lists.linux.dev>; Sat, 22 Jan 2022 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642848278; x=1674384278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+QvsIxeGcYkl/A1U5Osq5yeMqcCLUOrLGPqPG8HZ4+E=;
  b=mYu8Ja1JkPpSFZNwwFbBGY/r9ugsgK0AT9XX/0omMed78S/h2e7aEhzO
   guOUioF+oEPNPctWKTGLYfE2pLSVWNGiB/s6D5dD00eRpKnVzaoBB8MHc
   3tkwqyDlc5szZRFiD5vM0+RGT7KCcRTl8P/1VO3t7YDXJaitTsp5a4gJz
   9kQcbSnwC6E0pfjLSM/Ssy3ifWP3ud8W40btXeBfWJW9sY+hiFV7HGR/g
   ezOiTzo/RUKI9z4O76a8Eo3PW/mOdPka+HkyaXBuA/0BkHpy60BAdlwYG
   w0KOyNm5s+1uFc/f4KLthb1+tPeG8hpx/MRx76KfYixP/6GXHEmuy2hs8
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="309138718"
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="309138718"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2022 02:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,308,1635231600"; 
   d="scan'208";a="579872984"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Jan 2022 02:44:34 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nBDsn-000GJM-SW; Sat, 22 Jan 2022 10:44:33 +0000
Date: Sat, 22 Jan 2022 18:44:16 +0800
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
Message-ID: <202201221855.aplqWaqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b57f458985742bd1c585f4c7f36d04634ce1143
commit: 7878f22a2e03b69baf792f74488962981a1c9547 scsi: qla2xxx: edif: Add getfcinfo and statistic bsgs
date:   6 months ago
config: arm-randconfig-r036-20220122 (https://download.01.org/0day-ci/archive/20220122/202201221855.aplqWaqk-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
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
