Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5C515B11D;
	Thu,  8 Aug 2024 22:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155470; cv=none; b=AMQBRRrfQwtjaU08TWw8kFwV2vwuq0yr96BRYV0PqgtaT9zQDYbGHW2BcfMAR9+hz1MwCFAW4QBnD5p3ZoYP4TH81hs3QTiGABEnYGcXEkRgO5std5QR/sSquAnZbG5nnO2kmB74Tx2jqje+HS0VmQR/daKgbSq9QnTrX+I4gPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155470; c=relaxed/simple;
	bh=C2HnxQGSVhLVyQROl959iMgFNs5mvx8cONd2x3MySZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8KtCEfhPU5G8ggjeFfY8apiGudvxPvxLcA2BzL3IOn6Qhy0Eq4t+GdpvQJZSXPAAu6+cexT3ce7gHqoUD3gzItQCJDjGTn+SLp0fWukY2aXleVf8k3I4rzfO2VFWWYh4h6vNadX96CXSAe9nuhFXROH4jtMkw5VTIN04O4Zm9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipcR9b2K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipcR9b2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723155469; x=1754691469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2HnxQGSVhLVyQROl959iMgFNs5mvx8cONd2x3MySZg=;
  b=ipcR9b2Kgj+epbr1uNHKqGmRd/bQguq3wPRvwaTAFawZa+A9ZfXu/LNF
   /O5G86TtED3aPFIRKgCS2ubH4XkSu7Pn4jWIvJtfstKMRNSMpf/1WmB5R
   wygxtgodiOM5uTcBRUCTmhkytW9K4HBWx8Dar0cSRXMdV1P3GkDJEzgYp
   7wAs2rRRNr8KaTkK8syGsUcxHc9oRituCRqURWIJuw1x2/arv/8YQuL1C
   b5oeAkLGK8iTT8gt9C/n9HRcLocWreoQW9uPOknL5oHn7Xfgcsge0hXSs
   V23nbGotx0YLDiwU5F36AZnWLBmQXhi+g601VQvpTtLKtI8Aj6DSrMsgT
   w==;
X-CSE-ConnectionGUID: 6riG/W5pTOaCVoIuJYltxQ==
X-CSE-MsgGUID: NGR1xc6ZROy2YJFM9pjbcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43827890"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="43827890"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 15:17:46 -0700
X-CSE-ConnectionGUID: FteGkWEmSKOBgWj4hZaPjQ==
X-CSE-MsgGUID: ecAIS4JmRoS6ZLpiDGTfNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57604306"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 15:17:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scBS2-0006Yu-1r;
	Thu, 08 Aug 2024 22:17:42 +0000
Date: Fri, 9 Aug 2024 06:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chiara Meiohas <cmeiohas@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 25/37] drivers/infiniband/core/nldev.c:2782:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202408090634.vvrFPOUe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   8f867b8b95b4aab452108f77167fae8d7e0d5056
commit: 917eed2ac05a89c1c663e22dc744b8ae64d84ac7 [25/37] RDMA/nldev: Add support for RDMA monitoring
config: i386-buildonly-randconfig-004-20240809 (https://download.01.org/0day-ci/archive/20240809/202408090634.vvrFPOUe-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090634.vvrFPOUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090634.vvrFPOUe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/core/nldev.c:2782:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    2782 |         default:
         |         ^
   drivers/infiniband/core/nldev.c:2782:2: note: insert 'break;' to avoid fall-through
    2782 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +2782 drivers/infiniband/core/nldev.c

  2756	
  2757	static void rdma_nl_notify_err_msg(struct ib_device *device, u32 port_num,
  2758					    enum rdma_nl_notify_event_type type)
  2759	{
  2760		struct net_device *netdev;
  2761	
  2762		switch (type) {
  2763		case RDMA_REGISTER_EVENT:
  2764			dev_warn_ratelimited(&device->dev,
  2765					     "Failed to send RDMA monitor register device event\n");
  2766			break;
  2767		case RDMA_UNREGISTER_EVENT:
  2768			dev_warn_ratelimited(&device->dev,
  2769					     "Failed to send RDMA monitor unregister device event\n");
  2770			break;
  2771		case RDMA_NETDEV_ATTACH_EVENT:
  2772			netdev = ib_device_get_netdev(device, port_num);
  2773			dev_warn_ratelimited(&device->dev,
  2774					     "Failed to send RDMA monitor netdev attach event: port %d netdev %d\n",
  2775					     port_num, netdev->ifindex);
  2776			dev_put(netdev);
  2777			break;
  2778		case RDMA_NETDEV_DETACH_EVENT:
  2779			dev_warn_ratelimited(&device->dev,
  2780					     "Failed to send RDMA monitor netdev detach event: port %d\n",
  2781					     port_num);
> 2782		default:
  2783			break;
  2784		};
  2785	}
  2786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
