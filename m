Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE453BED18;
	Fri, 25 Sep 2026 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358177; cv=none; b=kmdVTczcytN1wpdt3/QwKll7oKiXPj5KB1a/PWRs6ui0L77syYEqcr2VpVsh/zyB2pJ6oa+sbeUf7BCFacUfysrH2R9B/WWZ9sEgekSkWiDLYL9OnNBpfDdG8UrX+ISbvlMdo5WEAOp3MWuHAnrIpaJP1N31C8lxuXr4AsckzLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358177; c=relaxed/simple;
	bh=C3sRVWxBsNwTH+2UUdSUL7mRfMKnvnZjrMt9myJn1wg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tjNIBXMhUA/EDgS8C+6IZjObnnJgGtgy/VmLcEXnyuZknPTKPp8PGKXGJaOU3a2NbB/8+/Gb0v0dSl99v++hnovM7wDkKOe2fZ5/3TyTPAOlMLBLRzXXRm23Sf01gMbiUDu94rob8CuJoFxmy84ksApcNI7QuIADRL0LrL25QN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j97p31f8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j97p31f8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790358176; x=1821894176;
  h=date:from:to:cc:subject:message-id;
  bh=C3sRVWxBsNwTH+2UUdSUL7mRfMKnvnZjrMt9myJn1wg=;
  b=j97p31f8TkO3tBcYd1PegGGgGI5suq7Eunay88ts9EChRllWAWAsngDZ
   csqRj4ueudKoAOKyu5FyIz+lUA9+O3E/rCyd6TifUKFT8iHF2xuf1xVKv
   gwCiak8dTkzQ2HEVTQ+p+wQgn7+p8LvWFGe8dXrMkShcsdOsXzS/7rjva
   iNZ/6lwCe9cfuw++ITrgIVMX5okueiYZBBZBDdMbBuW5kggdQuby3EFsv
   CqlIlHPx29wtBa4HqM5ewv4AcJcNRE2l+W4y0985gzfiiaLJO7H79Lail
   xlY83fOsfEZTFUn2ida0vvf8RyLXbKH/UBlpt9S0CGTuuEBIwa7UTw6bV
   g==;
X-CSE-ConnectionGUID: ungGCQ9yR3m42AXEMETYOw==
X-CSE-MsgGUID: 0/IlfRSwSKe5XilwK+mS8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116678335"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116678335"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:42:55 -0700
X-CSE-ConnectionGUID: CDi0SkOkQLOc944+9hUTag==
X-CSE-MsgGUID: h01gje+qSmKT3BpeyQimgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="282463878"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2026 10:42:53 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA9wh-000000000qW-1FGb;
	Fri, 25 Sep 2026 17:42:51 +0000
Date: Fri, 25 Sep 2026 19:42:43 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 467/673]
 drivers/target/target_core_xcopy.c:657:13: warning: stack frame size (1104)
 exceeds limit (960) in 'target_xcopy_do_work'
Message-ID: <202609251958.uQdPiFrU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: acb21639a56634b326a26f5c179ba3f94ab5b6c2 [467/673] fixup! testing: allow building more quickly with W=12
config: s390-randconfig-2001-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251958.uQdPiFrU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 57e112ccb2a509c0e1d36963b187fccdd59566de)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251958.uQdPiFrU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251958.uQdPiFrU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/target/target_core_xcopy.c:657:13: warning: stack frame size (1104) exceeds limit (960) in 'target_xcopy_do_work' [-Wframe-larger-than]
     657 | static void target_xcopy_do_work(struct work_struct *work)
         |             ^
   1 warning generated.
