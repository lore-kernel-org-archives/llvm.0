Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53DE2AD35;
	Sun, 13 Sep 2026 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789337772; cv=none; b=Bv3sGjapZTg0bTmn8Dii+ZnxzXis2eagjRTybxRCaNel3d1BmK4HiWC3iBMr8MbAzVX31J5PlkjNIh+cBxEutrneLWv03unt/YPUTD6/o3nLhQt50M+3jqH6quL5bE2nJ+Ur7bT3GQJVMSFPqelm32mKulZeYFO2C7obI2dEYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789337772; c=relaxed/simple;
	bh=ecFsenRlS3xp2E6Al8LiFV2CwaAIMNeSQ1XqXbuNq1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tr9DqyPrqpZTDnOQIo/hYz6x98DGvz09P+rpDRY2xWqkZe3lnYOROCgzis1UCj5NVO7tT5Nlsm99F4N9uPKBKTK/vJa7ocRlagGuUTpPGhRaitoGA9r3E9ejAZp6T2pgkp8z1xoNS2x1XogC61vpY2vZ0kqf53w2jCdAesDrXUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuBRF6zp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuBRF6zp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789337768; x=1820873768;
  h=date:from:to:cc:subject:message-id;
  bh=ecFsenRlS3xp2E6Al8LiFV2CwaAIMNeSQ1XqXbuNq1w=;
  b=NuBRF6zpZ/jdXdMndURpuV7OVdjzxRuhfhOqLCxSiALs74Sn48eGJQqF
   HjnWwUb6IAwrJtuGpSm8xmkr3irPnLNk0U8BHLzu7DBq9oHhZG8fE0ahy
   ZSy2JRhjg3vqE/Rxi/MKDd9PsXZ6DxrgcnwZFyE78XMuM/ZK30Cu9qXY/
   y4x5ZejWUjb6/Vfw4PAtLVdXFTScwaA8uGHrNDUds9Vlq6hfmsPoA18pS
   s32/aNAGb2oniRydWQpECO4HTPLCKtnNtR4j+Yu/pYRy6HcZLbifa6qbW
   CcZMfapCh/0GkWyMhLZZgGxY8VvvAPDlnrQPRPnT0ed6bU4IzafoQ3mfx
   Q==;
X-CSE-ConnectionGUID: wxuxflInQaeEq8PPndGc7A==
X-CSE-MsgGUID: K5rvjn+VSNCp92Hqq85HNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89727124"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89727124"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 15:16:08 -0700
X-CSE-ConnectionGUID: vxcxvetuTSGcIiIkaodBkw==
X-CSE-MsgGUID: cRqMoqFcQcmhkLI2Mttivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="295963867"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2026 15:16:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5sUU-000000001ML-4BgW;
	Sun, 13 Sep 2026 22:16:02 +0000
Date: Mon, 14 Sep 2026 06:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 163/169]
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:599:3: error: cannot jump from
 this goto statement to its label
