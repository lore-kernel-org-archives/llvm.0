Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E48801;
	Wed, 31 Jul 2024 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722421595; cv=none; b=NFRrFc+7rNNGaWqFa072epBmgnNRJP9UFuCaGXb05o/PAsrG6lqQeYg+PFIzCGJDGm3fL5M1kjTYofVd6HoBscIfidnZV3EnrLccnggpRtAqq/ZfBBpbdoPW+l5O0UWYewdkgaanhKLPKV+SzRiQfFoH13pGSYGu+vr3WK8XLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722421595; c=relaxed/simple;
	bh=XvMFr0wPs3mgsYDxpZgyoui9SPtvHYOCJPFY3zLfrJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T52v1koHfSmyftO81yhrsR0FRDjaXArczNiEItTD71RQ+E4m7b0z+YatSSNPESEtEsAXCQD6MlDJ8DTefmFiU3XJu9gjdYXtnbr1PEUGHYpBrZFIYpos3Mld/I/Lckp3Mm3TqFlkeLakQ/tXGJdtHYWwB2x3IlH/E46JLx0PFLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgAPvhgE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgAPvhgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722421592; x=1753957592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XvMFr0wPs3mgsYDxpZgyoui9SPtvHYOCJPFY3zLfrJY=;
  b=QgAPvhgEewGi6IbfwZDtFLSn25rDYk2NjvVBlDQaAz68eb97GFo6T6HL
   IhjKqm3gMMnRZhVZlCgN6PSU5V2d+55tA/LNmkpIAky8v1yaYR1PMxSQD
   RCxOcyyrNcHarj/x3ZPBXJ3a7OsmudFizlR48PmslXGT+GsWMmMD5STUl
   03eVlzcpZFKkGQ1k3cqkWT+9QSJcs1Ays2f+yQd+yj/4+6Qrzyf8/gykJ
   A4vkkFlKaM+7PDhqqQrLmoSpFmnMp4YBQmoY+zZL3RsaLB9t/ZMP1QKtY
   9917aGXxgPwWlJzHWD378hqzsRvzIy5jOhMWIdtwFPn8+d17Iug9BDrnI
   A==;
X-CSE-ConnectionGUID: 5zUR1y1xQl2VfT9GE+42Tw==
X-CSE-MsgGUID: rZfC0NzwS4+2umuSWSVNYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20413647"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="20413647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 03:26:32 -0700
X-CSE-ConnectionGUID: XDSI/mKvQ9yg76g8737yXg==
X-CSE-MsgGUID: oCClxtnmS0aiU1AVFk91tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="92161993"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2024 03:26:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ6XM-000u7X-1X;
	Wed, 31 Jul 2024 10:26:28 +0000
Date: Wed, 31 Jul 2024 18:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/api-cleanups 4/36] drivers/gpio/gpiolib-of.c:1126:9: error:
 use of undeclared identifier 'group_names'
