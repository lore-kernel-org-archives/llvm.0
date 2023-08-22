Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2008C8473;
	Tue, 22 Aug 2023 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692692356; x=1724228356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2QzrY/WDas483aKpaGxnYbfLFBGdIzXK1ZVYl86dUaU=;
  b=gMStaTAikWLRj4eyIdK69e+XO/7t2RQueXAeb7+lLZTyBuOWgKK+eTjT
   x7DqJv8F4UuTdry8nYwvSwS49AMiygd26THueII0IeOMCxGOnoFHYRFsb
   tmO+8H0eFkBZIiKQtPL/hZhX+uSFNdhuEt+GEnGXpyz889Vs1ba7m2P7J
   SSg4colmxhXahmgQAKmDwdyM/5sN3GJchUeWUyMgOOxWlfFZ7N07H3A4y
   EQ/VwmIFg+9w4fTQpblyjaTakkC0hrW8IdcTXV/g8b2G+YXh0X/u5AUoy
   +Cmnjz059w7Z7K5O5iEObCkbCMMbSGOcm9kHA5+uRSy5ynUu0O6DHjZ2x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373788828"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="373788828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 01:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="736121440"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="736121440"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Aug 2023 01:19:12 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYMbV-0001Z2-2F;
	Tue, 22 Aug 2023 08:19:10 +0000
Date: Tue, 22 Aug 2023 16:18:42 +0800
From: kernel test robot <lkp@intel.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ksmbd: reduce descriptor size if remaining bytes is less
 than request size
Message-ID: <202308221607.e4auCYyC-lkp@intel.com>
References: <20230821135140.4434-1-linkinjeon@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821135140.4434-1-linkinjeon@kernel.org>

Hi Namjae,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5-rc7 next-20230821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Namjae-Jeon/ksmbd-reduce-descriptor-size-if-remaining-bytes-is-less-than-request-size/20230821-215453
base:   linus/master
patch link:    https://lore.kernel.org/r/20230821135140.4434-1-linkinjeon%40kernel.org
patch subject: [PATCH] ksmbd: reduce descriptor size if remaining bytes is less than request size
config: x86_64-randconfig-003-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221607.e4auCYyC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221607.e4auCYyC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221607.e4auCYyC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/server/transport_rdma.c:1370:9: warning: variable 'total_length' set but not used [-Wunused-but-set-variable]
           size_t total_length = 0;
                  ^
   1 warning generated.


vim +/total_length +1370 fs/smb/server/transport_rdma.c

