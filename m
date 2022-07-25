Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353B37E
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 22:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658788215; x=1690324215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rEibPX4A+3q/UO4dudDLBb6xgStJG1WiFr0ZClH+s98=;
  b=Jm6EuH7rCNEsAbmH04KYC3J5Q0r9OgTDpj0EiPqImpHc4emQSfl7CNO2
   4tHaWM5lGO7c1iMsgdPM3/ZkSeEmIo4uyv9wTWGYM+95nyt0QphY+UgZW
   SX2ZEP0IDXgVRc0aersoUxHDeW8Djr6dYQbjSiA+0GY93yEOHc2ul6MWr
   NGrxigqGbcRevzKV1t2xifVHfuyvYdrXdqFTjIpTVndzlPZ8yXIPcIeIT
   o7tyv8wmMTI8dAC1RpQ/5lzXvSIcKweh95yjEQxF6xLy/K1w0sKX2Y4jL
   QdtNuSYRwgWMHW1iYnA3xVvBb1iTj38lvsfmfP//fO+buhC/aX/cAMPkB
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="351802828"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="351802828"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2022 15:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; 
   d="scan'208";a="667653405"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2022 15:30:12 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oG6aa-0005cW-0u;
	Mon, 25 Jul 2022 22:30:12 +0000
Date: Tue, 26 Jul 2022 06:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: sound/soc/codecs/wm_adsp.c:1490:32: warning: taking address of
 packed member 'name' of class or structure 'wm_adsp_host_buf_coeff_v1' may
 result in an unaligned pointer value
