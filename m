Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3DE1FAB;
	Sat,  9 Sep 2023 21:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694294093; x=1725830093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHkJrugcxiHznL/9pviAG6OrRB9F9fk7qrGG2FAK6QE=;
  b=WyZoeDf1qStncX2p3DwOPcqKXAE7cmMW1uSrsSJFf7h69jYXdgjS6XpI
   4nbSeUxMLcCYaACngQ1jcCilUAgDFy4fmONSLeQoAXsSnzvreBh+aHuch
   vlY4c17Wf4BZY9kEjuxbKmQbBsyM+UoGePXFcKHt40PV5mjQiEKw2p7xF
   s6hD58ErSBUNiBU57WoMMZroIJNWLrToAyqJnn3qxWZjbNna5cMVWy0Jm
   ZIK3+mrrFAq5e/CtF3nMTjyFEuSkLp6Qm9TBjRuYTm96pcx6hAFjs5iOk
   VKxO49UTMizmXMn+vrFQ31sP1DmMtALdS+kIBjYrOrYmbsGMjG69v0DW0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441863055"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="441863055"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 14:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="886028476"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="886028476"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 14:14:30 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qf5Hz-0003wr-2c;
	Sat, 09 Sep 2023 21:14:47 +0000
Date: Sun, 10 Sep 2023 05:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers 2/19]
 drivers/vfio/vfio_main.c:1379:29: error: incomplete definition of type
 'struct vfio_group'
Message-ID: <202309100504.KDK9plcm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guarded_kvm_headers
head:   a4cf1960322069d95b013d644a0121858e5c996f
commit: 9a113a1eb83dc18c8f26462b8781d0a59f8c607e [2/19] KVM: vfio: Pass in kvm_{get,put}_kvm() helpers instead of doing symbol lookups
config: x86_64-randconfig-075-20230910 (https://download.01.org/0day-ci/archive/20230910/202309100504.KDK9plcm-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309100504.KDK9plcm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309100504.KDK9plcm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/vfio_main.c:1379:29: error: incomplete definition of type 'struct vfio_group'
                   vfio_device_set_kvm(&group->kvm_ref, kvm, get_kvm, put_kvm);
                                        ~~~~~^
   drivers/vfio/vfio.h:29:9: note: forward declaration of 'struct vfio_group'
           struct vfio_group *group;
                  ^
   1 error generated.


vim +1379 drivers/vfio/vfio_main.c

  1363	
  1364	/**
  1365	 * vfio_file_set_kvm - Link a kvm with VFIO drivers
  1366	 * @file: VFIO group file or VFIO device file
  1367	 * @kvm: KVM to link
  1368	 * @get_kvm: Callback to get a reference to @kvm
  1369	 * @put_kvm: Callback to put a reference to @kvm
  1370	 */
  1371	void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
  1372			       bool (*get_kvm)(struct kvm *kvm),
  1373			       void (*put_kvm)(struct kvm *kvm))
  1374	{
  1375		struct vfio_group *group;
  1376	
  1377		group = vfio_group_from_file(file);
  1378		if (group)
> 1379			vfio_device_set_kvm(&group->kvm_ref, kvm, get_kvm, put_kvm);
  1380	
  1381		if (vfio_device_from_file(file))
  1382			vfio_device_file_set_kvm(file, kvm, get_kvm, put_kvm);
  1383	}
  1384	EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
  1385	#endif
  1386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
