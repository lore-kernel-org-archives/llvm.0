Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8771C9E1;
	Wed,  9 Aug 2023 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691619952; x=1723155952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z0glSc8LY2LtLuJc7hMlmzjpzI22Dwm4Qp6bntrmsak=;
  b=d8wgbsNfl5bNGjursqx1FNIqjIbah3TFhOaR/HEnEEf39qhXCvDYnjIt
   3BUqfG3MQgGfwRYWF9RcXJGnAQ2UUocxcExIDYHupd9+SKNYtH8uzZPFJ
   5Bqu9iZSguYzK2XV/vKSM1tQW77bhlYhQg30C4esXwRvxi5OeZ3OWrk2k
   OT8hQmHKhzq2QclGLjSaNTphr9h8m4di+oaBLkaUHwbUldBTqTEpZ2NEC
   ZuJT+tNJp2W90P1DMAkYbmS4ZuyD4W7z+iH3Mkj+hP7J/ZaZKaYHT8egJ
   CDE6RvhDWsNwEfMKtv1XGT5z5bVG0DirJedOJvpte9Qiez987rdVCHNyV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374959931"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="374959931"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 15:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="875458453"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2023 15:25:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTrch-0006SC-1D;
	Wed, 09 Aug 2023 22:25:47 +0000
Date: Thu, 10 Aug 2023 06:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>, Breno Leitao <leitao@debian.org>,
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ipmr: Call ipmr_ioctl() directly from
 ipmr_sk_ioctl()
Message-ID: <202308100626.gj6rvqoB-lkp@intel.com>
References: <20230731145713.178509-1-gustavold@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731145713.178509-1-gustavold@gmail.com>

Hi Gustavo,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master v6.5-rc5 next-20230809]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gustavo-Luiz-Duarte/net-ipmr-Call-ipmr_ioctl-directly-from-ipmr_sk_ioctl/20230731-225918
base:   net/main
patch link:    https://lore.kernel.org/r/20230731145713.178509-1-gustavold%40gmail.com
patch subject: [PATCH] net: ipmr: Call ipmr_ioctl() directly from ipmr_sk_ioctl()
config: i386-randconfig-i011-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100626.gj6rvqoB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100626.gj6rvqoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100626.gj6rvqoB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ip6mr_ioctl
   >>> referenced by mroute6.h:115 (include/linux/mroute6.h:115)
   >>>               net/core/sock.o:(sk_ioctl) in archive vmlinux.a
   >>> referenced by mroute6.h:130 (include/linux/mroute6.h:130)
   >>>               net/core/sock.o:(sk_ioctl) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
