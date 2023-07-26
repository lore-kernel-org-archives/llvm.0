Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14485CA74;
	Wed, 26 Jul 2023 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690370652; x=1721906652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AcOIqlDTLlcj+BQgc3a10//A/KNbvCGci1yK88AC+1A=;
  b=DGJ2Xb/EgZwHCsfUoIzD3h8Q1C731MMxo3Aei7AfF3H0SllB+6RN919w
   FZHZn4lkF6mKTJWSFAZUxHpuqke9Fg+0Tm4ziw1eYab5MVHNKZhvXglsX
   kDT47HOoqCWMjjBWLmG4KxgFjVPSPYJGd1C9hdVALJZ/Vex0EOyfzxRWD
   TqnbfrcQZKctG9QiGTt/HztW//DbMcDqVzVNjvgXMn1vogwofwPUB/9sx
   o3sZJqOIUiC+3oqzHtixpCw4BwUcTeGdG2M0PgzJke02Z4eFqtrLtoat/
   XDjmFXe2Lrp0mlJgxLaydsSVA2Zfsqrh4poRLwIj+Judr0Xq2nT+Lhabk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="370663671"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="370663671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 04:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="791810607"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="791810607"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Jul 2023 04:24:09 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOccF-0000vT-02;
	Wed, 26 Jul 2023 11:23:56 +0000
Date: Wed, 26 Jul 2023 19:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/6] scsi: Retry unaligned zoned writes
Message-ID: <202307261938.3I7MPEJs-lkp@intel.com>
References: <20230726005742.303865-5-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726005742.303865-5-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.5-rc3 next-20230726]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Introduce-the-flag-REQ_NO_WRITE_LOCK/20230726-085936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230726005742.303865-5-bvanassche%40acm.org
patch subject: [PATCH v3 4/6] scsi: Retry unaligned zoned writes
config: s390-randconfig-r044-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261938.3I7MPEJs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261938.3I7MPEJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261938.3I7MPEJs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/scsi_error.c:32:
   In file included from include/scsi/scsi.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/scsi/scsi_error.c:32:
   In file included from include/scsi/scsi.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/scsi/scsi_error.c:32:
   In file included from include/scsi/scsi.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/scsi/scsi_error.c:709:7: error: call to undeclared function 'blk_queue_no_zone_write_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     709 |                     blk_queue_no_zone_write_lock(sdev->request_queue) &&
         |                     ^
   drivers/scsi/scsi_error.c:709:7: note: did you mean 'blk_req_zone_write_lock'?
   include/linux/blk-mq.h:1213:20: note: 'blk_req_zone_write_lock' declared here
    1213 | static inline void blk_req_zone_write_lock(struct request *rq)
         |                    ^
   12 warnings and 1 error generated.


