Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFAF30AD0A;
	Thu,  5 Mar 2026 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697215; cv=none; b=QRef379oMsSc0yyeU1ORkJqUzLIC/M5qJk2l4+56BPkAIcnaM0uRRl43E/1PVSW/Eq4B1R3RmOTO61rqCiQIpLwMz1UmffMoP17mT5LobUC9QRLU2j1+amZ5T1SR2ofDBKuUgAY5b01hTl4AI4a4MAuIabB8O4+iChR6jM320ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697215; c=relaxed/simple;
	bh=0IRCN5orXpBlDp5bbe+hP/a4OpxCZ/kKP/mq46MHsUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRww7kr2Xd0TImVHdzFy2PMMb0ksQPvZrY10vder3xolgZ++DfmSDI/a3ZKxTwSVU3pMl7cGIZwRrQyhS89aXsEC8JmlqN2vBk5uCiRnUSTtBE97v0J79uWc1hPH41c9L9ZioX2w714nZEoAhDnDn+3ESyRCVC2syd8FPN6+KrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ku4RhVWj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ku4RhVWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772697214; x=1804233214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0IRCN5orXpBlDp5bbe+hP/a4OpxCZ/kKP/mq46MHsUc=;
  b=ku4RhVWjH8Y7sbPrjrY2nOl8fKf5gE31ZDAIsoI4ljsRBHenNpCh8mBT
   vc6QuuKPcgENAVqRadzecw3s3IYWNPcEUkzGmM00lyO+sovbyqb8I2mLe
   icajiDrmvYFA8914q6AJZ1TOkwlgFI85sHg7VYTZ3v0hfcxE2mqWJu1b9
   aRh32O4hzRi6KzXTB7aKzd0ty2cdVeZURRrvg/md3kKF6sN64Br5m+EGP
   DPpx6UcGEnGfPJSJV5zwG2IJs56RU3Yp5WH6mYWlxDT50mSAHOxFCXH4S
   3G70Ltyj+5DvehKeFJXA3DCQbRF2wJw0NSUMJkUc90i6ZYgBVcfJwv2CM
   Q==;
X-CSE-ConnectionGUID: C0OvAfa8RfyDysZR2qcTUg==
X-CSE-MsgGUID: YBV/GBd+Q/+PKL21V2GLNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77646909"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="77646909"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 23:53:32 -0800
X-CSE-ConnectionGUID: w663kWYfQVa8o27u4O5rSw==
X-CSE-MsgGUID: kwe5FhppRZ2RDxvcFi9xoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221500100"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 23:53:27 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy3WF-000000000Du-3zCf;
	Thu, 05 Mar 2026 07:53:15 +0000
Date: Thu, 5 Mar 2026 15:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: alistair23@gmail.com, chuck.lever@oracle.com, hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-nfs@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kbusch@kernel.org,
	axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
	hare@suse.de, alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v7 4/5] nvme-tcp: Support KeyUpdate
Message-ID: <202603051502.9qxZ0noK-lkp@intel.com>
References: <20260304053500.590630-5-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304053500.590630-5-alistair.francis@wdc.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on net/main net-next/main linus/master v7.0-rc2 next-20260304]
[cannot apply to linux-nvme/for-next horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alistair23-gmail-com/net-handshake-Store-the-key-serial-number-on-completion/20260304-134148
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260304053500.590630-5-alistair.francis%40wdc.com
patch subject: [PATCH v7 4/5] nvme-tcp: Support KeyUpdate
config: x86_64-buildonly-randconfig-006-20260305 (https://download.01.org/0day-ci/archive/20260305/202603051502.9qxZ0noK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051502.9qxZ0noK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051502.9qxZ0noK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/tcp.c:1429:24: error: no member named 'read_sock_cmsg' in 'struct proto_ops'
    1429 |         consumed = sock->ops->read_sock_cmsg(sk, &rd_desc, nvme_tcp_recv_skb,
         |                    ~~~~~~~~~  ^
   1 error generated.


vim +1429 drivers/nvme/host/tcp.c

  1417	
  1418	static int nvme_tcp_try_recv(struct nvme_tcp_queue *queue)
  1419	{
  1420		struct socket *sock = queue->sock;
  1421		struct sock *sk = sock->sk;
  1422		read_descriptor_t rd_desc;
  1423		int consumed;
  1424	
  1425		rd_desc.arg.data = queue;
  1426		rd_desc.count = 1;
  1427		lock_sock(sk);
  1428		queue->nr_cqe = 0;
> 1429		consumed = sock->ops->read_sock_cmsg(sk, &rd_desc, nvme_tcp_recv_skb,
  1430						     nvme_tcp_recv_cmsg);
  1431		release_sock(sk);
  1432		return consumed == -EAGAIN ? 0 : consumed;
  1433	}
  1434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
