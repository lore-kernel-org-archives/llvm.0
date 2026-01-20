Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFCC3D2FF7;
	Tue, 20 Jan 2026 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902297; cv=none; b=vGdrlIx4H+DFCptRQIBtJWKp5LHmBDcPjs/7/lgtjUEllxBzQs9o3DL0CJqOn2uZ/1seIIFR6BA9QBs4GsaOUQXMPDU5JOQONU+oCTZICfCL8a/9uIjHS+NQLfa9v8svk/BD97/HDtpAry+ypiyQ9RDXTqjHjgd82xA5VR+DlZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902297; c=relaxed/simple;
	bh=Fq6mW3eYzAf3EDBXq4PBMFMTS2KvJkX84ejoU8hzI38=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hJpRXL3G3tn14zKY5TvIQVpyqYOke4yN23noidy5MYAPn/Y4eGYPrRCvVbjhtMph0uKXfEP0y9iskAZyarjhdKxAINL4vK142FcQjXK1zIsADN37HgSMT8ufbUDTayR8/gLUF3T30SQ88avU+ICBgr8c6kKnaw0V3FnnMCwqgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfC/Q7SI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfC/Q7SI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768902295; x=1800438295;
  h=date:from:to:cc:subject:message-id;
  bh=Fq6mW3eYzAf3EDBXq4PBMFMTS2KvJkX84ejoU8hzI38=;
  b=BfC/Q7SIAi5cwPyn7LMP+ayuu5N9RnefFqwbG8iXBjBWWBledNDxkt/M
   Lh7+de/EIH+6fPUBQnKFuCNXaoIywWrSMsTpViZFQkSKMZ9hwx3yRdJ5T
   Q8xbrzVOq59gcjko7GFxfTs+i2cB8/r4yXQNUXuDP020+qtYIfm0jNkZT
   vugVP3qBm9KfABlrr/PQO/foxhSJPLipSiQKyl5hCiv4AtH6F5RlfsJKC
   GmscqN+U/IWlf05M//vbocwKJpIcxnZfboiArNbTwYBCRtwnsSPg6vJMu
   2mwqOrD4Mr71lW0W7oh0O6RW3tQJIyAao2MC4+5uS8vYNt1fG0ys7PLNj
   w==;
X-CSE-ConnectionGUID: 5nMC/8LiRJmtkklH9D2fmQ==
X-CSE-MsgGUID: 0exEqTKhQHWuBWScg8fq4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="87520462"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="87520462"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:44:54 -0800
X-CSE-ConnectionGUID: +rN1o8dhQze40o25WwT3Hw==
X-CSE-MsgGUID: ZXk/Aj+0RRWBKtdMDIuWOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="236763002"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 01:44:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi8I5-00000000Omh-1M11;
	Tue, 20 Jan 2026 09:44:49 +0000
Date: Tue, 20 Jan 2026 17:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260119 5/11]
 drivers/scsi/aic94xx/aic94xx_task.c:427:7: error: no member named 'smp_task'
 in 'struct scb'
Message-ID: <202601201716.hOYjsAs5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260119
head:   ea9777b50492237d558d25d0478d9093358465e2
commit: 3f3304f607160e329f4255a3b3a0de8f8021790a [5/11] scsi: libsas/aci94xx: Avoid multiple -Wflex-array-member-not-at-end warnings
config: powerpc-randconfig-001-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201716.hOYjsAs5-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201716.hOYjsAs5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201716.hOYjsAs5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/scsi/aic94xx/aic94xx_reg.c:10:
   In file included from drivers/scsi/aic94xx/aic94xx_reg.h:13:
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.h:19:
   drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field has incomplete type 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                                   ^
   drivers/scsi/aic94xx/aic94xx_sas.h:323:9: note: forward declaration of 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                ^
   In file included from drivers/scsi/aic94xx/aic94xx_reg.c:10:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   1 warning and 1 error generated.
