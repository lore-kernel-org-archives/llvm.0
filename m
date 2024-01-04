Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133D4219EE;
	Thu,  4 Jan 2024 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWEtWwZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704372570; x=1735908570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZqQu8HfEkvamar/UMiLY9wskaFS0cJL6PKdzPHicFSk=;
  b=lWEtWwZZgiJdL/+bI7e0bjjfhbFOo1IlrdMC/EfFPwMij42ObbpY8Sbv
   YL7hqHRylq7xF2sT+vDqrpELHQ94RiNIHNfzxgnqAHlhdOja0NlRxLqKm
   LmQzdKYzrsCoAl/Ij2S15zJwB2EFB9v5RgTFrV8G7CXea28VzkURwmLOE
   LG4hDmB68pDVYO1+iO7J7tkm8rC2iH741lgnwccnMXWe+2qTGSW9R7gfY
   AyqO1Mr2J5qKvDEVj7pXYvfe5t+vPNEKXXT2vR9P8pPgZrjydi57Wlbpf
   0ZVONbWgMMSdERcHPRa/67epS9chBeeTZsEaL0r/mFVHKQVuOMIAXB4VI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="401010009"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="401010009"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 04:49:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="780371180"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="780371180"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 04 Jan 2024 04:49:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLN99-000NIa-27;
	Thu, 04 Jan 2024 12:49:16 +0000
Date: Thu, 4 Jan 2024 20:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/6] accel/habanalabs/gaudi2: move HMMU page tables to
 device memory
Message-ID: <202401042015.r2eyzYmv-lkp@intel.com>
References: <20240102150654.522555-5-ogabbay@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102150654.522555-5-ogabbay@kernel.org>

Hi Oded,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-misc/drm-misc-next linus/master v6.7-rc8 next-20240104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oded-Gabbay/accel-habanalabs-gaudi2-add-interrupt-affinity-for-user-interrupts/20240102-231007
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20240102150654.522555-5-ogabbay%40kernel.org
patch subject: [PATCH 5/6] accel/habanalabs/gaudi2: move HMMU page tables to device memory
config: x86_64-buildonly-randconfig-003-20240103 (https://download.01.org/0day-ci/archive/20240104/202401042015.r2eyzYmv-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401042015.r2eyzYmv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401042015.r2eyzYmv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/habanalabs/gaudi2/gaudi2.c:2311:6: warning: no previous prototype for function 'gaudi2_is_edma_queue_id' [-Wmissing-prototypes]
    2311 | bool gaudi2_is_edma_queue_id(u32 queue_id)
         |      ^
   drivers/accel/habanalabs/gaudi2/gaudi2.c:2311:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2311 | bool gaudi2_is_edma_queue_id(u32 queue_id)
         | ^
         | static 
   1 warning generated.


vim +/gaudi2_is_edma_queue_id +2311 drivers/accel/habanalabs/gaudi2/gaudi2.c

  2310	
> 2311	bool gaudi2_is_edma_queue_id(u32 queue_id)
  2312	{
  2313	
  2314		switch (queue_id) {
  2315		case GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0...GAUDI2_QUEUE_ID_DCORE0_EDMA_1_3:
  2316		case GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0...GAUDI2_QUEUE_ID_DCORE1_EDMA_1_3:
  2317		case GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0...GAUDI2_QUEUE_ID_DCORE2_EDMA_1_3:
  2318		case GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0...GAUDI2_QUEUE_ID_DCORE3_EDMA_1_3:
  2319			return true;
  2320		default:
  2321			return false;
  2322		}
  2323	}
  2324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
