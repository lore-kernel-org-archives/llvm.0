Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27711E1DFC;
	Sun, 15 Feb 2026 04:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771129696; cv=none; b=rZPAPUiJwAxNRecvWrYdwnF2vOAYR1U2iuOAaBIi4xrXfj9E6gNgi/SolkugfORPhMSpi0M8qzxHT6ZDSHwSTZJhaDAbKbfbwmrBgZCb/zJIAqMwybRMIpLo5PScBF2EEA8kn2ugEB94ok4vr4yO2ndxVast6R9oc0yLObCLr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771129696; c=relaxed/simple;
	bh=lAqbb6Bt6CRRp0SUFVtpZiA5j/NCVSuvXd/BTo9Lb7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oSH9tPfnLHJ9tteau8uSYBG4hlsc/6R6T/MFC18XeI0+i2ZGlPbRU5nTPz0R2hyXqPbiQFtEzBwvXmQZ0Fw26ZS3XlG9EX4roOGdSpIF0V5lVLrBHR1oWr4whbZfFouZBpX4vmwlWZjlEYrclWUU5LSLzK95nKuspKthitel0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHpTchjV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHpTchjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771129695; x=1802665695;
  h=date:from:to:cc:subject:message-id;
  bh=lAqbb6Bt6CRRp0SUFVtpZiA5j/NCVSuvXd/BTo9Lb7w=;
  b=kHpTchjV7gXsERlK15Xd2CrIf7OShHwSNqGVdbkHHk0bA81MYbLhUS8z
   K0DwmuIv7Gun5UDQDss1X8d0wcZ6pQaplCOxqU14bDgEI3OJSdfbGF/Iw
   9qMva8gascnwlfip3REM9YMZ80rExJo0Nx0hSaFtWjLftTtFZ791pdXzy
   1zeXrmCFCZY2aZCyOauZZ63McCfhYzZxnF+c/VbgupwZfx6HNAS/KM7zl
   ZmaTWBx8dlvM2k85yjED/53LJN80Ey3LgsauuLjIbxywE5AgE6GhWnuG5
   oxc4wVpao+lFs2GRZ7blDkESuwYillxZkxJIRYrBuTIW6ZDCZTwlZ2dq0
   g==;
X-CSE-ConnectionGUID: zeMoCmlOSGGAC5abLzHQrg==
X-CSE-MsgGUID: 0O75xpxAQoKQrtYCO6MjLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="71284996"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="71284996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 20:28:14 -0800
X-CSE-ConnectionGUID: Ua0zYn6dQ6m2UfMGLKGTvA==
X-CSE-MsgGUID: k9IYt96YTcWRpX910MBj7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="211900386"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2026 20:28:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrTju-00000000xP6-22M6;
	Sun, 15 Feb 2026 04:28:10 +0000
Date: Sun, 15 Feb 2026 12:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:nfsd-testing 30/32] fs/nfsd/nfs4layouts.c:851:12:
 error: no member named 'cl_fence_retry_warn' in 'struct nfs4_client'
Message-ID: <202602151202.a1laeI7t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   953c8226cb2febafabb06a2667e860a2bfe43660
commit: ce1368c9edf719a4fada76bf537f0614ab611835 [30/32] NFSD: Enforce timeout on layout recall and integrate lease manager fencing
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260215/202602151202.a1laeI7t-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151202.a1laeI7t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151202.a1laeI7t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/nfs4layouts.c:851:12: error: no member named 'cl_fence_retry_warn' in 'struct nfs4_client'
     851 |         if (!clp->cl_fence_retry_warn) {
         |              ~~~  ^
   fs/nfsd/nfs4layouts.c:856:8: error: no member named 'cl_fence_retry_warn' in 'struct nfs4_client'
     856 |                 clp->cl_fence_retry_warn = true;
         |                 ~~~  ^
   2 errors generated.


vim +851 fs/nfsd/nfs4layouts.c

   795	
   796	static void
   797	nfsd4_layout_fence_worker(struct work_struct *work)
   798	{
   799		struct delayed_work *dwork = to_delayed_work(work);
   800		struct nfs4_layout_stateid *ls = container_of(dwork,
   801				struct nfs4_layout_stateid, ls_fence_work);
   802		struct nfsd_file *nf;
   803		struct block_device *bdev;
   804		struct nfs4_client *clp;
   805		struct nfsd_net *nn;
   806	
   807		/*
   808		 * The workqueue clears WORK_STRUCT_PENDING before invoking
   809		 * this callback. Re-arm immediately so that
   810		 * delayed_work_pending() returns true while the fence
   811		 * operation is in progress, preventing
   812		 * lm_breaker_timedout() from taking a duplicate reference.
   813		 */
   814		mod_delayed_work(system_dfl_wq, &ls->ls_fence_work, 0);
   815	
   816		spin_lock(&ls->ls_lock);
   817		if (list_empty(&ls->ls_layouts)) {
   818			spin_unlock(&ls->ls_lock);
   819	dispose:
   820			cancel_delayed_work(&ls->ls_fence_work);
   821			/* unlock the lease so that tasks waiting on it can proceed */
   822			nfsd4_close_layout(ls);
   823	
   824			ls->ls_fenced = true;
   825			nfs4_put_stid(&ls->ls_stid);
   826			return;
   827		}
   828		spin_unlock(&ls->ls_lock);
   829	
   830		rcu_read_lock();
   831		nf = nfsd_file_get(ls->ls_file);
   832		rcu_read_unlock();
   833		if (!nf)
   834			goto dispose;
   835	
   836		clp = ls->ls_stid.sc_client;
   837		nn = net_generic(clp->net, nfsd_net_id);
   838		bdev = nf->nf_file->f_path.mnt->mnt_sb->s_bdev;
   839		if (nfsd4_layout_ops[ls->ls_layout_type]->fence_client(ls, nf)) {
   840			/* fenced ok */
   841			nfsd_file_put(nf);
   842			pr_warn("%s: FENCED client[%pISpc] clid[%d] to device[%s]\n",
   843				__func__, (struct sockaddr *)&clp->cl_addr,
   844				clp->cl_clientid.cl_id - nn->clientid_base,
   845				bdev->bd_disk->disk_name);
   846			goto dispose;
   847		}
   848		/* fence failed */
   849		nfsd_file_put(nf);
   850	
 > 851		if (!clp->cl_fence_retry_warn) {
   852			pr_warn("%s: FENCE failed client[%pISpc] clid[%d] device[%s]\n",
   853				__func__, (struct sockaddr *)&clp->cl_addr,
   854				clp->cl_clientid.cl_id - nn->clientid_base,
   855				bdev->bd_disk->disk_name);
   856			clp->cl_fence_retry_warn = true;
   857		}
   858		/*
   859		 * The fence worker retries the fencing operation indefinitely to
   860		 * prevent data corruption. The admin needs to take the following
   861		 * actions to restore access to the file for other clients:
   862		 *
   863		 *  . shutdown or power off the client being fenced.
   864		 *  . manually expire the client to release all its state on the server;
   865		 *    echo 'expire' > /proc/fs/nfsd/clients/clid/ctl'.
   866		 *
   867		 *    Where:
   868		 *
   869		 *    clid: is the unique client identifier displayed in
   870		 *          the warning message above.
   871		 */
   872		if (!ls->ls_fence_delay)
   873			ls->ls_fence_delay = HZ;
   874		else
   875			ls->ls_fence_delay = min(ls->ls_fence_delay << 1,
   876						 MAX_FENCE_DELAY);
   877		mod_delayed_work(system_dfl_wq, &ls->ls_fence_work, ls->ls_fence_delay);
   878	}
   879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
