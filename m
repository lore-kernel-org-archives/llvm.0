Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9903FB95;
	Mon, 11 Mar 2024 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710166608; cv=none; b=a4xY+fCqd7nXRKsfg0z+9h5oqul6abky03lJ34IE3XNAd+/7caSbrCH6kvCGlYRGEqNlF1/pBBN3TlSET6KSAs/wMmxolT9ZD7eDMS0xXG3nhT4p+GiRZm9e/Qrh3LQB0wEaph/4lPRJAUWgHC6Yvp5ZGTQUPynUZcrkz1KGqNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710166608; c=relaxed/simple;
	bh=WSGPC7C5T3gv/BeIbBQR0oTEGkTo2Yp2Jlxul6f5iYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0vZgDxe/CTGqJlCYy5A03xScySZNsyi18K/xNgvjx9PVjfl6eJ+NcdW1P0YzoKgyXX3kU642kQc6H6AfC6Np4UgTxRtIZ5lBtm1hHni+4EPcb+0byGC5T6Gbrlqday19D5FpKi8NHSurv0apZ0qdNFp+I8q0TTY1CjlwrDOV2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9brIOvB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9brIOvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710166607; x=1741702607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WSGPC7C5T3gv/BeIbBQR0oTEGkTo2Yp2Jlxul6f5iYs=;
  b=U9brIOvBiOYviBe4k6h4cWULejE0MC2pEcoBTzpscNgdtvEH24BRH3eR
   F6VKNr1A325BiHHmYOoCiUZgxEjHB5iv8quHbGcsetRxZ0/fugZ/W4dda
   o8MgNVKUqi7OPqAdAInGyv6OZay3WaVKj7NVXooDXC2MhW9u+zuw9qhvr
   Hzq1Ee2RrMKVKOe6PrixibCN4zF7myI2zhSSvI3mSwT4T4rGXXzNrvsCV
   v0HfC7yvZ3DFmwebn/8S0l01H5C+v81RSu93nncJIPOcpHg3Y5S9YC4vF
   iMyplZAYJUrd1ycU6npJc74pwLfWDVaW4ceaQ8bKakUjVqsDsNVk4Dxw4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4755613"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4755613"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 07:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11758068"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2024 07:16:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjgSI-0009AX-28;
	Mon, 11 Mar 2024 14:16:42 +0000
Date: Mon, 11 Mar 2024 22:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH vhost v2 1/4] virtio: find_vqs: pass struct instead of
 multi parameters
Message-ID: <202403112253.omPqb1A5-lkp@intel.com>
References: <20240311072113.67673-2-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311072113.67673-2-xuanzhuo@linux.alibaba.com>

Hi Xuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on s390/features linus/master v6.8 next-20240308]
[cannot apply to uml/next uml/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio-find_vqs-pass-struct-instead-of-multi-parameters/20240311-152448
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240311072113.67673-2-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH vhost v2 1/4] virtio: find_vqs: pass struct instead of multi parameters
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240311/202403112253.omPqb1A5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403112253.omPqb1A5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403112253.omPqb1A5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/virtio/virtio_pci_modern.c:761:15: error: read-only variable is not assignable
           cfg.names[0] = avq->name;
           ~~~~~~~~~~~~ ^
   1 error generated.


vim +761 drivers/virtio/virtio_pci_modern.c

   735	
   736	static int vp_modern_create_avq(struct virtio_device *vdev)
   737	{
   738		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
   739		vq_callback_t *callbacks[] = { NULL };
   740		struct virtio_vq_config cfg = {};
   741		struct virtio_pci_admin_vq *avq;
   742		struct virtqueue *vq;
   743		const char *names[1];
   744		u16 admin_q_num;
   745	
   746		cfg.nvqs = 1;
   747		cfg.callbacks = callbacks;
   748		cfg.names = names;
   749	
   750		if (!virtio_has_feature(vdev, VIRTIO_F_ADMIN_VQ))
   751			return 0;
   752	
   753		admin_q_num = vp_modern_avq_num(&vp_dev->mdev);
   754		if (!admin_q_num)
   755			return -EINVAL;
   756	
   757		avq = &vp_dev->admin_vq;
   758		avq->vq_index = vp_modern_avq_index(&vp_dev->mdev);
   759		sprintf(avq->name, "avq.%u", avq->vq_index);
   760	
 > 761		cfg.names[0] = avq->name;
   762		cfg.cfg_idx = 0;
   763		vq = vp_dev->setup_vq(vp_dev, &vp_dev->admin_vq.info, avq->vq_index,
   764				      &cfg, VIRTIO_MSI_NO_VECTOR);
   765		if (IS_ERR(vq)) {
   766			dev_err(&vdev->dev, "failed to setup admin virtqueue, err=%ld",
   767				PTR_ERR(vq));
   768			return PTR_ERR(vq);
   769		}
   770	
   771		vp_modern_set_queue_enable(&vp_dev->mdev, avq->info.vq->index, true);
   772		return 0;
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
