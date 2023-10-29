Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89D838B;
	Sun, 29 Oct 2023 01:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Engyc690"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698542809; x=1730078809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mIEVVAat7PnxMneksUDSqD31vJyMx+pMAo4mn1Xr9oc=;
  b=Engyc690CpRmfSAKTk9DdYeZDBO9ysWZnEV5DrnLmp1c36mCwkwucqAJ
   VxOgLy+rt11+9FOWMnfY+0IU48QemJjOQH+BtKUuUrbYHX8C3G8hluA13
   UyiYgnTTCemkK/+oKPIGdBMQxdZVMNS0v7x3dSaq+9q0oeI7kijyZQI19
   Q7FCXbAeuLz9ccW+wMbKvGYYPzdDLefPnP8le7Dk4qH+62iiStqQdoi3B
   Y3uD+L03+xFYcYeWl1NpYPoCgrNoHGEIxjzEpc4u+OJEfwsYvq618mC01
   yt5cKKDuBNvB2uCjuL/LfpKfaD0jMav/UP6vG5hwzyG21jnvGPXkQxk3y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="454393407"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="454393407"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 18:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="1007091624"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="1007091624"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Oct 2023 18:26:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwuZf-000CER-0e;
	Sun, 29 Oct 2023 01:26:43 +0000
Date: Sun, 29 Oct 2023 09:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>, Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v2 05/11] x86/stackprotector/64: Convert stack protector
 to normal percpu variable
Message-ID: <202310290927.2MuJJdu9-lkp@intel.com>
References: <20231026160100.195099-6-brgerst@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026160100.195099-6-brgerst@gmail.com>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/master]
[also build test ERROR on next-20231027]
[cannot apply to tip/x86/core dennis-percpu/for-next linus/master tip/auto-latest v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/x86-stackprotector-32-Remove-stack-protector-test-script/20231027-000533
base:   tip/master
patch link:    https://lore.kernel.org/r/20231026160100.195099-6-brgerst%40gmail.com
patch subject: [PATCH v2 05/11] x86/stackprotector/64: Convert stack protector to normal percpu variable
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231029/202310290927.2MuJJdu9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290927.2MuJJdu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290927.2MuJJdu9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Unsupported relocation type: unknown type rel type name (42)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
