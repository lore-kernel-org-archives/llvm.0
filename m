Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0936834F262;
	Tue, 23 Dec 2025 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503780; cv=none; b=tXp3GZmWhcxdfH+8K+lxrlIPzWrrGxk9R5Dm/4uyZ+oY3Z/s+gqiTR77VGavQtQ6NSaZDH99sGkyL9Kkt2Ivg1MZm8uLYaJyCJ6iCt2GGpvuqVt8HMKZ95cp1idEQDmZGbNXyafqmsBi9yhHIYyxPxG3OwUJEB9cHieWzZoVgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503780; c=relaxed/simple;
	bh=CuLUCLF2D9OlmbHPGcwpLc9XdrPHTvg6uUHWA7dO4hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rf4bbSdyWY7GJaQ0kP+N9/5HjZYqb9JwBRQRI1V3Sd+fpe0rtxfYANo8FE+/P+IxmdGLco3Lw8J3osgH76ijl/n15Xk1Oj/66DYXXoraVGaBxHlNpNsSAkXBiHi8PkKYcYFtUB+Dch0/Yg79GTcWwdEuDOqP9DKT0CuXN9upFcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuOaXkj+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuOaXkj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766503779; x=1798039779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CuLUCLF2D9OlmbHPGcwpLc9XdrPHTvg6uUHWA7dO4hw=;
  b=KuOaXkj+cuMb1RFJ42d9edCbdbsHcdRQevuknVZKact2u/2vqpQDmjud
   dGpBXTKI2Jsl7Wn5y65USKuRC6yjAS8FAqcIe1eULhDEuTrj1Xb3XKNGx
   IzHd6kfHSYY82Wy7cdOBDnyAILHMnWThNrxny+JEJKnyxHIWZ5PX/2q83
   J8JauEm4p+6i/wpqaSlY7l2OLrFJxCqsQKdU2OdDbhL58a5aRM8ZC383W
   kPc+Z0fjIKL0UouaX/eXj9LHSeJNVYx+W3gb/Vi1AupFvGSNnow/9f3o7
   070cdmwsy69FqZsAp0jKYyyIZKAK/rCdgMRFqO+MiTu/oRVlnvJkiJ4Yg
   A==;
X-CSE-ConnectionGUID: x/N3H4iCQj+LtvneTaqohw==
X-CSE-MsgGUID: qqR+8Sb2S6a2i0cHmgreWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79072936"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79072936"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 07:29:37 -0800
X-CSE-ConnectionGUID: zRTC+q2yS3Kg1LdPAnSe6A==
X-CSE-MsgGUID: pEiBsqglRf6vYpMfKv6CjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199832341"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2025 07:29:34 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY4I3-00000000241-28Oj;
	Tue, 23 Dec 2025 15:27:42 +0000
Date: Tue, 23 Dec 2025 23:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, ioana.ciornei@nxp.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Dan Carpenter <error27@gmail.com>, Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
Message-ID: <202512232341.mNsrluKO-lkp@intel.com>
References: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222074958.992911-1-lihaoxiang@isrc.iscas.ac.cn>

Hi Haoxiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haoxiang-Li/bus-fsl-mc-fix-an-error-handling-in-fsl_mc_device_add/20251222-155324
base:   linus/master
patch link:    https://lore.kernel.org/r/20251222074958.992911-1-lihaoxiang%40isrc.iscas.ac.cn
patch subject: [PATCH] bus: fsl-mc: fix an error handling in fsl_mc_device_add()
config: x86_64-buildonly-randconfig-001-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232341.mNsrluKO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232341.mNsrluKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232341.mNsrluKO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bus/fsl-mc/fsl-mc-bus.c:899:27: error: expected ';' after expression
     899 |                 put_device(&mc_dev->dev)
         |                                         ^
         |                                         ;
   1 error generated.


