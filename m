Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6639514F6B;
	Tue, 29 Aug 2023 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693322769; x=1724858769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4Q2QqVZy96C8p0XDB/KS0+6JhEswRx3cuazaro5clw=;
  b=i7c3VydEWx3owvpFCefXIqWAxrg/YX8j8nENXvSbbPF2YGg9lVlij9fC
   G2IA7I5jytSPhm18mNnxH0NXCkhEkOhOZp8wa4W/Rf6D9Y5vj+aJvonjt
   n+OWOWW+yOOZoxbeyV3/KigFLvxJeyFM+Oxxe1zZ6Xb+XptQU6Tvsrlnk
   XPooik25zYpWFXk9NX05oeRTOWRu7u/51MiJcTdzwsALpSQd3rfY+ABPy
   Dtvfe0lOLsdigR5W1poJlpo6FAq0HZhnm6juwQWn+ZcNWBalV0zBqSvyy
   9Z68M4aBonTdurFJP9F+XPv2h8LpW4qRYzKjpapRppelKngWvsZv0GV4y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374296502"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="374296502"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 08:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912455846"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="912455846"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 08:24:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb0aQ-0008qh-1S;
	Tue, 29 Aug 2023 15:24:58 +0000
Date: Tue, 29 Aug 2023 23:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nilesh Javali <njavali@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [linux-next:master 12683/13297]
 drivers/scsi/qla2xxx/qla_nvme.c:1183:13: warning: unused variable 'fcport'
Message-ID: <202308292344.Y3XqInYf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae782d4e2bf53b0b642ae860794f7a39470f995a
commit: 27177862de9676c8c35b86bf89c38864fbe5ed71 [12683/13297] scsi: qla2xxx: Fix nvme_fc_rcv_ls_req() undefined error
config: arm64-randconfig-r034-20230829 (https://download.01.org/0day-ci/archive/20230829/202308292344.Y3XqInYf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308292344.Y3XqInYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308292344.Y3XqInYf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_nvme.c:1183:13: warning: unused variable 'fcport' [-Wunused-variable]
    1183 |         fc_port_t *fcport = uctx->fcport;
         |                    ^
   1 warning generated.


vim +/fcport +1183 drivers/scsi/qla2xxx/qla_nvme.c

875386b9885782 Manish Rangankar 2023-08-21  1167  
875386b9885782 Manish Rangankar 2023-08-21  1168  /*
875386b9885782 Manish Rangankar 2023-08-21  1169   * qla2xxx_process_purls_pkt() - Pass-up Unsolicited
875386b9885782 Manish Rangankar 2023-08-21  1170   * Received FC-NVMe Link Service pkt to nvme_fc_rcv_ls_req().
875386b9885782 Manish Rangankar 2023-08-21  1171   * LLDD need to provide memory for response buffer, which
875386b9885782 Manish Rangankar 2023-08-21  1172   * will be used to reference the exchange corresponding
875386b9885782 Manish Rangankar 2023-08-21  1173   * to the LS when issuing an ls response. LLDD will have to free
875386b9885782 Manish Rangankar 2023-08-21  1174   * response buffer in lport->ops->xmt_ls_rsp().
875386b9885782 Manish Rangankar 2023-08-21  1175   *
875386b9885782 Manish Rangankar 2023-08-21  1176   * @vha: SCSI qla host
875386b9885782 Manish Rangankar 2023-08-21  1177   * @item: ptr to purex_item
875386b9885782 Manish Rangankar 2023-08-21  1178   */
875386b9885782 Manish Rangankar 2023-08-21  1179  static void
875386b9885782 Manish Rangankar 2023-08-21  1180  qla2xxx_process_purls_pkt(struct scsi_qla_host *vha, struct purex_item *item)
875386b9885782 Manish Rangankar 2023-08-21  1181  {
875386b9885782 Manish Rangankar 2023-08-21  1182  	struct qla_nvme_unsol_ctx *uctx = item->purls_context;
875386b9885782 Manish Rangankar 2023-08-21 @1183  	fc_port_t *fcport = uctx->fcport;
875386b9885782 Manish Rangankar 2023-08-21  1184  	struct qla_nvme_lsrjt_pt_arg a;
27177862de9676 Nilesh Javali    2023-08-24  1185  	int ret = 1;
875386b9885782 Manish Rangankar 2023-08-21  1186  

:::::: The code at line 1183 was first introduced by commit
:::::: 875386b98857822b77ac7f95bdf367b70af5b78c scsi: qla2xxx: Add Unsolicited LS Request and Response Support for NVMe

:::::: TO: Manish Rangankar <mrangankar@marvell.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
