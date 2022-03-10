Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E021E7A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 04:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646885675; x=1678421675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WijTDSV8XOCgXa9Ll9UMdYgTluGCId0qD6jFG+7r0E8=;
  b=eBCNFdu3QPxIOmxB98io6NAH9vnePlUap+RGefPnXgM29WkGGBWFrSx+
   tdEq4h0IpfqDffOXeeae+5dbHqWAapeyzk96K/fx9S4lbQ9avbGxA4tNQ
   Nqm9/++/brm2DVMrNR6AaVlFHl4U6Th2rgoFiiYBwlzouf8smuGVQ46NT
   uWPUS2lMRCy/w7SR+XYLbeCRDFhAjdIueQTjD4losXZFxbA9t41lKM2AC
   hrqQQQNY27sR2dl6+qFm4l15BdeUBkByymrwv78QirUon8uFpROfmhr2X
   vNPjWZKmvFNUtHfcHhHk0Sq9Cd/2lvMvG57TYQ4G1C8iXszfP/+dj6ln5
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="235105611"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="235105611"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 20:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="510749871"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2022 20:14:33 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSAC9-0004H8-4m; Thu, 10 Mar 2022 04:14:33 +0000
Date: Thu, 10 Mar 2022 12:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 4/6] cec.h: add cec_msg_recv_is_rx/tx_result helpers
Message-ID: <202203101144.4sZrcK21-lkp@intel.com>
References: <20220309155726.1258388-5-hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309155726.1258388-5-hverkuil-cisco@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hans,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.17-rc7 next-20220309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hans-Verkuil/cec-various-fixes-and-enhancements/20220309-235956
base:   git://linuxtv.org/media_tree.git master
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220310/202203101144.4sZrcK21-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/85ba002ddea0c2fd3a9ea7b140f1dee157803c25
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hans-Verkuil/cec-various-fixes-and-enhancements/20220309-235956
        git checkout 85ba002ddea0c2fd3a9ea7b140f1dee157803c25
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/cec-funcs.h:11:
>> ./usr/include/linux/cec.h:150:19: error: unknown type name 'bool'
   static __inline__ bool cec_msg_recv_is_tx_result(const struct cec_msg *msg)
                     ^
   ./usr/include/linux/cec.h:160:19: error: unknown type name 'bool'
   static __inline__ bool cec_msg_recv_is_rx_result(const struct cec_msg *msg)
                     ^
   2 errors generated.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
