Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FED9125D1;
	Wed,  6 Sep 2023 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694040494; x=1725576494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+MX9kv0UICmveqsK8mmPgfTB03+w/QtqW94cq0y3TnE=;
  b=NtIXWdIJqNAHcDwF369fLvaObZaUIVE8+sNgkwzP8LEjtjPejkr3VyM0
   RcPqHSOrjbDGuDo1JmNe1tFag8y9De1wpW2C/hQswg/FKBMr6c029z8sR
   7Czs0zJPtnktwlHtkEYO3RszS2jiPUTCjXxHKZ/y+rrA4nPepusvBSiQ/
   I95CsIw/wa7X3wAwjGW0fdJqodzzNjNQtD2RN1bVY/MjcaF5K9JInhYMA
   MZJ/sllwHFpQEjAkh/U4NMv4jRy4zTBlWwb4tml+r8NCzcm0NvW3air4x
   tKIwAkuea6GC7e+GkPR+zG/47d6L9Fj6h7E/fjBNMfyevSogsik/qrQEG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376103973"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="376103973"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856650663"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856650663"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 15:48:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe1Jd-0000ep-0v;
	Wed, 06 Sep 2023 22:48:05 +0000
Date: Thu, 7 Sep 2023 06:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <lnimi@hotmail.com>, richardcochran@gmail.com, lee@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Min Li <min.li.xe@renesas.com>
Subject: Re: [PATCH net 1/1] ptp: clockmatrix: support 32-bit address space
Message-ID: <202309070602.ai5WsjEa-lkp@intel.com>
References: <MW5PR03MB6932BFFE31583BBF02CD9488A0EFA@MW5PR03MB6932.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW5PR03MB6932BFFE31583BBF02CD9488A0EFA@MW5PR03MB6932.namprd03.prod.outlook.com>

