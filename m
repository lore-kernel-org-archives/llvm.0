Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E925125AB;
	Wed, 20 Dec 2023 05:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMZMeDW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703048597; x=1734584597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5j2qoJG8bDcY1zuNdymq9Ne9Gu2e1JgT9G7UnH+7U04=;
  b=KMZMeDW9XEmr9Vf1/w2NPPi/a3eEJXe5QbhlsQqjgKdRNbsxA7cVwPM7
   LDdPJwc3pJRH0IbtdRr+OUeWNWZFQCHRM400bPeNxFB0FrRxPmdQWe0JK
   KDrjDTQ+71b1j6m4UqGSAf/dyBhjeB0Lcj7TA8zLVAAYv5GVbilc175pm
   OntjMthw7Pc9wH9Rc4+DXbgYrBP7GtB3OQyQmgTiogTpIttrS/DSkWmj0
   P0fqJqADfZPzFuOTK5u7FUWAuRmq7G1T60sr6/53wWmlKyEIoL3GSxFNE
   PU4Kh4vqCRWK7kJ6dTbYJ3IQKrBkjaCkk+LHjRRXVdg0+U012wKgI3KTC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="9225779"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="9225779"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 21:03:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="846591877"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; 
   d="scan'208";a="846591877"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Dec 2023 21:03:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFojf-0006Pp-10;
	Wed, 20 Dec 2023 05:03:12 +0000
Date: Wed, 20 Dec 2023 13:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 41/42]
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Function
 parameter or member 'params' not described in 'idpf_send_chunked_msg'
Message-ID: <202312201344.ix0XJ5OC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   f22bd3c6717325f6b0b63386c626c279a450413d
commit: 352bcda07492a7c4be26de93471bfd5102112ee0 [41/42] idpf: add vc functions to manage selected queues
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231220/202312201344.ix0XJ5OC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312201344.ix0XJ5OC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312201344.ix0XJ5OC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Function parameter or member 'params' not described in 'idpf_send_chunked_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'xn_params' description in 'idpf_send_chunked_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'prep_msg' description in 'idpf_send_chunked_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'config_data_size' description in 'idpf_send_chunked_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'num_chunks' description in 'idpf_send_chunked_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'chunk_size' description in 'idpf_send_chunked_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1499: warning: Excess function parameter 'chunks' description in 'idpf_send_chunked_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1710: warning: Function parameter or member 'q' not described in 'idpf_fill_rxbufq_config_chunk'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1710: warning: expecting prototype for idpf_fill_bufq_config_chunk(). Prototype was for idpf_fill_rxbufq_config_chunk() instead
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1932: warning: Function parameter or member 'vc_op' not described in 'idpf_send_ena_dis_selected_qs_msg'
>> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1932: warning: Excess function parameter 'ena' description in 'idpf_send_ena_dis_selected_qs_msg'


vim +1499 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c

  1482	
  1483	/**
  1484	 * idpf_send_chunked_msg - Send a VC message consisting of chunks.
  1485	 * @vport: virtual port data structure
  1486	 * @xn_params: parameters for this particular transaction including
  1487	 * @prep_msg: pointer to the helper function for preparing the VC message
  1488	 * @config_data_size: size of the message config data
  1489	 * @num_chunks: number of chunks in the message
  1490	 * @chunk_size: size of single message chunk
  1491	 * @chunks: pointer to a buffer containig chunks of the message
  1492	 *
  1493	 * Helper function for preparing the message describing queues to be enabled
  1494	 * or disabled.
  1495	 * Returns the total size of the prepared message.
  1496	 */
  1497	static int idpf_send_chunked_msg(struct idpf_vport *vport,
  1498					 struct idpf_chunked_msg_params *params)
> 1499	{
  1500		u32 num_msgs, max_chunks, left_chunks, max_buf_sz;
  1501		u32 num_chunks = params->num_chunks;
  1502		int err = 0, i;
  1503		u8 *msg_buf;
  1504	
  1505		max_chunks = min_t(u32, IDPF_NUM_CHUNKS_PER_MSG(params->config_sz,
  1506								params->chunk_sz),
  1507								params->num_chunks);
  1508		max_buf_sz = params->config_sz + max_chunks * params->chunk_sz;
  1509		num_msgs = DIV_ROUND_UP(params->num_chunks, max_chunks);
  1510	
  1511		msg_buf = kzalloc(max_buf_sz, GFP_KERNEL);
  1512		if (!msg_buf) {
  1513			err = -ENOMEM;
  1514			goto error;
  1515		}
  1516	
  1517		mutex_lock(&vport->vc_buf_lock);
  1518	
  1519		left_chunks = num_chunks;
  1520		for (i = 0; i < num_msgs; i++) {
  1521			u8 *chunks = params->chunks;
  1522			int buf_sz, msg_size;
  1523			u8 *first_chunk;
  1524	
  1525			num_chunks = min(max_chunks, left_chunks);
  1526			first_chunk = chunks + (i * params->chunk_sz * max_chunks);
  1527			msg_size = params->chunk_sz * num_chunks + params->config_sz;
  1528	
  1529			buf_sz = params->prepare_msg(vport, msg_buf, first_chunk,
  1530						     num_chunks);
  1531			if (buf_sz != msg_size) {
  1532				err = -EINVAL;
  1533				goto msg_error;
  1534			}
  1535	
  1536			err = idpf_send_mb_msg(vport->adapter, params->op,
  1537					       buf_sz, msg_buf);
  1538			if (err)
  1539				goto msg_error;
  1540	
  1541			err = __idpf_wait_for_event(vport->adapter, vport,
  1542						    params->state, params->err_check,
  1543						    params->timeout);
  1544			if (err)
  1545				goto msg_error;
  1546	
  1547			left_chunks -= num_chunks;
  1548		}
  1549	
  1550		if (left_chunks != 0)
  1551			err = -EINVAL;
  1552	msg_error:
  1553		mutex_unlock(&vport->vc_buf_lock);
  1554		kfree(msg_buf);
  1555	error:
  1556		return err;
  1557	}
  1558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
