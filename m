Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20AE35DA6C;
	Tue, 14 Jul 2026 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037566; cv=none; b=rwglYQP0Qj35KJEyQX7D/UtnJY4GWKGx8DwOr0tPggfoZvVd3YmxNo6MSfvavRt0X6214h83MwfNcnomh3yvlowCWYQq4MLAGIiQBz9id8PSyCcyS/wrB0MDR6uxV7t2vLYRWGrrCEdJqf471Km5f5dOLGsU3DiH9PEmKWCj0h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037566; c=relaxed/simple;
	bh=MkZmBpIuWtnvBdEMvXQllbhJ3k6fd1KBv2cGQQreuxY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RAgIbFzWhkka/c/sTQxnTQq0fQmh7tKvvj4dHrJb2Gl5sQ2Umn/GV5Jh3OAMTRqd8lNLe3AREq5+zsTDpUQxwct9olktfKHSgsGXBicck45iqf36y5XD9ewv99JlsngNnEKNnjIYCEOamjrV/rjLgOVxkcI7yVNGrjJ7M12eBR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4RIyCsp; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4RIyCsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784037560; x=1815573560;
  h=date:from:to:cc:subject:message-id;
  bh=MkZmBpIuWtnvBdEMvXQllbhJ3k6fd1KBv2cGQQreuxY=;
  b=f4RIyCspAA0d7G0YodjpoyJexuFGbxPKZI0OX49gqDqELmAYj7xW9InE
   BsAe1f3JbpA9iuHyCv1Uvz8yY3ouqC7va7eUNhbahB7TrX7hkCBccSqtW
   iyncFA4ynN2BxhaA+YpyVzl08ZCEr+wUxgk58osgdjgx3gNWaxDUwGwKo
   sJo32i0C6DEkpGU9DiKyfkins3Gozd7l2rzcxycNifExp9dWbji4dLliV
   T73etEZL+2XwmsS7XMSUonvudY92uPtSSsljuqmj2P2FGyPmE49Ol7ClZ
   kIP4ONet+shvbBSFN6a4iTATsPTiX58l4ox1zK2v/+zgt7g+1sFvEbuWU
   w==;
X-CSE-ConnectionGUID: 1CrYrwoMQES+s33YGRLQrg==
X-CSE-MsgGUID: bueqBebgQ0eXw6nVXZhl/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95011689"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95011689"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 06:59:17 -0700
X-CSE-ConnectionGUID: w3u4jIA7Rp6GnGQfEE0D8g==
X-CSE-MsgGUID: abTeTjTZRP2iTms9f3t9JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="249511377"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2026 06:59:15 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjdfE-00000000405-3n04;
	Tue, 14 Jul 2026 13:59:12 +0000
Date: Tue, 14 Jul 2026 15:58:59 +0200
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Nilesh Javali <njavali@marvell.com>,
 Hannes Reinecke <hare@kernel.org>
Subject: drivers/scsi/qla2xxx/qla_sup.c:319:28: warning: variable
 'chunk_count' set but not used
Message-ID: <202607141520.k9T31Dpp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/scsi-qla2xxx-Add-29xx-series-PCI-device-ID-support/20260714-180455
head:   a91be341107d322b5c157a8eb685f7d8d4d9277b
commit: 16cd00c766b785eeb125dbd4f768b64ad26ce4c3 scsi: qla2xxx: Add flash read/write interface for 29xx
date:   4 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260714/202607141520.k9T31Dpp-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607141520.k9T31Dpp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141520.k9T31Dpp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_sup.c:319:28: warning: variable 'chunk_count' set but not used [-Wunused-but-set-variable]
     319 |         uint16_t chunk_index = 0, chunk_count = 0;
         |                                   ^
   drivers/scsi/qla2xxx/qla_sup.c:447:28: warning: variable 'chunk_count' set but not used [-Wunused-but-set-variable]
     447 |         uint16_t chunk_index = 0, chunk_count = 0;
         |                                   ^
   2 warnings generated.


