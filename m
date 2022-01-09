Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460072C9C
	for <llvm@lists.linux.dev>; Sun,  9 Jan 2022 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641750055; x=1673286055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WljjhiCDUPxI76scuLoJrrql0N+MWgmZwjRPCXDuc+8=;
  b=iJ1WZ4gc2xOqI/lqUq7q60veBxbAMxZHeWgIMvscVpY3ZJSxy/+cLQ6B
   iryw+DaQeIJE/GtwmtQ6dG862K7OzGrVOmIOf/yY+sRMwCXRRqXkBi2y6
   eYZkO+iO4GKUFVhc50gmlVyW6KFT7ffo+2+vRdpZ6HoO//dfzbRxhs3JS
   EhAhISfUMMMx2ZgxZ2/XVYXQ1AR1JkUzM6mgrAZJ/2M2qQl5wjJuCTOOO
   ANBl7Tatt7+rvSRrfG39Y0Uq0+tWQ+f4NbgpGDy+YZ3aqz+uHzFxYMmvI
   aSx8dcw8xjlGNQ+pzi1k9T4A/Y6eGYgMsUv8QRJZdL6VhIZ6g2o3nKtuF
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="329447635"
X-IronPort-AV: E=Sophos;i="5.88,274,1635231600"; 
   d="scan'208";a="329447635"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2022 09:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,274,1635231600"; 
   d="scan'208";a="557773583"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jan 2022 09:40:52 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6cBY-0001nm-1Z; Sun, 09 Jan 2022 17:40:52 +0000
Date: Mon, 10 Jan 2022 01:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 06/11] usb: gadget: f_uac2: Rename Clock Sources to
 fixed names
