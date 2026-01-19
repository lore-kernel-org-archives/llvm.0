Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A982ECE91;
	Mon, 19 Jan 2026 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768854741; cv=none; b=S0VlVJ+OTQYaiLszxvKXHbqi1AthaqJy2qmOpS+0g84BQWkfsX5N5dIk3px6Kd7KE1rHwuFUUQPVsLnsPqt68+Qq+HzxqZ1ClWUF3QtqW6gV9E4NkDn+uilTlV4+KXa+iv8Bt+aLCZ26B18NNYlCvZCXlmqDC1abDRItgJE2zEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768854741; c=relaxed/simple;
	bh=0kSyxZkV6VvJmJlenpWogDJfu5GTq7YVZxtQIvgk4YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oARnU5wtgkToYssjLRQcTl1uy7FKABTnSd2oNO0UZiA4/NISYnPxr+Miu8Ld9IYBlWQQe58okNZuEJD5wIGYB1H+tT8J2ZxaUQYnegBEi6T9fi2O/gggjiqYEjuS6d1AcmSSfptV8RwYNtYz1eW+s4N0HmW752aAeENCBjVgTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lu5RpLO/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lu5RpLO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768854740; x=1800390740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0kSyxZkV6VvJmJlenpWogDJfu5GTq7YVZxtQIvgk4YQ=;
  b=Lu5RpLO/i9N0VQNkuANg4p0OU6zm/+tQEuKSbJw9fpK/NRZ6l8v6gt+b
   M9qzmhoanEuR+HZ+UBZNWdVuXz3ZmQqtqQ8bf5iVM8gRXiWRU+KUBzIyl
   KhyMsJe2REQsN36L9M5yEZCaeKeujFVUbvFo5A48ga/NCn3jJ0CAhYP6j
   KOETDvxil7rTSTWwKehwHbR2t6QaK52qJ8Vz9Iser9Ml5MSp9ir7VlYCh
   11Y0fIvSBMCAg5I+/iTPp8Vf5yOnsh0Hlz84ydQjWxWyjErUv4PvqH9k2
   weu5XUkL4O26sORu446YPUHkgbNCHjjNpi+m64E2JRkPEZjhG7YOzxFpX
   w==;
X-CSE-ConnectionGUID: uRnvV/l+R5edb3m93LmHYA==
X-CSE-MsgGUID: Uc9VVIHqQHywoMZNj5pNHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95539199"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="95539199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 12:32:18 -0800
X-CSE-ConnectionGUID: svZBSJU6RoOD5C+BtsURAg==
X-CSE-MsgGUID: K8kb2n/uQyWqWjoRgkzGvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="228877536"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 12:32:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhvv3-00000000OHf-07LS;
	Mon, 19 Jan 2026 20:32:13 +0000
Date: Tue, 20 Jan 2026 04:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: mpenttil@redhat.com, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202601200418.y3IajnfX-lkp@intel.com>
References: <20260119112502.645059-2-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119112502.645059-2-mpenttil@redhat.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260119-193100
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260119112502.645059-2-mpenttil%40redhat.com
patch subject: [PATCH v2 1/3] mm: unified hmm fault and migrate device pagewalk paths
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260120/202601200418.y3IajnfX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200418.y3IajnfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200418.y3IajnfX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: hmm_range_fault
   >>> referenced by migrate_device.c:774 (mm/migrate_device.c:774)
   >>>               vmlinux.o:(migrate_vma_setup)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
