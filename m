Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3546214F75;
	Sun, 30 Jul 2023 20:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690748149; x=1722284149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oqi/5hV9zFCtVGyV0q21JNckf57HO2PFnTjvDdxWCzA=;
  b=a7qMmHpWb61+rUHMDVCrzsoigjLt6tFdICvCFWGbGWYGh5bMX2FwRP8D
   gLoh7jDx3lbDyGzfN+Nw5Dkk1u6haX1P+RzjWZm71umaL4PRH4mrVshIv
   wg8bHNMIYVCkGFZQJRvBoHBRmLr944wzbpyNGsbiUidE+jcp810R6iacl
   iSk3Os7spTq6v3BF5kX6pY0AQlbGZhZRz2jSmaLRCqWGFZLvc86Faglwd
   6mvyE1gWksH2K99Z8YphxVNShumtJzyJ4jIDVMHO2ujOWekZdchkd6PvT
   MwY4xLybURvHgeEgCzJ60/oxRtzjnEZzvaRoZcQXXPbDy6LONieJBxs7F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="367764438"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="367764438"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 13:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="728072372"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="728072372"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Jul 2023 13:15:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQCpM-0004lL-1h;
	Sun, 30 Jul 2023 20:15:44 +0000
Date: Mon, 31 Jul 2023 04:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>, Iskren Chernev <me@iskren.info>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] power: max17040: get thermal data from adc if
 available
Message-ID: <202307310455.Om3VuGqo-lkp@intel.com>
References: <20230730172648.71578-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230730172648.71578-4-clamor95@gmail.com>

Hi Svyatoslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-dt/for-next]
[also build test ERROR on linus/master v6.5-rc3 next-20230728]
[cannot apply to sre-power-supply/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-power-supply-maxim-max17040-update-properties/20230731-012920
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git for-next
patch link:    https://lore.kernel.org/r/20230730172648.71578-4-clamor95%40gmail.com
patch subject: [PATCH v2 3/3] power: max17040: get thermal data from adc if available
config: i386-randconfig-i013-20230731 (https://download.01.org/0day-ci/archive/20230731/202307310455.Om3VuGqo-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310455.Om3VuGqo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310455.Om3VuGqo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_iio_channel_get
   >>> referenced by max17040_battery.c:483 (drivers/power/supply/max17040_battery.c:483)
   >>>               drivers/power/supply/max17040_battery.o:(max17040_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: iio_read_channel_processed_scale
   >>> referenced by max17040_battery.c:413 (drivers/power/supply/max17040_battery.c:413)
   >>>               drivers/power/supply/max17040_battery.o:(max17040_get_property) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
