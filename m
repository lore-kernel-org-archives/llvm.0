Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCCB19DFAB;
	Sun, 11 Jan 2026 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768173071; cv=none; b=h0YRDHj0GNF9cSRDhrK1zZwj6XnlacFqUD6fNYlZFpKKw6BG1iYQrIxvDFL9J+wVz0ZSQVLaH7sMFQ/Dj2P0sUAltA10pe+LOF9Owlhz3wTQQkmj9eI9lzx/S5XXAG/RagFsTwEbPrrWOnP+l1GlSqa5cXIZQGWUwsfZJjbaYIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768173071; c=relaxed/simple;
	bh=hQWqDBXJMwztibG6gXOLy7xnT0QG22C2jWxcwZBOJ3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVTDONkE990EHmgKxzOBuheriNW+J4ba2S8ksvXUh65PS+YN0sOEO1L2nMCpKqJ5ctf9EskON9bIP8mbb6ymD46vahobn8Hqx113r+BngVvqz697hOjB780rvbtW710aKogHyKR44J1te2J5uln7bei8VTv6flVU2GNFmhoj9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEkzCnwr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEkzCnwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768173070; x=1799709070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hQWqDBXJMwztibG6gXOLy7xnT0QG22C2jWxcwZBOJ3U=;
  b=YEkzCnwrPKAnn2e9wImp/qMGJ2GEuYvsiz0fsHamd2UavktLZgaeeMd5
   09bo0SS3UoG4qxNxDPIafakn44ytrXElWRwywl2KEOhf6YjUnvyn2bvbh
   +yeSAfviw4PTjC6ZyLE2b5sdWVJ3Unfpo2jv1nHPSRNxfoNJUm6yJzWaI
   ug/NGDnfkus1YXG5CkSjvSyN7lIsK3IqCAJEHbtZLp4xc5zi9cw8Z822o
   UHLR4kZkccoTi2CVIC42B10QomwEQiJomrM/fn8uoELBsZVdyKj0rm2Mp
   afeA5ntI2KF4g7EYjw7F0AYjAK7B1wujEahgR+2PDNcIto9lcsThRF8LU
   w==;
X-CSE-ConnectionGUID: dUME/tnVRRSVx3ge0oAgJA==
X-CSE-MsgGUID: 7yDunM6BTcGiSfxYLmTw0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="73303836"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="73303836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:11:10 -0800
X-CSE-ConnectionGUID: c8v7TUQxSTa58k/C+DCK5A==
X-CSE-MsgGUID: zAuSWI54SH+CZC25rTSnEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204361223"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Jan 2026 15:11:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf4aP-00000000Cl6-2nls;
	Sun, 11 Jan 2026 23:11:05 +0000
Date: Mon, 12 Jan 2026 07:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: Luigi Rizzo <lrizzo@google.com>, tglx@linutronix.de, maz@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	edumazet@google.com, linux-kernel@vger.kernel.org,
	Luigi Rizzo <lrizzo@google.com>
Subject: Re: [PATCH] genirq: move clear of kstat_irqs to free_desc()
Message-ID: <202601120627.Dd67Hehl-lkp@intel.com>
References: <20260111191710.1993867-1-lrizzo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111191710.1993867-1-lrizzo@google.com>

Hi Luigi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.19-rc4 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luigi-Rizzo/genirq-move-clear-of-kstat_irqs-to-free_desc/20260112-031857
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260111191710.1993867-1-lrizzo%40google.com
patch subject: [PATCH] genirq: move clear of kstat_irqs to free_desc()
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260112/202601120627.Dd67Hehl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120627.Dd67Hehl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120627.Dd67Hehl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/irqdesc.c:118:6: warning: unused variable 'cpu' [-Wunused-variable]
     118 |         int cpu;
         |             ^~~
>> kernel/irq/irqdesc.c:625:25: error: use of undeclared identifier 'cpu'
     625 |                 for_each_possible_cpu(cpu)
         |                                       ^~~
>> kernel/irq/irqdesc.c:625:25: error: use of undeclared identifier 'cpu'
     625 |                 for_each_possible_cpu(cpu)
         |                                       ^~~
>> kernel/irq/irqdesc.c:625:25: error: use of undeclared identifier 'cpu'
     625 |                 for_each_possible_cpu(cpu)
         |                                       ^~~
   kernel/irq/irqdesc.c:626:35: error: use of undeclared identifier 'cpu'
     626 |                         *per_cpu_ptr(desc->kstat_irqs, cpu) = (struct irqstat) { };
         |                                                        ^~~
   1 warning and 4 errors generated.


vim +/cpu +625 kernel/irq/irqdesc.c

   618	
   619	static void free_desc(unsigned int irq)
   620	{
   621		struct irq_desc *desc = irq_to_desc(irq);
   622	
   623		scoped_guard(raw_spinlock_irqsave, &desc->lock) {
   624			desc_set_defaults(irq, desc, irq_desc_get_node(desc), NULL, NULL);
 > 625			for_each_possible_cpu(cpu)
   626				*per_cpu_ptr(desc->kstat_irqs, cpu) = (struct irqstat) { };
   627		}
   628		delete_irq_desc(irq);
   629	}
   630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
