Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D14C17F1;
	Sat, 25 Mar 2023 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679732287; x=1711268287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vkGsebY+bi2zt68dIYP5n+JMfaG3q4r/7n81x+5v2jE=;
  b=EFysMelJDUnzSaC7Z09+x0aiO0B8FrTUmSDSaTEDnX1g8gyyaq5F2BMc
   OkHzanbq66RX2eAD9OEm+jw4JOU70IUbDl5JR7ssktjoGNQGkYMUn/Y+i
   grvFU65A7MkeceBk1YNadATswZ5g7VA6DGjDaXDOhdczMMocJaYly53md
   t5SvVYJynd7S5WTbJ0WsXRZ1HWdfWMEsSyzZfc/VZvxM2HPVe7kwOjqfA
   OqtNjAK/q5Y2Kfrfpg/wARgMjNvHmfCng9K9gDYteHnJ90XJHAJWzJAJu
   Yzj5+I1yHjrDks3BehiSF/eKvEGo8MI3HFNwxLqg2OhFMWOpo1bTYeiOR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="319603156"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="319603156"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 01:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="1012535901"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="1012535901"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2023 01:17:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfz62-000G6N-0Q;
	Sat, 25 Mar 2023 08:17:54 +0000
Date: Sat, 25 Mar 2023 16:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kevin-lu@ti.com,
	shenghao-ding@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com,
	navada@ti.com, Shenghao Ding <13916275206@139.com>
Subject: Re: [PATCH v6] ASoC: tas2781: Add tas2781 driver
Message-ID: <202303251653.7HZjyxTf-lkp@intel.com>
References: <20230324110755.27652-1-13916275206@139.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324110755.27652-1-13916275206@139.com>

Hi Shenghao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230324-190955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230324110755.27652-1-13916275206%40139.com
patch subject: [PATCH v6] ASoC: tas2781: Add tas2781 driver
config: arm-randconfig-r021-20230322 (https://download.01.org/0day-ci/archive/20230325/202303251653.7HZjyxTf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/ae727fb08bb90265d16859aa62c7c956e46841ee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shenghao-Ding/ASoC-tas2781-Add-tas2781-driver/20230324-190955
        git checkout ae727fb08bb90265d16859aa62c7c956e46841ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303251653.7HZjyxTf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/tas2781-dsp.c:1357:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (in) {
               ^~
   sound/soc/codecs/tas2781-dsp.c:1378:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   sound/soc/codecs/tas2781-dsp.c:1357:2: note: remove the 'if' if its condition is always true
           if (in) {
           ^~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1343:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   sound/soc/codecs/tas2781-dsp.c:1407:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (in) {
               ^~
   sound/soc/codecs/tas2781-dsp.c:1444:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   sound/soc/codecs/tas2781-dsp.c:1407:2: note: remove the 'if' if its condition is always true
           if (in) {
           ^~~~~~~~
   sound/soc/codecs/tas2781-dsp.c:1388:9: note: initialize the variable 'ret' to silence this warning
           int ret, i;
                  ^
                   = 0
   2 warnings generated.


vim +1357 sound/soc/codecs/tas2781-dsp.c

  1336	
  1337	static int do_singlereg_checksum(struct tasdevice_priv *tasdevice,
  1338		enum channel chl, unsigned char book, unsigned char page,
  1339		unsigned char reg, unsigned char val)
  1340	{
  1341		struct tas_crc crc_data;
  1342		unsigned int nData1;
  1343		int ret;
  1344		bool in;
  1345	
  1346		if ((book == TASDEVICE_BOOK_ID(TAS2781_SA_COEFF_SWAP_REG))
  1347			&& (page == TASDEVICE_PAGE_ID(TAS2781_SA_COEFF_SWAP_REG))
  1348			&& (reg >= TASDEVICE_PAGE_REG(TAS2781_SA_COEFF_SWAP_REG))
  1349			&& (reg <= (TASDEVICE_PAGE_REG(
  1350			TAS2781_SA_COEFF_SWAP_REG) + 4))) {
  1351			/*DSP swap command, pass */
  1352			ret = 0;
  1353			goto end;
  1354		}
  1355	
  1356		in = check_yram(&crc_data, book, page, reg, 1);
> 1357		if (in) {
  1358			ret = tasdevice_dev_read(tasdevice, chl,
  1359				TASDEVICE_REG(book, page, reg), &nData1);
  1360			if (ret < 0)
  1361				goto end;
  1362	
  1363			if (nData1 != val) {
  1364				dev_err(tasdevice->dev,
  1365					"B[0x%x]P[0x%x]R[0x%x] W[0x%x], R[0x%x]\n",
  1366					book, page, reg,
  1367					val, nData1);
  1368				tasdevice->tasdevice[chl].err_code |=
  1369					ERROR_YRAM_CRCCHK;
  1370				ret = -EAGAIN;
  1371				goto end;
  1372			}
  1373	
  1374			ret = crc8(tasdevice->crc8_lkp_tbl, &val, 1, 0);
  1375		}
  1376	
  1377	end:
  1378		return ret;
  1379	}
  1380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
