Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DE7134B6;
	Wed,  2 Aug 2023 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691018914; x=1722554914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SosQ6XtOTnUjvK9QyYp1jV9TerKWmMOHJiDxLiHnXbY=;
  b=QuYKoZosMM+VqtC/4fn353dVKmM4fOTtAVP8/bsMetLhmrH8drNd/61x
   y1nA04PlC9WLqe5qhRHN5aTSM4eboEhXPtxraUD1kmVV6UQ2+rfuLiUpS
   g7udODd9neoIvZQjDMM3cUma+jg0dXbS0FPBaIGLBuqe3BiKVir1xdgxo
   HjR2bhGvUopqHJtzaE7XjvTufFQZRdf+xe5HuRxa4LzkjDoAsB9hDWd95
   kwMRwaSTVZQ1X+SCsuMCWVukPHTV3h4C9qAg5mOyB4KSBbeu07zS7AR1J
   eatxIZ96rAk9R3MIHrZRxrdCuCg+YIBAx8VJM+a2PJ6+zrliMCbnoh06F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372458451"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="372458451"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 16:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="729324104"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="729324104"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 02 Aug 2023 16:28:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRLGa-0001Zd-0X;
	Wed, 02 Aug 2023 23:28:32 +0000
Date: Thu, 3 Aug 2023 07:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: zhanchengbin <zhanchengbin1@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] ext4: ioctl adds a framework for modifying
 superblock parameters
Message-ID: <202308030734.qYKK5Phq-lkp@intel.com>
References: <20230802083402.515570-2-zhanchengbin1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802083402.515570-2-zhanchengbin1@huawei.com>

Hi zhanchengbin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhanchengbin/ext4-ioctl-adds-a-framework-for-modifying-superblock-parameters/20230802-163905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230802083402.515570-2-zhanchengbin1%40huawei.com
patch subject: [RFC PATCH 1/2] ext4: ioctl adds a framework for modifying superblock parameters
config: i386-randconfig-i012-20230731 (https://download.01.org/0day-ci/archive/20230803/202308030734.qYKK5Phq-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030734.qYKK5Phq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030734.qYKK5Phq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/ext4.h:77:22: warning: // comments are not allowed in this language [-Wcomment]
           __u32                           sba_count; // attrs number
                                                      ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
