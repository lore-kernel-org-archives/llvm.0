Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669711734;
	Fri, 27 Oct 2023 08:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvbH4iM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698393919; x=1729929919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QIKwvjsek1goltp4pekEjHsWHkEdQyhC55sfxHvQOc0=;
  b=BvbH4iM+TXKZLUVnjafoCQOoqm1PmTREWcFO7GrmSrjRnQppfqIxfR7Z
   sTTHycbU/JJdkPcB7LOsbdgMWwpEBJyqdXm3mdz+8zdhVMgB7yiM9+FXJ
   f7JVaJPiooBzYN9YHMVlkmr+uxPe9GZhFLOBaVYhZD2lADi2+IWpmw9Fh
   AdC6y+eisYvWwBe5fO3Pg7MpITXAdbdSeI6E1gvUxeDAVs4UDRQmTC9cI
   UxWNwn5e67M+Dm9m7SRKLeRYsdIalMwQybui8JPk2Gr2kzTE5bOsPpWkg
   Sgtfi9Vqo7jtWo0PPhbfKM26rkUA2t97Gc77tSs6JHMa68NG8wJZD6spc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="550576"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="550576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 01:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="735591"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2023 01:04:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwHqE-000AcN-0E;
	Fri, 27 Oct 2023 08:05:14 +0000
Date: Fri, 27 Oct 2023 16:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>
Subject: /bin/bash: line 1:   383 Segmentation fault
      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j
 --lang_exclude=rust --skip_encoding_btf_inconsistent_proto
 --btf_gen_optimized --btf_base vmlinux net/wireless/lib80211_crypt_wep.ko
Message-ID: <202310271627.PoxpstI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a568e3a961ba330091cd031647e4c303fa0badb
commit: 75eaf63ea7afeafd026ffef03bdc69e31f10829b net: skbuff: don't include <net/page_pool/types.h> to <linux/skbuff.h>
date:   3 months ago
config: hexagon-randconfig-r045-20220708 (https://download.01.org/0day-ci/archive/20231027/202310271627.PoxpstI5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271627.PoxpstI5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271627.PoxpstI5-lkp@intel.com/

All errors (new ones prefixed by >>):

   die__process_class: tag not supported 0x21 (subrange_type)!
>> /bin/bash: line 1:   383 Segmentation fault      LLVM_OBJCOPY="llvm-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux net/wireless/lib80211_crypt_wep.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
