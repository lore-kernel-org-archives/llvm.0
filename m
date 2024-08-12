Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D2411C92;
	Mon, 12 Aug 2024 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723471515; cv=none; b=HkqVOYA5rKo9zKBWlxPywiNGBONisoFiG1iXhrkIRGSzX/ZH2PwOqiroY8smmyc7OMolzAqKKQqtjZnZ5omeUie2D2feqCmALNchNU7h93OOeZXb6iff4yriKN036BFzpB/heCSoLpAuL1pycCWds+yYV3DvUZK8j+RlJgIkldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723471515; c=relaxed/simple;
	bh=8zAzGWTrTdgyW5NDvsQe8+IjYMlYxTyJS8xTNFrf3b8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqIwBK20IE0iiAwiynGnOnIP0RxmkuCtd/wokBtF5JmXQVAuJSSlhUKOPORHwgFlPr+OIeEK5GoAnSDPmzeZs1zo6vndNEui1nThobgMme/6Kp2D9AK90dE446fWjP38eFVgY/AidK079koaalcIXt7J41k32wY9JykaGK0C7nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdVS2o3t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdVS2o3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723471513; x=1755007513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zAzGWTrTdgyW5NDvsQe8+IjYMlYxTyJS8xTNFrf3b8=;
  b=ZdVS2o3t+k1P9+c1WXwp/5j/IeCe/1N/bDL0wbK56+7eQkIOoVoUk4lo
   QRMPP+jBEzPUbTr8KoOpKUB0TA2E2t6HirDLcEZlZwiJXb38fjngGXO5A
   4NoTpK/3nhWR2R7TvTVZ6UyrFxH4Tgg/iNWpsjpkEbDkVzae/iKGwHB1k
   Rb0WXxWhQDNZBrCDNEmp4HYXQ06Z4pl6Io2uirB9cxFd4B1DWqTbzSD6d
   GfkBTI5ARdMPlzu8oYL1VgQfYa/moeeL1mIwna45K+pcixH9fWZdUFlhU
   DCR6MbhwRCEFEc0q6gHOPWvVeHjmFtDt1QaQS8ooXofBjS6VFCnURwxJS
   g==;
X-CSE-ConnectionGUID: FcePDSImQ2GrhwIKudnnIw==
X-CSE-MsgGUID: uMIuLKdUQH2F9OupBZD0YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21731788"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21731788"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 07:05:09 -0700
X-CSE-ConnectionGUID: X52p2oiWTPqWwKq+bXK3OQ==
X-CSE-MsgGUID: tInoh+PSSIWO+Y6wvC0q2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="89107572"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2024 07:05:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdVfU-000Bs1-30;
	Mon, 12 Aug 2024 14:05:04 +0000
Date: Mon, 12 Aug 2024 22:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.f_owner 1/1] drivers/net/tun.c:3509:12: error:
 invalid operands to binary expression ('struct tun_file *' and 'struct
 sock')
Message-ID: <202408122247.pYJJ8C5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.f_owner
head:   06c2bce128dd5099bfb11734c6c043e38b8f40df
commit: 06c2bce128dd5099bfb11734c6c043e38b8f40df [1/1] file: reclaim 24 bytes from f_owner
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240812/202408122247.pYJJ8C5g-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122247.pYJJ8C5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408122247.pYJJ8C5g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/tun.c:3509:12: error: invalid operands to binary expression ('struct tun_file *' and 'struct sock')
    3509 |         if (tfile && tfile->sk)
         |             ~~~~~ ^  ~~~~~~~~~
   1 error generated.


vim +3509 drivers/net/tun.c

  3466	
  3467	static int tun_chr_open(struct inode *inode, struct file * file)
  3468	{
  3469		struct net *net = current->nsproxy->net_ns;
  3470		struct tun_file *tfile;
  3471		int ret;
  3472	
  3473		ret = file_f_owner_allocate(file);
  3474		if (ret)
  3475			return ret;
  3476	
  3477		tfile = (struct tun_file *)sk_alloc(net, AF_UNSPEC, GFP_KERNEL,
  3478						    &tun_proto, 0);
  3479		if (!tfile)
  3480			goto out_cleanup;
  3481		if (ptr_ring_init(&tfile->tx_ring, 0, GFP_KERNEL))
  3482			goto out_cleanup;
  3483	
  3484		mutex_init(&tfile->napi_mutex);
  3485		RCU_INIT_POINTER(tfile->tun, NULL);
  3486		tfile->flags = 0;
  3487		tfile->ifindex = 0;
  3488	
  3489		init_waitqueue_head(&tfile->socket.wq.wait);
  3490	
  3491		tfile->socket.file = file;
  3492		tfile->socket.ops = &tun_socket_ops;
  3493	
  3494		sock_init_data_uid(&tfile->socket, &tfile->sk, current_fsuid());
  3495	
  3496		tfile->sk.sk_write_space = tun_sock_write_space;
  3497		tfile->sk.sk_sndbuf = INT_MAX;
  3498	
  3499		file->private_data = tfile;
  3500		INIT_LIST_HEAD(&tfile->next);
  3501	
  3502		sock_set_flag(&tfile->sk, SOCK_ZEROCOPY);
  3503	
  3504		/* tun groks IOCB_NOWAIT just fine, mark it as such */
  3505		file->f_mode |= FMODE_NOWAIT;
  3506		return 0;
  3507	
  3508	out_cleanup:
> 3509		if (tfile && tfile->sk)
  3510			sk_free(&tfile->sk);
  3511		kfree(file->f_owner);
  3512		return -ENOMEM;
  3513	}
  3514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