vim +/blk_queue_no_zone_write_lock +709 drivers/scsi/scsi_error.c

   526	
   527	/**
   528	 * scsi_check_sense - Examine scsi cmd sense
   529	 * @scmd:	Cmd to have sense checked.
   530	 *
   531	 * Return value:
   532	 *	SUCCESS or FAILED or NEEDS_RETRY or ADD_TO_MLQUEUE
   533	 *
   534	 * Notes:
   535	 *	When a deferred error is detected the current command has
   536	 *	not been executed and needs retrying.
   537	 */
   538	enum scsi_disposition scsi_check_sense(struct scsi_cmnd *scmd)
   539	{
   540		struct request *req = scsi_cmd_to_rq(scmd);
   541		struct scsi_device *sdev = scmd->device;
   542		struct scsi_sense_hdr sshdr;
   543	
   544		if (! scsi_command_normalize_sense(scmd, &sshdr))
   545			return FAILED;	/* no valid sense data */
   546	
   547		scsi_report_sense(sdev, &sshdr);
   548	
   549		if (scsi_sense_is_deferred(&sshdr))
   550			return NEEDS_RETRY;
   551	
   552		if (sdev->handler && sdev->handler->check_sense) {
   553			enum scsi_disposition rc;
   554	
   555			rc = sdev->handler->check_sense(sdev, &sshdr);
   556			if (rc != SCSI_RETURN_NOT_HANDLED)
   557				return rc;
   558			/* handler does not care. Drop down to default handling */
   559		}
   560	
   561		if (scmd->cmnd[0] == TEST_UNIT_READY &&
   562		    scmd->submitter != SUBMITTED_BY_SCSI_ERROR_HANDLER)
   563			/*
   564			 * nasty: for mid-layer issued TURs, we need to return the
   565			 * actual sense data without any recovery attempt.  For eh
   566			 * issued ones, we need to try to recover and interpret
   567			 */
   568			return SUCCESS;
   569	
   570		/*
   571		 * Previous logic looked for FILEMARK, EOM or ILI which are
   572		 * mainly associated with tapes and returned SUCCESS.
   573		 */
   574		if (sshdr.response_code == 0x70) {
   575			/* fixed format */
   576			if (scmd->sense_buffer[2] & 0xe0)
   577				return SUCCESS;
   578		} else {
   579			/*
   580			 * descriptor format: look for "stream commands sense data
   581			 * descriptor" (see SSC-3). Assume single sense data
   582			 * descriptor. Ignore ILI from SBC-2 READ LONG and WRITE LONG.
   583			 */
   584			if ((sshdr.additional_length > 3) &&
   585			    (scmd->sense_buffer[8] == 0x4) &&
   586			    (scmd->sense_buffer[11] & 0xe0))
   587				return SUCCESS;
   588		}
   589	
   590		switch (sshdr.sense_key) {
   591		case NO_SENSE:
   592			return SUCCESS;
   593		case RECOVERED_ERROR:
   594			return /* soft_error */ SUCCESS;
   595	
   596		case ABORTED_COMMAND:
   597			if (sshdr.asc == 0x10) /* DIF */
   598				return SUCCESS;
   599	
   600			/*
   601			 * Check aborts due to command duration limit policy:
   602			 * ABORTED COMMAND additional sense code with the
   603			 * COMMAND TIMEOUT BEFORE PROCESSING or
   604			 * COMMAND TIMEOUT DURING PROCESSING or
   605			 * COMMAND TIMEOUT DURING PROCESSING DUE TO ERROR RECOVERY
   606			 * additional sense code qualifiers.
   607			 */
   608			if (sshdr.asc == 0x2e &&
   609			    sshdr.ascq >= 0x01 && sshdr.ascq <= 0x03) {
   610				set_scsi_ml_byte(scmd, SCSIML_STAT_DL_TIMEOUT);
   611				req->cmd_flags |= REQ_FAILFAST_DEV;
   612				req->rq_flags |= RQF_QUIET;
   613				return SUCCESS;
   614			}
   615	
   616			if (sshdr.asc == 0x44 && sdev->sdev_bflags & BLIST_RETRY_ITF)
   617				return ADD_TO_MLQUEUE;
   618			if (sshdr.asc == 0xc1 && sshdr.ascq == 0x01 &&
   619			    sdev->sdev_bflags & BLIST_RETRY_ASC_C1)
   620				return ADD_TO_MLQUEUE;
   621	
   622			return NEEDS_RETRY;
   623		case NOT_READY:
   624		case UNIT_ATTENTION:
   625			/*
   626			 * if we are expecting a cc/ua because of a bus reset that we
   627			 * performed, treat this just as a retry.  otherwise this is
   628			 * information that we should pass up to the upper-level driver
   629			 * so that we can deal with it there.
   630			 */
   631			if (scmd->device->expecting_cc_ua) {
   632				/*
   633				 * Because some device does not queue unit
   634				 * attentions correctly, we carefully check
   635				 * additional sense code and qualifier so as
   636				 * not to squash media change unit attention.
   637				 */
   638				if (sshdr.asc != 0x28 || sshdr.ascq != 0x00) {
   639					scmd->device->expecting_cc_ua = 0;
   640					return NEEDS_RETRY;
   641				}
   642			}
   643			/*
   644			 * we might also expect a cc/ua if another LUN on the target
   645			 * reported a UA with an ASC/ASCQ of 3F 0E -
   646			 * REPORTED LUNS DATA HAS CHANGED.
   647			 */
   648			if (scmd->device->sdev_target->expecting_lun_change &&
   649			    sshdr.asc == 0x3f && sshdr.ascq == 0x0e)
   650				return NEEDS_RETRY;
   651			/*
   652			 * if the device is in the process of becoming ready, we
   653			 * should retry.
   654			 */
   655			if ((sshdr.asc == 0x04) && (sshdr.ascq == 0x01))
   656				return NEEDS_RETRY;
   657			/*
   658			 * if the device is not started, we need to wake
   659			 * the error handler to start the motor
   660			 */
   661			if (scmd->device->allow_restart &&
   662			    (sshdr.asc == 0x04) && (sshdr.ascq == 0x02))
   663				return FAILED;
   664			/*
   665			 * Pass the UA upwards for a determination in the completion
   666			 * functions.
   667			 */
   668			return SUCCESS;
   669	
   670			/* these are not supported */
   671		case DATA_PROTECT:
   672			if (sshdr.asc == 0x27 && sshdr.ascq == 0x07) {
   673				/* Thin provisioning hard threshold reached */
   674				set_scsi_ml_byte(scmd, SCSIML_STAT_NOSPC);
   675				return SUCCESS;
   676			}
   677			fallthrough;
   678		case COPY_ABORTED:
   679		case VOLUME_OVERFLOW:
   680		case MISCOMPARE:
   681		case BLANK_CHECK:
   682			set_scsi_ml_byte(scmd, SCSIML_STAT_TGT_FAILURE);
   683			return SUCCESS;
   684	
   685		case MEDIUM_ERROR:
   686			if (sshdr.asc == 0x11 || /* UNRECOVERED READ ERR */
   687			    sshdr.asc == 0x13 || /* AMNF DATA FIELD */
   688			    sshdr.asc == 0x14) { /* RECORD NOT FOUND */
   689				set_scsi_ml_byte(scmd, SCSIML_STAT_MED_ERROR);
   690				return SUCCESS;
   691			}
   692			return NEEDS_RETRY;
   693	
   694		case HARDWARE_ERROR:
   695			if (scmd->device->retry_hwerror)
   696				return ADD_TO_MLQUEUE;
   697			else
   698				set_scsi_ml_byte(scmd, SCSIML_STAT_TGT_FAILURE);
   699			fallthrough;
   700	
   701		case ILLEGAL_REQUEST:
   702			/*
   703			 * Unaligned write command. This indicates that zoned writes
   704			 * have been received by the device in the wrong order. If zone
   705			 * write locking is disabled, retry after all pending commands
   706			 * have completed.
   707			 */
   708			if (sshdr.asc == 0x21 && sshdr.ascq == 0x04 &&
 > 709			    blk_queue_no_zone_write_lock(sdev->request_queue) &&
   710			    !scsi_noretry_cmd(scmd) && scsi_cmd_retry_allowed(scmd))
   711				return NEEDS_DELAYED_RETRY;
   712	
   713			if (sshdr.asc == 0x20 || /* Invalid command operation code */
   714			    sshdr.asc == 0x21 || /* Logical block address out of range */
   715			    sshdr.asc == 0x22 || /* Invalid function */
   716			    sshdr.asc == 0x24 || /* Invalid field in cdb */
   717			    sshdr.asc == 0x26 || /* Parameter value invalid */
   718			    sshdr.asc == 0x27) { /* Write protected */
   719				set_scsi_ml_byte(scmd, SCSIML_STAT_TGT_FAILURE);
   720			}
   721			return SUCCESS;
   722	
   723		case COMPLETED:
   724			if (sshdr.asc == 0x55 && sshdr.ascq == 0x0a) {
   725				set_scsi_ml_byte(scmd, SCSIML_STAT_DL_TIMEOUT);
   726				req->cmd_flags |= REQ_FAILFAST_DEV;
   727				req->rq_flags |= RQF_QUIET;
   728			}
   729			return SUCCESS;
   730	
   731		default:
   732			return SUCCESS;
   733		}
   734	}
   735	EXPORT_SYMBOL_GPL(scsi_check_sense);
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
