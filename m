Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEB12904;
	Fri, 21 Jun 2024 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718935938; cv=none; b=pL7cLGnutMkokKzChKlTdclZIiX4K7dIzI18F/+ExopoRH2Qm1KoXJoR67cUldlT6+wwo943g0y/Sk1gyz5miAr7Ium4DvxEl1PuJAQI0UOt1fgq6D+PXeRSC90scsZrVtR3RzNNiPJZ3cs/psROvyquhzRke8VjV1axavbYue8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718935938; c=relaxed/simple;
	bh=cSVV91smChU59fq/0cf8CcphdgPaV6UJgHcHP4gOoKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dW6t3UAKyJAv5ZqIihYgLrot90Nez1LFrxihisI3qzTEIzp8h3TT5xis/IfZj8RRjuczIL1O4mLPPoZEod7QUBoEly+dv/Cp3h1lu6M6wdwy3CZ3LZv5zG9Ag+l46i31WtJYbPXkGm53XDexuZcTmFEQvYZfEUsniTqxpgluKi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfXRATAS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfXRATAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718935936; x=1750471936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSVV91smChU59fq/0cf8CcphdgPaV6UJgHcHP4gOoKs=;
  b=UfXRATAS74wP1A/kcV3FbtSA8/Izu3UhJAwAOjY1Sdezv1ck9xPjsF/l
   xjf9U69jfsjIgUbF14rYxgGcsFGYYOPtlOTNK+Xtc+/0ij5iDin0dZgjd
   UPWToqz60gS/wKBOMgT/P9dLEhC5KZliqYeenOvJhuwE9M4U+QwOiLkft
   V1UiH3arU/x63lD55H+oyvF5L1UeMt5sbiNTBfPdAhExkZIZa98nJ2dkV
   JZ8ufhEvlxmayEgR1lslzYDrnRVhdvS0f7LdjQjaTOzBbPzUvLiikd2ZA
   KfPvxqyQL1go5bGBtwNvQggd8WUkSaxFeCz7l+qPfapRl7JxU4b66+pQw
   Q==;
X-CSE-ConnectionGUID: XdE5Yk5lRge7p6Ir7LcqiA==
X-CSE-MsgGUID: LGVEQbjqQm2ckTAfLhCstw==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16096307"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16096307"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 19:12:16 -0700
X-CSE-ConnectionGUID: +fcWbVETTg6E/OY+YLI/rA==
X-CSE-MsgGUID: WzmryTMNS/STmdus2NglhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="65690574"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jun 2024 19:12:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKTl6-00087K-2j;
	Fri, 21 Jun 2024 02:12:12 +0000
Date: Fri, 21 Jun 2024 10:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>
Subject: [ulfh-mmc:next 13/14]
 drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:50: error: no member named
 'dma_complete' in 'struct tmio_mmc_host'
Message-ID: <202406211041.tUZSSJI3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   602a73f6dd02fc2501694c8e08b7a1e267b7c14c
commit: 74a3fe7c3784c8cae2e3e14c0078f33c1468fefc [13/14] mmc: Convert from tasklet to BH workqueue
config: i386-buildonly-randconfig-001-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211041.tUZSSJI3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211041.tUZSSJI3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211041.tUZSSJI3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:50: error: no member named 'dma_complete' in 'struct tmio_mmc_host'
     489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
         |                                      ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/workqueue.h:535:44: note: expanded from macro 'from_work'
     535 |         container_of(callback_work, typeof(*var), work_fieldname)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
   include/linux/container_of.h:20:49: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:428:74: note: expanded from macro '__same_type'
     428 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:31: error: no member named 'dma_complete' in 'tmio_mmc_host'
     489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
         |                                      ^                  ~~~~~~~~~~~~
   include/linux/workqueue.h:535:2: note: expanded from macro 'from_work'
     535 |         container_of(callback_work, typeof(*var), work_fieldname)
         |         ^                                         ~~~~~~~~~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^              ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
>> drivers/mmc/host/renesas_sdhi_internal_dmac.c:489:24: error: initializing 'struct tmio_mmc_host *' with an expression of incompatible type 'void'
     489 |         struct tmio_mmc_host *host = from_work(host, t, dma_complete);
         |                               ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +489 drivers/mmc/host/renesas_sdhi_internal_dmac.c

   486	
   487	static void renesas_sdhi_internal_dmac_complete_work_fn(struct work_struct *t)
   488	{
 > 489		struct tmio_mmc_host *host = from_work(host, t, dma_complete);
   490	
   491		spin_lock_irq(&host->lock);
   492		if (!renesas_sdhi_internal_dmac_complete(host))
   493			goto out;
   494	
   495		tmio_mmc_do_data_irq(host);
   496	out:
   497		spin_unlock_irq(&host->lock);
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