--
   In file included from drivers/scsi/aic94xx/aic94xx_scb.c:13:
   In file included from drivers/scsi/aic94xx/aic94xx_reg.h:13:
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.h:19:
   drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field has incomplete type 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                                   ^
   drivers/scsi/aic94xx/aic94xx_sas.h:323:9: note: forward declaration of 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                ^
   In file included from drivers/scsi/aic94xx/aic94xx_scb.c:13:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   drivers/scsi/aic94xx/aic94xx_scb.c:369:39: error: no member named 'escb' in 'struct scb'
     369 |         struct empty_scb *escb = &ascb->scb->escb;
         |                                   ~~~~~~~~~  ^
   drivers/scsi/aic94xx/aic94xx_scb.c:631:42: error: no member named 'control_phy' in 'struct scb'
     631 |         struct control_phy *control_phy = &scb->control_phy;
         |                                            ~~~  ^
   drivers/scsi/aic94xx/aic94xx_scb.c:770:42: error: no member named 'control_phy' in 'struct scb'
     770 |         struct control_phy *control_phy = &scb->control_phy;
         |                                            ~~~  ^
   1 warning and 4 errors generated.
--
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.c:16:
   In file included from drivers/scsi/aic94xx/aic94xx_reg.h:13:
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.h:19:
   drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field has incomplete type 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                                   ^
   drivers/scsi/aic94xx/aic94xx_sas.h:323:9: note: forward declaration of 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                ^
   In file included from drivers/scsi/aic94xx/aic94xx_hwi.c:16:
>> drivers/scsi/aic94xx/aic94xx_reg.h:252:37: warning: shift count >= width of type [-Wshift-count-overflow]
     252 |         asd_write_reg_dword(asd_ha, reg+4, ASD_BUSADDR_HI(dma_handle));
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_hwi.h:210:61: note: expanded from macro 'ASD_BUSADDR_HI'
     210 |                                     ? ((u32)((__dma_handle) >> 32)) \
         |                                                             ^  ~~
   drivers/scsi/aic94xx/aic94xx_hwi.c:344:40: error: no member named 'escb' in 'struct scb'
     344 |                 struct empty_scb *escb = &ascb->scb->escb;
         |                                           ~~~~~~~~~  ^
   1 warning and 2 errors generated.
