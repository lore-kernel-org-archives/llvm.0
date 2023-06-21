Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6515BC;
	Wed, 21 Jun 2023 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687313763; x=1718849763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6m8oZcodhtix0QwhxR/xmxGRXoNB5c0KxxyIl1Y1I6M=;
  b=n9N8uwfAmRFJz9ospGFXGmBGPZ9kCXhJBnREZRSd0SzRFd93gEmb4KaO
   2/07kGZqnUjk2M7RMw0ZZcwEQgVqbD9jwdoQDes16cg8Frwi7jWd7DL4h
   wmcPXDQVv5KUyzXwgSJx37O5nEjvaDYenInmH+X/j+KMtR/cHctpBeli5
   6TnVguXOcvLEM+ajg9fIGCYW6BabTT4Qoy0fViV2ylt385p4UKPGLCedF
   N5LjI7kuE0a1wEsjqPm91bbJ5Z9C1kIjoddPISa+3Q9PFKsTqX+tgJbhJ
   YaVX3iK6sNCx/W0Z957qaf6PK1Bti8DfBsP8JKcRZsEgx44X8Ia+QzRo1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="362581733"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="362581733"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 19:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="858802795"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="858802795"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2023 19:15:50 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBnNt-0006Ro-2C;
	Wed, 21 Jun 2023 02:15:49 +0000
Date: Wed, 21 Jun 2023 10:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, arnd@arndb.de,
	hch@lst.de, christophe.leroy@csgroup.eu, rppt@kernel.org,
	willy@infradead.org, agordeev@linux.ibm.com,
	wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
	David.Laight@aculab.com, shorne@gmail.com, deller@gmx.de,
	nathan@kernel.org, glaubitz@physik.fu-berlin.de,
	Baoquan He <bhe@redhat.com>, Brian Cain <bcain@quicinc.com>,
	linux-hexagon@vger.kernel.org
Subject: Re: [PATCH v7 02/19] hexagon: mm: Convert to GENERIC_IOREMAP
Message-ID: <202306211030.DioMEPhl-lkp@intel.com>
References: <20230620131356.25440-3-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620131356.25440-3-bhe@redhat.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/asm-generic-iomap-h-remove-ARCH_HAS_IOREMAP_xx-macros/20230620-212135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230620131356.25440-3-bhe%40redhat.com
patch subject: [PATCH v7 02/19] hexagon: mm: Convert to GENERIC_IOREMAP
config: hexagon-randconfig-r041-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211030.DioMEPhl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211030.DioMEPhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211030.DioMEPhl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/hexagon/kernel/hexagon_ksyms.o: error: local symbol ioremap was exported

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
