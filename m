Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A2802;
	Fri, 21 Jul 2023 04:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689913923; x=1721449923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6GVU4NtSBfHGIA+db9VVes1wkK8Q3Ya1oLA7sHzSrXM=;
  b=F5pji8Vu6vJcyPzDR/Fed80so5doKRh0OoKwDyJDzYgNitbprKUN91Fm
   h3SXNCGLSOa3CJPuYdeEPpRPkin/40Y6Z898ON3Qp4b96od+JXHAuO0ii
   XsP0woe6BBoED+2WoGpG6/hC8XSKUalRcN/hyHe6UrOOD4+XPOgYUzEcB
   DU5ji/wrf1TyFQgJibbLD9NH5QtzAzhVZXn+QPuTfvg3Va/wPV0Tw1oy6
   ZqeRa/0mFFKoDhfnL/ZuT2EviAjnchQ0h+S+y4pOB4WlxjdvTzIZi3yG5
   LHBgPr5Awi6PRIXLOcvHhwN4pTgtShfx+A4nx5/ZP5cOWBIe6laiTjQSX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370533072"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="370533072"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 21:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="674910112"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="674910112"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Jul 2023 21:31:59 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMho1-0006sZ-2n;
	Fri, 21 Jul 2023 04:31:55 +0000
Date: Fri, 21 Jul 2023 12:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Rae Moar <rmoar@google.com>, shuah@kernel.org, davidgow@google.com,
	dlatypov@google.com, brendan.higgins@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, keescook@chromium.org,
	linux-hardening@vger.kernel.org, jstultz@google.com,
	tglx@linutronix.de, sboyd@kernel.org, Rae Moar <rmoar@google.com>
Subject: Re: [PATCH v1 2/9] kunit: Add speed attribute
Message-ID: <202307211202.hZ3gtW5S-lkp@intel.com>
References: <20230719222338.259684-3-rmoar@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719222338.259684-3-rmoar@google.com>

Hi Rae,

kernel test robot noticed the following build errors:

[auto build test ERROR on 64bd4641310c41a1ecf07c13c67bc0ed61045dfd]

url:    https://github.com/intel-lab-lkp/linux/commits/Rae-Moar/kunit-Add-test-attributes-API-structure/20230720-062623
base:   64bd4641310c41a1ecf07c13c67bc0ed61045dfd
patch link:    https://lore.kernel.org/r/20230719222338.259684-3-rmoar%40google.com
patch subject: [PATCH v1 2/9] kunit: Add speed attribute
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230721/202307211202.hZ3gtW5S-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307211202.hZ3gtW5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307211202.hZ3gtW5S-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/kunit/attributes.c:89:47: error: initializer element is not a compile-time constant
   static struct kunit_attr kunit_attr_list[] = {speed_attr};
                                                 ^~~~~~~~~~
   1 error generated.


vim +89 lib/kunit/attributes.c

    88	
  > 89	static struct kunit_attr kunit_attr_list[] = {speed_attr};
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
