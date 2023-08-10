Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CCB1E1C0;
	Thu, 10 Aug 2023 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691687546; x=1723223546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ztHccN4uK1QNpdAB8tzxeS2pHdz7ydchs5vr3hkbkLE=;
  b=c/9MHjLI6NJVNfWd2pwOoxsPIBktEUpfudAOUH5oDNYVsREioF9PRhuV
   hrUFnusVFj0OxWOlMkqZUsmesSl/n61Rl6YomfFeWAjmveO2VRzZaovJN
   UftuBd5jfy2X5kaky7YU6THVbOIJD4WhzLZnep04qWs2EEHRTlKEdBh1F
   rc7CkJJ6lXzkWpOiYHApe68i438j17cTltiNlo5t9M/WgrOOgRn2UKkwu
   9y1B4+LPnlvVNDA2+OpN4vdhrKP36RBRS3RBaNLQB/djHHSLrwz0VZY3q
   96Sp5dbVD8yk4gw4v2alJN8WfmG+SK/6eWPaNfTZwy5VhIVoflNcikKvL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361605834"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="361605834"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 10:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="1062994071"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="1062994071"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Aug 2023 10:12:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU9Co-00078C-1M;
	Thu, 10 Aug 2023 17:12:14 +0000
Date: Fri, 11 Aug 2023 01:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [drm-misc:for-linux-next 1/3] ld.lld: error: undefined symbol:
 vmf_insert_pfn_prot
Message-ID: <202308110133.f0lhFwMV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2799804ac651da1375ecb9b9a644eba97218df07
commit: e3912d09bf8ddd8e274118d4c9cc550d9665115d [1/3] drm/ttm: Introduce KUnit test
config: riscv-randconfig-r022-20230810 (https://download.01.org/0day-ci/archive/20230811/202308110133.f0lhFwMV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110133.f0lhFwMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110133.f0lhFwMV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: vmf_insert_pfn_prot
   >>> referenced by ttm_bo_vm.c
   >>>               drivers/gpu/drm/ttm/ttm_bo_vm.o:(ttm_bo_vm_fault_reserved) in archive vmlinux.a
   >>> referenced by ttm_bo_vm.c
   >>>               drivers/gpu/drm/ttm/ttm_bo_vm.o:(ttm_bo_vm_dummy_page) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - DRM_TTM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
