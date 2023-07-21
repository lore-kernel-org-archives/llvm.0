Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349D1ED47;
	Fri, 21 Jul 2023 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689955314; x=1721491314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K9rkpTqbHpDBqeauTBa56f+QOF+7Knd4P5lfvCLE4XU=;
  b=B4ek82cbQEdkuAQkyiUnKy12HpcZWhfqb3vFT4ayr7wh8r0l020sZYER
   mgbWYL9bx/wpsWVb9B2/u6ORFE98oMsR/M+uMg+x5R59Epo0N8KFjhmpJ
   BkiYFsE+5Rwlre8Br4LPR5dyyAdXtGS+/0vhaHJaslEHhVAwxnxk20WnA
   sZbHl6Sg4uqtkMnDON5PAiPaNB0/MPtIu28xgu54V7FSR1wUgIoUlS6Dd
   BeY6mbyNC2Dtjizc1LHQZx5X616yUCl8p5HiDqG3v9DlwV+hWrtK/7mgY
   3CqgIQNmixABu1X8JN5YntD+1S4xiJ5FBaZjUAozabXw+7fQM6bnxhet5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="365947539"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="365947539"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 09:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="754507156"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="754507156"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 21 Jul 2023 09:01:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qMsZU-00BWpT-0C;
	Fri, 21 Jul 2023 19:01:36 +0300
Date: Fri, 21 Jul 2023 19:01:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1 1/1] minmax: Fix header inclusions
Message-ID: <ZLqr39JOLQ3QhRbQ@smile.fi.intel.com>
References: <20230721133932.12679-1-andriy.shevchenko@linux.intel.com>
 <202307212350.YQFKs9v6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307212350.YQFKs9v6-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jul 21, 2023 at 11:52:46PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:

Oh my...
UM without this header or even a stub?!

Hmm... Which one else? Let's wait a few days to see.

>    In file included from arch/um/os-Linux/sigio.c:6:
>    In file included from include/linux/minmax.h:5:
>    In file included from include/linux/build_bug.h:5:
> >> include/linux/compiler.h:246:10: fatal error: 'asm/rwonce.h' file not found
>      246 | #include <asm/rwonce.h>
>          |          ^~~~~~~~~~~~~~

-- 
With Best Regards,
Andy Shevchenko


