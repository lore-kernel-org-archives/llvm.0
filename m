Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7881DA23;
	Wed,  3 Jan 2024 21:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAE13Yzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704318419; x=1735854419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TMnFsNV5lqQthHteL5zvt2e7MKf88WZtxvqv4vfLaqU=;
  b=cAE13Yzy3TMjtPxfr+VycGxKIzYKkqyFPcwco9JbWj5JmdHGDSdj4+JU
   plmUjHv7GzmUsncL5doPdh4l27PwUGlGtlTKOe7nT2BKsj9XvlpDTmg3B
   97PDaM1io3G5+AwAqebzmpwmxxzFfaEx3H9414iRzOLRPyG/2KSJsqiG4
   FCamn0+CsxcMWX7Y51iYLF7aUedxn1ty6HGYQocKfuWkzzFxchvWUTqZq
   wb2stIZNQ8lWuPGs73pUxxBb+FMXtAdleMZQJfR657fO6gvHoYNfv0vLg
   SCWgPm/Hj5JZRN3KdjvQ6GFBprK5TXgxoqh16WFLLWTOe0syLLycTZODA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="10665558"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="10665558"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 13:46:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="953351996"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="953351996"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Jan 2024 13:46:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL94P-000Mam-1u;
	Wed, 03 Jan 2024 21:46:38 +0000
Date: Thu, 4 Jan 2024 05:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] accel/habanalabs/gaudi2: add interrupt affinity for
 user interrupts
Message-ID: <202401040509.quNnhjqG-lkp@intel.com>
References: <20240102150654.522555-2-ogabbay@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102150654.522555-2-ogabbay@kernel.org>

Hi Oded,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[also build test ERROR on linus/master v6.7-rc8]
[cannot apply to drm-misc/drm-misc-next next-20240103]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oded-Gabbay/accel-habanalabs-gaudi2-add-interrupt-affinity-for-user-interrupts/20240102-231007
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20240102150654.522555-2-ogabbay%40kernel.org
patch subject: [PATCH 2/6] accel/habanalabs/gaudi2: add interrupt affinity for user interrupts
config: x86_64-buildonly-randconfig-003-20240103 (https://download.01.org/0day-ci/archive/20240104/202401040509.quNnhjqG-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040509.quNnhjqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040509.quNnhjqG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/habanalabs/common/device.c:2814:34: error: no member named 'numa_node' in 'struct device'
    2814 |         int numa_node = hdev->pdev->dev.numa_node, i;
         |                         ~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +2814 drivers/accel/habanalabs/common/device.c

  2810	
  2811	void hl_init_cpu_for_irq(struct hl_device *hdev)
  2812	{
  2813		struct cpumask *available_mask = &hdev->irq_affinity_mask;
> 2814		int numa_node = hdev->pdev->dev.numa_node, i;
  2815		static struct cpumask cpu_mask;
  2816	
  2817		if (numa_node < 0)
  2818			return;
  2819	
  2820		if (!cpumask_and(&cpu_mask, cpumask_of_node(numa_node), cpu_online_mask)) {
  2821			dev_err(hdev->dev, "No available affinities in current numa node\n");
  2822			return;
  2823		}
  2824	
  2825		/* Remove HT siblings */
  2826		for_each_cpu(i, &cpu_mask)
  2827			cpumask_set_cpu(cpumask_first(topology_sibling_cpumask(i)), available_mask);
  2828	}
  2829	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
