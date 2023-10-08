Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786559CA65;
	Sun,  8 Oct 2023 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDc0MKGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696752172; x=1728288172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NxwhEY2aLQTt0LSUKcSPKbSYog5ukmmLPiczy0V/HRQ=;
  b=kDc0MKGzxUierqHwLacRl+Q2Z6L2frBrJ1GZ6Rnu+0nEhfyKyqPQ/GZ6
   Gj+/Rs2QX7ac/inaNzamZIWgLD8CLDXrR9/thOytyvmu6Koa9feptzwGr
   0bAdWbVhhmzQa2uB9ZS63snjNDs/MZN0MugOCcLw5RK2hHuAec+N+Qv+e
   ZM5GYIAfHjiV6qLr6pcrQaOs2rYb16LeYB6gUsNUal3wr7X19oTa/eE+f
   +QLQyaNKa2Fm3wlP7waoc0C6cqwZPQ2NIZB4ijZI3OzNmlL4U/cAUd++9
   iPrGA8BJzV/dY74RZxxkEpXvdWHGOV1ZJLr4rz9eagI6w61VFXsBOY0gV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="386818567"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="386818567"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 01:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="752687719"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="752687719"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Oct 2023 01:02:49 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpOkR-0005E9-0f;
	Sun, 08 Oct 2023 08:02:47 +0000
Date: Sun, 8 Oct 2023 16:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 3/4] bpf: Introduce css_descendant
 open-coded iterator kfuncs
Message-ID: <202310081516.eEu25C9D-lkp@intel.com>
References: <20230827072057.1591929-4-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827072057.1591929-4-zhouchuyi@bytedance.com>

Hi Chuyi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuyi-Zhou/bpf-Introduce-css_task-open-coded-iterator-kfuncs/20230827-152340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230827072057.1591929-4-zhouchuyi%40bytedance.com
patch subject: [RFC PATCH bpf-next 3/4] bpf: Introduce css_descendant open-coded iterator kfuncs
config: i386-randconfig-r003-20230827 (https://download.01.org/0day-ci/archive/20231008/202310081516.eEu25C9D-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310081516.eEu25C9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310081516.eEu25C9D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_400 marked "dontcall-error": BUILD_BUG_ON failed: sizeof(struct bpf_iter_css_kern) != sizeof(struct bpf_iter_css)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