vim +/chunk_count +319 drivers/scsi/qla2xxx/qla_sup.c

   290	
   291	/**
   292	 * qla29xx_write_optrom_data - Write data to the optrom for QLA29xx adapters.
   293	 * @vha: Pointer to SCSI QLogic host structure.
   294	 * @reg_code: Region code to write to.
   295	 * @opts: Options for the write operation.
   296	 * @buf: Buffer containing the data to write.
   297	 * @offset: Offset within the region to start writing.
   298	 * @length: Length of data to write.
   299	 *
   300	 * This function writes data to the specified optrom region for QLA29xx adapters.
   301	 *
   302	 * Returns 0 on success or a negative error code on failure.
   303	 */
   304	int
   305	qla29xx_write_optrom_data(struct scsi_qla_host *vha, uint16_t reg_code,
   306				 uint16_t opts, void *buf, uint32_t offset,
   307				 uint32_t length)
   308	{
   309		struct qla_hw_data *ha = vha->hw;
   310		struct qla_flt_region_data region;
   311		dma_addr_t optrom_dma;
   312		uint32_t faddr, left, burst;
   313		uint32_t img_len, seg_dlen;
   314		uint32_t region_len, region_dlen;
   315		void *optrom;
   316		uint8_t *pbuf;
   317		int rval = -EINVAL;
   318		uint16_t total_segments, segment_index = 0;
 > 319		uint16_t chunk_index = 0, chunk_count = 0;
   320	
   321		memset(&region, 0, sizeof(region));
   322	
   323		optrom = dma_alloc_coherent(&ha->pdev->dev, OPTROM_BURST_SIZE,
   324					    &optrom_dma, GFP_KERNEL);
   325		if (!optrom) {
   326			ql_log(ql_log_warn, vha, 0x0090,
   327			    "Unable to allocate memory for optrom burst read (%x KB).\n",
   328			    OPTROM_BURST_SIZE / 1024);
   329			return -ENOMEM;
   330		}
   331	
   332		if (ha->flags.valid_flt && length == 0) {
   333			/* Get image length and segment length from FLT */
   334			rval = qla29xx_get_flash_region(vha, reg_code, &region);
   335			if (rval != QLA_SUCCESS) {
   336				ql_log(ql_log_warn, vha, 0x0092,
   337					"Invalid address %x - not a region start address\n",
   338					reg_code);
   339				goto free_buf;
   340			}
   341			img_len = le32_to_cpu(region.image_length);
   342		} else {
   343			img_len = length;
   344		}
   345	
   346		seg_dlen = ha->flt_segment_length >> 2;
   347		region_len = (length > 0) ? length : img_len;
   348		region_dlen = (region_len >> 2);
   349		total_segments = (region_dlen + seg_dlen - 1) / seg_dlen;
   350	
   351		faddr = offset >> 2;
   352		left = region_dlen;
   353		burst = OPTROM_BURST_DWORDS;
   354		pbuf = buf;
   355	
   356		while (region_dlen > 0) {
   357			uint32_t segment_size, total_chunks;
   358			uint16_t options = 0;
   359	
   360			segment_size = (region_dlen > seg_dlen) ? seg_dlen : region_dlen;
   361			total_chunks = (segment_size + OPTROM_BURST_DWORDS - 1) /
   362					OPTROM_BURST_DWORDS;
   363	
   364			burst = OPTROM_BURST_DWORDS;
   365			if (burst > left)
   366				burst = left;
   367			if (burst > segment_size - chunk_index * OPTROM_BURST_DWORDS)
   368				burst = segment_size - chunk_index * OPTROM_BURST_DWORDS;
   369	
   370			set_segment_bits(&options, segment_index, total_segments);
   371			set_chunk_bits(&options, chunk_index, total_chunks);
   372	
   373			/* flash block write operations */
   374			SET_FW_BIT(options, BIT_6);
   375			CLEAR_FW_BIT(options, BIT_9);
   376	
   377			check_and_set_mbc_bits(opts, options, BIT_15, BIT_15);
   378			check_and_set_mbc_bits(opts, options, BIT_7, BIT_7);
   379	
   380			if (segment_index == total_segments - 1 &&
   381			    chunk_index == total_chunks - 1)
   382				check_and_set_mbc_bits(opts, options, BIT_8, BIT_8);
   383	
   384			memcpy(optrom, pbuf, burst * 4);
   385	
   386			/* faddr is offset relative to region code */
   387			rval = qla29xx_flash_block_write(vha, optrom_dma,
   388					faddr, burst, reg_code, options);
   389			if (rval) {
   390				ql_log(ql_log_warn, vha, 0x0095,
   391				    "Unable to burst-write optrom segment (%x/%x/%llx).\n",
   392				    rval, faddr, (unsigned long long)optrom_dma);
   393	
   394				dma_free_coherent(&ha->pdev->dev, OPTROM_BURST_SIZE,
   395				    optrom, optrom_dma);
   396				goto exit_write;
   397			}
   398	
   399			left -= burst;
   400			faddr += burst;
   401			pbuf += burst * 4;
   402			chunk_index++;
   403			chunk_count++;
   404			if (chunk_index >= total_chunks) {
   405				chunk_index = 0;
   406				segment_index++;
   407				region_dlen -= segment_size;
   408			}
   409		}
   410	
   411	free_buf:
   412		dma_free_coherent(&ha->pdev->dev, OPTROM_BURST_SIZE, optrom,
   413		    optrom_dma);
   414		return rval;
   415	
   416	exit_write:
   417		return rval;
   418	}
   419	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
