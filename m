Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517F62F39DE;
	Tue,  2 Sep 2025 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810302; cv=none; b=GsfYAK+DWq7DLxz7VTTzmioDLYsG/xY4rCShhKE2/m4WIR/Kzt5tOGfY3e0FWebJ30to/f89+Aeo3+14gO6KlsgFylDViZySwcCZq9zHwtjkxLjGfEPjK2STZVoFlU1SiHq7hiVsf4Qc0ILclZxAXvuCcm868+EhUWCqgkpCvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810302; c=relaxed/simple;
	bh=6voiUtFCPIIZkK9FvK1ZTdpHcuU2vsOzBOEaHB2C5Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONo5wteroNZHqZw8pVjTLWK2uP5H5siT3fXFQC4wBXX1hkYgbf14bm6288WQtgBDOw+jTexLrkHWWCFfvTI+S4qHUpBCclQGeubj8CMOOrw5CnFPBtvX54R+PTnbCVMmw8DKGAY79NIXEi78DyiKQs+pH2rP+/5OJL+aqqX+rYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bl2ZofJQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bl2ZofJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756810301; x=1788346301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6voiUtFCPIIZkK9FvK1ZTdpHcuU2vsOzBOEaHB2C5Z4=;
  b=Bl2ZofJQ6yVOmeFvRsGK6wYQouhNGcZYfai/RsgxUfZhX2FAUugXU6Wo
   mtu7uI+TXpLkp//cKhcgecBS5zAW7ci70Wqh71BhNiThJbBK/r4yhy9D1
   k1DPZUk9UHBxpj/vOuhYfsIqhrRVNPItSHLmKqtzHujZUOKZAjvTxhenf
   80SYXwUvpFUzV6QDgsekMMpgQ5o/j+mL4n+daP78umMM01Y390xqh1kca
   jC9qdVZf7fKHke/CJlp9bav2mPzPjl8TKX9A1n++xvBpp4945Y3Vzdx4c
   Ow+Fm/OCj8Tu/zr2Tkwdkk9uxXPABghV3ZqbA1swVpUTRxVY4NhijeOFO
   A==;
X-CSE-ConnectionGUID: bXI+7plKS3+6RA0+VrCOrg==
X-CSE-MsgGUID: LdkxTZqIQNmLDrE4Ojk4rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59014776"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59014776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:51:40 -0700
X-CSE-ConnectionGUID: sNwDSsDoSt6kk2HK9sIkYw==
X-CSE-MsgGUID: caws2EPTSTOwRdb4BA+nYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175609646"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Sep 2025 03:51:39 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utObw-0001rR-1z;
	Tue, 02 Sep 2025 10:51:36 +0000
Date: Tue, 2 Sep 2025 18:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 4/7] soc: fsl: qe: Add support of IRQ in QE GPIO
Message-ID: <202509021830.uakzVIlK-lkp@intel.com>
References: <1234b2b7105443654c5f2bb97d25cf16408d6003.1756727747.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1234b2b7105443654c5f2bb97d25cf16408d6003.1756727747.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on powerpc/next powerpc/fixes linus/master v6.17-rc4]
[cannot apply to next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/soc-fsl-qe-Add-an-interrupt-controller-for-QUICC-Engine-Ports/20250901-202447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1234b2b7105443654c5f2bb97d25cf16408d6003.1756727747.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v5 4/7] soc: fsl: qe: Add support of IRQ in QE GPIO
config: powerpc64-randconfig-003-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021830.uakzVIlK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021830.uakzVIlK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021830.uakzVIlK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:37:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      37 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_THREAD__ 1
         |         ^
>> drivers/soc/fsl/qe/gpio.c:316:9: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'const void *' [-Wvoid-pointer-to-int-cast]
     316 |         mask = (u32)of_device_get_match_data(dev);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +316 drivers/soc/fsl/qe/gpio.c

   301	
   302	static int qe_gpio_probe(struct platform_device *ofdev)
   303	{
   304		struct device *dev = &ofdev->dev;
   305		struct device_node *np = dev->of_node;
   306		struct qe_gpio_chip *qe_gc;
   307		struct gpio_chip *gc;
   308		u32 mask;
   309	
   310		qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
   311		if (!qe_gc)
   312			return -ENOMEM;
   313	
   314		spin_lock_init(&qe_gc->lock);
   315	
 > 316		mask = (u32)of_device_get_match_data(dev);
   317		if (mask) {
   318			int i, j;
   319	
   320			for (i = 0, j = 0; i < ARRAY_SIZE(qe_gc->irq); i++)
   321				if (mask & PIN_MASK(i))
   322					qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
   323		}
   324	
   325		gc = &qe_gc->gc;
   326	
   327		gc->base = -1;
   328		gc->ngpio = QE_PIO_PINS;
   329		gc->direction_input = qe_gpio_dir_in;
   330		gc->direction_output = qe_gpio_dir_out;
   331		gc->get = qe_gpio_get;
   332		gc->set = qe_gpio_set;
   333		gc->set_multiple = qe_gpio_set_multiple;
   334		gc->to_irq = qe_gpio_to_irq;
   335		gc->parent = dev;
   336		gc->owner = THIS_MODULE;
   337	
   338		gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
   339		if (!gc->label)
   340			return -ENOMEM;
   341	
   342		qe_gc->regs = devm_of_iomap(dev, np, 0, NULL);
   343		if (IS_ERR(qe_gc->regs))
   344			return PTR_ERR(qe_gc->regs);
   345	
   346		qe_gpio_save_regs(qe_gc);
   347	
   348		return devm_gpiochip_add_data(dev, gc, qe_gc);
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