--
>> lib/zstd/common/entropy_common.c:235:8: warning: stack frame size (992) exceeds limit (960) in 'HUF_readStats' [-Wframe-larger-than]
     235 | size_t HUF_readStats(BYTE* huffWeight, size_t hwSize, U32* rankStats,
         |        ^
   1 warning generated.


vim +/target_xcopy_do_work +657 drivers/target/target_core_xcopy.c

cbf031f425fd0b Nicholas Bellinger 2013-08-20  656  
cbf031f425fd0b Nicholas Bellinger 2013-08-20 @657  static void target_xcopy_do_work(struct work_struct *work)
cbf031f425fd0b Nicholas Bellinger 2013-08-20  658  {
cbf031f425fd0b Nicholas Bellinger 2013-08-20  659  	struct xcopy_op *xop = container_of(work, struct xcopy_op, xop_work);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  660  	struct se_cmd *ec_cmd = xop->xop_se_cmd;
d877d7275be34a Bart Van Assche    2017-05-23  661  	struct se_device *src_dev, *dst_dev;
d877d7275be34a Bart Van Assche    2017-05-23  662  	sector_t src_lba, dst_lba, end_lba;
689d94ec208cfd Anastasia Kovaleva 2022-11-14  663  	unsigned long long max_bytes, max_bytes_src, max_bytes_dst, max_blocks;
d877d7275be34a Bart Van Assche    2017-05-23  664  	int rc = 0;
689d94ec208cfd Anastasia Kovaleva 2022-11-14  665  	unsigned short nolb;
689d94ec208cfd Anastasia Kovaleva 2022-11-14  666  	unsigned int copied_bytes = 0;
0394b5048efd73 Sergey Samoylenko  2021-08-03  667  	sense_reason_t sense_rc;
d877d7275be34a Bart Van Assche    2017-05-23  668  
0394b5048efd73 Sergey Samoylenko  2021-08-03  669  	sense_rc = target_parse_xcopy_cmd(xop);
0394b5048efd73 Sergey Samoylenko  2021-08-03  670  	if (sense_rc != TCM_NO_SENSE)
d877d7275be34a Bart Van Assche    2017-05-23  671  		goto err_free;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  672  
0394b5048efd73 Sergey Samoylenko  2021-08-03  673  	if (WARN_ON_ONCE(!xop->src_dev) || WARN_ON_ONCE(!xop->dst_dev)) {
0394b5048efd73 Sergey Samoylenko  2021-08-03  674  		sense_rc = TCM_INVALID_PARAMETER_LIST;
d877d7275be34a Bart Van Assche    2017-05-23  675  		goto err_free;
0394b5048efd73 Sergey Samoylenko  2021-08-03  676  	}
d877d7275be34a Bart Van Assche    2017-05-23  677  
d877d7275be34a Bart Van Assche    2017-05-23  678  	src_dev = xop->src_dev;
d877d7275be34a Bart Van Assche    2017-05-23  679  	dst_dev = xop->dst_dev;
d877d7275be34a Bart Van Assche    2017-05-23  680  	src_lba = xop->src_lba;
d877d7275be34a Bart Van Assche    2017-05-23  681  	dst_lba = xop->dst_lba;
d877d7275be34a Bart Van Assche    2017-05-23  682  	nolb = xop->nolb;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  683  	end_lba = src_lba + nolb;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  684  	/*
689d94ec208cfd Anastasia Kovaleva 2022-11-14  685  	 * Break up XCOPY I/O into hw_max_sectors * hw_block_size sized
689d94ec208cfd Anastasia Kovaleva 2022-11-14  686  	 * I/O based on the smallest max_bytes between src_dev + dst_dev
cbf031f425fd0b Nicholas Bellinger 2013-08-20  687  	 */
689d94ec208cfd Anastasia Kovaleva 2022-11-14  688  	max_bytes_src = (unsigned long long) src_dev->dev_attrib.hw_max_sectors *
689d94ec208cfd Anastasia Kovaleva 2022-11-14  689  			src_dev->dev_attrib.hw_block_size;
689d94ec208cfd Anastasia Kovaleva 2022-11-14  690  	max_bytes_dst = (unsigned long long) dst_dev->dev_attrib.hw_max_sectors *
689d94ec208cfd Anastasia Kovaleva 2022-11-14  691  			dst_dev->dev_attrib.hw_block_size;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  692  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  693  	max_bytes = min_t(u64, max_bytes_src, max_bytes_dst);
689d94ec208cfd Anastasia Kovaleva 2022-11-14  694  	max_bytes = min_t(u64, max_bytes, XCOPY_MAX_BYTES);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  695  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  696  	/*
689d94ec208cfd Anastasia Kovaleva 2022-11-14  697  	 * Using shift instead of the division because otherwise GCC
689d94ec208cfd Anastasia Kovaleva 2022-11-14  698  	 * generates __udivdi3 that is missing on i386
689d94ec208cfd Anastasia Kovaleva 2022-11-14  699  	 */
689d94ec208cfd Anastasia Kovaleva 2022-11-14  700  	max_blocks = max_bytes >> ilog2(src_dev->dev_attrib.block_size);
689d94ec208cfd Anastasia Kovaleva 2022-11-14  701  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  702  	pr_debug("%s: nolb: %u, max_blocks: %llu end_lba: %llu\n", __func__,
689d94ec208cfd Anastasia Kovaleva 2022-11-14  703  			nolb, max_blocks, (unsigned long long)end_lba);
689d94ec208cfd Anastasia Kovaleva 2022-11-14  704  	pr_debug("%s: Starting src_lba: %llu, dst_lba: %llu\n", __func__,
cbf031f425fd0b Nicholas Bellinger 2013-08-20  705  			(unsigned long long)src_lba, (unsigned long long)dst_lba);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  706  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  707  	while (nolb) {
689d94ec208cfd Anastasia Kovaleva 2022-11-14  708  		u32 cur_bytes = min_t(u64, max_bytes, nolb * src_dev->dev_attrib.block_size);
689d94ec208cfd Anastasia Kovaleva 2022-11-14  709  		unsigned short cur_nolb = cur_bytes / src_dev->dev_attrib.block_size;
0ad08996da05b6 David Disseldorp   2020-03-27  710  
0ad08996da05b6 David Disseldorp   2020-03-27  711  		if (cur_bytes != xop->xop_data_bytes) {
0ad08996da05b6 David Disseldorp   2020-03-27  712  			/*
0ad08996da05b6 David Disseldorp   2020-03-27  713  			 * (Re)allocate a buffer large enough to hold the XCOPY
0ad08996da05b6 David Disseldorp   2020-03-27  714  			 * I/O size, which can be reused each read / write loop.
0ad08996da05b6 David Disseldorp   2020-03-27  715  			 */
0ad08996da05b6 David Disseldorp   2020-03-27  716  			target_free_sgl(xop->xop_data_sg, xop->xop_data_nents);
0ad08996da05b6 David Disseldorp   2020-03-27  717  			rc = target_alloc_sgl(&xop->xop_data_sg,
0ad08996da05b6 David Disseldorp   2020-03-27  718  					      &xop->xop_data_nents,
0ad08996da05b6 David Disseldorp   2020-03-27  719  					      cur_bytes,
0ad08996da05b6 David Disseldorp   2020-03-27  720  					      false, false);
0ad08996da05b6 David Disseldorp   2020-03-27  721  			if (rc < 0)
0ad08996da05b6 David Disseldorp   2020-03-27  722  				goto out;
0ad08996da05b6 David Disseldorp   2020-03-27  723  			xop->xop_data_bytes = cur_bytes;
0ad08996da05b6 David Disseldorp   2020-03-27  724  		}
cbf031f425fd0b Nicholas Bellinger 2013-08-20  725  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  726  		pr_debug("%s: Calling read src_dev: %p src_lba: %llu, cur_nolb: %hu\n",
689d94ec208cfd Anastasia Kovaleva 2022-11-14  727  				__func__, src_dev, (unsigned long long)src_lba, cur_nolb);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  728  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  729  		rc = target_xcopy_read_source(ec_cmd, xop, src_dev, src_lba, cur_bytes);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  730  		if (rc < 0)
cbf031f425fd0b Nicholas Bellinger 2013-08-20  731  			goto out;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  732  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  733  		src_lba += cur_bytes / src_dev->dev_attrib.block_size;
689d94ec208cfd Anastasia Kovaleva 2022-11-14  734  		pr_debug("%s: Incremented READ src_lba to %llu\n", __func__,
cbf031f425fd0b Nicholas Bellinger 2013-08-20  735  				(unsigned long long)src_lba);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  736  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  737  		pr_debug("%s: Calling write dst_dev: %p dst_lba: %llu, cur_nolb: %u\n",
689d94ec208cfd Anastasia Kovaleva 2022-11-14  738  				__func__, dst_dev, (unsigned long long)dst_lba, cur_nolb);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  739  
cbf031f425fd0b Nicholas Bellinger 2013-08-20  740  		rc = target_xcopy_write_destination(ec_cmd, xop, dst_dev,
689d94ec208cfd Anastasia Kovaleva 2022-11-14  741  						dst_lba, cur_bytes);
b92fcfcb687de7 David Disseldorp   2020-03-27  742  		if (rc < 0)
cbf031f425fd0b Nicholas Bellinger 2013-08-20  743  			goto out;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  744  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  745  		dst_lba += cur_bytes / dst_dev->dev_attrib.block_size;
689d94ec208cfd Anastasia Kovaleva 2022-11-14  746  		pr_debug("%s: Incremented WRITE dst_lba to %llu\n", __func__,
cbf031f425fd0b Nicholas Bellinger 2013-08-20  747  				(unsigned long long)dst_lba);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  748  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  749  		copied_bytes += cur_bytes;
689d94ec208cfd Anastasia Kovaleva 2022-11-14  750  		nolb -= cur_bytes / src_dev->dev_attrib.block_size;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  751  	}
cbf031f425fd0b Nicholas Bellinger 2013-08-20  752  
cbf031f425fd0b Nicholas Bellinger 2013-08-20  753  	xcopy_pt_undepend_remotedev(xop);
0ad08996da05b6 David Disseldorp   2020-03-27  754  	target_free_sgl(xop->xop_data_sg, xop->xop_data_nents);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  755  	kfree(xop);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  756  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  757  	pr_debug("%s: Final src_lba: %llu, dst_lba: %llu\n", __func__,
cbf031f425fd0b Nicholas Bellinger 2013-08-20  758  		(unsigned long long)src_lba, (unsigned long long)dst_lba);
689d94ec208cfd Anastasia Kovaleva 2022-11-14  759  	pr_debug("%s: Blocks copied: %u, Bytes Copied: %u\n", __func__,
689d94ec208cfd Anastasia Kovaleva 2022-11-14  760  		copied_bytes / dst_dev->dev_attrib.block_size, copied_bytes);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  761  
689d94ec208cfd Anastasia Kovaleva 2022-11-14  762  	pr_debug("%s: Setting X-COPY GOOD status -> sending response\n", __func__);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  763  	target_complete_cmd(ec_cmd, SAM_STAT_GOOD);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  764  	return;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  765  
cbf031f425fd0b Nicholas Bellinger 2013-08-20  766  out:
0394b5048efd73 Sergey Samoylenko  2021-08-03  767  	/*
0394b5048efd73 Sergey Samoylenko  2021-08-03  768  	 * The XCOPY command was aborted after some data was transferred.
0394b5048efd73 Sergey Samoylenko  2021-08-03  769  	 * Terminate command with CHECK CONDITION status, with the sense key
0394b5048efd73 Sergey Samoylenko  2021-08-03  770  	 * set to COPY ABORTED.
0394b5048efd73 Sergey Samoylenko  2021-08-03  771  	 */
0394b5048efd73 Sergey Samoylenko  2021-08-03  772  	sense_rc = TCM_COPY_TARGET_DEVICE_NOT_REACHABLE;
cbf031f425fd0b Nicholas Bellinger 2013-08-20  773  	xcopy_pt_undepend_remotedev(xop);
0ad08996da05b6 David Disseldorp   2020-03-27  774  	target_free_sgl(xop->xop_data_sg, xop->xop_data_nents);
d877d7275be34a Bart Van Assche    2017-05-23  775  
d877d7275be34a Bart Van Assche    2017-05-23  776  err_free:
cbf031f425fd0b Nicholas Bellinger 2013-08-20  777  	kfree(xop);
689d94ec208cfd Anastasia Kovaleva 2022-11-14  778  	pr_warn_ratelimited("%s: rc: %d, sense: %u, XCOPY operation failed\n",
689d94ec208cfd Anastasia Kovaleva 2022-11-14  779  			   __func__, rc, sense_rc);
0394b5048efd73 Sergey Samoylenko  2021-08-03  780  	target_complete_cmd_with_sense(ec_cmd, SAM_STAT_CHECK_CONDITION, sense_rc);
cbf031f425fd0b Nicholas Bellinger 2013-08-20  781  }
cbf031f425fd0b Nicholas Bellinger 2013-08-20  782  

:::::: The code at line 657 was first introduced by commit
:::::: cbf031f425fd0b30ff10ba83b612753189a6bbbf target: Add support for EXTENDED_COPY copy offload emulation

:::::: TO: Nicholas Bellinger <nab@daterainc.com>
:::::: CC: Nicholas Bellinger <nab@linux-iscsi.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
