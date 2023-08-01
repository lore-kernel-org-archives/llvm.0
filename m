Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B8A22EFB;
	Tue,  1 Aug 2023 14:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690898953; x=1722434953;
  h=date:from:cc:subject:message-id:mime-version;
  bh=BklpZD2PNQM5NMmrn0/IcJ70+shQc5bkVzugWWc2Y38=;
  b=Wm4lIgJu8ESdPx4i1CRAHWcwoOl6i1Kuu2PTkJQtEzBlLncYQQSPPyZv
   L03PhPvMDwWtweOp4OTwAENUaqSC2V77g7taZnMTS1qPyCqK9tBTrSzV2
   NdQgXe02WJe9EB3QqTi4vtYQ2jeYVo3UJphYEnp9VFPyzIIxizKWu6nSM
   ygK8CCJdXDNvSazejuPCj/aNeBvD+FA3bThrlogbPfhwtrEJeCeWMqYvg
   7TW5qTYPG3VQ71+idF2A7959t/8pKc5Ns2xNaQsMol+fnTZRd+pcZ11J4
   mpPPFvxYI4ShR3jYZLmqJgj7yiWi1gOgvSH8/mRnoyYbn0jAAc/pRKX2L
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="354232787"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="354232787"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:06:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="902562828"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="902562828"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Aug 2023 07:05:59 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQq0c-0000Kx-2j;
	Tue, 01 Aug 2023 14:05:58 +0000
Date: Tue, 1 Aug 2023 22:05:37 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 8687/9999]
 drivers/infiniband/core/user_mad.c:574:36: warning: taking address of packed
 member 'rmpp_hdr' of class or structure 'ib_rmpp_mad_hdr' may result in an
 unaligned pointer value
Message-ID: <202308012118.8ujjnjmt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
drivers/infiniband/core/user_mad.c: 574:36: warning: taking address of packed
 member 'rmpp_hdr' of class or structure 'ib_rmpp_mad_hdr' may result in an
 unaligned pointer value [-Waddress-of-packed-member]

TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Leon Romanovsky <leon@kernel.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   09996673e3139a6d86fc3d95c852b3a020e2fe5f
commit: 036e02dfd5154583358de9a98cf0e313232b7295 [8687/9999] RDMA/core: Fix multiple -Warray-bounds warnings
config: mips-randconfig-r031-20230801 (https://download.01.org/0day-ci/archive/20230801/202308012118.8ujjnjmt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012118.8ujjnjmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012118.8ujjnjmt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/user_mad.c:574:36: warning: taking address of packed member 'rmpp_hdr' of class or structure 'ib_rmpp_mad_hdr' may result in an unaligned pointer value [-Waddress-of-packed-member]
     574 |                 rmpp_active = ib_get_rmpp_flags(&rmpp_mad_hdr->rmpp_hdr) &
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/core/user_mad.c:628:29: warning: taking address of packed member 'rmpp_hdr' of class or structure 'ib_rmpp_mad_hdr' may result in an unaligned pointer value [-Waddress-of-packed-member]
     628 |             && (ib_get_rmpp_flags(&rmpp_mad_hdr->rmpp_hdr) & IB_MGMT_RMPP_FLAG_ACTIVE)) {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +574 drivers/infiniband/core/user_mad.c

   497	
   498	static ssize_t ib_umad_write(struct file *filp, const char __user *buf,
   499				     size_t count, loff_t *pos)
   500	{
   501		struct ib_umad_file *file = filp->private_data;
   502		struct ib_rmpp_mad_hdr *rmpp_mad_hdr;
   503		struct ib_umad_packet *packet;
   504		struct ib_mad_agent *agent;
   505		struct rdma_ah_attr ah_attr;
   506		struct ib_ah *ah;
   507		__be64 *tid;
   508		int ret, data_len, hdr_len, copy_offset, rmpp_active;
   509		u8 base_version;
   510	
   511		if (count < hdr_size(file) + IB_MGMT_RMPP_HDR)
   512			return -EINVAL;
   513	
   514		packet = kzalloc(sizeof(*packet) + IB_MGMT_RMPP_HDR, GFP_KERNEL);
   515		if (!packet)
   516			return -ENOMEM;
   517	
   518		if (copy_from_user(&packet->mad, buf, hdr_size(file))) {
   519			ret = -EFAULT;
   520			goto err;
   521		}
   522	
   523		if (packet->mad.hdr.id >= IB_UMAD_MAX_AGENTS) {
   524			ret = -EINVAL;
   525			goto err;
   526		}
   527	
   528		buf += hdr_size(file);
   529	
   530		if (copy_from_user(packet->mad.data, buf, IB_MGMT_RMPP_HDR)) {
   531			ret = -EFAULT;
   532			goto err;
   533		}
   534	
   535		mutex_lock(&file->mutex);
   536	
   537		trace_ib_umad_write(file, &packet->mad.hdr,
   538				    (struct ib_mad_hdr *)&packet->mad.data);
   539	
   540		agent = __get_agent(file, packet->mad.hdr.id);
   541		if (!agent) {
   542			ret = -EIO;
   543			goto err_up;
   544		}
   545	
   546		memset(&ah_attr, 0, sizeof ah_attr);
   547		ah_attr.type = rdma_ah_find_type(agent->device,
   548						 file->port->port_num);
   549		rdma_ah_set_dlid(&ah_attr, be16_to_cpu(packet->mad.hdr.lid));
   550		rdma_ah_set_sl(&ah_attr, packet->mad.hdr.sl);
   551		rdma_ah_set_path_bits(&ah_attr, packet->mad.hdr.path_bits);
   552		rdma_ah_set_port_num(&ah_attr, file->port->port_num);
   553		if (packet->mad.hdr.grh_present) {
   554			rdma_ah_set_grh(&ah_attr, NULL,
   555					be32_to_cpu(packet->mad.hdr.flow_label),
   556					packet->mad.hdr.gid_index,
   557					packet->mad.hdr.hop_limit,
   558					packet->mad.hdr.traffic_class);
   559			rdma_ah_set_dgid_raw(&ah_attr, packet->mad.hdr.gid);
   560		}
   561	
   562		ah = rdma_create_user_ah(agent->qp->pd, &ah_attr, NULL);
   563		if (IS_ERR(ah)) {
   564			ret = PTR_ERR(ah);
   565			goto err_up;
   566		}
   567	
   568		rmpp_mad_hdr = (struct ib_rmpp_mad_hdr *)packet->mad.data;
   569		hdr_len = ib_get_mad_data_offset(rmpp_mad_hdr->mad_hdr.mgmt_class);
   570	
   571		if (ib_is_mad_class_rmpp(rmpp_mad_hdr->mad_hdr.mgmt_class)
   572		    && ib_mad_kernel_rmpp_agent(agent)) {
   573			copy_offset = IB_MGMT_RMPP_HDR;
 > 574			rmpp_active = ib_get_rmpp_flags(&rmpp_mad_hdr->rmpp_hdr) &
   575							IB_MGMT_RMPP_FLAG_ACTIVE;
   576		} else {
   577			copy_offset = IB_MGMT_MAD_HDR;
   578			rmpp_active = 0;
   579		}
   580	
   581		base_version = ((struct ib_mad_hdr *)&packet->mad.data)->base_version;
   582		data_len = count - hdr_size(file) - hdr_len;
   583		packet->msg = ib_create_send_mad(agent,
   584						 be32_to_cpu(packet->mad.hdr.qpn),
   585						 packet->mad.hdr.pkey_index, rmpp_active,
   586						 hdr_len, data_len, GFP_KERNEL,
   587						 base_version);
   588		if (IS_ERR(packet->msg)) {
   589			ret = PTR_ERR(packet->msg);
   590			goto err_ah;
   591		}
   592	
   593		packet->msg->ah		= ah;
   594		packet->msg->timeout_ms = packet->mad.hdr.timeout_ms;
   595		packet->msg->retries	= packet->mad.hdr.retries;
   596		packet->msg->context[0] = packet;
   597	
   598		/* Copy MAD header.  Any RMPP header is already in place. */
   599		memcpy(packet->msg->mad, packet->mad.data, IB_MGMT_MAD_HDR);
   600	
   601		if (!rmpp_active) {
   602			if (copy_from_user(packet->msg->mad + copy_offset,
   603					   buf + copy_offset,
   604					   hdr_len + data_len - copy_offset)) {
   605				ret = -EFAULT;
   606				goto err_msg;
   607			}
   608		} else {
   609			ret = copy_rmpp_mad(packet->msg, buf);
   610			if (ret)
   611				goto err_msg;
   612		}
   613	
   614		/*
   615		 * Set the high-order part of the transaction ID to make MADs from
   616		 * different agents unique, and allow routing responses back to the
   617		 * original requestor.
   618		 */
   619		if (!ib_response_mad(packet->msg->mad)) {
   620			tid = &((struct ib_mad_hdr *) packet->msg->mad)->tid;
   621			*tid = cpu_to_be64(((u64) agent->hi_tid) << 32 |
   622					   (be64_to_cpup(tid) & 0xffffffff));
   623			rmpp_mad_hdr->mad_hdr.tid = *tid;
   624		}
   625	
   626		if (!ib_mad_kernel_rmpp_agent(agent)
   627		    && ib_is_mad_class_rmpp(rmpp_mad_hdr->mad_hdr.mgmt_class)
   628		    && (ib_get_rmpp_flags(&rmpp_mad_hdr->rmpp_hdr) & IB_MGMT_RMPP_FLAG_ACTIVE)) {
   629			spin_lock_irq(&file->send_lock);
   630			list_add_tail(&packet->list, &file->send_list);
   631			spin_unlock_irq(&file->send_lock);
   632		} else {
   633			spin_lock_irq(&file->send_lock);
   634			ret = is_duplicate(file, packet);
   635			if (!ret)
   636				list_add_tail(&packet->list, &file->send_list);
   637			spin_unlock_irq(&file->send_lock);
   638			if (ret) {
   639				ret = -EINVAL;
   640				goto err_msg;
   641			}
   642		}
   643	
   644		ret = ib_post_send_mad(packet->msg, NULL);
   645		if (ret)
   646			goto err_send;
   647	
   648		mutex_unlock(&file->mutex);
   649		return count;
   650	
   651	err_send:
   652		dequeue_send(file, packet);
   653	err_msg:
   654		ib_free_send_mad(packet->msg);
   655	err_ah:
   656		rdma_destroy_ah(ah, RDMA_DESTROY_AH_SLEEPABLE);
   657	err_up:
   658		mutex_unlock(&file->mutex);
   659	err:
   660		kfree(packet);
   661		return ret;
   662	}
   663	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