Message-ID: <202201100122.8amhCftR-lkp@intel.com>
References: <20220109115946.392818-7-pavel.hofman@ivitera.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220109115946.392818-7-pavel.hofman@ivitera.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Pavel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[cannot apply to linus/master balbi-usb/testing/next peter-chen-usb/for-usb-next v5.16-rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pavel-Hofman/usb-gadget-audio-Multiple-rates-notify/20220109-200125
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: x86_64-randconfig-a015-20220109 (https://download.01.org/0day-ci/archive/20220110/202201100122.8amhCftR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4c4a7d32bcd7aa57e015597497c80ead346c7385
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Pavel-Hofman/usb-gadget-audio-Multiple-rates-notify/20220109-200125
        git checkout 4c4a7d32bcd7aa57e015597497c80ead346c7385
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_uac2.c:981:20: warning: variable 'init_c_srate' set but not used [-Wunused-but-set-variable]
           int init_p_srate, init_c_srate;
                             ^
>> drivers/usb/gadget/function/f_uac2.c:981:6: warning: variable 'init_p_srate' set but not used [-Wunused-but-set-variable]
           int init_p_srate, init_c_srate;
               ^
   2 warnings generated.


vim +/init_c_srate +981 drivers/usb/gadget/function/f_uac2.c

3713d5ceb04d5ab drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-03-01   969  
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22   970  static int
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02   971  afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02   972  {
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18   973  	struct f_uac2 *uac2 = func_to_uac2(fn);
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18   974  	struct g_audio *agdev = func_to_g_audio(fn);
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02   975  	struct usb_composite_dev *cdev = cfg->cdev;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02   976  	struct usb_gadget *gadget = cdev->gadget;
7158b57a495635c drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18   977  	struct device *dev = &gadget->dev;
3713d5ceb04d5ab drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-03-01   978  	struct f_uac2_opts *uac2_opts = g_audio_to_uac2_opts(agdev);
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22   979  	struct usb_string *us;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02   980  	int ret;
919a88c00fb3ce7 drivers/usb/gadget/function/f_uac2.c Julian Scheel             2022-01-09  @981  	int init_p_srate, init_c_srate;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02   982  
3713d5ceb04d5ab drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-03-01   983  	ret = afunc_validate_opts(agdev, dev);
3713d5ceb04d5ab drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-03-01   984  	if (ret)
3713d5ceb04d5ab drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-03-01   985  		return ret;
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22   986  
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22   987  	us = usb_gstrings_attach(cdev, fn_strings, ARRAY_SIZE(strings_fn));
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22   988  	if (IS_ERR(us))
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22   989  		return PTR_ERR(us);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   990  
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   991  	if (FUOUT_EN(uac2_opts)) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   992  		out_feature_unit_desc = build_fu_desc(uac2_opts->c_chmask);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   993  		if (!out_feature_unit_desc)
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   994  			return -ENOMEM;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   995  	}
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   996  	if (FUIN_EN(uac2_opts)) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   997  		in_feature_unit_desc = build_fu_desc(uac2_opts->p_chmask);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   998  		if (!in_feature_unit_desc) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12   999  			ret = -ENOMEM;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1000  			goto err_free_fu;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1001  		}
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1002  	}
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1003  
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1004  	iad_desc.iFunction = us[STR_ASSOC].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1005  	std_ac_if_desc.iInterface = us[STR_IF_CTRL].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1006  	in_clk_src_desc.iClockSource = us[STR_CLKSRC_IN].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1007  	out_clk_src_desc.iClockSource = us[STR_CLKSRC_OUT].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1008  	usb_out_it_desc.iTerminal = us[STR_USB_IT].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1009  	io_in_it_desc.iTerminal = us[STR_IO_IT].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1010  	usb_in_ot_desc.iTerminal = us[STR_USB_OT].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1011  	io_out_ot_desc.iTerminal = us[STR_IO_OT].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1012  	std_as_out_if0_desc.iInterface = us[STR_AS_OUT_ALT0].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1013  	std_as_out_if1_desc.iInterface = us[STR_AS_OUT_ALT1].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1014  	std_as_in_if0_desc.iInterface = us[STR_AS_IN_ALT0].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1015  	std_as_in_if1_desc.iInterface = us[STR_AS_IN_ALT1].id;
f408757f819a579 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1016  
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1017  	if (FUOUT_EN(uac2_opts)) {
59e477af7b1a2a0 drivers/usb/gadget/function/f_uac2.c Colin Ian King            2021-08-04  1018  		u8 *i_feature = (u8 *)out_feature_unit_desc +
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1019  				out_feature_unit_desc->bLength - 1;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1020  		*i_feature = us[STR_FU_OUT].id;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1021  	}
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1022  	if (FUIN_EN(uac2_opts)) {
59e477af7b1a2a0 drivers/usb/gadget/function/f_uac2.c Colin Ian King            2021-08-04  1023  		u8 *i_feature = (u8 *)in_feature_unit_desc +
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1024  				in_feature_unit_desc->bLength - 1;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1025  		*i_feature = us[STR_FU_IN].id;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1026  	}
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1027  
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1028  
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1029  	/* Initialize the configurable parameters */
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1030  	usb_out_it_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1031  	usb_out_it_desc.bmChannelConfig = cpu_to_le32(uac2_opts->c_chmask);
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1032  	io_in_it_desc.bNrChannels = num_channels(uac2_opts->p_chmask);
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1033  	io_in_it_desc.bmChannelConfig = cpu_to_le32(uac2_opts->p_chmask);
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1034  	as_out_hdr_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1035  	as_out_hdr_desc.bmChannelConfig = cpu_to_le32(uac2_opts->c_chmask);
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1036  	as_in_hdr_desc.bNrChannels = num_channels(uac2_opts->p_chmask);
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1037  	as_in_hdr_desc.bmChannelConfig = cpu_to_le32(uac2_opts->p_chmask);
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1038  	as_out_fmt1_desc.bSubslotSize = uac2_opts->c_ssize;
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1039  	as_out_fmt1_desc.bBitResolution = uac2_opts->c_ssize * 8;
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1040  	as_in_fmt1_desc.bSubslotSize = uac2_opts->p_ssize;
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1041  	as_in_fmt1_desc.bBitResolution = uac2_opts->p_ssize * 8;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1042  	if (FUOUT_EN(uac2_opts)) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1043  		__le32 *bma = (__le32 *)&out_feature_unit_desc->bmaControls[0];
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1044  		u32 control = 0;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1045  
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1046  		if (uac2_opts->c_mute_present)
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1047  			control |= CONTROL_RDWR << FU_MUTE_CTRL;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1048  		if (uac2_opts->c_volume_present)
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1049  			control |= CONTROL_RDWR << FU_VOL_CTRL;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1050  		*bma = cpu_to_le32(control);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1051  	}
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1052  	if (FUIN_EN(uac2_opts)) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1053  		__le32 *bma = (__le32 *)&in_feature_unit_desc->bmaControls[0];
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1054  		u32 control = 0;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1055  
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1056  		if (uac2_opts->p_mute_present)
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1057  			control |= CONTROL_RDWR << FU_MUTE_CTRL;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1058  		if (uac2_opts->p_volume_present)
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1059  			control |= CONTROL_RDWR << FU_VOL_CTRL;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1060  		*bma = cpu_to_le32(control);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1061  	}
f8f93d244afad80 drivers/usb/gadget/function/f_uac2.c Andrzej Pietrasiewicz     2014-07-22  1062  
919a88c00fb3ce7 drivers/usb/gadget/function/f_uac2.c Julian Scheel             2022-01-09  1063  	init_p_srate = uac2_opts->p_srates[0];
919a88c00fb3ce7 drivers/usb/gadget/function/f_uac2.c Julian Scheel             2022-01-09  1064  	init_c_srate = uac2_opts->c_srates[0];
919a88c00fb3ce7 drivers/usb/gadget/function/f_uac2.c Julian Scheel             2022-01-09  1065  
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1066  	ret = usb_interface_id(cfg, fn);
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1067  	if (ret < 0) {
a8147dabe56f7e7 drivers/usb/gadget/function/f_uac2.c Daniel Mack               2014-08-27  1068  		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1069  		goto err_free_fu;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1070  	}
8813a59ed892305 drivers/usb/gadget/function/f_uac2.c John Keeping              2018-01-12  1071  	iad_desc.bFirstInterface = ret;
8813a59ed892305 drivers/usb/gadget/function/f_uac2.c John Keeping              2018-01-12  1072  
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1073  	std_ac_if_desc.bInterfaceNumber = ret;
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1074  	uac2->ac_intf = ret;
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1075  	uac2->ac_alt = 0;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1076  
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1077  	if (EPOUT_EN(uac2_opts)) {
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1078  		ret = usb_interface_id(cfg, fn);
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1079  		if (ret < 0) {
a8147dabe56f7e7 drivers/usb/gadget/function/f_uac2.c Daniel Mack               2014-08-27  1080  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1081  			goto err_free_fu;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1082  		}
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1083  		std_as_out_if0_desc.bInterfaceNumber = ret;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1084  		std_as_out_if1_desc.bInterfaceNumber = ret;
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1085  		uac2->as_out_intf = ret;
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1086  		uac2->as_out_alt = 0;
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1087  
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1088  		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1089  			fs_epout_desc.bmAttributes =
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1090  			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1091  			hs_epout_desc.bmAttributes =
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1092  			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1093  			ss_epout_desc.bmAttributes =
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1094  			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1095  			std_as_out_if1_desc.bNumEndpoints++;
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1096  		} else {
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1097  			fs_epout_desc.bmAttributes =
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1098  			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1099  			hs_epout_desc.bmAttributes =
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1100  			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1101  			ss_epout_desc.bmAttributes =
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1102  			  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1103  		}
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1104  	}
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1105  
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1106  	if (EPIN_EN(uac2_opts)) {
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1107  		ret = usb_interface_id(cfg, fn);
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1108  		if (ret < 0) {
a8147dabe56f7e7 drivers/usb/gadget/function/f_uac2.c Daniel Mack               2014-08-27  1109  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1110  			goto err_free_fu;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1111  		}
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1112  		std_as_in_if0_desc.bInterfaceNumber = ret;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1113  		std_as_in_if1_desc.bInterfaceNumber = ret;
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1114  		uac2->as_in_intf = ret;
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1115  		uac2->as_in_alt = 0;
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1116  	}
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1117  
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1118  	if (FUOUT_EN(uac2_opts) || FUIN_EN(uac2_opts)) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1119  		uac2->int_ep = usb_ep_autoconfig(gadget, &fs_ep_int_desc);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1120  		if (!uac2->int_ep) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1121  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1122  			ret = -ENODEV;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1123  			goto err_free_fu;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1124  		}
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1125  
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1126  		std_ac_if_desc.bNumEndpoints = 1;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1127  	}
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1128  
0db56e43359c47f drivers/usb/gadget/function/f_uac2.c Sekhar Nori               2017-05-17  1129  	/* Calculate wMaxPacketSize according to audio bandwidth */
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1130  	ret = set_ep_max_packet_size(uac2_opts, &fs_epin_desc, USB_SPEED_FULL,
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1131  				     true);
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1132  	if (ret < 0) {
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1133  		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1134  		return ret;
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1135  	}
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1136  
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1137  	ret = set_ep_max_packet_size(uac2_opts, &fs_epout_desc, USB_SPEED_FULL,
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1138  				     false);
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1139  	if (ret < 0) {
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1140  		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1141  		return ret;
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1142  	}
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1143  
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1144  	ret = set_ep_max_packet_size(uac2_opts, &hs_epin_desc, USB_SPEED_HIGH,
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1145  				     true);
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1146  	if (ret < 0) {
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1147  		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1148  		return ret;
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1149  	}
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1150  
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1151  	ret = set_ep_max_packet_size(uac2_opts, &hs_epout_desc, USB_SPEED_HIGH,
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1152  				     false);
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1153  	if (ret < 0) {
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1154  		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1155  		return ret;
9389044f27081d6 drivers/usb/gadget/function/f_uac2.c Jerome Brunet             2020-12-21  1156  	}
0db56e43359c47f drivers/usb/gadget/function/f_uac2.c Sekhar Nori               2017-05-17  1157  
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1158  	ret = set_ep_max_packet_size(uac2_opts, &ss_epin_desc, USB_SPEED_SUPER,
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1159  				     true);
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1160  	if (ret < 0) {
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1161  		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1162  		return ret;
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1163  	}
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1164  
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1165  	ret = set_ep_max_packet_size(uac2_opts, &ss_epout_desc, USB_SPEED_SUPER,
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1166  				     false);
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1167  	if (ret < 0) {
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1168  		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1169  		return ret;
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1170  	}
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1171  
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1172  	if (EPOUT_EN(uac2_opts)) {
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1173  		agdev->out_ep = usb_ep_autoconfig(gadget, &fs_epout_desc);
391aa852a372308 drivers/usb/gadget/f_uac2.c          Sebastian Andrzej Siewior 2012-10-22  1174  		if (!agdev->out_ep) {
a8147dabe56f7e7 drivers/usb/gadget/function/f_uac2.c Daniel Mack               2014-08-27  1175  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1176  			ret = -ENODEV;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1177  			goto err_free_fu;
391aa852a372308 drivers/usb/gadget/f_uac2.c          Sebastian Andrzej Siewior 2012-10-22  1178  		}
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1179  		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
24f779dac8f3efb drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1180  			agdev->in_ep_fback = usb_ep_autoconfig(gadget,
24f779dac8f3efb drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1181  						       &fs_epin_fback_desc);
24f779dac8f3efb drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1182  			if (!agdev->in_ep_fback) {
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1183  				dev_err(dev, "%s:%d Error!\n",
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1184  					__func__, __LINE__);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1185  				ret = -ENODEV;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1186  				goto err_free_fu;
24f779dac8f3efb drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1187  			}
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1188  		}
40c73b30546e759 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1189  	}
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1190  
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1191  	if (EPIN_EN(uac2_opts)) {
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1192  		agdev->in_ep = usb_ep_autoconfig(gadget, &fs_epin_desc);
391aa852a372308 drivers/usb/gadget/f_uac2.c          Sebastian Andrzej Siewior 2012-10-22  1193  		if (!agdev->in_ep) {
a8147dabe56f7e7 drivers/usb/gadget/function/f_uac2.c Daniel Mack               2014-08-27  1194  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1195  			ret = -ENODEV;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1196  			goto err_free_fu;
391aa852a372308 drivers/usb/gadget/f_uac2.c          Sebastian Andrzej Siewior 2012-10-22  1197  		}
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1198  	}
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1199  
14e1d56cbea6c02 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-25  1200  	agdev->in_ep_maxpsize = max_t(u16,
14e1d56cbea6c02 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-25  1201  				le16_to_cpu(fs_epin_desc.wMaxPacketSize),
14e1d56cbea6c02 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-25  1202  				le16_to_cpu(hs_epin_desc.wMaxPacketSize));
14e1d56cbea6c02 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-25  1203  	agdev->out_ep_maxpsize = max_t(u16,
14e1d56cbea6c02 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-25  1204  				le16_to_cpu(fs_epout_desc.wMaxPacketSize),
14e1d56cbea6c02 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-25  1205  				le16_to_cpu(hs_epout_desc.wMaxPacketSize));
eb127cb519d73c0 drivers/usb/gadget/f_uac2.c          Jassi Brar                2013-05-30  1206  
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1207  	agdev->in_ep_maxpsize = max_t(u16, agdev->in_ep_maxpsize,
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1208  				le16_to_cpu(ss_epin_desc.wMaxPacketSize));
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1209  	agdev->out_ep_maxpsize = max_t(u16, agdev->out_ep_maxpsize,
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1210  				le16_to_cpu(ss_epout_desc.wMaxPacketSize));
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1211  
f0e8a206a2a53a9 drivers/usb/gadget/function/f_uac2.c Jack Pham                 2021-09-09  1212  	ss_epin_desc_comp.wBytesPerInterval = ss_epin_desc.wMaxPacketSize;
f0e8a206a2a53a9 drivers/usb/gadget/function/f_uac2.c Jack Pham                 2021-09-09  1213  	ss_epout_desc_comp.wBytesPerInterval = ss_epout_desc.wMaxPacketSize;
f0e8a206a2a53a9 drivers/usb/gadget/function/f_uac2.c Jack Pham                 2021-09-09  1214  
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1215  	// HS and SS endpoint addresses are copied from autoconfigured FS descriptors
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1216  	hs_ep_int_desc.bEndpointAddress = fs_ep_int_desc.bEndpointAddress;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1217  	hs_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
24f779dac8f3efb drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1218  	hs_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1219  	hs_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1220  	ss_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
24f779dac8f3efb drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1221  	ss_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1222  	ss_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1223  	ss_ep_int_desc.bEndpointAddress = fs_ep_int_desc.bEndpointAddress;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1224  
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1225  	setup_descriptor(uac2_opts);
3fa4eaa6c08206b drivers/usb/gadget/function/f_uac2.c Andreas Pape              2018-06-21  1226  
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1227  	ret = usb_assign_descriptors(fn, fs_audio_desc, hs_audio_desc, ss_audio_desc,
f8cb3d556be31d2 drivers/usb/gadget/function/f_uac2.c Pawel Laszczak            2021-03-10  1228  				     ss_audio_desc);
10287baec761d33 drivers/usb/gadget/f_uac2.c          Sebastian Andrzej Siewior 2012-10-22  1229  	if (ret)
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1230  		goto err_free_fu;
132fcb460839a87 drivers/usb/gadget/f_uac2.c          Jassi Brar                2012-02-02  1231  
7158b57a495635c drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1232  	agdev->gadget = gadget;
7158b57a495635c drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1233  
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1234  	agdev->params.p_chmask = uac2_opts->p_chmask;
919a88c00fb3ce7 drivers/usb/gadget/function/f_uac2.c Julian Scheel             2022-01-09  1235  	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
919a88c00fb3ce7 drivers/usb/gadget/function/f_uac2.c Julian Scheel             2022-01-09  1236  			sizeof(agdev->params.p_srates));
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1237  	agdev->params.p_ssize = uac2_opts->p_ssize;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1238  	if (FUIN_EN(uac2_opts)) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1239  		agdev->params.p_fu.id = USB_IN_FU_ID;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1240  		agdev->params.p_fu.mute_present = uac2_opts->p_mute_present;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1241  		agdev->params.p_fu.volume_present = uac2_opts->p_volume_present;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1242  		agdev->params.p_fu.volume_min = uac2_opts->p_volume_min;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1243  		agdev->params.p_fu.volume_max = uac2_opts->p_volume_max;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1244  		agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1245  	}
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1246  	agdev->params.c_chmask = uac2_opts->c_chmask;
919a88c00fb3ce7 drivers/usb/gadget/function/f_uac2.c Julian Scheel             2022-01-09  1247  	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
919a88c00fb3ce7 drivers/usb/gadget/function/f_uac2.c Julian Scheel             2022-01-09  1248  			sizeof(agdev->params.c_srates));
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1249  	agdev->params.c_ssize = uac2_opts->c_ssize;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1250  	if (FUOUT_EN(uac2_opts)) {
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1251  		agdev->params.c_fu.id = USB_OUT_FU_ID;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1252  		agdev->params.c_fu.mute_present = uac2_opts->c_mute_present;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1253  		agdev->params.c_fu.volume_present = uac2_opts->c_volume_present;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1254  		agdev->params.c_fu.volume_min = uac2_opts->c_volume_min;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1255  		agdev->params.c_fu.volume_max = uac2_opts->c_volume_max;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1256  		agdev->params.c_fu.volume_res = uac2_opts->c_volume_res;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1257  	}
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1258  	agdev->params.req_number = uac2_opts->req_number;
e89bb4288378b85 drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-06-04  1259  	agdev->params.fb_max = uac2_opts->fb_max;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1260  
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1261  	if (FUOUT_EN(uac2_opts) || FUIN_EN(uac2_opts))
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1262      agdev->notify = afunc_notify;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1263  
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1264  	ret = g_audio_setup(agdev, "UAC2 PCM", "UAC2_Gadget");
391aa852a372308 drivers/usb/gadget/f_uac2.c          Sebastian Andrzej Siewior 2012-10-22  1265  	if (ret)
eb9fecb9e69b0be drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1266  		goto err_free_descs;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1267  
391aa852a372308 drivers/usb/gadget/f_uac2.c          Sebastian Andrzej Siewior 2012-10-22  1268  	return 0;
d12a8727171c770 drivers/usb/gadget/function/f_uac2.c Pavitrakumar Managutte    2014-10-22  1269  
f1d3861d63a5d79 drivers/usb/gadget/function/f_uac2.c Peter Chen                2016-11-08  1270  err_free_descs:
f1d3861d63a5d79 drivers/usb/gadget/function/f_uac2.c Peter Chen                2016-11-08  1271  	usb_free_all_descriptors(fn);
7158b57a495635c drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2017-06-18  1272  	agdev->gadget = NULL;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1273  err_free_fu:
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1274  	kfree(out_feature_unit_desc);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1275  	out_feature_unit_desc = NULL;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1276  	kfree(in_feature_unit_desc);
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1277  	in_feature_unit_desc = NULL;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1278  	return ret;
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1279  }
eaf6cbe0992052a drivers/usb/gadget/function/f_uac2.c Ruslan Bilovol            2021-07-12  1280  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
