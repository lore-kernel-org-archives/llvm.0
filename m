Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5978D2F7;
	Thu,  6 Apr 2023 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680815234; x=1712351234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z7sV9fgfh3NvaO9Y31rSyQ96j2EHREVjYSeE8EQzjR0=;
  b=hoenU+tqlmd/gssT3oHcjilQqbue/I+wVs685ltNmdufcfcAx3+m+sAw
   fjKtSLaLY7xWMjL2F2uN0yQC7vs0bD+YmDql3PCYlrqb9JXE7Ykx9SId0
   BSyssQhVTkwiQZEhGXqJwzzxU2pi8rmm+Gs0oSguJTkPbp1zCGLu7tfZr
   9H1AIH3ZnVIzUXxpBp86obpFz8hyXXVJGfZFyRTvTet6QXAUfLbxl1XOs
   zN8wsDvEDLU8hak/SvGNEBWx+ZaH8/Xl6+m3RgwAYPzveVys7xKhoPUAO
   a5KYAtEpf1iiI8hOjFHdtqDmnJvDukZvEo/iSw0QMmT1EvkpIhO8Zh0d9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344609889"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="344609889"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 14:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="798477281"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="798477281"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Apr 2023 14:07:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkWp5-000RmE-1e;
	Thu, 06 Apr 2023 21:07:11 +0000
Date: Fri, 7 Apr 2023 05:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 4/5] bpf: add smc negotiator support in BPF
 struct_ops
Message-ID: <202304070405.Zgl8WMAW-lkp@intel.com>
References: <1680795034-86384-5-git-send-email-alibuda@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1680795034-86384-5-git-send-email-alibuda@linux.alibaba.com>

Hi Wythe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Wythe/net-smc-move-smc_sock-related-structure-definition/20230406-233148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/1680795034-86384-5-git-send-email-alibuda%40linux.alibaba.com
patch subject: [RFC PATCH bpf-next 4/5] bpf: add smc negotiator support in BPF struct_ops
config: i386-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070405.Zgl8WMAW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4b65a6397e28b562750d5c411994667c30002963
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review D-Wythe/net-smc-move-smc_sock-related-structure-definition/20230406-233148
        git checkout 4b65a6397e28b562750d5c411994667c30002963
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070405.Zgl8WMAW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/bpf_struct_ops.c:85:
>> kernel/bpf/bpf_struct_ops_types.h:14:1: error: field has incomplete type 'struct smc_sock_negotiator_ops'
   BPF_STRUCT_OPS_TYPE(smc_sock_negotiator_ops)
   ^
   kernel/bpf/bpf_struct_ops.c:83:15: note: expanded from macro 'BPF_STRUCT_OPS_TYPE'
           struct _name data ____cacheline_aligned_in_smp;         \
                        ^
   include/net/smc.h:299:15: note: forward declaration of 'struct smc_sock_negotiator_ops'
           const struct smc_sock_negotiator_ops *negotiator_ops;
                        ^
   1 error generated.


vim +14 kernel/bpf/bpf_struct_ops_types.h

     3	
     4	#ifdef CONFIG_BPF_JIT
     5	#ifdef CONFIG_NET
     6	BPF_STRUCT_OPS_TYPE(bpf_dummy_ops)
     7	#endif
     8	#ifdef CONFIG_INET
     9	#include <net/tcp.h>
    10	BPF_STRUCT_OPS_TYPE(tcp_congestion_ops)
    11	#endif
    12	#if IS_ENABLED(CONFIG_SMC)
    13	#include <net/smc.h>
  > 14	BPF_STRUCT_OPS_TYPE(smc_sock_negotiator_ops)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
