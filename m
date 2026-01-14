Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD55336EC0;
	Wed, 14 Jan 2026 04:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768365383; cv=none; b=C6Y8LchXplaJojCDqeTDvGPBCHvPB1jpLV81fZK7BUzzyTwuWu6gN4QuapT/R3AcRfQvOOzIpur36VenKHeZYOiKm/ZigmHizyRzKwyA4QzBuZIOjvHtXJid9ka6ykAhIcclkihf9mfzbjI+5Q4iwUwVo3ez4qzGd/eqqdW/eH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768365383; c=relaxed/simple;
	bh=zF3EdgRjHVtpVqrIul/E0YAUCIe5vpaFfMrnuSUsHG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lu2Roo/5Q5if78GktwtpO2nmRD8Qk3sopKhaDckxgG7LroyGYXzlOnM8YPpKbKk32rEWIZUBtGtAfHYEo1exeeQBDzNDp5ZPcfFRhW6gpsBbyzuh2C7yB64Zf095HKpxTbxI8CIDLzLpJJpm+MHanD6xioWTuuyDXHUNsr/iRJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAZop9K/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAZop9K/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768365374; x=1799901374;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zF3EdgRjHVtpVqrIul/E0YAUCIe5vpaFfMrnuSUsHG8=;
  b=LAZop9K/bjwiuJ5ceLtioTXiWTg8d1IAGnZXjhwiKdovjJ6+6l3hN4VB
   Q8DeOLPeRI/r0epdnX2/SSPNMgjSKQ9KeUVnHMr3t7fF3zIAGdNavt2kA
   Tng0C+Ee8tilAf/R+BxDMfQeSeLbCAfXWw2DpzB/ezJFt/J2W+gzcG8rt
   14ogRFKPz16I2LQpnLpHvEdnRbVSMtL+tk7ORRSZ8goPPbLTlwOJWHGay
   IKmYauEjYrJ+NFo9XtLA38+z01LDgYTWcSnjr5qhn5ByXtr8Yl6COYQ/j
   VGsrZ1kBvSLy7CDVBH5SREhyd2naE6deRPv0BVqZqSJ/5vEDddeawanRl
   g==;
X-CSE-ConnectionGUID: 4gzIpBNGT0+aY/hcfWd2GQ==
X-CSE-MsgGUID: ZqQ+BxurS1mmSRzM+NZqVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81109400"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="81109400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 20:36:10 -0800
X-CSE-ConnectionGUID: kpDpgYPeTviJ1BMBk2zXqQ==
X-CSE-MsgGUID: ZSAkH35xStqMDr2agUFWLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="209032540"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jan 2026 20:36:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfsc2-00000000Fmm-1Y7w;
	Wed, 14 Jan 2026 04:36:06 +0000
Date: Wed, 14 Jan 2026 12:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: Imran Khan <imran.f.khan@oracle.com>, tglx@linutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] genirq/cpuhotplug: notify about irq affinity change
 for offlined cpus.
Message-ID: <202601141105.x7z7rWPk-lkp@intel.com>
References: <20260113143727.1041265-1-imran.f.khan@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113143727.1041265-1-imran.f.khan@oracle.com>

Hi Imran,

kernel test robot noticed the following build errors:

[auto build test ERROR on f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da]

url:    https://github.com/intel-lab-lkp/linux/commits/Imran-Khan/genirq-cpuhotplug-notify-about-irq-affinity-change-for-offlined-cpus/20260113-223900
base:   f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
patch link:    https://lore.kernel.org/r/20260113143727.1041265-1-imran.f.khan%40oracle.com
patch subject: [PATCH v3] genirq/cpuhotplug: notify about irq affinity change for offlined cpus.
config: arm-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141105.x7z7rWPk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141105.x7z7rWPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141105.x7z7rWPk-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/manage.c:149:6: error: redefinition of 'schedule_affinity_notify_work'
     149 | void schedule_affinity_notify_work(struct irq_desc *desc)
         |      ^
   include/linux/interrupt.h:449:20: note: previous definition is here
     449 | static inline void schedule_affinity_notify_work(struct irq_desc *desc) { }
         |                    ^
>> kernel/irq/manage.c:151:18: error: no member named 'affinity_notify' in 'struct irq_desc'
     151 |         kref_get(&desc->affinity_notify->kref);
         |                   ~~~~  ^
   kernel/irq/manage.c:152:28: error: no member named 'affinity_notify' in 'struct irq_desc'
     152 |         if (!schedule_work(&desc->affinity_notify->work))
         |                             ~~~~  ^
   kernel/irq/manage.c:154:19: error: no member named 'affinity_notify' in 'struct irq_desc'
     154 |                 kref_put(&desc->affinity_notify->kref,
         |                           ~~~~  ^
   kernel/irq/manage.c:155:11: error: no member named 'affinity_notify' in 'struct irq_desc'
     155 |                          desc->affinity_notify->release);
         |                          ~~~~  ^
   5 errors generated.


vim +151 kernel/irq/manage.c

   141	
   142	/**
   143	 * schedule_affinity_notify_work - Schedule work to notify
   144	 * about irq affinity change.
   145	 * @desc:  irq descriptor whose affinity changed
   146	 *
   147	 * Caller needs to hold desc->lock
   148	 */
   149	void schedule_affinity_notify_work(struct irq_desc *desc)
   150	{
 > 151		kref_get(&desc->affinity_notify->kref);
   152		if (!schedule_work(&desc->affinity_notify->work))
   153			/* Work was already scheduled, drop our extra ref */
   154			kref_put(&desc->affinity_notify->kref,
   155				 desc->affinity_notify->release);
   156	}
   157	EXPORT_SYMBOL_GPL(schedule_affinity_notify_work);
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
