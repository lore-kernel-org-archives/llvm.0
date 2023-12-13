Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362077F54B;
	Wed, 13 Dec 2023 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcglRoHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702501462; x=1734037462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PpMrmW5HF4EtNlNBApCPLwVPgeMZlNGAAVBGM7lh0rQ=;
  b=VcglRoHLnRrJ4wPsOca8A7V3OO3YPfsPe18CuawyT+4GiEhRB6m4cJgd
   mHYwEDLp4HMt03S2vHLXeVjkbm6w8Z2xjQ1fs65fkpUbZ+2mY8+qkeZjD
   hZQvDoiBarBqItbFCiHUe8qG2Z3SjRFYsOzUy/M8kCioB1isd7hDwNEfz
   hwp+kdc/Zv7JT5Ywn3eDG4eY98Yifsrup+WGg+w+LhrI5H150Azf4gaup
   GQspe3qOI7OEmhjTLfAnIJUPsIwtCsIMvwIfZkkZE1aE1h0DqWneEfxsR
   zGtwMWDnrIXS9C5efwu/c0pPapVYsqc4ww66sjwKyvhB4ldIy40/GZK3P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="461495915"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="461495915"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 13:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="947311373"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="947311373"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2023 13:04:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDWOp-000L8D-2u;
	Wed, 13 Dec 2023 21:04:11 +0000
Date: Thu, 14 Dec 2023 05:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>,
	Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH] usb: gadget: f_fs: fix fortify warning
Message-ID: <202312140411.KJ3yiKt5-lkp@intel.com>
References: <20231212112923.61799-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212112923.61799-1-dmantipov@yandex.ru>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/usb-gadget-f_fs-fix-fortify-warning/20231212-193946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231212112923.61799-1-dmantipov%40yandex.ru
patch subject: [PATCH] usb: gadget: f_fs: fix fortify warning
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231214/202312140411.KJ3yiKt5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140411.KJ3yiKt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140411.KJ3yiKt5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/usb/functionfs.h:76:2: error: type name requires a specifier or qualifier
           struct_group(IDs,
           ^
>> ./usr/include/linux/usb/functionfs.h:77:3: error: unexpected type name '__u8': expected identifier
                   __u8    CompatibleID[8];
                   ^
>> ./usr/include/linux/usb/functionfs.h:77:8: error: expected ')'
                   __u8    CompatibleID[8];
                           ^
   ./usr/include/linux/usb/functionfs.h:76:14: note: to match this '('
           struct_group(IDs,
                       ^
>> ./usr/include/linux/usb/functionfs.h:76:15: error: a parameter list without types is only allowed in a function definition
           struct_group(IDs,
                        ^
   ./usr/include/linux/usb/functionfs.h:79:2: error: type name requires a specifier or qualifier
           );
           ^
>> ./usr/include/linux/usb/functionfs.h:79:2: error: expected member name or ';' after declaration specifiers
>> ./usr/include/linux/usb/functionfs.h:78:27: error: expected ';' at end of declaration list
                   __u8    SubCompatibleID[8];
                                              ^
                                              ;
   7 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