0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1355  
1807abcf8778bc fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1356  static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
1807abcf8778bc fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1357  				void *buf, int buf_len,
1807abcf8778bc fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1358  				struct smb2_buffer_desc_v1 *desc,
1807abcf8778bc fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1359  				unsigned int desc_len,
1807abcf8778bc fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1360  				bool is_read)
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1361  {
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1362  	struct smb_direct_rdma_rw_msg *msg, *next_msg;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1363  	int i, ret;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1364  	DECLARE_COMPLETION_ONSTACK(completion);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1365  	struct ib_send_wr *first_wr;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1366  	LIST_HEAD(msg_list);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1367  	char *desc_buf;
ddbdc861e37c16 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1368  	int credits_needed;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1369  	unsigned int desc_buf_len, desc_num = 0;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30 @1370  	size_t total_length = 0;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1371  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1372  	if (t->status != SMB_DIRECT_CS_CONNECTED)
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1373  		return -ENOTCONN;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1374  
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1375  	if (buf_len > t->max_rdma_rw_size)
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1376  		return -EINVAL;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1377  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1378  	/* calculate needed credits */
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1379  	credits_needed = 0;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1380  	desc_buf = buf;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1381  	for (i = 0; i < desc_len / sizeof(*desc) && buf_len != 0; i++) {
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1382  		if (!buf_len)
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1383  			break;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1384  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1385  		desc_buf_len = le32_to_cpu(desc[i].length);
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1386  		if (!desc_buf_len)
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1387  			return -EINVAL;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1388  
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1389  		if (desc_buf_len > buf_len) {
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1390  			desc_buf_len = buf_len;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1391  			desc[i].length = cpu_to_le32(desc_buf_len);
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1392  			buf_len = 0;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1393  		}
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1394  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1395  		credits_needed += calc_rw_credits(t, desc_buf, desc_buf_len);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1396  		desc_buf += desc_buf_len;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1397  		total_length += desc_buf_len;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1398  		buf_len -= desc_buf_len;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1399  		desc_num++;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1400  	}
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1401  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1402  	ksmbd_debug(RDMA, "RDMA %s, len %#x, needed credits %#x\n",
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1403  		    is_read ? "read" : "write", buf_len, credits_needed);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1404  
ddbdc861e37c16 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1405  	ret = wait_for_rw_credits(t, credits_needed);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1406  	if (ret < 0)
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1407  		return ret;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1408  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1409  	/* build rdma_rw_ctx for each descriptor */
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1410  	desc_buf = buf;
7373359abfd031 fs/smb/server/transport_rdma.c Namjae Jeon  2023-08-21  1411  	for (i = 0; i < desc_num; i++) {
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1412  		msg = kzalloc(offsetof(struct smb_direct_rdma_rw_msg, sg_list) +
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1413  			      sizeof(struct scatterlist) * SG_CHUNK_SIZE, GFP_KERNEL);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1414  		if (!msg) {
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1415  			ret = -ENOMEM;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1416  			goto out;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1417  		}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1418  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1419  		desc_buf_len = le32_to_cpu(desc[i].length);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1420  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1421  		msg->t = t;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1422  		msg->cqe.done = is_read ? read_done : write_done;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1423  		msg->completion = &completion;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1424  
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1425  		msg->sgt.sgl = &msg->sg_list[0];
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1426  		ret = sg_alloc_table_chained(&msg->sgt,
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1427  					     get_buf_page_count(desc_buf, desc_buf_len),
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1428  					     msg->sg_list, SG_CHUNK_SIZE);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1429  		if (ret) {
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1430  			kfree(msg);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1431  			ret = -ENOMEM;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1432  			goto out;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1433  		}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1434  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1435  		ret = get_sg_list(desc_buf, desc_buf_len,
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1436  				  msg->sgt.sgl, msg->sgt.orig_nents);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1437  		if (ret < 0) {
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1438  			sg_free_table_chained(&msg->sgt, SG_CHUNK_SIZE);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1439  			kfree(msg);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1440  			goto out;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1441  		}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1442  
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1443  		ret = rdma_rw_ctx_init(&msg->rw_ctx, t->qp, t->qp->port,
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1444  				       msg->sgt.sgl,
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1445  				       get_buf_page_count(desc_buf, desc_buf_len),
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1446  				       0,
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1447  				       le64_to_cpu(desc[i].offset),
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1448  				       le32_to_cpu(desc[i].token),
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1449  				       is_read ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1450  		if (ret < 0) {
bde1694aecdb53 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-06-28  1451  			pr_err("failed to init rdma_rw_ctx: %d\n", ret);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1452  			sg_free_table_chained(&msg->sgt, SG_CHUNK_SIZE);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1453  			kfree(msg);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1454  			goto out;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1455  		}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1456  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1457  		list_add_tail(&msg->list, &msg_list);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1458  		desc_buf += desc_buf_len;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1459  	}
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1460  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1461  	/* concatenate work requests of rdma_rw_ctxs */
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1462  	first_wr = NULL;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1463  	list_for_each_entry_reverse(msg, &msg_list, list) {
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1464  		first_wr = rdma_rw_ctx_wrs(&msg->rw_ctx, t->qp, t->qp->port,
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1465  					   &msg->cqe, first_wr);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1466  	}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1467  
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1468  	ret = ib_post_send(t->qp, first_wr, NULL);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1469  	if (ret) {
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1470  		pr_err("failed to post send wr for RDMA R/W: %d\n", ret);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1471  		goto out;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1472  	}
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1473  
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1474  	msg = list_last_entry(&msg_list, struct smb_direct_rdma_rw_msg, list);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1475  	wait_for_completion(&completion);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1476  	ret = msg->status;
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1477  out:
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1478  	list_for_each_entry_safe(msg, next_msg, &msg_list, list) {
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1479  		list_del(&msg->list);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1480  		smb_direct_free_rdma_rw_msg(t, msg,
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1481  					    is_read ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1482  	}
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1483  	atomic_add(credits_needed, &t->rw_credits);
ee1b0558965909 fs/ksmbd/transport_rdma.c      Hyunchul Lee 2022-04-30  1484  	wake_up(&t->wait_rw_credits);
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1485  	return ret;
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1486  }
0626e6641f6b46 fs/cifsd/transport_rdma.c      Namjae Jeon  2021-03-16  1487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
