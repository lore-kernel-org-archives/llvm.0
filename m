Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EC1600D
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657829319; x=1689365319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIX0eVpa9x1OvLLdjQ4v9KeZgkmfZygJr9+vcPR9t9g=;
  b=GdxHfToIpkEwHsIVoLzcBKYhhtIvSll2RkCCl5T0r9/A7k2TZ/TBsvbH
   Yj5W62u4Eo7lghbrNRYGGz6EuWUh/Acgz7p5jHC/wFWPragI0HjoEgS1L
   CERDeBVWEH7ypBf6ePRd3Za+DqpX+kdFC1sa4LRp5c6kyD1Qc83n1w7kV
   9OnSstYrNZwX/pko3QBAKD27c49EhUUnBw8MVT3iXbinxMmBhcoiHG1yR
   w8pNZ60wyA5AurEx3WQooSAtZe8cVSiGk5Uum7GjAvc0+UvnJHJJf4k+k
   tO2/iEMp5InbZruVfQUB86tK2y6oP0rMAuyjBSh64fqeo2iXKG3PQIv/c
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286360480"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="286360480"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 13:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="772742980"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2022 13:08:37 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC58W-00016V-Rk;
	Thu, 14 Jul 2022 20:08:36 +0000
Date: Fri, 15 Jul 2022 04:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: Quinn Tran <qutran@marvell.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>,
	Nilesh Javali <njavali@marvell.com>
Subject: [linux-next:master 10618/10678]
 drivers/scsi/qla2xxx/qla_init.c:171:10: warning: variable 'bail' set but not
 used
Message-ID: <202207150400.NMBYJFkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
commit: c8c2a9053c4b28167c2a63e78d7949b775d238b6 [10618/10678] scsi: qla2xxx: Fix imbalance vha->vref_count
config: riscv-randconfig-r002-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150400.NMBYJFkA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c8c2a9053c4b28167c2a63e78d7949b775d238b6
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c8c2a9053c4b28167c2a63e78d7949b775d238b6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/scsi/qla2xxx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/qla2xxx/qla_init.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:14:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/scsi/qla2xxx/qla_init.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:14:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/scsi/qla2xxx/qla_init.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:14:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/scsi/qla2xxx/qla_init.c:171:10: warning: variable 'bail' set but not used [-Wunused-but-set-variable]
           uint8_t bail;
                   ^
   drivers/scsi/qla2xxx/qla_init.c:2023:10: warning: variable 'bail' set but not used [-Wunused-but-set-variable]
           uint8_t bail;
                   ^
   drivers/scsi/qla2xxx/qla_init.c:5533:7: warning: variable 'found_devs' set but not used [-Wunused-but-set-variable]
           int             found_devs;
                           ^
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   error: A dwo section may not contain relocations
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   10 warnings and 20 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on HAS_IOMEM && DRM && MMU
   Selected by
   - DRM_TTM_HELPER && HAS_IOMEM && DRM
   - DRM_HISI_HIBMC && HAS_IOMEM && DRM && PCI && (ARM64 || COMPILE_TEST


vim +/bail +171 drivers/scsi/qla2xxx/qla_init.c

   164	
   165	int qla24xx_async_abort_cmd(srb_t *cmd_sp, bool wait)
   166	{
   167		scsi_qla_host_t *vha = cmd_sp->vha;
   168		struct srb_iocb *abt_iocb;
   169		srb_t *sp;
   170		int rval = QLA_FUNCTION_FAILED;
 > 171		uint8_t bail;
   172	
   173		/* ref: INIT for ABTS command */
   174		sp = qla2xxx_get_qpair_sp(cmd_sp->vha, cmd_sp->qpair, cmd_sp->fcport,
   175					  GFP_ATOMIC);
   176		if (!sp)
   177			return QLA_MEMORY_ALLOC_FAILED;
   178	
   179		QLA_VHA_MARK_BUSY(vha, bail);
   180		abt_iocb = &sp->u.iocb_cmd;
   181		sp->type = SRB_ABT_CMD;
   182		sp->name = "abort";
   183		sp->qpair = cmd_sp->qpair;
   184		sp->cmd_sp = cmd_sp;
   185		if (wait)
   186			sp->flags = SRB_WAKEUP_ON_COMP;
   187	
   188		init_completion(&abt_iocb->u.abt.comp);
   189		/* FW can send 2 x ABTS's timeout/20s */
   190		qla2x00_init_async_sp(sp, 42, qla24xx_abort_sp_done);
   191		sp->u.iocb_cmd.timeout = qla24xx_abort_iocb_timeout;
   192	
   193		abt_iocb->u.abt.cmd_hndl = cmd_sp->handle;
   194		abt_iocb->u.abt.req_que_no = cpu_to_le16(cmd_sp->qpair->req->id);
   195	
   196		ql_dbg(ql_dbg_async, vha, 0x507c,
   197		       "Abort command issued - hdl=%x, type=%x\n", cmd_sp->handle,
   198		       cmd_sp->type);
   199	
   200		rval = qla2x00_start_sp(sp);
   201		if (rval != QLA_SUCCESS) {
   202			/* ref: INIT */
   203			kref_put(&sp->cmd_kref, qla2x00_sp_release);
   204			return rval;
   205		}
   206	
   207		if (wait) {
   208			wait_for_completion(&abt_iocb->u.abt.comp);
   209			rval = abt_iocb->u.abt.comp_status == CS_COMPLETE ?
   210				QLA_SUCCESS : QLA_ERR_FROM_FW;
   211			/* ref: INIT */
   212			kref_put(&sp->cmd_kref, qla2x00_sp_release);
   213		}
   214	
   215		return rval;
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
