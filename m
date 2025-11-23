Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3DC1A76D4;
	Sun, 23 Nov 2025 04:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763872795; cv=none; b=cRU3gTY5sGjcIjFEopq8uF/nLR9LwNhzwkJ/gGJDCCA+hlPyUdQ7QEBoCVOFqDaNx1q79arEOZ/wm+hIHwDYa8V4FbA8FBMQJ05SfcQoPIBnqqnLTMlyRp6R80NPo/XzjDAuL8ooGlWQyujWv3slgvWm/tb/IghvjoS1a8yebGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763872795; c=relaxed/simple;
	bh=2ySFjsTcdMRfPRKbwzttoDoAVAj6sZhQ51GCYfVHNe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fk10i8Jz4h32nP9VlbBElgpRSWti5PryUzyvazFKrm0YSTGstruzADKy8a4opHrTaug8lp3swXceVgHi2acDwjrH0gx5mPkNt/iJKuQy63QnP2d/p8OfFvoinZbS3G9qxVySoHZolG4Xc+M/bMnuYStBFfiU+vcnhteMWgiq/J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJw0pmBU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJw0pmBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763872793; x=1795408793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ySFjsTcdMRfPRKbwzttoDoAVAj6sZhQ51GCYfVHNe0=;
  b=nJw0pmBUt+fJ89TZIYSSGXylF6PcGnAkpQm6zZZkGxloMgIb/koo4XzA
   koMgMOlXu1AyWPCI+opzkyvpUFjE1KYuiO+8SaqLUTGQS0447RBDvAEDa
   A3H0gazESdnZVBnAqoJ30TC8euttO5wd71mufYhDxZlac1zNn9tamFL5j
   U+G41ifURpkrUIhpUfamFZf+1MWqKXk5ywbTyZedFGpa1GBy5NzyxzQ1W
   NP04grk6xvkHnkObFE2NqCtUiiQ+Rg2DQ9wqpoWdy1k2b55yKkfDq0LoY
   IALobEgI/oUhXTfy0pH2rGIYGy1k/hdLnA16EtqCj+w3Co7JYpw2G6iXy
   w==;
X-CSE-ConnectionGUID: 15fCQ/3rRba2deyieFHjrg==
X-CSE-MsgGUID: iXjHsyTcTziE/IXzbd90CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69777656"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="69777656"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 20:39:52 -0800
X-CSE-ConnectionGUID: 7rmj2kNbRkqYm+scOI03tg==
X-CSE-MsgGUID: AH8VV6n6QWuvVkZhGEzSoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="191703664"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2025 20:39:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN1t6-000835-2g;
	Sun, 23 Nov 2025 04:39:48 +0000
Date: Sun, 23 Nov 2025 12:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare.scoped 38/51]
 arch/powerpc/platforms/pseries/papr-platform-dump.c:344:13: error: expected
 ';' after return statement
Message-ID: <202511231423.4weNFSVC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.fd.prepare.scoped
head:   09ba3707485de081133d97c9bdc7fa364d318f46
commit: 50297133917dafcd5d8924120ff66dc108351f57 [38/51] pseries: convert papr_platform_dump_create_handle() to FD_PREPARE()
config: powerpc64-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231423.4weNFSVC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231423.4weNFSVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231423.4weNFSVC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-platform-dump.c:344:13: error: expected ';' after return statement
     344 |                 return err
         |                           ^
         |                           ;
   1 error generated.


vim +344 arch/powerpc/platforms/pseries/papr-platform-dump.c

   281	
   282	/**
   283	 * papr_platform_dump_create_handle() - Create a fd-based handle for
   284	 * reading platform dump
   285	 *
   286	 * Handler for PAPR_PLATFORM_DUMP_IOC_CREATE_HANDLE ioctl command
   287	 * Allocates RTAS parameter struct and work area and attached to the
   288	 * file descriptor for reading by user space with the multiple RTAS
   289	 * calls until the dump is completed. This memory allocation is freed
   290	 * when the file is released.
   291	 *
   292	 * Multiple dump requests with different IDs are allowed at the same
   293	 * time, but not with the same dump ID. So if the user space is
   294	 * already opened file descriptor for the specific dump ID, return
   295	 * -EALREADY for the next request.
   296	 *
   297	 * @dump_tag: Dump ID for the dump requested to retrieve from the
   298	 *		hypervisor
   299	 *
   300	 * Return: The installed fd number if successful, -ve errno otherwise.
   301	 */
   302	static long papr_platform_dump_create_handle(u64 dump_tag)
   303	{
   304		struct ibm_platform_dump_params *params, *tmp;
   305		u64 param_dump_tag;
   306		int err;
   307	
   308		/*
   309		 * Return failure if the user space is already opened FD for
   310		 * the specific dump ID. This check will prevent multiple dump
   311		 * requests for the same dump ID at the same time. Generally
   312		 * should not expect this, but in case.
   313		 */
   314		list_for_each_entry(params, &platform_dump_list, list) {
   315			param_dump_tag = (u64) (((u64)params->dump_tag_hi << 32) |
   316						params->dump_tag_lo);
   317			if (dump_tag == param_dump_tag) {
   318				pr_err("Platform dump for ID(%llu) is already in progress\n",
   319						dump_tag);
   320				return -EALREADY;
   321			}
   322		}
   323	
   324		params =  kzalloc(sizeof(struct ibm_platform_dump_params),
   325				GFP_KERNEL_ACCOUNT);
   326		if (!params)
   327			return -ENOMEM;
   328	
   329		params->work_area = rtas_work_area_alloc(SZ_4K);
   330		params->buf_length = SZ_4K;
   331		params->dump_tag_hi = (u32)(dump_tag >> 32);
   332		params->dump_tag_lo = (u32)(dump_tag & 0x00000000ffffffffULL);
   333		params->status = RTAS_IBM_PLATFORM_DUMP_START;
   334	
   335		FD_PREPARE(fdf, O_RDONLY | O_CLOEXEC,
   336			   anon_inode_getfile_fmode("[papr-platform-dump]",
   337						    &papr_platform_dump_handle_ops,
   338						    (void *)params, O_RDONLY,
   339						    FMODE_LSEEK | FMODE_PREAD));
   340		err = ACQUIRE_ERR(fd_prepare, &fdf);
   341		if (err) {
   342			rtas_work_area_free(params->work_area);
   343			kfree(params);
 > 344			return err
   345		}
   346	
   347		list_add(&params->list, &platform_dump_list);
   348	
   349		pr_info("%s (%d) initiated platform dump for dump tag %llu\n",
   350			current->comm, current->pid, dump_tag);
   351		return fd_publish(fdf);
   352	}
   353	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
