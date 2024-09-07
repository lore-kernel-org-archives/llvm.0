Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8030F282FA;
	Sat,  7 Sep 2024 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725740198; cv=none; b=iO3pzq83JYXJnDoOYKu7DchqH45n4ze/4qeJIC3XtP34U1N4M7rrUbqryjViZJe89X2uCrZQzaGBEZ5ewh8yWzPjJHz9LW5kltjwvFYZn1Nboj3ek+OH05qMhaP+FmugsqfHnvinnn/TYXBR9QpDF2dvJbRDkRKABMsstD1fFcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725740198; c=relaxed/simple;
	bh=WMVQMzLE9Xqb8q7ZuUfOhRebecLvcZqfXpcB1wDdFrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWVvGOFdAVQhqevtWL6WLcrGlzrlkeBx9dkXDurjkPzLnBPzIYu7j5MYEAhEfBTrb7RxzONpvTB9xBUdTmoS0c/zYT/WWUvlcjAxOLnHi/yt+QBOaCU5049GwqPohr+tkyjqoaqFS7qMNmJI5IWH0rxeTiLhnaVbgykFQzHtp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeJ8XttG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeJ8XttG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725740196; x=1757276196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WMVQMzLE9Xqb8q7ZuUfOhRebecLvcZqfXpcB1wDdFrE=;
  b=WeJ8XttGHQy+tkbuJ6/7M45+lm5PPBxFGU67O0E4/AmF87/2+p78ZWNt
   YDXqv2IK906rJxSI1VVxsT49rELPyUDMGRtHrTDWgfJX2fTdPsOtCfWn1
   4oPBCy69fpPJ+aFNjYJe1iKDT5uA9wWhNZ3NaDboo3vUeHdtS8iMwhiKR
   uKFls7ftOBN4XbwzbpX/QX9Zc7HxH6+kDZ4gK2L99vzrE0xv2Us9hNABo
   +tXnmT+iWrzmL4IuRF/EtBavt2afwHH242c2ewYwiyUzIAFKo6obBZnrw
   RB8n9GAwxkHvcpKcJ1fJRg6RQg6T5whwqrrti4W7eij5LJa1wmWyq2MCl
   A==;
X-CSE-ConnectionGUID: 9tlgqQo3Tn2RKYtwCtIqaw==
X-CSE-MsgGUID: 9IuC07RNRiij46h/944i9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="13424234"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="13424234"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 13:16:35 -0700
X-CSE-ConnectionGUID: sB+7M0u9T22JZWBAuo/AcQ==
X-CSE-MsgGUID: PaXA9fJ2SUSKXdN51vEzzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="71055438"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Sep 2024 13:16:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn1rD-000Cxv-0p;
	Sat, 07 Sep 2024 20:16:31 +0000
Date: Sun, 8 Sep 2024 04:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vasileios Amoiridis <vassilisamir@gmail.com>, robh@kernel.org,
	saravanak@google.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	andriy.shevchenko@linux.intel.com,
	Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: Re: [PATCH v2 2/2] of/irq: Use helper to define resources
Message-ID: <202409080407.JLfgI8Fr-lkp@intel.com>
References: <20240904160239.121301-3-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904160239.121301-3-vassilisamir@gmail.com>

Hi Vasileios,

kernel test robot noticed the following build errors:

[auto build test ERROR on ecc768a84f0b8e631986f9ade3118fa37852fef0]

url:    https://github.com/intel-lab-lkp/linux/commits/Vasileios-Amoiridis/of-irq-Make-use-of-irq_get_trigger_type/20240905-000607
base:   ecc768a84f0b8e631986f9ade3118fa37852fef0
patch link:    https://lore.kernel.org/r/20240904160239.121301-3-vassilisamir%40gmail.com
patch subject: [PATCH v2 2/2] of/irq: Use helper to define resources
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240908/202409080407.JLfgI8Fr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080407.JLfgI8Fr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080407.JLfgI8Fr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/of/irq.c:432:71: error: expected ';' after expression
     432 |                 *r = DEFINE_RES_IRQ_NAMED(irq, name ? name : of_node_full_name(dev))
         |                                                                                     ^
         |                                                                                     ;
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [y]:
   - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +432 drivers/of/irq.c

   405	
   406	/**
   407	 * of_irq_to_resource - Decode a node's IRQ and return it as a resource
   408	 * @dev: pointer to device tree node
   409	 * @index: zero-based index of the irq
   410	 * @r: pointer to resource structure to return result into.
   411	 */
   412	int of_irq_to_resource(struct device_node *dev, int index, struct resource *r)
   413	{
   414		int irq = of_irq_get(dev, index);
   415	
   416		if (irq < 0)
   417			return irq;
   418	
   419		/* Only dereference the resource if both the
   420		 * resource and the irq are valid. */
   421		if (r && irq) {
   422			const char *name = NULL;
   423	
   424			memset(r, 0, sizeof(*r));
   425			/*
   426			 * Get optional "interrupt-names" property to add a name
   427			 * to the resource.
   428			 */
   429			of_property_read_string_index(dev, "interrupt-names", index,
   430						      &name);
   431	
 > 432			*r = DEFINE_RES_IRQ_NAMED(irq, name ? name : of_node_full_name(dev))
   433			r->flags |= irq_get_trigger_type(irq);
   434		}
   435	
   436		return irq;
   437	}
   438	EXPORT_SYMBOL_GPL(of_irq_to_resource);
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
