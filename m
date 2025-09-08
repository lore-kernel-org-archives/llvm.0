Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E3D279337;
	Mon,  8 Sep 2025 21:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757366755; cv=none; b=Vxnu24yhUaRgyOndmRu3wmXORAbIYMHD/u3RkGLYMBJs2MXZZRPHsYL+QOQGCi1Qc6DpKU8VhGhf/sITGpWgZOPZZw6o9owrcqVlcNfUTdObfSJ/isu8B/6speE8YF7/DkYxcxJv/kDOYqHQqx1/3kOBUX2zxLuBM+d+YtsU6W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757366755; c=relaxed/simple;
	bh=Fu8+aayxVNZCT/oRSmjlPZbESme4v7nIzu2hac/jq2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ot58xF2+al3pdDskHnJyeMigQcIvBVoLZ6bmZPdvOhwU97RSDkQvBmNPoaKJ+OaJvkBOXVxOSLbbrQvl6DWEWSlmT54Efwfa1cmlvpE8O/N8wF4obTi7N8z7q5EAUXv99viR5x3nvBd8su6rUkWHquTXFlm902Tfg6cQz2je+Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FtHx4s3S; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FtHx4s3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757366754; x=1788902754;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fu8+aayxVNZCT/oRSmjlPZbESme4v7nIzu2hac/jq2E=;
  b=FtHx4s3SNiTLS9roOPHgX7+KAqUONC7pGmI6oOyv6SiZu6idmOwtIl14
   mmo0S9ze0jyLdTHg4GiBFMb9kYVvw0STcFAbgBCHyDWQiveCETFLv7M2s
   eKEVAIy3QJXAY+IN2O8OakRuodrzr9m0xsx1SOEI5PHaahsaNC/dQOLLs
   JpjVoaVAEHdkfyOyHQoGEx0S1ZoaBgyATXBJHpe5pcOJWK9ruPV3nZQOC
   zX4uj3k1V8we2I0zy8vkXYcgDhADHtFgPw5E79u+GFndXgPSWSN/ydg/B
   c1o0qdq8r+defmXzwpswarqSiIapLkSh4y3OpzfdxDYsvvDNdPq9U1EEz
   g==;
X-CSE-ConnectionGUID: gc4hz1pJQvC4JTw77C7SCg==
X-CSE-MsgGUID: GmaxHditRkWfRE1dUYT+Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70337130"
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="70337130"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 14:25:53 -0700
X-CSE-ConnectionGUID: HtjZveYrRG2X2LOIsBwwEg==
X-CSE-MsgGUID: 2TFM5I92RN2w0wCE+oqhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="203884073"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2025 14:25:51 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvjMy-0004Ad-30;
	Mon, 08 Sep 2025 21:25:48 +0000
Date: Tue, 9 Sep 2025 05:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Coiby Xu <coxu@redhat.com>, kexec@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	fuqiang wang <fuqiang.wang@easystack.cn>, x86@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] crash: Add KUnit tests for crash_exclude_mem_range
Message-ID: <202509090415.cOytgte4-lkp@intel.com>
References: <20250904093855.1180154-2-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904093855.1180154-2-coxu@redhat.com>

Hi Coiby,

kernel test robot noticed the following build errors:

[auto build test ERROR on b320789d6883cc00ac78ce83bccbfe7ed58afcf0]

url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/crash-Add-KUnit-tests-for-crash_exclude_mem_range/20250904-174105
base:   b320789d6883cc00ac78ce83bccbfe7ed58afcf0
patch link:    https://lore.kernel.org/r/20250904093855.1180154-2-coxu%40redhat.com
patch subject: [PATCH v6 2/2] crash: Add KUnit tests for crash_exclude_mem_range
config: x86_64-randconfig-073-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090415.cOytgte4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090415.cOytgte4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090415.cOytgte4-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "crash_exclude_mem_range" [kernel/crash_core_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
