Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B202CA0
	for <llvm@lists.linux.dev>; Fri, 17 Dec 2021 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639726861; x=1671262861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FsjSOMZTk1SCFYs0XKAtOuaBpRAyOq2B6iO1MDZPgc=;
  b=IN3H8zuu4vncYuR02SYTZY/tBL3d3enjy4ZR6RCRiyb3VC6McK/lg9Ef
   E5YgCQkoBEWVoZ62/LcE5nF9eFSOXCW60Pt5neZ+AKlfG9bGKWO6NHG9n
   Z8owrebkqwwNQ2yQ8PGi5Hw8KeXnCHcwsiGwSElKZnds3N+GNX/CUm9v2
   c8+jRfK0orOSE3Soa5ca4+MyQcJDGE7PA/jwZZZ5m7hBt7Qta4yBpFHIg
   V8R3DisDIgWxuF0uUvQYSPKSpSV1yKCyENSCtU8zdE/JSYI9hsS0yuYtK
   0twEkSraWEQkAzOcCvXK1v9ApnwoKo/TLVnUyv1jZlsnKD/MWmI3TCmGO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="237240834"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="237240834"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 23:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="615472402"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2021 23:40:58 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1my7rO-0004Qt-8q; Fri, 17 Dec 2021 07:40:58 +0000
Date: Fri, 17 Dec 2021 15:40:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [pinchartl-media:gmsl/max9286/bindings 2/45]
 drivers/media/v4l2-core/v4l2-subdev.c:951:10: error: implicit declaration of
 function '__v4l2_subdev_state_alloc'
Message-ID: <202112171557.AF8ndfET-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://linuxtv.org/pinchartl/media.git gmsl/max9286/bindings
head:   b551a93fb443867f1a950d6063910639bd303daf
commit: 3e5486c9f448f3d9067b1050ed189db7d062fdf4 [2/45] media: subdev: add active state to struct v4l2_subdev
config: x86_64-randconfig-r015-20211216 (https://download.01.org/0day-ci/archive/20211217/202112171557.AF8ndfET-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 9043c3d65b11b442226015acfbf8167684586cfa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media gmsl/max9286/bindings
        git checkout 3e5486c9f448f3d9067b1050ed189db7d062fdf4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-subdev.c:951:10: error: implicit declaration of function '__v4l2_subdev_state_alloc' [-Werror,-Wimplicit-function-declaration]
           state = __v4l2_subdev_state_alloc(sd);
                   ^
>> drivers/media/v4l2-core/v4l2-subdev.c:951:8: warning: incompatible integer to pointer conversion assigning to 'struct v4l2_subdev_state *' from 'int' [-Wint-conversion]
           state = __v4l2_subdev_state_alloc(sd);
                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:963:2: error: implicit declaration of function '__v4l2_subdev_state_free' [-Werror,-Wimplicit-function-declaration]
           __v4l2_subdev_state_free(sd->active_state);
           ^
   1 warning and 2 errors generated.


vim +/__v4l2_subdev_state_alloc +951 drivers/media/v4l2-core/v4l2-subdev.c

   946	
   947	int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
   948	{
   949		struct v4l2_subdev_state *state;
   950	
 > 951		state = __v4l2_subdev_state_alloc(sd);
   952		if (IS_ERR(state))
   953			return PTR_ERR(state);
   954	
   955		sd->active_state = state;
   956	
   957		return 0;
   958	}
   959	EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
   960	
   961	void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
   962	{
 > 963		__v4l2_subdev_state_free(sd->active_state);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