Message-ID: <202207260648.ERQjXCRB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: 353bb6a5f2ac495f289b7c7a528c7d134c9a8ec4 ASoC: wm_adsp: Compressed stream DSP memory structs should be __packed
date:   5 months ago
config: arm-randconfig-r013-20220724 (https://download.01.org/0day-ci/archive/20220726/202207260648.ERQjXCRB-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9e88cbcc403bdf82f29259ad60ff60a8fc4434a1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=353bb6a5f2ac495f289b7c7a528c7d134c9a8ec4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 353bb6a5f2ac495f289b7c7a528c7d134c9a8ec4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wm_adsp.c:1490:32: warning: taking address of packed member 'name' of class or structure 'wm_adsp_host_buf_coeff_v1' may result in an unaligned pointer value [-Waddress-of-packed-member]
           cs_dsp_remove_padding((u32 *)&coeff_v1.name, ARRAY_SIZE(coeff_v1.name));
                                         ^~~~~~~~~~~~~
   1 warning generated.


vim +1490 sound/soc/codecs/wm_adsp.c

d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1434  
0700bc2fb94c28 Simon Trimmer      2021-09-13  1435  static int wm_adsp_buffer_parse_coeff(struct cs_dsp_coeff_ctl *cs_ctl)
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1436  {
4f2d4eabf57718 Stuart Henderson   2019-02-22  1437  	struct wm_adsp_host_buf_coeff_v1 coeff_v1;
a792af69b08fd7 Charles Keepax     2019-02-22  1438  	struct wm_adsp_compr_buf *buf;
e146820215910d Simon Trimmer      2021-09-13  1439  	struct wm_adsp *dsp = container_of(cs_ctl->dsp, struct wm_adsp, cs_dsp);
04ae08596737c4 Charles Keepax     2021-09-13  1440  	unsigned int version;
a792af69b08fd7 Charles Keepax     2019-02-22  1441  	int ret, i;
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1442  
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1443  	for (i = 0; i < 5; ++i) {
a887f9c7a4d37a Charles Keepax     2022-02-10  1444  		ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, &coeff_v1,
a887f9c7a4d37a Charles Keepax     2022-02-10  1445  					     min(cs_ctl->len, sizeof(coeff_v1)));
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1446  		if (ret < 0)
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1447  			return ret;
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1448  
04ae08596737c4 Charles Keepax     2021-09-13  1449  		if (coeff_v1.host_buf_ptr)
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1450  			break;
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1451  
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1452  		usleep_range(1000, 2000);
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1453  	}
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1454  
04ae08596737c4 Charles Keepax     2021-09-13  1455  	if (!coeff_v1.host_buf_ptr) {
0700bc2fb94c28 Simon Trimmer      2021-09-13  1456  		adsp_err(dsp, "Failed to acquire host buffer\n");
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1457  		return -EIO;
a792af69b08fd7 Charles Keepax     2019-02-22  1458  	}
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1459  
0700bc2fb94c28 Simon Trimmer      2021-09-13  1460  	buf = wm_adsp_buffer_alloc(dsp);
a792af69b08fd7 Charles Keepax     2019-02-22  1461  	if (!buf)
a792af69b08fd7 Charles Keepax     2019-02-22  1462  		return -ENOMEM;
a792af69b08fd7 Charles Keepax     2019-02-22  1463  
0700bc2fb94c28 Simon Trimmer      2021-09-13  1464  	buf->host_buf_mem_type = cs_ctl->alg_region.type;
04ae08596737c4 Charles Keepax     2021-09-13  1465  	buf->host_buf_ptr = be32_to_cpu(coeff_v1.host_buf_ptr);
a792af69b08fd7 Charles Keepax     2019-02-22  1466  
a792af69b08fd7 Charles Keepax     2019-02-22  1467  	ret = wm_adsp_buffer_populate(buf);
a792af69b08fd7 Charles Keepax     2019-02-22  1468  	if (ret < 0)
a792af69b08fd7 Charles Keepax     2019-02-22  1469  		return ret;
a792af69b08fd7 Charles Keepax     2019-02-22  1470  
4f2d4eabf57718 Stuart Henderson   2019-02-22  1471  	/*
4f2d4eabf57718 Stuart Henderson   2019-02-22  1472  	 * v0 host_buffer coefficients didn't have versioning, so if the
4f2d4eabf57718 Stuart Henderson   2019-02-22  1473  	 * control is one word, assume version 0.
4f2d4eabf57718 Stuart Henderson   2019-02-22  1474  	 */
0700bc2fb94c28 Simon Trimmer      2021-09-13  1475  	if (cs_ctl->len == 4) {
0d3fba3e7a5669 Charles Keepax     2019-02-22  1476  		compr_dbg(buf, "host_buf_ptr=%x\n", buf->host_buf_ptr);
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1477  		return 0;
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1478  	}
d52ed4b0bc73c1 Richard Fitzgerald 2018-07-19  1479  
a0b653e89a3afd Richard Fitzgerald 2020-12-30  1480  	version = be32_to_cpu(coeff_v1.versions) & HOST_BUF_COEFF_COMPAT_VER_MASK;
a0b653e89a3afd Richard Fitzgerald 2020-12-30  1481  	version >>= HOST_BUF_COEFF_COMPAT_VER_SHIFT;
4f2d4eabf57718 Stuart Henderson   2019-02-22  1482  
a0b653e89a3afd Richard Fitzgerald 2020-12-30  1483  	if (version > HOST_BUF_COEFF_SUPPORTED_COMPAT_VER) {
0700bc2fb94c28 Simon Trimmer      2021-09-13  1484  		adsp_err(dsp,
4f2d4eabf57718 Stuart Henderson   2019-02-22  1485  			 "Host buffer coeff ver %u > supported version %u\n",
a0b653e89a3afd Richard Fitzgerald 2020-12-30  1486  			 version, HOST_BUF_COEFF_SUPPORTED_COMPAT_VER);
4f2d4eabf57718 Stuart Henderson   2019-02-22  1487  		return -EINVAL;
4f2d4eabf57718 Stuart Henderson   2019-02-22  1488  	}
4f2d4eabf57718 Stuart Henderson   2019-02-22  1489  
5beb8eeade2c03 Simon Trimmer      2021-09-13 @1490  	cs_dsp_remove_padding((u32 *)&coeff_v1.name, ARRAY_SIZE(coeff_v1.name));
4f2d4eabf57718 Stuart Henderson   2019-02-22  1491  
0700bc2fb94c28 Simon Trimmer      2021-09-13  1492  	buf->name = kasprintf(GFP_KERNEL, "%s-dsp-%s", dsp->part,
4f2d4eabf57718 Stuart Henderson   2019-02-22  1493  			      (char *)&coeff_v1.name);
4f2d4eabf57718 Stuart Henderson   2019-02-22  1494  
0d3fba3e7a5669 Charles Keepax     2019-02-22  1495  	compr_dbg(buf, "host_buf_ptr=%x coeff version %u\n",
a0b653e89a3afd Richard Fitzgerald 2020-12-30  1496  		  buf->host_buf_ptr, version);
4f2d4eabf57718 Stuart Henderson   2019-02-22  1497  
a0b653e89a3afd Richard Fitzgerald 2020-12-30  1498  	return version;
4f2d4eabf57718 Stuart Henderson   2019-02-22  1499  }
4f2d4eabf57718 Stuart Henderson   2019-02-22  1500  

:::::: The code at line 1490 was first introduced by commit
:::::: 5beb8eeade2c03b55ae729c05bb9fa245633fe74 ASoC: wm_adsp: Rename generic DSP support

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