--
   In file included from drivers/scsi/aic94xx/aic94xx_task.c:11:
   drivers/scsi/aic94xx/aic94xx_sas.h:323:28: error: field has incomplete type 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                                   ^
   drivers/scsi/aic94xx/aic94xx_sas.h:323:9: note: forward declaration of 'struct ssp_command_iu_hdr'
     323 |         struct ssp_command_iu_hdr ssp_cmd;
         |                ^
   drivers/scsi/aic94xx/aic94xx_task.c:129:33: error: no member named 'ssp_task' in 'struct scb'
     129 |                        le64_to_cpu(ascb->scb->ssp_task.sg_element[0].bus_addr);
         |                                    ~~~~~~~~~  ^
   include/linux/byteorder/generic.h:87:21: note: expanded from macro 'le64_to_cpu'
      87 | #define le64_to_cpu __le64_to_cpu
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:33:59: note: expanded from macro '__le64_to_cpu'
      33 | #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:128:54: note: expanded from macro '__swab64'
     128 | #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
         |                                                      ^
   drivers/scsi/aic94xx/aic94xx_task.c:365:7: error: no member named 'ata_task' in 'struct scb'
     365 |         scb->ata_task.proto_conn_rate = (1 << 5); /* STP */
         |         ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:367:8: error: no member named 'ata_task' in 'struct scb'
     367 |                 scb->ata_task.proto_conn_rate |= dev->linkrate;
         |                 ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:369:7: error: no member named 'ata_task' in 'struct scb'
     369 |         scb->ata_task.total_xfer_len = cpu_to_le32(task->total_xfer_len);
         |         ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:370:7: error: no member named 'ata_task' in 'struct scb'
     370 |         scb->ata_task.fis = task->ata_task.fis;
         |         ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:372:8: error: no member named 'ata_task' in 'struct scb'
     372 |                 scb->ata_task.fis.flags |= 0x80; /* C=1: update ATA cmd reg */
         |                 ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:373:7: error: no member named 'ata_task' in 'struct scb'
     373 |         scb->ata_task.fis.flags &= 0xF0; /* PM_PORT field shall be 0 */
         |         ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:375:15: error: no member named 'ata_task' in 'struct scb'
     375 |                 memcpy(scb->ata_task.atapi_packet, task->ata_task.atapi_packet,
         |                        ~~~  ^
   include/linux/fortify-string.h:689:17: note: expanded from macro 'memcpy'
     689 |                 __struct_size(p), __struct_size(q),                     \
         |                               ^
   include/linux/compiler_types.h:523:56: note: expanded from macro '__struct_size'
     523 | #define __struct_size(p)        __builtin_dynamic_object_size(p, 0)
         |                                                               ^
   include/linux/fortify-string.h:626:27: note: expanded from macro '__fortify_memcpy_chk'
     626 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   drivers/scsi/aic94xx/aic94xx_task.c:375:15: error: no member named 'ata_task' in 'struct scb'
     375 |                 memcpy(scb->ata_task.atapi_packet, task->ata_task.atapi_packet,
         |                        ~~~  ^
   include/linux/fortify-string.h:690:17: note: expanded from macro 'memcpy'
     690 |                 __member_size(p), __member_size(q),                     \
         |                               ^
   include/linux/compiler_types.h:524:56: note: expanded from macro '__member_size'
     524 | #define __member_size(p)        __builtin_dynamic_object_size(p, 1)
         |                                                               ^
   include/linux/fortify-string.h:628:33: note: expanded from macro '__fortify_memcpy_chk'
     628 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   drivers/scsi/aic94xx/aic94xx_task.c:375:15: error: no member named 'ata_task' in 'struct scb'
     375 |                 memcpy(scb->ata_task.atapi_packet, task->ata_task.atapi_packet,
         |                        ~~~  ^
   include/linux/fortify-string.h:688:47: note: expanded from macro 'memcpy'
     688 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                                               ^
   include/linux/fortify-string.h:643:20: note: expanded from macro '__fortify_memcpy_chk'
     643 |         __underlying_##op(p, q, __copy_size);                           \
         |                           ^
   drivers/scsi/aic94xx/aic94xx_task.c:377:7: error: no member named 'ata_task' in 'struct scb'
     377 |         scb->ata_task.sister_scb = cpu_to_le16(0xFFFF);
         |         ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:378:7: error: no member named 'ata_task' in 'struct scb'
     378 |         scb->ata_task.conn_handle = cpu_to_le16(
         |         ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:389:8: error: no member named 'ata_task' in 'struct scb'
     389 |                 scb->ata_task.ata_flags = flags;
         |                 ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:391:8: error: no member named 'ata_task' in 'struct scb'
     391 |                 scb->ata_task.retry_count = 0;
         |                 ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:393:8: error: no member named 'ata_task' in 'struct scb'
     393 |                 scb->ata_task.flags = 0;
         |                 ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:398:40: error: no member named 'ata_task' in 'struct scb'
     398 |                 res = asd_map_scatterlist(task, scb->ata_task.sg_element,
         |                                                 ~~~  ^
>> drivers/scsi/aic94xx/aic94xx_task.c:427:7: error: no member named 'smp_task' in 'struct scb'
     427 |         scb->smp_task.proto_conn_rate = dev->linkrate;
         |         ~~~  ^
   drivers/scsi/aic94xx/aic94xx_task.c:429:7: error: no member named 'smp_task' in 'struct scb'
     429 |         scb->smp_task.smp_req.bus_addr =
         |         ~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +427 drivers/scsi/aic94xx/aic94xx_task.c

2908d778ab3e24 James Bottomley   2006-08-29  410  
2908d778ab3e24 James Bottomley   2006-08-29  411  static int asd_build_smp_ascb(struct asd_ascb *ascb, struct sas_task *task,
3cc27547d6ee2d Al Viro           2006-09-25  412  			      gfp_t gfp_flags)
2908d778ab3e24 James Bottomley   2006-08-29  413  {
2908d778ab3e24 James Bottomley   2006-08-29  414  	struct asd_ha_struct *asd_ha = ascb->ha;
2908d778ab3e24 James Bottomley   2006-08-29  415  	struct domain_device *dev = task->dev;
2908d778ab3e24 James Bottomley   2006-08-29  416  	struct scb *scb;
2908d778ab3e24 James Bottomley   2006-08-29  417  
3a21986f1a5974 Christoph Hellwig 2018-10-11  418  	dma_map_sg(&asd_ha->pcidev->dev, &task->smp_task.smp_req, 1,
3a21986f1a5974 Christoph Hellwig 2018-10-11  419  		   DMA_TO_DEVICE);
3a21986f1a5974 Christoph Hellwig 2018-10-11  420  	dma_map_sg(&asd_ha->pcidev->dev, &task->smp_task.smp_resp, 1,
3a21986f1a5974 Christoph Hellwig 2018-10-11  421  		   DMA_FROM_DEVICE);
2908d778ab3e24 James Bottomley   2006-08-29  422  
2908d778ab3e24 James Bottomley   2006-08-29  423  	scb = ascb->scb;
2908d778ab3e24 James Bottomley   2006-08-29  424  
2908d778ab3e24 James Bottomley   2006-08-29  425  	scb->header.opcode = INITIATE_SMP_TASK;
2908d778ab3e24 James Bottomley   2006-08-29  426  
2908d778ab3e24 James Bottomley   2006-08-29 @427  	scb->smp_task.proto_conn_rate = dev->linkrate;
2908d778ab3e24 James Bottomley   2006-08-29  428  
2908d778ab3e24 James Bottomley   2006-08-29  429  	scb->smp_task.smp_req.bus_addr =
2908d778ab3e24 James Bottomley   2006-08-29  430  		cpu_to_le64((u64)sg_dma_address(&task->smp_task.smp_req));
2908d778ab3e24 James Bottomley   2006-08-29  431  	scb->smp_task.smp_req.size =
2908d778ab3e24 James Bottomley   2006-08-29  432  		cpu_to_le32((u32)sg_dma_len(&task->smp_task.smp_req)-4);
2908d778ab3e24 James Bottomley   2006-08-29  433  
2908d778ab3e24 James Bottomley   2006-08-29  434  	scb->smp_task.smp_resp.bus_addr =
2908d778ab3e24 James Bottomley   2006-08-29  435  		cpu_to_le64((u64)sg_dma_address(&task->smp_task.smp_resp));
2908d778ab3e24 James Bottomley   2006-08-29  436  	scb->smp_task.smp_resp.size =
2908d778ab3e24 James Bottomley   2006-08-29  437  		cpu_to_le32((u32)sg_dma_len(&task->smp_task.smp_resp)-4);
2908d778ab3e24 James Bottomley   2006-08-29  438  
2908d778ab3e24 James Bottomley   2006-08-29  439  	scb->smp_task.sister_scb = cpu_to_le16(0xFFFF);
2908d778ab3e24 James Bottomley   2006-08-29  440  	scb->smp_task.conn_handle = cpu_to_le16((u16)
2908d778ab3e24 James Bottomley   2006-08-29  441  						(unsigned long)dev->lldd_dev);
2908d778ab3e24 James Bottomley   2006-08-29  442  
2908d778ab3e24 James Bottomley   2006-08-29  443  	ascb->tasklet_complete = asd_task_tasklet_complete;
2908d778ab3e24 James Bottomley   2006-08-29  444  
2908d778ab3e24 James Bottomley   2006-08-29  445  	return 0;
2908d778ab3e24 James Bottomley   2006-08-29  446  }
2908d778ab3e24 James Bottomley   2006-08-29  447  

:::::: The code at line 427 was first introduced by commit
:::::: 2908d778ab3e244900c310974e1fc1c69066e450 [SCSI] aic94xx: new driver

:::::: TO: James Bottomley <James.Bottomley@SteelEye.com>
:::::: CC: James Bottomley <jejb@mulgrave.il.steeleye.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
