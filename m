Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2442E23C5;
	Mon, 13 Mar 2023 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678703788; x=1710239788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txA6Pey+fBov6xxorHszJ6TVKscirhURSe8KtYZOGsc=;
  b=jrDwL6kCFRQ++2sT+wvNbLV48DcZ+/JoVL28dw2JocAUQBGrEJ+MCdEK
   k2CIzSI2PgZ/e/hG+FwEP65L3PhgXApmkze14O2neq05T8NGBqdq2R/Hs
   /OkT4YNOhUa33q/ob2ylp2JW1lFebkgV3+ADoxxt9w4MsMqSHiUqTmyE3
   ifrq4ZRAhiF+2PAiY4aUi2xuDyp9MZOLIRmSviKbn5rjKiEaqdzPU9gdw
   ZdBM8p5KWvLXIAWd4NsG7YvHXkkcPzDhmFv6++0HMQBDp0gghuTHNQa70
   NHvjqBaol9xgdAIsxUu5tGw3Zc0VKiudWTmxbOKg8eQ8P3nGvCQhetR+L
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="399705855"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="399705855"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 03:36:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="747563109"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="747563109"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2023 03:36:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbfXG-0005aL-0o;
	Mon, 13 Mar 2023 10:36:10 +0000
Date: Mon, 13 Mar 2023 18:36:00 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 57/68]
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r525.c:62:1: error: non-void
 function does not return a value in all control paths
Message-ID: <202303131841.Xd5mO1kx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   89da5e5109a92f4be025e40b80d1f1a6c1d6d8c7
commit: f88f955a8a247f03baa570bb53b67846f6af7e90 [57/68] disp
config: mips-randconfig-r001-20230313 (https://download.01.org/0day-ci/archive/20230313/202303131841.Xd5mO1kx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout f88f955a8a247f03baa570bb53b67846f6af7e90
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303131841.Xd5mO1kx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvif/outp.c:317:1: warning: stack frame size (2128) exceeds limit (2048) in 'nvif_outp_edid_get' [-Wframe-larger-than]
   nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
   ^
   56/2128 (2.63%) spills, 2072/2128 (97.37%) variables
   1 warning generated.
--
>> drivers/gpu/drm/nouveau/nvkm/engine/disp/r525.c:62:1: error: non-void function does not return a value in all control paths [-Werror,-Wreturn-type]
   }
   ^
   1 error generated.


vim +62 drivers/gpu/drm/nouveau/nvkm/engine/disp/r525.c

    49	
    50	static u64
    51	r525_chan_user(struct nvkm_disp_chan *chan, u64 *psize)
    52	{
    53		switch (chan->object.oclass & 0xff) {
    54		case 0x7d: *psize = 0x10000; return 0x680000;
    55		case 0x7e: *psize = 0x01000; return 0x690000 + (chan->head * *psize);
    56		case 0x7b: *psize = 0x01000; return 0x6b0000 + (chan->head * *psize);
    57		case 0x7a: *psize = 0x01000; return 0x6d8000 + (chan->head * *psize);
    58		default:
    59			BUG_ON(1);
    60			break;
    61		}
  > 62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
