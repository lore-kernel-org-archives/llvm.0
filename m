Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C527C7F;
	Mon, 20 Nov 2023 00:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atpsucVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700438847; x=1731974847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fJ/D5rD/5O5u1EMP4jAbEGB4cg6X1FffoQPDKhIH5j4=;
  b=atpsucVh2DMHeolO4G+1D2qE3IYvHm7klPN2YzgxmbGpmc2UsorOicd6
   hl4404hDVtSI6XIs+tIgeEUbIBrQzM50oXMFK7bZ+3iErfj8L9duZ4+FS
   QQ27Pv2pyacujO+AQNOSTwWQYuni//hau6SxY/p5Jw0A0CsWTPRKv2jiO
   ZnGfa9vJlxXjQe8UUwKZNQigHsK0D1EdSXpiRWLXs+fm1dyDANe1DR9c3
   7qyaVu4n4xnqHG5geMrO42k1gYzeyLTZEI2LIJFXQyGzKNKI27T9s7wvk
   bG3u8F8rG9su8ygsoHGVQj9fLOjlnx1Kkb098VuOJgmXWR+T89b0Hb9Hy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376564712"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="376564712"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 16:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="883690891"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="883690891"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2023 16:07:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4row-0005jR-1A;
	Mon, 20 Nov 2023 00:07:22 +0000
Date: Mon, 20 Nov 2023 08:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm 5/6] drivers/char/tpm/tpm_tdx.c:884:32:
 warning: unused variable 'tdx_guest_ids'
Message-ID: <202311200755.tLSSoVwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm
head:   8fc95ae74b62b245179fb0a0a84dc5f5d8ce80aa
commit: db9652ec7a5bff8428a39af5c4aa706f62550ee2 [5/6] tpm: Add vTPM TDX support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231120/202311200755.tLSSoVwn-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200755.tLSSoVwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311200755.tLSSoVwn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_tdx.c:26:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
   drivers/char/tpm/tpm_tdx.c:685:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:716:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/char/tpm/tpm_tdx.c:685:2: note: remove the 'if' if its condition is always false
           if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:685:6: warning: variable 'ret' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
           if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:716:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/char/tpm/tpm_tdx.c:685:6: note: remove the '||' if its condition is always false
           if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:658:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
>> drivers/char/tpm/tpm_tdx.c:884:32: warning: unused variable 'tdx_guest_ids' [-Wunused-const-variable]
   static const struct x86_cpu_id tdx_guest_ids[] = {
                                  ^
   4 warnings generated.


vim +/tdx_guest_ids +884 drivers/char/tpm/tpm_tdx.c

   883	
 > 884	static const struct x86_cpu_id tdx_guest_ids[] = {
   885		X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
   886		{}
   887	};
   888	MODULE_DEVICE_TABLE(x86cpu, tdx_guest_ids);
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