vim +899 drivers/bus/fsl-mc/fsl-mc-bus.c

   778	
   779	/*
   780	 * Add a newly discovered fsl-mc device to be visible in Linux
   781	 */
   782	int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
   783			      struct fsl_mc_io *mc_io,
   784			      struct device *parent_dev,
   785			      struct fsl_mc_device **new_mc_dev)
   786	{
   787		int error;
   788		struct fsl_mc_device *mc_dev = NULL;
   789		struct fsl_mc_bus *mc_bus = NULL;
   790		struct fsl_mc_device *parent_mc_dev;
   791	
   792		if (dev_is_fsl_mc(parent_dev))
   793			parent_mc_dev = to_fsl_mc_device(parent_dev);
   794		else
   795			parent_mc_dev = NULL;
   796	
   797		if (strcmp(obj_desc->type, "dprc") == 0) {
   798			/*
   799			 * Allocate an MC bus device object:
   800			 */
   801			mc_bus = kzalloc(sizeof(*mc_bus), GFP_KERNEL);
   802			if (!mc_bus)
   803				return -ENOMEM;
   804	
   805			mutex_init(&mc_bus->scan_mutex);
   806			mc_dev = &mc_bus->mc_dev;
   807		} else {
   808			/*
   809			 * Allocate a regular fsl_mc_device object:
   810			 */
   811			mc_dev = kzalloc(sizeof(*mc_dev), GFP_KERNEL);
   812			if (!mc_dev)
   813				return -ENOMEM;
   814		}
   815	
   816		mc_dev->obj_desc = *obj_desc;
   817		mc_dev->mc_io = mc_io;
   818		device_initialize(&mc_dev->dev);
   819		mc_dev->dev.parent = parent_dev;
   820		mc_dev->dev.bus = &fsl_mc_bus_type;
   821		mc_dev->dev.release = fsl_mc_device_release;
   822		mc_dev->dev.type = fsl_mc_get_device_type(obj_desc->type);
   823		if (!mc_dev->dev.type) {
   824			error = -ENODEV;
   825			dev_err(parent_dev, "unknown device type %s\n", obj_desc->type);
   826			goto error_cleanup_dev;
   827		}
   828		dev_set_name(&mc_dev->dev, "%s.%d", obj_desc->type, obj_desc->id);
   829	
   830		if (strcmp(obj_desc->type, "dprc") == 0) {
   831			struct fsl_mc_io *mc_io2;
   832	
   833			mc_dev->flags |= FSL_MC_IS_DPRC;
   834	
   835			/*
   836			 * To get the DPRC's ICID, we need to open the DPRC
   837			 * in get_dprc_icid(). For child DPRCs, we do so using the
   838			 * parent DPRC's MC portal instead of the child DPRC's MC
   839			 * portal, in case the child DPRC is already opened with
   840			 * its own portal (e.g., the DPRC used by AIOP).
   841			 *
   842			 * NOTE: There cannot be more than one active open for a
   843			 * given MC object, using the same MC portal.
   844			 */
   845			if (parent_mc_dev) {
   846				/*
   847				 * device being added is a child DPRC device
   848				 */
   849				mc_io2 = parent_mc_dev->mc_io;
   850			} else {
   851				/*
   852				 * device being added is the root DPRC device
   853				 */
   854				if (!mc_io) {
   855					error = -EINVAL;
   856					goto error_cleanup_dev;
   857				}
   858	
   859				mc_io2 = mc_io;
   860			}
   861	
   862			error = get_dprc_icid(mc_io2, obj_desc->id, &mc_dev->icid);
   863			if (error < 0)
   864				goto error_cleanup_dev;
   865		} else {
   866			/*
   867			 * A non-DPRC object has to be a child of a DPRC, use the
   868			 * parent's ICID and interrupt domain.
   869			 */
   870			mc_dev->icid = parent_mc_dev->icid;
   871			mc_dev->dma_mask = FSL_MC_DEFAULT_DMA_MASK;
   872			mc_dev->dev.dma_mask = &mc_dev->dma_mask;
   873			mc_dev->dev.coherent_dma_mask = mc_dev->dma_mask;
   874			dev_set_msi_domain(&mc_dev->dev,
   875					   dev_get_msi_domain(&parent_mc_dev->dev));
   876		}
   877	
   878		/*
   879		 * Get MMIO regions for the device from the MC:
   880		 *
   881		 * NOTE: the root DPRC is a special case as its MMIO region is
   882		 * obtained from the device tree
   883		 */
   884		if (parent_mc_dev && obj_desc->region_count != 0) {
   885			error = fsl_mc_device_get_mmio_regions(mc_dev,
   886							       parent_mc_dev);
   887			if (error < 0)
   888				goto error_cleanup_dev;
   889		}
   890	
   891		/*
   892		 * The device-specific probe callback will get invoked by device_add()
   893		 */
   894		error = device_add(&mc_dev->dev);
   895		if (error < 0) {
   896			dev_err(parent_dev,
   897				"device_add() failed for device %s: %d\n",
   898				dev_name(&mc_dev->dev), error);
 > 899			put_device(&mc_dev->dev)
   900			return error;
   901		}
   902	
   903		dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));
   904	
   905		*new_mc_dev = mc_dev;
   906		return 0;
   907	
   908	error_cleanup_dev:
   909		kfree(mc_dev->regions);
   910		if (mc_bus)
   911			kfree(mc_bus);
   912		else
   913			kfree(mc_dev);
   914	
   915		return error;
   916	}
   917	EXPORT_SYMBOL_GPL(fsl_mc_device_add);
   918	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