Message-ID: <202609140614.KMCttn8e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   357c2e168b861a3df80c68a9c44de9c9c282ec46
commit: 6757a837e28b868ce4068fb422f168f92ced6c1a [163/169] media: ipu6: Serialise access to stream pointers by isys stream_lock
config: i386-randconfig-012-20260913 (https://download.01.org/0day-ci/archive/20260914/202609140614.KMCttn8e-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609140614.KMCttn8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609140614.KMCttn8e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:599:3: error: cannot jump from this goto statement to its label
     599 |                 goto leave;
         |                 ^
   drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:602:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     602 |         guard(spinlock_irqsave)(&isys->streams_lock);
         |         ^
   include/linux/cleanup.h:423:2: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:303:3: note: expanded from macro 'CLASS'
     303 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:27:1: note: expanded from here
      27 | class_spinlock_irqsave_constructor
         | ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:33:1: note: expanded from here
      33 | __UNIQUE_ID_unlock_437
         | ^
   drivers/media/pci/intel/ipu6/ipu7-fw-isys.c:602:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
   include/linux/cleanup.h:423:15: note: expanded from macro 'guard'
     423 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:165:2: note: expanded from macro '__UNIQUE_ID'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^
   include/linux/compiler_types.h:16:23: note: expanded from macro '__PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^
   include/linux/compiler_types.h:15:24: note: expanded from macro '___PASTE'
      15 | #define ___PASTE(a, b) a##b
         |                        ^
   <scratch space>:21:1: note: expanded from here
      21 | __UNIQUE_ID_guard_436
         | ^
   1 error generated.


vim +599 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c

f268203d74ff25 Antti Laakso 2026-08-27  542  
f268203d74ff25 Antti Laakso 2026-08-27  543  static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
f268203d74ff25 Antti Laakso 2026-08-27  544  {
f268203d74ff25 Antti Laakso 2026-08-27  545  	struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
f268203d74ff25 Antti Laakso 2026-08-27  546  	struct ipu6_isys_stream *stream = NULL;
f268203d74ff25 Antti Laakso 2026-08-27  547  	struct device *dev = &adev->auxdev.dev;
f268203d74ff25 Antti Laakso 2026-08-27  548  	struct ipu6_isys_csi2 *csi2 = NULL;
f268203d74ff25 Antti Laakso 2026-08-27  549  	struct ipu7_fw_isys_msg_err err_info;
f268203d74ff25 Antti Laakso 2026-08-27  550  	struct isys_fw_msgs *isys_fw_msg;
f268203d74ff25 Antti Laakso 2026-08-27  551  	struct ipu7_insys_resp *resp;
f268203d74ff25 Antti Laakso 2026-08-27  552  	u64 ts;
f268203d74ff25 Antti Laakso 2026-08-27  553  
f268203d74ff25 Antti Laakso 2026-08-27  554  	if (!isys->fwctx)
f268203d74ff25 Antti Laakso 2026-08-27  555  		return 1;
f268203d74ff25 Antti Laakso 2026-08-27  556  
f268203d74ff25 Antti Laakso 2026-08-27  557  	resp = ipu7_fw_isys_get_resp(isys);
f268203d74ff25 Antti Laakso 2026-08-27  558  	if (!resp)
f268203d74ff25 Antti Laakso 2026-08-27  559  		return 1;
f268203d74ff25 Antti Laakso 2026-08-27  560  
f268203d74ff25 Antti Laakso 2026-08-27  561  	if (resp->type >= N_IPU7_INSYS_RESP_TYPE) {
f268203d74ff25 Antti Laakso 2026-08-27  562  		dev_err(dev, "Unknown response type %u stream %u\n",
f268203d74ff25 Antti Laakso 2026-08-27  563  			resp->type, resp->stream_id);
f268203d74ff25 Antti Laakso 2026-08-27  564  		ipu7_fw_isys_put_resp(isys);
f268203d74ff25 Antti Laakso 2026-08-27  565  		return 1;
f268203d74ff25 Antti Laakso 2026-08-27  566  	}
f268203d74ff25 Antti Laakso 2026-08-27  567  
f268203d74ff25 Antti Laakso 2026-08-27  568  	err_info = resp->error_info;
f268203d74ff25 Antti Laakso 2026-08-27  569  	ts = ((u64)resp->timestamp[1] << 32) | resp->timestamp[0];
f268203d74ff25 Antti Laakso 2026-08-27  570  
f268203d74ff25 Antti Laakso 2026-08-27  571  	if (err_info.err_group == INSYS_MSG_ERR_GROUP_CAPTURE &&
f268203d74ff25 Antti Laakso 2026-08-27  572  	    err_info.err_code == INSYS_MSG_ERR_CAPTURE_SYNC_FRAME_DROP) {
f268203d74ff25 Antti Laakso 2026-08-27  573  		/* receive a sp w/o command, firmware drop it */
f268203d74ff25 Antti Laakso 2026-08-27  574  		dev_dbg(dev, "FRAME DROP: %02u %s stream %u\n",
f268203d74ff25 Antti Laakso 2026-08-27  575  			resp->type, is_fw_msg[resp->type].msg,
f268203d74ff25 Antti Laakso 2026-08-27  576  			resp->stream_id);
f268203d74ff25 Antti Laakso 2026-08-27  577  		dev_dbg(dev, "\tpin %u buf_id %llx frame %u\n",
f268203d74ff25 Antti Laakso 2026-08-27  578  			resp->pin_id, resp->buf_id, resp->frame_id);
f268203d74ff25 Antti Laakso 2026-08-27  579  		dev_dbg(dev, "\terror group %u code %u details [%u %u]\n",
f268203d74ff25 Antti Laakso 2026-08-27  580  			err_info.err_group, err_info.err_code,
f268203d74ff25 Antti Laakso 2026-08-27  581  			err_info.err_detail[0], err_info.err_detail[1]);
f268203d74ff25 Antti Laakso 2026-08-27  582  	} else if (err_info.err_code) {
f268203d74ff25 Antti Laakso 2026-08-27  583  		dev_err(dev, "%02u %s stream %u pin %u buf_id %llx frame %u\n",
f268203d74ff25 Antti Laakso 2026-08-27  584  			resp->type, is_fw_msg[resp->type].msg, resp->stream_id,
f268203d74ff25 Antti Laakso 2026-08-27  585  			resp->pin_id, resp->buf_id, resp->frame_id);
f268203d74ff25 Antti Laakso 2026-08-27  586  		dev_err(dev, "\terror group %u code %u details [%u %u]\n",
f268203d74ff25 Antti Laakso 2026-08-27  587  			err_info.err_group, err_info.err_code,
f268203d74ff25 Antti Laakso 2026-08-27  588  			err_info.err_detail[0], err_info.err_detail[1]);
f268203d74ff25 Antti Laakso 2026-08-27  589  	} else {
f268203d74ff25 Antti Laakso 2026-08-27  590  		dev_dbg(dev, "%02u %s stream %u pin %u buf_id %llx frame %u\n",
f268203d74ff25 Antti Laakso 2026-08-27  591  			resp->type, is_fw_msg[resp->type].msg, resp->stream_id,
f268203d74ff25 Antti Laakso 2026-08-27  592  			resp->pin_id, resp->buf_id, resp->frame_id);
f268203d74ff25 Antti Laakso 2026-08-27  593  		dev_dbg(dev, "\tts %llu\n", ts);
f268203d74ff25 Antti Laakso 2026-08-27  594  	}
f268203d74ff25 Antti Laakso 2026-08-27  595  
f268203d74ff25 Antti Laakso 2026-08-27  596  	if (resp->stream_id >= IPU7_ISYS_MAX_STREAMS) {
f268203d74ff25 Antti Laakso 2026-08-27  597  		dev_err(dev, "bad stream handle %u\n",
f268203d74ff25 Antti Laakso 2026-08-27  598  			resp->stream_id);
f268203d74ff25 Antti Laakso 2026-08-27 @599  		goto leave;
f268203d74ff25 Antti Laakso 2026-08-27  600  	}
f268203d74ff25 Antti Laakso 2026-08-27  601  
6757a837e28b86 Sakari Ailus 2025-12-18  602  	guard(spinlock_irqsave)(&isys->streams_lock);
6757a837e28b86 Sakari Ailus 2025-12-18  603  
99f62d82955331 Sakari Ailus 2026-06-26  604  	stream = resp->stream_id < IPU6_ISYS_MAX_STREAMS ?
99f62d82955331 Sakari Ailus 2026-06-26  605  		isys->streams_by_handle[resp->stream_id] : NULL;
f268203d74ff25 Antti Laakso 2026-08-27  606  	if (!stream) {
f268203d74ff25 Antti Laakso 2026-08-27  607  		dev_err(dev, "stream of stream_handle %u is unused\n",
f268203d74ff25 Antti Laakso 2026-08-27  608  			resp->stream_id);
f268203d74ff25 Antti Laakso 2026-08-27  609  		goto leave;
f268203d74ff25 Antti Laakso 2026-08-27  610  	}
f268203d74ff25 Antti Laakso 2026-08-27  611  
f268203d74ff25 Antti Laakso 2026-08-27  612  	stream->error = err_info.err_code;
f268203d74ff25 Antti Laakso 2026-08-27  613  
f268203d74ff25 Antti Laakso 2026-08-27  614  	if (stream->asd)
f268203d74ff25 Antti Laakso 2026-08-27  615  		csi2 = ipu6_isys_subdev_to_csi2(stream->asd);
f268203d74ff25 Antti Laakso 2026-08-27  616  
f268203d74ff25 Antti Laakso 2026-08-27  617  	switch (resp->type) {
f268203d74ff25 Antti Laakso 2026-08-27  618  	case IPU7_INSYS_RESP_TYPE_STREAM_OPEN_DONE:
f268203d74ff25 Antti Laakso 2026-08-27  619  		complete(&stream->stream_open_completion);
f268203d74ff25 Antti Laakso 2026-08-27  620  		break;
f268203d74ff25 Antti Laakso 2026-08-27  621  	case IPU7_INSYS_RESP_TYPE_STREAM_CLOSE_ACK:
f268203d74ff25 Antti Laakso 2026-08-27  622  		complete(&stream->stream_close_completion);
f268203d74ff25 Antti Laakso 2026-08-27  623  		break;
f268203d74ff25 Antti Laakso 2026-08-27  624  	case IPU7_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_ACK:
f268203d74ff25 Antti Laakso 2026-08-27  625  		complete(&stream->stream_start_completion);
f268203d74ff25 Antti Laakso 2026-08-27  626  		break;
f268203d74ff25 Antti Laakso 2026-08-27  627  	case IPU7_INSYS_RESP_TYPE_STREAM_ABORT_ACK:
f268203d74ff25 Antti Laakso 2026-08-27  628  		complete(&stream->stream_stop_completion);
f268203d74ff25 Antti Laakso 2026-08-27  629  		break;
f268203d74ff25 Antti Laakso 2026-08-27  630  	case IPU7_INSYS_RESP_TYPE_STREAM_FLUSH_ACK:
f268203d74ff25 Antti Laakso 2026-08-27  631  		complete(&stream->stream_stop_completion);
f268203d74ff25 Antti Laakso 2026-08-27  632  		break;
f268203d74ff25 Antti Laakso 2026-08-27  633  	case IPU7_INSYS_RESP_TYPE_PIN_DATA_READY:
f268203d74ff25 Antti Laakso 2026-08-27  634  		/*
f268203d74ff25 Antti Laakso 2026-08-27  635  		 * firmware only release the capture msg until software
f268203d74ff25 Antti Laakso 2026-08-27  636  		 * get pin_data_ready event
f268203d74ff25 Antti Laakso 2026-08-27  637  		 */
f268203d74ff25 Antti Laakso 2026-08-27  638  		isys_fw_msg = container_of((void *)(uintptr_t)resp->buf_id,
f268203d74ff25 Antti Laakso 2026-08-27  639  					   struct isys_fw_msgs, dummy);
f268203d74ff25 Antti Laakso 2026-08-27  640  
f268203d74ff25 Antti Laakso 2026-08-27  641  		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
f268203d74ff25 Antti Laakso 2026-08-27  642  		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS)
f268203d74ff25 Antti Laakso 2026-08-27  643  			ipu6_stream_buf_ready(stream, resp->pin_id,
f268203d74ff25 Antti Laakso 2026-08-27  644  					      resp->pin.addr, ts, 0);
f268203d74ff25 Antti Laakso 2026-08-27  645  		else
f268203d74ff25 Antti Laakso 2026-08-27  646  			dev_err(dev, "No handler for pin %u ready\n",
f268203d74ff25 Antti Laakso 2026-08-27  647  				resp->pin_id);
f268203d74ff25 Antti Laakso 2026-08-27  648  		if (csi2)
f268203d74ff25 Antti Laakso 2026-08-27  649  			ipu7_isys_csi2_error(csi2);
f268203d74ff25 Antti Laakso 2026-08-27  650  
f268203d74ff25 Antti Laakso 2026-08-27  651  		break;
f268203d74ff25 Antti Laakso 2026-08-27  652  	case IPU7_INSYS_RESP_TYPE_STREAM_CAPTURE_ACK:
f268203d74ff25 Antti Laakso 2026-08-27  653  		break;
f268203d74ff25 Antti Laakso 2026-08-27  654  	case IPU7_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE:
f268203d74ff25 Antti Laakso 2026-08-27  655  	case IPU7_INSYS_RESP_TYPE_STREAM_CAPTURE_DONE:
f268203d74ff25 Antti Laakso 2026-08-27  656  		break;
f268203d74ff25 Antti Laakso 2026-08-27  657  	case IPU7_INSYS_RESP_TYPE_FRAME_SOF:
f268203d74ff25 Antti Laakso 2026-08-27  658  		if (csi2)
f268203d74ff25 Antti Laakso 2026-08-27  659  			ipu6_isys_csi2_sof_event_by_stream(stream);
f268203d74ff25 Antti Laakso 2026-08-27  660  
f268203d74ff25 Antti Laakso 2026-08-27  661  		stream->seq[stream->seq_index].sequence =
f268203d74ff25 Antti Laakso 2026-08-27  662  			atomic_read(&stream->sequence) - 1U;
f268203d74ff25 Antti Laakso 2026-08-27  663  		stream->seq[stream->seq_index].timestamp = ts;
f268203d74ff25 Antti Laakso 2026-08-27  664  		dev_dbg(dev,
f268203d74ff25 Antti Laakso 2026-08-27  665  			"SOF: stream %u frame %u (index %u), ts 0x%16.16llx\n",
f268203d74ff25 Antti Laakso 2026-08-27  666  			resp->stream_id, resp->frame_id,
f268203d74ff25 Antti Laakso 2026-08-27  667  			stream->seq[stream->seq_index].sequence, ts);
f268203d74ff25 Antti Laakso 2026-08-27  668  		stream->seq_index = (stream->seq_index + 1U)
f268203d74ff25 Antti Laakso 2026-08-27  669  			% IPU6_ISYS_MAX_PARALLEL_SOF;
f268203d74ff25 Antti Laakso 2026-08-27  670  		break;
f268203d74ff25 Antti Laakso 2026-08-27  671  	case IPU7_INSYS_RESP_TYPE_FRAME_EOF:
f268203d74ff25 Antti Laakso 2026-08-27  672  		if (csi2)
f268203d74ff25 Antti Laakso 2026-08-27  673  			ipu6_isys_csi2_eof_event_by_stream(stream);
f268203d74ff25 Antti Laakso 2026-08-27  674  
f268203d74ff25 Antti Laakso 2026-08-27  675  		dev_dbg(dev, "eof: stream %d(index %u) ts 0x%16.16llx\n",
f268203d74ff25 Antti Laakso 2026-08-27  676  			resp->stream_id,
f268203d74ff25 Antti Laakso 2026-08-27  677  			stream->seq[stream->seq_index].sequence, ts);
f268203d74ff25 Antti Laakso 2026-08-27  678  		break;
f268203d74ff25 Antti Laakso 2026-08-27  679  	default:
f268203d74ff25 Antti Laakso 2026-08-27  680  		dev_err(dev, "Unknown response type %u stream %u\n",
f268203d74ff25 Antti Laakso 2026-08-27  681  			resp->type, resp->stream_id);
f268203d74ff25 Antti Laakso 2026-08-27  682  		break;
f268203d74ff25 Antti Laakso 2026-08-27  683  	}
f268203d74ff25 Antti Laakso 2026-08-27  684  
f268203d74ff25 Antti Laakso 2026-08-27  685  leave:
f268203d74ff25 Antti Laakso 2026-08-27  686  	ipu7_fw_isys_put_resp(isys);
f268203d74ff25 Antti Laakso 2026-08-27  687  
f268203d74ff25 Antti Laakso 2026-08-27  688  	return 0;
f268203d74ff25 Antti Laakso 2026-08-27  689  }
f268203d74ff25 Antti Laakso 2026-08-27  690  

:::::: The code at line 599 was first introduced by commit
:::::: f268203d74ff25f5443a16813196fb8ecd775be3 media: ipu6: Add ipu7 isr handler

:::::: TO: Antti Laakso <antti.laakso@linux.intel.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
