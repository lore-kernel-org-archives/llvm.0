Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7D568B;
	Wed,  4 Oct 2023 20:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZr2MNE6"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696451871; x=1727987871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1JWBvPt33HK6ZOUD4ML/JmJZj6nsbTPT/ySlCFlr//I=;
  b=AZr2MNE6ikkU+TnWuPXdj1i5eGuIaZh6cNupaOnUupVJvSzcKYVcdp3C
   ukQEnt8KuYpF25Av21e3/uhjqIrBh5deKDMBgo/wLP6+PrDCn4JV0ACGC
   7O2nP2yZlFKAYyF0hZUfX9IFZqqVJ5ZkLsI2jGZEICdBtJzkFLV9Ws1+M
   pCV6JuFvu21TrRzxphFILnhZNpwWhbkbxHHxGBgrKYjtQo0O1NMvjaB5P
   ynoPETBby0BeQi6JPTZcYgnPQeFTGSPDKbBk27dKrNRSeQQlLsLHMvfqx
   lI6bSouT3TT2zn/VE2tgmcWcZ6B9fEoHuj0DzOopcaWIpKQRcFXdJwXM2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="4860469"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="4860469"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 13:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="895130504"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="895130504"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2023 13:36:21 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo8cs-000KbE-1O;
	Wed, 04 Oct 2023 20:37:46 +0000
Date: Thu, 5 Oct 2023 04:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nfs@vger.kernel.org
Subject: [trondmy-nfs:testing 12/12]
 fs/nfs/flexfilelayout/flexfilelayout.c:2536:13: error: use of undeclared
 identifier 'inode'
Message-ID: <202310050440.0XpKt47j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git testing
head:   a1a6c3d7c1edb81c0b4b20b44f0f4e7214c92116
commit: a1a6c3d7c1edb81c0b4b20b44f0f4e7214c92116 [12/12] pNFS/flexfiles: Check the layout validity in ff_layout_mirror_prepare_stats
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231005/202310050440.0XpKt47j-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050440.0XpKt47j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050440.0XpKt47j-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/flexfilelayout/flexfilelayout.c:1230:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
           int err;
               ^
>> fs/nfs/flexfilelayout/flexfilelayout.c:2536:13: error: use of undeclared identifier 'inode'
           lo = NFS_I(inode)->layout;
                      ^
   1 warning and 1 error generated.


vim +/inode +2536 fs/nfs/flexfilelayout/flexfilelayout.c

  2522	
  2523	static int ff_layout_prepare_layoutstats(struct nfs42_layoutstat_args *args)
  2524	{
  2525		struct pnfs_layout_hdr *lo;
  2526		struct nfs4_flexfile_layout *ff_layout;
  2527		const int dev_count = PNFS_LAYOUTSTATS_MAXDEV;
  2528	
  2529		/* For now, send at most PNFS_LAYOUTSTATS_MAXDEV statistics */
  2530		args->devinfo = kmalloc_array(dev_count, sizeof(*args->devinfo),
  2531					      nfs_io_gfp_mask());
  2532		if (!args->devinfo)
  2533			return -ENOMEM;
  2534	
  2535		spin_lock(&args->inode->i_lock);
> 2536		lo = NFS_I(inode)->layout;
  2537		if (lo && pnfs_layout_is_valid(lo)) {
  2538			ff_layout = FF_LAYOUT_FROM_HDR(lo);
  2539			args->num_dev = ff_layout_mirror_prepare_stats(
  2540				&ff_layout->generic_hdr, &args->devinfo[0], dev_count,
  2541				NFS4_FF_OP_LAYOUTSTATS);
  2542		} else
  2543			args->num_dev = 0;
  2544		spin_unlock(&args->inode->i_lock);
  2545		if (!args->num_dev) {
  2546			kfree(args->devinfo);
  2547			args->devinfo = NULL;
  2548			return -ENOENT;
  2549		}
  2550	
  2551		return 0;
  2552	}
  2553	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