Message-ID: <202407311834.DlEK1IXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/api-cleanups
head:   55dff5ffdb04a96e8f78fc4708ffa4701b509a0c
commit: ef621a11ff03382966ccedb9cb014fc679b1fa1c [4/36] gpio: Use of_property_present()
config: arm-randconfig-002-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311834.DlEK1IXp-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311834.DlEK1IXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407311834.DlEK1IXp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpiolib-of.c:1126:9: error: use of undeclared identifier 'group_names'
    1126 |                         if (!group_names) {
         |                              ^
   1 error generated.


vim +/group_names +1126 drivers/gpio/gpiolib-of.c

d621e8bae5ac9c Ricardo Ribalda   2014-12-17  1051  
f23f1516b6757c Shiraz Hashim     2012-10-27  1052  #ifdef CONFIG_PINCTRL
28355f81969962 Tomeu Vizoso      2015-07-14  1053  static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
f23f1516b6757c Shiraz Hashim     2012-10-27  1054  {
f23f1516b6757c Shiraz Hashim     2012-10-27  1055  	struct of_phandle_args pinspec;
1e63d7b9363f0c Linus Walleij     2012-11-06  1056  	struct pinctrl_dev *pctldev;
70d0fc4288dabd Andy Shevchenko   2022-12-28  1057  	struct device_node *np;
e818cd3c8a345c Doug Berger       2024-04-24  1058  	int index = 0, ret, trim;
586a87e6edc936 Christian Ruppert 2013-10-15  1059  	const char *name;
586a87e6edc936 Christian Ruppert 2013-10-15  1060  	static const char group_names_propname[] = "gpio-ranges-group-names";
ef621a11ff0338 Rob Herring (Arm  2024-07-25  1061) 	bool has_group_names;
f23f1516b6757c Shiraz Hashim     2012-10-27  1062  
70d0fc4288dabd Andy Shevchenko   2022-12-28  1063  	np = dev_of_node(&chip->gpiodev->dev);
f23f1516b6757c Shiraz Hashim     2012-10-27  1064  	if (!np)
28355f81969962 Tomeu Vizoso      2015-07-14  1065  		return 0;
f23f1516b6757c Shiraz Hashim     2012-10-27  1066  
ef621a11ff0338 Rob Herring (Arm  2024-07-25  1067) 	has_group_names = of_property_present(np, group_names_propname);
586a87e6edc936 Christian Ruppert 2013-10-15  1068  
ad4e1a7caf937a Haojian Zhuang    2013-02-17  1069  	for (;; index++) {
d9fe0039c42473 Stephen Warren    2013-08-14  1070  		ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
d9fe0039c42473 Stephen Warren    2013-08-14  1071  				index, &pinspec);
f23f1516b6757c Shiraz Hashim     2012-10-27  1072  		if (ret)
f23f1516b6757c Shiraz Hashim     2012-10-27  1073  			break;
f23f1516b6757c Shiraz Hashim     2012-10-27  1074  
1e63d7b9363f0c Linus Walleij     2012-11-06  1075  		pctldev = of_pinctrl_get(pinspec.np);
602cf63875f73f Masahiro Yamada   2016-05-23  1076  		of_node_put(pinspec.np);
1e63d7b9363f0c Linus Walleij     2012-11-06  1077  		if (!pctldev)
28355f81969962 Tomeu Vizoso      2015-07-14  1078  			return -EPROBE_DEFER;
f23f1516b6757c Shiraz Hashim     2012-10-27  1079  
e818cd3c8a345c Doug Berger       2024-04-24  1080  		/* Ignore ranges outside of this GPIO chip */
e818cd3c8a345c Doug Berger       2024-04-24  1081  		if (pinspec.args[0] >= (chip->offset + chip->ngpio))
e818cd3c8a345c Doug Berger       2024-04-24  1082  			continue;
e818cd3c8a345c Doug Berger       2024-04-24  1083  		if (pinspec.args[0] + pinspec.args[2] <= chip->offset)
e818cd3c8a345c Doug Berger       2024-04-24  1084  			continue;
e818cd3c8a345c Doug Berger       2024-04-24  1085  
586a87e6edc936 Christian Ruppert 2013-10-15  1086  		if (pinspec.args[2]) {
e818cd3c8a345c Doug Berger       2024-04-24  1087  			/* npins != 0: linear range */
ef621a11ff0338 Rob Herring (Arm  2024-07-25  1088) 			if (has_group_names) {
72858602e167ea Laurent Navet     2015-07-07  1089  				of_property_read_string_index(np,
586a87e6edc936 Christian Ruppert 2013-10-15  1090  						group_names_propname,
586a87e6edc936 Christian Ruppert 2013-10-15  1091  						index, &name);
586a87e6edc936 Christian Ruppert 2013-10-15  1092  				if (strlen(name)) {
7eb6ce2f272336 Rob Herring       2017-07-18  1093  					pr_err("%pOF: Group name of numeric GPIO ranges must be the empty string.\n",
7eb6ce2f272336 Rob Herring       2017-07-18  1094  						np);
586a87e6edc936 Christian Ruppert 2013-10-15  1095  					break;
586a87e6edc936 Christian Ruppert 2013-10-15  1096  				}
586a87e6edc936 Christian Ruppert 2013-10-15  1097  			}
e818cd3c8a345c Doug Berger       2024-04-24  1098  
e818cd3c8a345c Doug Berger       2024-04-24  1099  			/* Trim the range to fit this GPIO chip */
e818cd3c8a345c Doug Berger       2024-04-24  1100  			if (chip->offset > pinspec.args[0]) {
e818cd3c8a345c Doug Berger       2024-04-24  1101  				trim = chip->offset - pinspec.args[0];
e818cd3c8a345c Doug Berger       2024-04-24  1102  				pinspec.args[2] -= trim;
e818cd3c8a345c Doug Berger       2024-04-24  1103  				pinspec.args[1] += trim;
e818cd3c8a345c Doug Berger       2024-04-24  1104  				pinspec.args[0] = 0;
e818cd3c8a345c Doug Berger       2024-04-24  1105  			} else {
e818cd3c8a345c Doug Berger       2024-04-24  1106  				pinspec.args[0] -= chip->offset;
e818cd3c8a345c Doug Berger       2024-04-24  1107  			}
e818cd3c8a345c Doug Berger       2024-04-24  1108  			if ((pinspec.args[0] + pinspec.args[2]) > chip->ngpio)
e818cd3c8a345c Doug Berger       2024-04-24  1109  				pinspec.args[2] = chip->ngpio - pinspec.args[0];
e818cd3c8a345c Doug Berger       2024-04-24  1110  
1e63d7b9363f0c Linus Walleij     2012-11-06  1111  			ret = gpiochip_add_pin_range(chip,
ef5e3eef6b6b22 Haojian Zhuang    2013-01-18  1112  					pinctrl_dev_get_devname(pctldev),
1e63d7b9363f0c Linus Walleij     2012-11-06  1113  					pinspec.args[0],
86853c83e33738 Haojian Zhuang    2013-02-17  1114  					pinspec.args[1],
86853c83e33738 Haojian Zhuang    2013-02-17  1115  					pinspec.args[2]);
586a87e6edc936 Christian Ruppert 2013-10-15  1116  			if (ret)
28355f81969962 Tomeu Vizoso      2015-07-14  1117  				return ret;
586a87e6edc936 Christian Ruppert 2013-10-15  1118  		} else {
586a87e6edc936 Christian Ruppert 2013-10-15  1119  			/* npins == 0: special range */
586a87e6edc936 Christian Ruppert 2013-10-15  1120  			if (pinspec.args[1]) {
7eb6ce2f272336 Rob Herring       2017-07-18  1121  				pr_err("%pOF: Illegal gpio-range format.\n",
7eb6ce2f272336 Rob Herring       2017-07-18  1122  					np);
586a87e6edc936 Christian Ruppert 2013-10-15  1123  				break;
586a87e6edc936 Christian Ruppert 2013-10-15  1124  			}
586a87e6edc936 Christian Ruppert 2013-10-15  1125  
586a87e6edc936 Christian Ruppert 2013-10-15 @1126  			if (!group_names) {
7eb6ce2f272336 Rob Herring       2017-07-18  1127  				pr_err("%pOF: GPIO group range requested but no %s property.\n",
7eb6ce2f272336 Rob Herring       2017-07-18  1128  					np, group_names_propname);
586a87e6edc936 Christian Ruppert 2013-10-15  1129  				break;
586a87e6edc936 Christian Ruppert 2013-10-15  1130  			}
f23f1516b6757c Shiraz Hashim     2012-10-27  1131  
586a87e6edc936 Christian Ruppert 2013-10-15  1132  			ret = of_property_read_string_index(np,
586a87e6edc936 Christian Ruppert 2013-10-15  1133  						group_names_propname,
586a87e6edc936 Christian Ruppert 2013-10-15  1134  						index, &name);
1e63d7b9363f0c Linus Walleij     2012-11-06  1135  			if (ret)
1e63d7b9363f0c Linus Walleij     2012-11-06  1136  				break;
586a87e6edc936 Christian Ruppert 2013-10-15  1137  
586a87e6edc936 Christian Ruppert 2013-10-15  1138  			if (!strlen(name)) {
7eb6ce2f272336 Rob Herring       2017-07-18  1139  				pr_err("%pOF: Group name of GPIO group range cannot be the empty string.\n",
7eb6ce2f272336 Rob Herring       2017-07-18  1140  				np);
586a87e6edc936 Christian Ruppert 2013-10-15  1141  				break;
586a87e6edc936 Christian Ruppert 2013-10-15  1142  			}
586a87e6edc936 Christian Ruppert 2013-10-15  1143  
586a87e6edc936 Christian Ruppert 2013-10-15  1144  			ret = gpiochip_add_pingroup_range(chip, pctldev,
586a87e6edc936 Christian Ruppert 2013-10-15  1145  						pinspec.args[0], name);
586a87e6edc936 Christian Ruppert 2013-10-15  1146  			if (ret)
28355f81969962 Tomeu Vizoso      2015-07-14  1147  				return ret;
586a87e6edc936 Christian Ruppert 2013-10-15  1148  		}
ad4e1a7caf937a Haojian Zhuang    2013-02-17  1149  	}
28355f81969962 Tomeu Vizoso      2015-07-14  1150  
28355f81969962 Tomeu Vizoso      2015-07-14  1151  	return 0;
f23f1516b6757c Shiraz Hashim     2012-10-27  1152  }
f23f1516b6757c Shiraz Hashim     2012-10-27  1153  

:::::: The code at line 1126 was first introduced by commit
:::::: 586a87e6edc936d6d3c3585af504b33b9c3f0a06 pinctrl/gpio: non-linear GPIO ranges accesible from gpiolib

:::::: TO: Christian Ruppert <christian.ruppert@abilis.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
