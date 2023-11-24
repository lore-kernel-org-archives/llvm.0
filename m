Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DAE2F500;
	Fri, 24 Nov 2023 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9Ma7UPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840483; x=1732376483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KBXZ7V0n8puOvrA2iBOBIFPiPLtH4rJ94oxDT7+ukpo=;
  b=F9Ma7UPsL4IiAr08Z3YN6x1K1xwLAxsDQ69WzkYBHSL95IfmwkcrM3D9
   845tNO4EX0mB4mmsHlfprj3SepGl7t1112wG4T+iMQ1RuIIrYbt6dd15J
   bqAt10DRU2UjUl7Gs+q5i/Xb0bx5L1B6fu2ef0JL/Sf/n4kg+xJDVohxu
   IShbGTsfWgJmA69Sj6MwDHqM1T0Ve0n0seteZ3Grynpn1q6Z8pL2qOwK1
   9bwABE2xBTDVZ0KmU0q7TJT4uKNyu/E6OUk2gUrGKN6AD/RN8Nq85fEcj
   9gWIoqjV41dGzzBctUG2DygRSdXs8hM0McFgCNy5r8j3OOE7WXe6cV+x0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478650490"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="478650490"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="838110800"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="838110800"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Nov 2023 07:41:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YIx-0002xj-29;
	Fri, 24 Nov 2023 15:41:19 +0000
Date: Fri, 24 Nov 2023 23:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-lpa2-v5-part1 41/42] ld.lld: error: undefined symbol:
 __kcfi_typeid_idmap_cpu_replace_ttbr1
Message-ID: <202311241925.fMr5Bccm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-lpa2-v5-part1
head:   c179631b61a7f3f25db10cad6a921bd0ee4ed93c
commit: a2e527cc6929fa619c131cf7fd73b9a901aecc7c [41/42] arm64: mm: omit redundant remap of kernel image
config: arm64-randconfig-003-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241925.fMr5Bccm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241925.fMr5Bccm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241925.fMr5Bccm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid_idmap_cpu_replace_ttbr1
   >>> referenced by arch/arm64/mm/proc.o:(.idmap.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
