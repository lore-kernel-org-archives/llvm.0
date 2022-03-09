Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F717C0
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646867597; x=1678403597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U7Nwa2/MaFerIKl5/9Kdbe5rlL2Uh6Li/uVnnd8vg8E=;
  b=ilrWHQr1XVyHo8nr4DtGS9Oo/TeocYyMIbfUIuUd5y7H8H++D6F1xhGi
   7Nd65+90nfyNF8V+TDOhDMaq+9gRm5vGgBUrdN8uVFyrZIflhkOl6QG5B
   Bn7/r0bQsj78MkZtHbypARVC4zdLTNDinUNsokmCYYN/9YwxvOvPni24U
   D2weSXfT/JTZmWVy7jqQieyUdrPY8VFV6EfAiVSlC7n/cYX+V4xOsAz5y
   fQBJ7R0q/aRkld8eaGRCZvwhOn8W90tgi9NVscuJoSI7bmQdtan7mYzbG
   AsuiiQMaw77ESCN09nua0ITwor0b3/zg9kDfLF2bZeZrXoD9jV7z8MKVJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255056361"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="255056361"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 15:13:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="632782804"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2022 15:13:15 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nS5UZ-0003wa-9v; Wed, 09 Mar 2022 23:13:15 +0000
Date: Thu, 10 Mar 2022 07:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v8 08/13] media: atmel: atmel-isc: change format
 propagation to subdev into only verification
Message-ID: <202203100702.sKbUGmsv-lkp@intel.com>
References: <20220309163758.2672727-9-eugen.hristev@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309163758.2672727-9-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Eugen,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on next-20220309]
[cannot apply to robh/for-next linux/master linus/master v5.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Eugen-Hristev/media-atmel-atmel-isc-implement-media-controller/20220310-010819
base:   git://linuxtv.org/media_tree.git master
config: arm64-randconfig-r011-20220309 (https://download.01.org/0day-ci/archive/20220310/202203100702.sKbUGmsv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/9309e70b1b6779814e915f8e103048c6681f280f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Eugen-Hristev/media-atmel-atmel-isc-implement-media-controller/20220310-010819
        git checkout 9309e70b1b6779814e915f8e103048c6681f280f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/media/platform/atmel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/atmel/atmel-isc-base.c:1955:5: warning: no previous prototype for function 'isc_link_validate' [-Wmissing-prototypes]
   int isc_link_validate(struct media_link *link)
       ^
   drivers/media/platform/atmel/atmel-isc-base.c:1955:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int isc_link_validate(struct media_link *link)
   ^
   static 
   1 warning generated.


vim +/isc_link_validate +1955 drivers/media/platform/atmel/atmel-isc-base.c

  1954	
> 1955	int isc_link_validate(struct media_link *link)
  1956	{
  1957		struct video_device *vdev =
  1958			media_entity_to_video_device(link->sink->entity);
  1959		struct isc_device *isc = video_get_drvdata(vdev);
  1960		int ret;
  1961	
  1962		ret = v4l2_subdev_link_validate(link);
  1963		if (ret)
  1964			return ret;
  1965	
  1966		return isc_validate(isc);
  1967	}
  1968	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
