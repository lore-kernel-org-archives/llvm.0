Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE94368277;
	Sun,  9 Aug 2026 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786259297; cv=none; b=pqvoDZvhA8lWa7smaa0ppxxMIxdOHIx325N7ebjUn8jJ9RWc2EkRNSDeY1Va9UrQSQ3rBDLyj799WBCpHnM5IbcVMqpYtziZgIJUbMLc4ZqtFJYU6GTi7dcvamqv+P4r/xiu74YjVdSmNokil/eOQ5jF7ARmYuy+1IPDu1NRb/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786259297; c=relaxed/simple;
	bh=P7RO58WtIeoSdwV984A4UZ6jTlYj4yP4zKHxE6UHa4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FTil+qFbhiKE1ooAO3MfvaZcEMz1WnMtJi1Q53zKeVP2oeTjPKCuNftOlikFjTPGXDh0GopkShpO+H+ioLFSTCHlX2pcSCK8Dh+VvXjUZR5Is5Gn6UkpBr16bJydpDkOReViyfmC52pzQrCTUl9oX4tfjbXedRgLgrOW6y+fzgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+G0Y1MA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+G0Y1MA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786259295; x=1817795295;
  h=date:from:to:cc:subject:message-id;
  bh=P7RO58WtIeoSdwV984A4UZ6jTlYj4yP4zKHxE6UHa4c=;
  b=a+G0Y1MA8/DWVQInP1TMgPwLjUsbQhxA+Iqkeu7kyeapSk2MrL/0mb1/
   9YoGGcRf7bp9IdaYHGio+mgeUjAfoBJMpGk4vwyF/WCk+Tf6CzOsDoWje
   4jWw3wAC16K60tEPI/JHMt02/vqs8oqhR0UAVF2yAU6WKx39HBXIDBLhg
   bNHYupLTZXG65b2UmIkAc3+63+gNk2qpIcMn9A3m2aRsmAtOrwo+DZT/5
   86+AMQy8ZRWt/9fHx8CljjAYFL37YOb8tVI9vR5+fGgY5+CSpANF7nVlY
   G4LPbHhgJY4BdDCN/76+32BhmAa3FIAERjoOfGwR+GW+OjqXi0WGv+cMd
   Q==;
X-CSE-ConnectionGUID: Be/LDRwpRnuKHkUDAAE/3A==
X-CSE-MsgGUID: PYKiBGF/RT6+9wLIq5DqyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="85774577"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="85774577"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 00:08:14 -0700
X-CSE-ConnectionGUID: oQiB9vmLQnqsLT3z6W95nA==
X-CSE-MsgGUID: 4PsuPFVzTfmvnTV6/7tp6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="286156760"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Aug 2026 00:08:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsxdh-00000000LXu-0uHF;
	Sun, 09 Aug 2026 07:08:09 +0000
Date: Sun, 09 Aug 2026 15:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Anil Gurumurthy <agurumurthy@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Martin K. Petersen (Oracle)" <mkp@kernel.org>,
 Nilesh Javali <njavali@marvell.com>, Hannes Reinecke <hare@kernel.org>
Subject: [mkp-scsi:for-next 112/210]
 drivers/scsi/qla2xxx/qla_init.c:9211:8: warning: format specifies type
 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202608091309.DUR23G15-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   15b7fe6db602d0202761902d2c50bc1e8bbe6cea
commit: b6781d71a41450418a1486122978ad5bb429136b [112/210] scsi: qla2xxx: Update IO path to use 128-byte IOCBs for 29xx
config: i386-randconfig-002-20260808 (https://download.01.org/0day-ci/archive/20260809/202608091309.DUR23G15-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608091309.DUR23G15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608091309.DUR23G15-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_init.c:9211:8: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    9209 |                             "TIM section too large (0x%x bytes, ring 0x%lx bytes).\n",
         |                                                                        ~~~
         |                                                                        %zx
    9210 |                             section_size,
    9211 |                             req->length * qla_req_entry_size(ha));
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/scsi/qla2xxx/qla_init.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:12:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:5:
   In file included from arch/x86/include/asm/processor.h:20:
   In file included from arch/x86/include/asm/page.h:14:
   In file included from arch/x86/include/asm/page_32.h:18:
   In file included from include/linux/string.h:383:
   include/linux/fortify-string.h:530:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     530 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   2 warnings generated.


