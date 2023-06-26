Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2C6111C;
	Mon, 26 Jun 2023 08:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687768375; x=1719304375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5fc0XJqjkH4cWPkyXxUW8B7scuYxwR6iY60Ou1IfUqs=;
  b=DIrqxRlFZftyx73MldcB3i2YE9d5mYvDIlxc0Xe1vUgN8YMfjrIU/Q2M
   3Ob0WHBOSRMWvQHKHmKK3Fi2845arPUD/7eqCHWQO/JyllTipmKCuQVp1
   3U+7LQQe5jdFB1yyqlpiQk2dRuoE6KttyLs8fIi9wkYgqypDi2ZtD/sz7
   VlvBHq93xMB48oK7qxXv98Gz18rhuAfyab/7pXixYFfYPBXEZ/Z5OH0hG
   eTYeY5RUW0dohTnJlIebRDcbKr5v25CWYWEGMJvicdtqcoFT/KRtmBD42
   /NmddvqyW/DK+u3/dvEFAhW9INr6+bMu/BByxxMW59sD9aTDvXVD21JUd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="447595550"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="447595550"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 01:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="860605855"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="860605855"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2023 01:32:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qDheV-006eY7-21;
	Mon, 26 Jun 2023 11:32:51 +0300
Date: Mon, 26 Jun 2023 11:32:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: lib/test_bitmap.c:920:2: error: call to __compiletime_assert_372
 declared with 'error' attribute: BUILD_BUG_ON failed:
 !__builtin_constant_p(res)
Message-ID: <ZJlNMwzlt2MGTvBp@smile.fi.intel.com>
References: <202306250533.CBxzOSEh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306250533.CBxzOSEh-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Jun 25, 2023 at 05:12:36AM +0800, kernel test robot wrote:
> Hi Alexander,
> 
> FYI, the error/warning still remains.

Alexander, do you have anything to present to fix this? Or is your plan to send
something after v6.5-rc1?

-- 
With Best Regards,
Andy Shevchenko