Hi Min,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Min-Li/ptp-clockmatrix-support-32-bit-address-space/20230907-005615
base:   net/main
patch link:    https://lore.kernel.org/r/MW5PR03MB6932BFFE31583BBF02CD9488A0EFA%40MW5PR03MB6932.namprd03.prod.outlook.com
patch subject: [PATCH net 1/1] ptp: clockmatrix: support 32-bit address space
config: x86_64-buildonly-randconfig-003-20230907 (https://download.01.org/0day-ci/archive/20230907/202309070602.ai5WsjEa-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070602.ai5WsjEa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070602.ai5WsjEa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_clockmatrix.c:1257:50: warning: implicit conversion from 'int' to 'u16' (aka 'unsigned short') changes value from 537972560 to 53072 [-Wconstant-conversion]
           u16 scratch = IDTCM_FW_REG(idtcm->fw_ver, V520, SCRATCH);
               ~~~~~~~                                     ^~~~~~~
   include/linux/mfd/idt8a340_reg.h:454:43: note: expanded from macro 'SCRATCH'
   #define SCRATCH                           0x2010cf50
                                             ^~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:673:55: note: expanded from macro 'IDTCM_FW_REG'
   #define IDTCM_FW_REG(FW, VER, REG)      (((FW) < (VER)) ? (REG) : (REG##_##VER))
                                                              ^~~
   drivers/ptp/ptp_clockmatrix.c:1257:16: warning: implicit conversion from 'int' to 'u16' (aka 'unsigned short') changes value from 537972556 to 53068 [-Wconstant-conversion]
           u16 scratch = IDTCM_FW_REG(idtcm->fw_ver, V520, SCRATCH);
               ~~~~~~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:673:63: note: expanded from macro 'IDTCM_FW_REG'
   #define IDTCM_FW_REG(FW, VER, REG)      (((FW) < (VER)) ? (REG) : (REG##_##VER))
                                                                      ^~~~~~~~~~~
   <scratch space>:171:1: note: expanded from here
   SCRATCH_V520
   ^~~~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:455:43: note: expanded from macro 'SCRATCH_V520'
   #define SCRATCH_V520                      0x2010cf4c
                                             ^~~~~~~~~~
   2 warnings generated.


vim +1257 drivers/ptp/ptp_clockmatrix.c

3a6ba7dc779935 Vincent Cheng 2019-10-31  1253  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1254  static int idtcm_load_firmware(struct idtcm *idtcm,
3a6ba7dc779935 Vincent Cheng 2019-10-31  1255  			       struct device *dev)
3a6ba7dc779935 Vincent Cheng 2019-10-31  1256  {
794c3dffacc166 Min Li        2021-09-13 @1257  	u16 scratch = IDTCM_FW_REG(idtcm->fw_ver, V520, SCRATCH);
7ea5fda2b1325e Min Li        2020-07-28  1258  	char fname[128] = FW_FILENAME;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1259  	const struct firmware *fw;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1260  	struct idtcm_fwrc *rec;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1261  	u32 regaddr;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1262  	int err;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1263  	s32 len;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1264  	u8 val;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1265  	u8 loaddr;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1266  
7ea5fda2b1325e Min Li        2020-07-28  1267  	if (firmware) /* module parameter */
7ea5fda2b1325e Min Li        2020-07-28  1268  		snprintf(fname, sizeof(fname), "%s", firmware);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1269  
930dfa56315517 Min Li        2021-09-24  1270  	dev_info(idtcm->dev, "requesting firmware '%s'", fname);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1271  
7ea5fda2b1325e Min Li        2020-07-28  1272  	err = request_firmware(&fw, fname, dev);
7ea5fda2b1325e Min Li        2020-07-28  1273  	if (err) {
930dfa56315517 Min Li        2021-09-24  1274  		dev_err(idtcm->dev,
1c49d3e947783b Vincent Cheng 2021-02-17  1275  			"Failed at line %d in %s!", __LINE__, __func__);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1276  		return err;
7ea5fda2b1325e Min Li        2020-07-28  1277  	}
3a6ba7dc779935 Vincent Cheng 2019-10-31  1278  
930dfa56315517 Min Li        2021-09-24  1279  	dev_dbg(idtcm->dev, "firmware size %zu bytes", fw->size);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1280  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1281  	rec = (struct idtcm_fwrc *) fw->data;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1282  
794c3dffacc166 Min Li        2021-09-13  1283  	if (contains_full_configuration(idtcm, fw))
3a6ba7dc779935 Vincent Cheng 2019-10-31  1284  		idtcm_state_machine_reset(idtcm);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1285  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1286  	for (len = fw->size; len > 0; len -= sizeof(*rec)) {
3a6ba7dc779935 Vincent Cheng 2019-10-31  1287  		if (rec->reserved) {
930dfa56315517 Min Li        2021-09-24  1288  			dev_err(idtcm->dev,
1c49d3e947783b Vincent Cheng 2021-02-17  1289  				"bad firmware, reserved field non-zero");
3a6ba7dc779935 Vincent Cheng 2019-10-31  1290  			err = -EINVAL;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1291  		} else {
3a6ba7dc779935 Vincent Cheng 2019-10-31  1292  			regaddr = rec->hiaddr << 8;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1293  			regaddr |= rec->loaddr;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1294  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1295  			val = rec->value;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1296  			loaddr = rec->loaddr;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1297  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1298  			rec++;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1299  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1300  			err = check_and_set_masks(idtcm, regaddr, val);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1301  		}
3a6ba7dc779935 Vincent Cheng 2019-10-31  1302  
7ea5fda2b1325e Min Li        2020-07-28  1303  		if (err != -EINVAL) {
7ea5fda2b1325e Min Li        2020-07-28  1304  			err = 0;
7ea5fda2b1325e Min Li        2020-07-28  1305  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1306  			/* Top (status registers) and bottom are read-only */
ea86327f3d85be Min Li        2023-09-06  1307  			if (regaddr < SCSR_ADDR(GPIO_USER_CONTROL) || regaddr >= scratch)
3a6ba7dc779935 Vincent Cheng 2019-10-31  1308  				continue;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1309  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1310  			/* Page size 128, last 4 bytes of page skipped */
77fdb168a3e2a6 Vincent Cheng 2021-02-17  1311  			if ((loaddr > 0x7b && loaddr <= 0x7f) || loaddr > 0xfb)
3a6ba7dc779935 Vincent Cheng 2019-10-31  1312  				continue;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1313  
ea86327f3d85be Min Li        2023-09-06  1314  			err = idtcm_write(idtcm, SCSR_BASE, regaddr, &val, sizeof(val));
3a6ba7dc779935 Vincent Cheng 2019-10-31  1315  		}
3a6ba7dc779935 Vincent Cheng 2019-10-31  1316  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1317  		if (err)
3a6ba7dc779935 Vincent Cheng 2019-10-31  1318  			goto out;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1319  	}
3a6ba7dc779935 Vincent Cheng 2019-10-31  1320  
7ea5fda2b1325e Min Li        2020-07-28  1321  	display_pll_and_masks(idtcm);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1322  
3a6ba7dc779935 Vincent Cheng 2019-10-31  1323  out:
3a6ba7dc779935 Vincent Cheng 2019-10-31  1324  	release_firmware(fw);
3a6ba7dc779935 Vincent Cheng 2019-10-31  1325  	return err;
3a6ba7dc779935 Vincent Cheng 2019-10-31  1326  }
3a6ba7dc779935 Vincent Cheng 2019-10-31  1327  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
