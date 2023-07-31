Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75E17FEB;
	Mon, 31 Jul 2023 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690805275; x=1722341275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTwSW5Pi476YcxNfncRebsXRrqRzP0HUL96D8nDTvMw=;
  b=SPNSoy4XGadNl2dhVquzBqmy75S1LFJAXeJKrLfcs06TP1+iuimqP2+f
   HST5rF1M6eznCRVuReAZ04wmUleFSBKSHSQkbgzbQDE/o9y8R5Ne5Z1bH
   zZQyVg60XRe98gofIbnoQjTygqwKBjqWMXI8A2BaUM6JeqCMLaM89E+/m
   s2COu3BNxV/xK9JtVIWImViVv9beJJYn0zA16BkViZloZoqsle/VoUQIp
   EcfLJzsqYFPMX7FCIVPSWUzj6/6Bhe7RmsA9tFPpff/v9Ppo8UKplLwAA
   GaOV7UhczFOAsPOeZgr6bKRtPChR0wPtLbP3tRoeURsj63pXHgr2rYZi/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="455375339"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="455375339"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 05:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="798223224"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="798223224"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.128])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 05:07:51 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/3] kunit: Allow kunit test modules to use test filtering
Date: Mon, 31 Jul 2023 14:07:49 +0200
Message-ID: <1971193.8hb0ThOEGa@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <202307311645.CdN0xKiF-lkp@intel.com>
References:
 <20230731054552.2145292-8-janusz.krzysztofik@linux.intel.com>
 <202307311645.CdN0xKiF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 31 July 2023 10:39:03 CEST kernel test robot wrote:
> >> ERROR: modpost: "glob_match" [lib/kunit/kunit.ko] undefined!

Caused by CONFIG_GLOB possibly not selected when building kunit as a module  
(it was selected via another, unrelated setting in my test .config).

Please expect v3 with that fixed.

Thanks,
Janusz


