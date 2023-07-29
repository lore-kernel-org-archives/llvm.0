Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A95F4FE;
	Sat, 29 Jul 2023 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690646286; x=1722182286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8B2ZXTX/T+9iJs7GisviUMJRO157mD7QeorTcPRymOo=;
  b=Rq0ZCDG9hFb/jAVogQOAJ2+D3h1K/mHDEGKNY3uCGZO12Xe3BW65/zBW
   WVUEnwrHHb09GnzyH7DLdnzBb6dh+i8LiEw96MRiC8rrEiyDYx5BsUKoS
   UsGvQjEu+p3EY5jMLl5uNDJ4wlUeZDALC2AB/rB2HR1pA3hvqYPETY/0p
   ZCkN4nVS/8KiGzRK6gVZAYgNOKengfkdtppFIhncg3qRMTevBWUNKcuoG
   z7eqqFH1Qg4vOC4zsYu0jXVecxnQ/4O5d1v1zGPo6xueCRDCiQ0bid3YF
   WgrBhzkvuS7gPVG/2i0TdzvPWu3THHbFfeHcI0wLo+7k9lgtAz9nXcwmL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="371471165"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="371471165"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 08:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="793225232"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="793225232"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.23.199])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 08:58:02 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH 3/3] kunit: Allow kunit test modules to use test filtering
Date: Sat, 29 Jul 2023 17:57:59 +0200
Message-ID: <3204833.aV6nBDHxoP@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <202307290124.BnnhRy8b-lkp@intel.com>
References:
 <20230728154419.1810177-8-janusz.krzysztofik@linux.intel.com>
 <202307290124.BnnhRy8b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, 28 July 2023 19:24:55 CEST kernel test robot wrote:
> >> lib/kunit/executor.c:182:42: warning: declaration of 'struct suite_set' 
will not be visible outside of this function [-Wvisibility]
>      182 | static void kunit_exec_list_tests(struct suite_set *suite_set)
>          |                                          ^

I've apparently broken this patch while reordering patches in the series.  
Sorry for submitting that untested.  Please expect v2 soon.

Thanks,
Janusz


