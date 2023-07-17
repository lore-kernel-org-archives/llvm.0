Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBDFA927;
	Mon, 17 Jul 2023 10:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689588255; x=1721124255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WnlwfGJjGqDvSxdq2cqUE+5C4r/vurq5Ib3eVZloNxQ=;
  b=G6/ryHao5CsBbspAUsMuP8dYr2o9t/IWB2hSekiOkp06ehZIk3bsK9Fq
   KRwG5ruLOjikhyYDQEIZZaDkSHlGUswoW5ptylvbMgbmSzM5dmgPyADZr
   OWXANcCg+8xs6wtsOmBl+tRwMOu1EkrAdy9BYd2OcG2oWfEi6ArANxuDv
   5YWeRQ2s3V3ZDLWrAGsnl5tz9dxLURFnmZ9GOSc12Jklxm8+ztS+2Tufn
   CqzdhcUmHYoFuXo3JwrHKDpW8w8xLgX2n/4qh9otBayw21DoVdRKaHSg9
   1vZKA5Uwn2UF6JQJPKeo9QxrNaDQ08eUWED0ZMqoj69vYQ61yL590K2Fr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="396717483"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="396717483"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 03:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="897160373"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="897160373"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 17 Jul 2023 03:04:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qLL5P-008dix-0p;
	Mon, 17 Jul 2023 13:04:11 +0300
Date: Mon, 17 Jul 2023 13:04:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: lib/test_bitmap.c:920:2: error: call to __compiletime_assert_348
 declared with 'error' attribute: BUILD_BUG_ON failed:
 !__builtin_constant_p(res)
Message-ID: <ZLUSG8bNnSqT0LO+@smile.fi.intel.com>
References: <202307171254.yFcH97ej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307171254.yFcH97ej-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jul 17, 2023 at 12:42:57PM +0800, kernel test robot wrote:
> Hi Alexander,
> 
> FYI, the error/warning still remains.

Alexander, either you can escalate this or just propose something to discuss.

-- 
With Best Regards,
Andy Shevchenko


