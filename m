Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48E12906;
	Mon, 26 Jun 2023 08:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687769341; x=1719305341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YQaF166oug6ylisXZvhibKOVqmr79D7iJaBzmGONrUU=;
  b=VZ/SPyECPS8QiJYGSMJDhQzNBi7Jf2oRG7YicTPnPByoFW+x0lq3KKo0
   7MbJgqJ+WL+zRfDJ7mbkzU2VQVb7QnY6XZUEpCwcwQIpnGtgQVautn+jA
   UesAqwL+EF3tpnW4YP5tTHQz0q6ROV2d88MdMzddnv8Pnran6cYveFDRD
   HMgXtNIUK5xqB65gM0fOPZx2PSaMHAcVKz1kwYk2sl3nsLhGTml1mw9pd
   RX2ngweFgANoTWLtJF1aqWGwwV2yOdK7/VBoplbohpkPnFGjxQT1T4bQk
   9MqbSRoxMx1ZRiEPjKBEvfST5GeorP0XZix7bSBsLWmyHCgQAGE0RJ2aZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="358708234"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="358708234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 01:48:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="745711382"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="745711382"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 26 Jun 2023 01:48:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qDhu4-006iZB-0e;
	Mon, 26 Jun 2023 11:48:56 +0300
Date: Mon, 26 Jun 2023 11:48:55 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Okan Sahin <okan.sahin@analog.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [linux-next:master 11546/12162] drivers/mfd/max77541.c:176:18:
 warning: cast to smaller integer type 'enum max7754x_ids' from 'const void
 *'
Message-ID: <ZJlQ9w89k7x88ovM@smile.fi.intel.com>
References: <202306260401.qZlYQpV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306260401.qZlYQpV2-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jun 26, 2023 at 04:53:43AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8d2be868b42c08290509c60515865f4de24ea704
> commit: e0cbc202388af454eb771043b20db6dfe68199ec [11546/12162] mfd: max77541: Add ADI MAX77541/MAX77540 PMIC Support
> config: x86_64-randconfig-r003-20230626 (https://download.01.org/0day-ci/archive/20230626/202306260401.qZlYQpV2-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230626/202306260401.qZlYQpV2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306260401.qZlYQpV2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/mfd/max77541.c:176:18: warning: cast to smaller integer type 'enum max7754x_ids' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>            max77541->id  = (enum max7754x_ids)device_get_match_data(dev);

	max77541->id  = (enum max7754x_ids)(uintptr_t)device_get_match_data(dev);

should fix it.

-- 
With Best Regards,
Andy Shevchenko


