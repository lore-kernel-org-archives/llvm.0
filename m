Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312A20E8
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 04:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651636959; x=1683172959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G/G+Nty+op6go1f4SOkm+//jqDawnNJnuOUV4gqoBy4=;
  b=ZvjyS/gZW8hVPRch52/CSKHpEFgFJAsmt3jSgK745+d+q/oVzEg60yC9
   Gt3qu9twn3I0mgEeEnXSkgcarV7dxHOASiV6n0fIPWXzRjkE+cctSYdkS
   paiNKrmxZFv4R4XEdTUHUzUJ9W+dl06H504Tg2NxlUXhByq9y1LP5hc3c
   QJCIU4X5hoTPDOSOD2g36gvYdWklS5cpvEreol4HRTmMPYIbNCuwfwo6+
   W1TpWVh/fI13rX2v1PNLQrbmwqJ4tjY9DkmjR7UcE2I60N4SQfTasiMH2
   33wgElcFPhMDtpN7jM/TzrIHZUvwRTbLykh9OmVPVPFZje4jY0N+T8S9E
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354094326"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="354094326"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 21:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="693144486"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 May 2022 21:02:37 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm6Dk-000B2x-Km;
	Wed, 04 May 2022 04:02:36 +0000
Date: Wed, 4 May 2022 12:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/1] pcie/portdrv: Hack in DOE and CDAT support
Message-ID: <202205041107.30URfLeU-lkp@intel.com>
References: <20220503153449.4088-2-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503153449.4088-2-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on helgaas-pci/next]
[also build test ERROR on v5.18-rc5 next-20220503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/DOE-usage-with-pcie-portdrv/20220503-233751
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220504/202205041107.30URfLeU-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fc2dfabb21cebe51654723860419130c3bcc09d6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Cameron/DOE-usage-with-pcie-portdrv/20220503-233751
        git checkout fc2dfabb21cebe51654723860419130c3bcc09d6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

           ^
   ./include/generated/autoksyms.h:195:9: note: previous definition is here
   #define __KSYM_net/phonet/pep-gprs.o 1
           ^
   ./include/generated/autoksyms.h:197:19: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_net/sunrpc/auth_gss/gss_generic_token.o 1
                     ^
   ./include/generated/autoksyms.h:197:9: warning: '__KSYM_net' macro redefined [-Wmacro-redefined]
   #define __KSYM_net/sunrpc/auth_gss/gss_generic_token.o 1
           ^
   ./include/generated/autoksyms.h:196:9: note: previous definition is here
   #define __KSYM_net/phonet/pn_netlink.o 1
           ^
   ./include/generated/autoksyms.h:198:19: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_net/tls/tls_sw.o 1
                     ^
   ./include/generated/autoksyms.h:198:9: warning: '__KSYM_net' macro redefined [-Wmacro-redefined]
   #define __KSYM_net/tls/tls_sw.o 1
           ^
   ./include/generated/autoksyms.h:197:9: note: previous definition is here
   #define __KSYM_net/sunrpc/auth_gss/gss_generic_token.o 1
           ^
   ./include/generated/autoksyms.h:199:19: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_net/vmw_vsock/af_vsock_tap.o 1
                     ^
   ./include/generated/autoksyms.h:199:9: warning: '__KSYM_net' macro redefined [-Wmacro-redefined]
   #define __KSYM_net/vmw_vsock/af_vsock_tap.o 1
           ^
   ./include/generated/autoksyms.h:198:9: note: previous definition is here
   #define __KSYM_net/tls/tls_sw.o 1
           ^
   ./include/generated/autoksyms.h:200:24: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_security/keys/trusted-keys/trusted_tpm1.o 1
                          ^
   ./include/generated/autoksyms.h:201:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/core/init.o 1
                       ^
   ./include/generated/autoksyms.h:202:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/core/pcm_native.o 1
                       ^
   ./include/generated/autoksyms.h:202:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/core/pcm_native.o 1
           ^
   ./include/generated/autoksyms.h:201:9: note: previous definition is here
   #define __KSYM_sound/core/init.o 1
           ^
   ./include/generated/autoksyms.h:203:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/core/seq/seq_lock.o 1
                       ^
   ./include/generated/autoksyms.h:203:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/core/seq/seq_lock.o 1
           ^
   ./include/generated/autoksyms.h:202:9: note: previous definition is here
   #define __KSYM_sound/core/pcm_native.o 1
           ^
   ./include/generated/autoksyms.h:204:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/bebob/bebob_stream.o 1
                       ^
   ./include/generated/autoksyms.h:204:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/bebob/bebob_stream.o 1
           ^
   ./include/generated/autoksyms.h:203:9: note: previous definition is here
   #define __KSYM_sound/core/seq/seq_lock.o 1
           ^
   ./include/generated/autoksyms.h:205:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/fireface/ff-transaction.o 1
                       ^
   ./include/generated/autoksyms.h:205:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/fireface/ff-transaction.o 1
           ^
   ./include/generated/autoksyms.h:204:9: note: previous definition is here
   #define __KSYM_sound/firewire/bebob/bebob_stream.o 1
           ^
   ./include/generated/autoksyms.h:206:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/fireworks/fireworks_command.o 1
                       ^
   ./include/generated/autoksyms.h:206:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/fireworks/fireworks_command.o 1
           ^
   ./include/generated/autoksyms.h:205:9: note: previous definition is here
   #define __KSYM_sound/firewire/fireface/ff-transaction.o 1
           ^
   ./include/generated/autoksyms.h:207:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/iso-resources.o 1
                       ^
   ./include/generated/autoksyms.h:207:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/iso-resources.o 1
           ^
   ./include/generated/autoksyms.h:206:9: note: previous definition is here
   #define __KSYM_sound/firewire/fireworks/fireworks_command.o 1
           ^
   ./include/generated/autoksyms.h:208:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/oxfw/oxfw-stream.o 1
                       ^
   ./include/generated/autoksyms.h:208:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/oxfw/oxfw-stream.o 1
           ^
   ./include/generated/autoksyms.h:207:9: note: previous definition is here
   #define __KSYM_sound/firewire/iso-resources.o 1
           ^
>> drivers/pci/pcie/portdrv_core.c:11:10: fatal error: 'linux/pci-doe.h' file not found
   #include <linux/pci-doe.h>
            ^~~~~~~~~~~~~~~~~
   400 warnings and 1 error generated.
--
           ^
   ./include/generated/autoksyms.h:195:9: note: previous definition is here
   #define __KSYM_net/phonet/pep-gprs.o 1
           ^
   ./include/generated/autoksyms.h:197:19: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_net/sunrpc/auth_gss/gss_generic_token.o 1
                     ^
   ./include/generated/autoksyms.h:197:9: warning: '__KSYM_net' macro redefined [-Wmacro-redefined]
   #define __KSYM_net/sunrpc/auth_gss/gss_generic_token.o 1
           ^
   ./include/generated/autoksyms.h:196:9: note: previous definition is here
   #define __KSYM_net/phonet/pn_netlink.o 1
           ^
   ./include/generated/autoksyms.h:198:19: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_net/tls/tls_sw.o 1
                     ^
   ./include/generated/autoksyms.h:198:9: warning: '__KSYM_net' macro redefined [-Wmacro-redefined]
   #define __KSYM_net/tls/tls_sw.o 1
           ^
   ./include/generated/autoksyms.h:197:9: note: previous definition is here
   #define __KSYM_net/sunrpc/auth_gss/gss_generic_token.o 1
           ^
   ./include/generated/autoksyms.h:199:19: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_net/vmw_vsock/af_vsock_tap.o 1
                     ^
   ./include/generated/autoksyms.h:199:9: warning: '__KSYM_net' macro redefined [-Wmacro-redefined]
   #define __KSYM_net/vmw_vsock/af_vsock_tap.o 1
           ^
   ./include/generated/autoksyms.h:198:9: note: previous definition is here
   #define __KSYM_net/tls/tls_sw.o 1
           ^
   ./include/generated/autoksyms.h:200:24: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_security/keys/trusted-keys/trusted_tpm1.o 1
                          ^
   ./include/generated/autoksyms.h:201:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/core/init.o 1
                       ^
   ./include/generated/autoksyms.h:202:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/core/pcm_native.o 1
                       ^
   ./include/generated/autoksyms.h:202:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/core/pcm_native.o 1
           ^
   ./include/generated/autoksyms.h:201:9: note: previous definition is here
   #define __KSYM_sound/core/init.o 1
           ^
   ./include/generated/autoksyms.h:203:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/core/seq/seq_lock.o 1
                       ^
   ./include/generated/autoksyms.h:203:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/core/seq/seq_lock.o 1
           ^
   ./include/generated/autoksyms.h:202:9: note: previous definition is here
   #define __KSYM_sound/core/pcm_native.o 1
           ^
   ./include/generated/autoksyms.h:204:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/bebob/bebob_stream.o 1
                       ^
   ./include/generated/autoksyms.h:204:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/bebob/bebob_stream.o 1
           ^
   ./include/generated/autoksyms.h:203:9: note: previous definition is here
   #define __KSYM_sound/core/seq/seq_lock.o 1
           ^
   ./include/generated/autoksyms.h:205:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/fireface/ff-transaction.o 1
                       ^
   ./include/generated/autoksyms.h:205:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/fireface/ff-transaction.o 1
           ^
   ./include/generated/autoksyms.h:204:9: note: previous definition is here
   #define __KSYM_sound/firewire/bebob/bebob_stream.o 1
           ^
   ./include/generated/autoksyms.h:206:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/fireworks/fireworks_command.o 1
                       ^
   ./include/generated/autoksyms.h:206:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/fireworks/fireworks_command.o 1
           ^
   ./include/generated/autoksyms.h:205:9: note: previous definition is here
   #define __KSYM_sound/firewire/fireface/ff-transaction.o 1
           ^
   ./include/generated/autoksyms.h:207:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/iso-resources.o 1
                       ^
   ./include/generated/autoksyms.h:207:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/iso-resources.o 1
           ^
   ./include/generated/autoksyms.h:206:9: note: previous definition is here
   #define __KSYM_sound/firewire/fireworks/fireworks_command.o 1
           ^
   ./include/generated/autoksyms.h:208:21: warning: ISO C99 requires whitespace after the macro name [-Wc99-extensions]
   #define __KSYM_sound/firewire/oxfw/oxfw-stream.o 1
                       ^
   ./include/generated/autoksyms.h:208:9: warning: '__KSYM_sound' macro redefined [-Wmacro-redefined]
   #define __KSYM_sound/firewire/oxfw/oxfw-stream.o 1
           ^
   ./include/generated/autoksyms.h:207:9: note: previous definition is here
   #define __KSYM_sound/firewire/iso-resources.o 1
           ^
>> drivers/pci/pcie/portdrv_pci.c:11:10: fatal error: 'linux/pci-doe.h' file not found
   #include <linux/pci-doe.h>
            ^~~~~~~~~~~~~~~~~
   400 warnings and 1 error generated.


vim +11 drivers/pci/pcie/portdrv_core.c

  > 11	#include <linux/pci-doe.h>
    12	#include <linux/kernel.h>
    13	#include <linux/errno.h>
    14	#include <linux/pm.h>
    15	#include <linux/pm_runtime.h>
    16	#include <linux/string.h>
    17	#include <linux/slab.h>
    18	#include <linux/aer.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
