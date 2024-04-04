Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2213C3E3;
	Thu,  4 Apr 2024 22:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712268619; cv=none; b=K50PMOFFY5GYhLmOC6R475pt04/FhDlSYszBKrd4HzStcWUnRJJInqvrAChEiAkYVefm2nhQmeTt1j8FDn2pcj+nUqMRpYzKYZJKJRcz+WnPVyqNZWhyGM+NAUPC5Qd4+OZtkz2lmLB9UStkbPVBM1DWkso3oK0FHrfNi+qr6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712268619; c=relaxed/simple;
	bh=x9YImRUgczdtN1gsBIQYqYrgwTtPDST/DQC6rlVvDGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h3CyGMnTVivuyGwoF5G4Bdc5uEM+/JsAeti4374LJRZ2f0KSOwBXvW8x+vigwLpNdnQNvKgKUtsFIcc4DM9OCKxed+4iRE9aVnOBnKsArtYopaY6aCQ4ev145u5GFj+X0N0Y8GEoxuoBwfXGsSoqyo84Gp51OA+ECPOzvR/bztY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLe5sLrM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLe5sLrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712268617; x=1743804617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9YImRUgczdtN1gsBIQYqYrgwTtPDST/DQC6rlVvDGQ=;
  b=NLe5sLrMLb5lnVh2lMrqbcIy7AaQ/tEtoROS2xd4ftqOoz4TAOn3eKgE
   64bH+WuqjOFze9IzDJ4ff4W0Z4xbExFDaO5SDlP+MQN5dGllopqnTwwIF
   f+seSutTycly2xRcalLySUXR3IG8C/o1FsWaat8J1OvpwdeuUC8eISbTG
   vFwuDi+weOnBfJ2p8V1V0YrvdwuXQ2d1XIIZBvRQDsNoMWnESMFQhzHQ3
   nOs/wLCWjM42K8QEpWgECOvMEOIbldSfHlyGjQ0Gg6XBCJY8OdClCTjv0
   kZDmbL8l+8uB9AQIDPI+eqGI+acbtkz2kOrs5Wi+ozTuzGk7KwrPlNSwW
   Q==;
X-CSE-ConnectionGUID: Xu4DtRJCRtOJ7J/7zaj9Cg==
X-CSE-MsgGUID: GXy7MANhQPeoJh15fq/O4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7713985"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7713985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 15:10:14 -0700
X-CSE-ConnectionGUID: 7hZJWJJSQ4aA4bJTIGc0+g==
X-CSE-MsgGUID: 8mp0uYzwSmSJ4iWpIDTDGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="18829573"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2024 15:10:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsVHe-0001ZF-2T;
	Thu, 04 Apr 2024 22:10:10 +0000
Date: Fri, 5 Apr 2024 06:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nfs@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [trondmy-nfs:testing 31/31] fs/nfs/inode.c:2434:6: warning:
 incompatible pointer to integer conversion assigning to 'int' from 'struct
 proc_dir_entry *'
Message-ID: <202404050613.KnVPG1fF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
head:   f290a586e31f8965387dde660729c716a3af9b6c
commit: f290a586e31f8965387dde660729c716a3af9b6c [31/31] nfs: Handle error of rpc_proc_register() in nfs_net_init().
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050613.KnVPG1fF-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050613.KnVPG1fF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050613.KnVPG1fF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/inode.c:2434:6: warning: incompatible pointer to integer conversion assigning to 'int' from 'struct proc_dir_entry *' [-Wint-conversion]
           err = rpc_proc_register(net, &nn->rpcstats);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2434 fs/nfs/inode.c

  2426	
  2427	static int nfs_net_init(struct net *net)
  2428	{
  2429		struct nfs_net *nn = net_generic(net, nfs_net_id);
  2430		int err;
  2431	
  2432		nfs_clients_init(net);
  2433	
> 2434		err = rpc_proc_register(net, &nn->rpcstats);
  2435		if (err) {
  2436			nfs_clients_exit(net);
  2437			return err;
  2438		}
  2439	
  2440		return nfs_fs_proc_net_init(net);
  2441	}
  2442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