vim +9211 drivers/scsi/qla2xxx/qla_init.c

c3930ec119cb91 Manish Rangankar 2026-07-23  9182  
c3930ec119cb91 Manish Rangankar 2026-07-23  9183  static int qla29xx_process_rd_image(struct scsi_qla_host *vha,
c3930ec119cb91 Manish Rangankar 2026-07-23  9184  				    struct fcop_header *header,
c3930ec119cb91 Manish Rangankar 2026-07-23  9185  				    __be32 *fwcode, int section,
c3930ec119cb91 Manish Rangankar 2026-07-23  9186  				    uint32_t risc_addr, uint32_t section_size)
c3930ec119cb91 Manish Rangankar 2026-07-23  9187  {
c3930ec119cb91 Manish Rangankar 2026-07-23  9188  	int rval = QLA_SUCCESS;
c3930ec119cb91 Manish Rangankar 2026-07-23  9189  	uint32_t *dcode = NULL;
c3930ec119cb91 Manish Rangankar 2026-07-23  9190  	struct qla_hw_data *ha = vha->hw;
c3930ec119cb91 Manish Rangankar 2026-07-23  9191  	struct req_que *req = ha->req_q_map[0];
c3930ec119cb91 Manish Rangankar 2026-07-23  9192  	int num_segments = 0, segment = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9193  	int chunks_per_segment = 0, chunk = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9194  	int is_first_chunk = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9195  	int is_last_chunk = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9196  	int is_first_segment = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9197  	int is_last_segment = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9198  	int opt = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9199  	uint32_t size = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9200  	uint32_t size_remainder = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9201  	uint32_t seg_size_remainder = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9202  	int i = 0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9203  
c3930ec119cb91 Manish Rangankar 2026-07-23  9204  	dcode = (uint32_t *)req->ring;
c3930ec119cb91 Manish Rangankar 2026-07-23  9205  
c3930ec119cb91 Manish Rangankar 2026-07-23  9206  	if (section == TIM) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9207  		if (section_size > req->length * qla_req_entry_size(ha)) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9208  			ql_log(ql_log_fatal, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9209  			    "TIM section too large (0x%x bytes, ring 0x%lx bytes).\n",
c3930ec119cb91 Manish Rangankar 2026-07-23  9210  			    section_size,
c3930ec119cb91 Manish Rangankar 2026-07-23 @9211  			    req->length * qla_req_entry_size(ha));
c3930ec119cb91 Manish Rangankar 2026-07-23  9212  			return QLA_FUNCTION_FAILED;
c3930ec119cb91 Manish Rangankar 2026-07-23  9213  		}
c3930ec119cb91 Manish Rangankar 2026-07-23  9214  
c3930ec119cb91 Manish Rangankar 2026-07-23  9215  		opt = BIT_15 | BIT_2 | BIT_1 | BIT_0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9216  		for (i = 0; i < (section_size >> 2); i++)
c3930ec119cb91 Manish Rangankar 2026-07-23  9217  			dcode[i] = swab32((__force u32)fwcode[i]);
c3930ec119cb91 Manish Rangankar 2026-07-23  9218  
c3930ec119cb91 Manish Rangankar 2026-07-23  9219  		ql_dbg(ql_dbg_init, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9220  		       "TIM : process_rd_image [opt 0x%x]\n", opt);
c3930ec119cb91 Manish Rangankar 2026-07-23  9221  		rval = qla2x00_load_ram(vha, req->dma, risc_addr,
c3930ec119cb91 Manish Rangankar 2026-07-23  9222  					section_size >> 2, opt);
c3930ec119cb91 Manish Rangankar 2026-07-23  9223  		if (rval) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9224  			ql_log(ql_log_fatal, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9225  			       "-> Failed load TIM\n");
c3930ec119cb91 Manish Rangankar 2026-07-23  9226  			return QLA_FUNCTION_FAILED;
c3930ec119cb91 Manish Rangankar 2026-07-23  9227  		}
c3930ec119cb91 Manish Rangankar 2026-07-23  9228  	} else {
c3930ec119cb91 Manish Rangankar 2026-07-23  9229  		size_remainder = section_size;
c3930ec119cb91 Manish Rangankar 2026-07-23  9230  		num_segments += (section_size % header->segment_size == 0) ?
c3930ec119cb91 Manish Rangankar 2026-07-23  9231  			(section_size / header->segment_size) :
c3930ec119cb91 Manish Rangankar 2026-07-23  9232  			(section_size / header->segment_size) + 1;
c3930ec119cb91 Manish Rangankar 2026-07-23  9233  		chunks_per_segment =
c3930ec119cb91 Manish Rangankar 2026-07-23  9234  			(header->segment_size % CHUNK_SIZE == 0) ?
c3930ec119cb91 Manish Rangankar 2026-07-23  9235  			(header->segment_size / CHUNK_SIZE) :
c3930ec119cb91 Manish Rangankar 2026-07-23  9236  			(header->segment_size / CHUNK_SIZE) + 1;
c3930ec119cb91 Manish Rangankar 2026-07-23  9237  
c3930ec119cb91 Manish Rangankar 2026-07-23  9238  		ql_dbg(ql_dbg_init, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9239  		       "num seg 0x%x chunk per seg 0x%x\n",
c3930ec119cb91 Manish Rangankar 2026-07-23  9240  		       num_segments, chunks_per_segment);
c3930ec119cb91 Manish Rangankar 2026-07-23  9241  
c3930ec119cb91 Manish Rangankar 2026-07-23  9242  		for (segment = 0; segment < num_segments; segment++) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9243  			for (chunk = 0; chunk < chunks_per_segment; chunk++) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9244  				is_first_chunk = (chunk == 0);
c3930ec119cb91 Manish Rangankar 2026-07-23  9245  				if (chunk == 0) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9246  					if (size_remainder >=
c3930ec119cb91 Manish Rangankar 2026-07-23  9247  					    header->segment_size)
c3930ec119cb91 Manish Rangankar 2026-07-23  9248  						seg_size_remainder =
c3930ec119cb91 Manish Rangankar 2026-07-23  9249  							header->segment_size;
c3930ec119cb91 Manish Rangankar 2026-07-23  9250  					else
c3930ec119cb91 Manish Rangankar 2026-07-23  9251  						seg_size_remainder =
c3930ec119cb91 Manish Rangankar 2026-07-23  9252  							size_remainder;
c3930ec119cb91 Manish Rangankar 2026-07-23  9253  				}
c3930ec119cb91 Manish Rangankar 2026-07-23  9254  
c3930ec119cb91 Manish Rangankar 2026-07-23  9255  				is_first_segment =
c3930ec119cb91 Manish Rangankar 2026-07-23  9256  					(section == ARR1 && segment == 0);
c3930ec119cb91 Manish Rangankar 2026-07-23  9257  				is_last_segment =
c3930ec119cb91 Manish Rangankar 2026-07-23  9258  					(section == ARR2 &&
c3930ec119cb91 Manish Rangankar 2026-07-23  9259  					 (segment == (num_segments - 1)));
c3930ec119cb91 Manish Rangankar 2026-07-23  9260  				is_last_chunk =
c3930ec119cb91 Manish Rangankar 2026-07-23  9261  					(chunk == (chunks_per_segment - 1) ||
c3930ec119cb91 Manish Rangankar 2026-07-23  9262  					 size_remainder <= CHUNK_SIZE);
c3930ec119cb91 Manish Rangankar 2026-07-23  9263  
c3930ec119cb91 Manish Rangankar 2026-07-23  9264  				if (seg_size_remainder < CHUNK_SIZE)
c3930ec119cb91 Manish Rangankar 2026-07-23  9265  					size = seg_size_remainder % CHUNK_SIZE;
c3930ec119cb91 Manish Rangankar 2026-07-23  9266  				else
c3930ec119cb91 Manish Rangankar 2026-07-23  9267  					size = CHUNK_SIZE;
c3930ec119cb91 Manish Rangankar 2026-07-23  9268  
c3930ec119cb91 Manish Rangankar 2026-07-23  9269  				ql_dbg(ql_dbg_init, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9270  				       "[%d]chunk 0x%x segment 0x%x first_segment 0x%x first_chunk 0x%x last_segment 0x%x last_chunk 0x%x\n",
c3930ec119cb91 Manish Rangankar 2026-07-23  9271  				       __LINE__, chunk, segment,
c3930ec119cb91 Manish Rangankar 2026-07-23  9272  				       is_first_segment, is_first_chunk,
c3930ec119cb91 Manish Rangankar 2026-07-23  9273  				       is_last_segment, is_last_chunk);
c3930ec119cb91 Manish Rangankar 2026-07-23  9274  
c3930ec119cb91 Manish Rangankar 2026-07-23  9275  				opt = BIT_2;
c3930ec119cb91 Manish Rangankar 2026-07-23  9276  				if (is_first_chunk)
c3930ec119cb91 Manish Rangankar 2026-07-23  9277  					opt |= BIT_0;
c3930ec119cb91 Manish Rangankar 2026-07-23  9278  				if (is_last_chunk)
c3930ec119cb91 Manish Rangankar 2026-07-23  9279  					opt |= BIT_1;
c3930ec119cb91 Manish Rangankar 2026-07-23  9280  				if (is_first_segment)
c3930ec119cb91 Manish Rangankar 2026-07-23  9281  					opt |= BIT_3;
c3930ec119cb91 Manish Rangankar 2026-07-23  9282  				if (is_last_segment)
c3930ec119cb91 Manish Rangankar 2026-07-23  9283  					opt |= BIT_4;
c3930ec119cb91 Manish Rangankar 2026-07-23  9284  
c3930ec119cb91 Manish Rangankar 2026-07-23  9285  				for (i = 0; i < (size >> 2); i++)
c3930ec119cb91 Manish Rangankar 2026-07-23  9286  					dcode[i] =
c3930ec119cb91 Manish Rangankar 2026-07-23  9287  					    swab32((__force u32)fwcode[i]);
c3930ec119cb91 Manish Rangankar 2026-07-23  9288  
c3930ec119cb91 Manish Rangankar 2026-07-23  9289  				ql_dbg(ql_dbg_init, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9290  				       "ARR[0x%x] : opt 0x%x\n", size, opt);
c3930ec119cb91 Manish Rangankar 2026-07-23  9291  				rval = qla2x00_load_ram(vha, req->dma,
c3930ec119cb91 Manish Rangankar 2026-07-23  9292  							risc_addr,
c3930ec119cb91 Manish Rangankar 2026-07-23  9293  							size >> 2, opt);
c3930ec119cb91 Manish Rangankar 2026-07-23  9294  				if (rval) {
c3930ec119cb91 Manish Rangankar 2026-07-23  9295  					ql_log(ql_log_fatal, vha, 0x0098,
c3930ec119cb91 Manish Rangankar 2026-07-23  9296  					       "-> Failed load ram\n");
c3930ec119cb91 Manish Rangankar 2026-07-23  9297  					return QLA_FUNCTION_FAILED;
c3930ec119cb91 Manish Rangankar 2026-07-23  9298  				}
c3930ec119cb91 Manish Rangankar 2026-07-23  9299  
c3930ec119cb91 Manish Rangankar 2026-07-23  9300  				fwcode += size >> 2;
c3930ec119cb91 Manish Rangankar 2026-07-23  9301  				size_remainder -= size;
c3930ec119cb91 Manish Rangankar 2026-07-23  9302  				seg_size_remainder -= size;
c3930ec119cb91 Manish Rangankar 2026-07-23  9303  				if (size_remainder == 0)
c3930ec119cb91 Manish Rangankar 2026-07-23  9304  					break;
c3930ec119cb91 Manish Rangankar 2026-07-23  9305  			}
c3930ec119cb91 Manish Rangankar 2026-07-23  9306  			risc_addr += header->segment_size >> 2;
c3930ec119cb91 Manish Rangankar 2026-07-23  9307  		}
c3930ec119cb91 Manish Rangankar 2026-07-23  9308  	}
c3930ec119cb91 Manish Rangankar 2026-07-23  9309  	return rval;
c3930ec119cb91 Manish Rangankar 2026-07-23  9310  }
c3930ec119cb91 Manish Rangankar 2026-07-23  9311  

:::::: The code at line 9211 was first introduced by commit
:::::: c3930ec119cb916be879c017ea1e389e05dbe1aa scsi: qla2xxx: Add FC operational firmware load for 29xx

:::::: TO: Manish Rangankar <mrangankar@marvell.com>
:::::: CC: Martin K. Petersen (Oracle) <mkp@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
