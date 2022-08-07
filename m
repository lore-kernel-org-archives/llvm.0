Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA51FBE
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 10:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659867812; x=1691403812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qNTiFy9gEA/14tAheQKTFr/D4+aV0LZIJMpKGQsAViU=;
  b=S05Xteq/3GQ0HAo/Zjo3U+OAfu3EbGEdtIMfcSsc7WQ66dXe1/HZSKaj
   vf0xkX/C0534swCfCtP7RD9NEdleHBoyZhDzI/vgnd8z0E3DBfLUvKlD9
   ZAnHeEaZNbGOytQO2Moq0ZLk+PdbLcDV4opU5098ZgoS126TUgaX+arQE
   sKbCIBeapdI/FhyI5WGAofmpLev3FPOtShmSj/Z/ESCm3AcA93zxK0F8A
   KoDj8+DmDWYEgM37l1VVSL/P6zOM4YMnahxTVn7i+O7cYpxSR5XB7sHj4
   ZpNO1vK7pnNviUzZqsZe51vNpy95nob4kvtVrw3PGdhtE9fXrwLFt7q8k
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="354426462"
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="354426462"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2022 03:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="554592377"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Aug 2022 03:23:29 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKdRR-000LDX-06;
	Sun, 07 Aug 2022 10:23:29 +0000
Date: Sun, 7 Aug 2022 18:22:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [CI 1/2] drm/i915/edid: convert DP, HDMI and LVDS to
 drm_edid
Message-ID: <202208071858.Dp9ETjVN-lkp@intel.com>
References: <20220805101334.925995-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805101334.925995-1-jani.nikula@intel.com>

Hi Jani,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-edid-convert-DP-HDMI-and-LVDS-to-drm_edid/20220805-184852
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220807/202208071858.Dp9ETjVN-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/72b9a6f4653066745c93c0a4d9cde53927ea0949
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-i915-edid-convert-DP-HDMI-and-LVDS-to-drm_edid/20220805-184852
        git checkout 72b9a6f4653066745c93c0a4d9cde53927ea0949
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_lvds.c:957:7: warning: variable 'drm_edid' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (edid) {
                       ^~~~
   drivers/gpu/drm/i915/display/intel_lvds.c:965:6: note: uninitialized use occurs here
           if (drm_edid) {
               ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_lvds.c:957:3: note: remove the 'if' if its condition is always true
                   if (edid) {
                   ^~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_lvds.c:832:33: note: initialize the variable 'drm_edid' to silence this warning
           const struct drm_edid *drm_edid;
                                          ^
                                           = NULL
   1 warning generated.


vim +957 drivers/gpu/drm/i915/display/intel_lvds.c

1974cad0ee4ce8 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2012-11-26  816  
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  817  /**
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  818   * intel_lvds_init - setup LVDS connectors on this device
af4ef7dccfcaef drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2018-02-14  819   * @dev_priv: i915 device
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  820   *
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  821   * Create the connector, register the LVDS DDC bus, and try to figure out what
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  822   * modes we can display on the LVDS panel (if present).
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  823   */
c39055b072f8b1 drivers/gpu/drm/i915/intel_lvds.c         Ander Conselvan de Oliveira 2016-11-23  824  void intel_lvds_init(struct drm_i915_private *dev_priv)
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  825  {
c39055b072f8b1 drivers/gpu/drm/i915/intel_lvds.c         Ander Conselvan de Oliveira 2016-11-23  826  	struct drm_device *dev = &dev_priv->drm;
29b99b4841cc15 drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2012-10-19  827  	struct intel_lvds_encoder *lvds_encoder;
21d40d37eca868 drivers/gpu/drm/i915/intel_lvds.c         Eric Anholt                 2010-03-25  828  	struct intel_encoder *intel_encoder;
bb8a356088db8a drivers/gpu/drm/i915/intel_lvds.c         Zhenyu Wang                 2010-03-29  829  	struct intel_connector *intel_connector;
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  830  	struct drm_connector *connector;
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  831  	struct drm_encoder *encoder;
72b9a6f4653066 drivers/gpu/drm/i915/display/intel_lvds.c Jani Nikula                 2022-08-05  832  	const struct drm_edid *drm_edid;
f0f59a00a1c9be drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-11-18  833  	i915_reg_t lvds_reg;
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  834  	u32 lvds;
270eea0fd71ae9 drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2010-09-24  835  	u8 pin;
8b45330ad30193 drivers/gpu/drm/i915/intel_lvds.c         Maarten Lankhorst           2017-05-01  836  	u32 allowed_scalers;
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  837  
425d244c86700b drivers/gpu/drm/i915/intel_lvds.c         Jarod Wilson                2009-05-05  838  	/* Skip init on machines we know falsely report LVDS */
ca3b3fa344476c drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2018-05-18  839  	if (dmi_check_system(intel_no_lvds)) {
f4224a4cb16c24 drivers/gpu/drm/i915/display/intel_lvds.c Pankaj Bharadiya            2020-01-28  840  		drm_WARN(dev, !dev_priv->vbt.int_lvds_support,
ca3b3fa344476c drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2018-05-18  841  			 "Useless DMI match. Internal LVDS support disabled by VBT\n");
c9093354a1e839 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2013-06-06  842  		return;
ca3b3fa344476c drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2018-05-18  843  	}
565dcd4635f4f8 drivers/gpu/drm/i915/intel_lvds.c         Paul Collins                2009-02-04  844  
5255e2f8d1177f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2018-05-08  845  	if (!dev_priv->vbt.int_lvds_support) {
900b8c9e8fe78c drivers/gpu/drm/i915/display/intel_lvds.c Wambui Karuga               2020-03-10  846  		drm_dbg_kms(&dev_priv->drm,
900b8c9e8fe78c drivers/gpu/drm/i915/display/intel_lvds.c Wambui Karuga               2020-03-10  847  			    "Internal LVDS support disabled by VBT\n");
5255e2f8d1177f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2018-05-08  848  		return;
5255e2f8d1177f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2018-05-08  849  	}
5255e2f8d1177f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2018-05-08  850  
6e266956a57f87 drivers/gpu/drm/i915/intel_lvds.c         Tvrtko Ursulin              2016-10-13  851  	if (HAS_PCH_SPLIT(dev_priv))
d0669d007542d7 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-09-18  852  		lvds_reg = PCH_LVDS;
d0669d007542d7 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-09-18  853  	else
d0669d007542d7 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-09-18  854  		lvds_reg = LVDS;
d0669d007542d7 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-09-18  855  
cc80e3625695ec drivers/gpu/drm/i915/display/intel_lvds.c Jani Nikula                 2020-01-24  856  	lvds = intel_de_read(dev_priv, lvds_reg);
d0669d007542d7 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-09-18  857  
6e266956a57f87 drivers/gpu/drm/i915/intel_lvds.c         Tvrtko Ursulin              2016-10-13  858  	if (HAS_PCH_SPLIT(dev_priv)) {
d0669d007542d7 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-09-18  859  		if ((lvds & LVDS_DETECTED) == 0)
c9093354a1e839 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2013-06-06  860  			return;
541998a18b72d2 drivers/gpu/drm/i915/intel_lvds.c         Zhenyu Wang                 2009-06-05  861  	}
541998a18b72d2 drivers/gpu/drm/i915/intel_lvds.c         Zhenyu Wang                 2009-06-05  862  
eebaed646ab263 drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2015-06-19  863  	pin = GMBUS_PIN_PANEL;
5a69d13d78d730 drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2016-03-16  864  	if (!intel_bios_is_lvds_present(dev_priv, &pin)) {
d0669d007542d7 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-09-18  865  		if ((lvds & LVDS_PORT_EN) == 0) {
900b8c9e8fe78c drivers/gpu/drm/i915/display/intel_lvds.c Wambui Karuga               2020-03-10  866  			drm_dbg_kms(&dev_priv->drm,
900b8c9e8fe78c drivers/gpu/drm/i915/display/intel_lvds.c Wambui Karuga               2020-03-10  867  				    "LVDS is not present in VBT\n");
eebaed646ab263 drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2015-06-19  868  			return;
eebaed646ab263 drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2015-06-19  869  		}
900b8c9e8fe78c drivers/gpu/drm/i915/display/intel_lvds.c Wambui Karuga               2020-03-10  870  		drm_dbg_kms(&dev_priv->drm,
900b8c9e8fe78c drivers/gpu/drm/i915/display/intel_lvds.c Wambui Karuga               2020-03-10  871  			    "LVDS is not present in VBT, but enabled anyway\n");
eebaed646ab263 drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2015-06-19  872  	}
eebaed646ab263 drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2015-06-19  873  
b14c5679dd2c87 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2013-09-19  874  	lvds_encoder = kzalloc(sizeof(*lvds_encoder), GFP_KERNEL);
29b99b4841cc15 drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2012-10-19  875  	if (!lvds_encoder)
c9093354a1e839 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2013-06-06  876  		return;
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  877  
aee7d9bee2db89 drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2018-10-10  878  	intel_connector = intel_connector_alloc();
aee7d9bee2db89 drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2018-10-10  879  	if (!intel_connector) {
9bdbd0b911086d drivers/gpu/drm/i915/intel_lvds.c         Ander Conselvan de Oliveira 2015-04-10  880  		kfree(lvds_encoder);
9bdbd0b911086d drivers/gpu/drm/i915/intel_lvds.c         Ander Conselvan de Oliveira 2015-04-10  881  		return;
9bdbd0b911086d drivers/gpu/drm/i915/intel_lvds.c         Ander Conselvan de Oliveira 2015-04-10  882  	}
9bdbd0b911086d drivers/gpu/drm/i915/intel_lvds.c         Ander Conselvan de Oliveira 2015-04-10  883  
aee7d9bee2db89 drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2018-10-10  884  	lvds_encoder->attached_connector = intel_connector;
62165e0def63fa drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2012-10-19  885  
29b99b4841cc15 drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2012-10-19  886  	intel_encoder = &lvds_encoder->base;
4ef69c7a64b78d drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2010-09-09  887  	encoder = &intel_encoder->base;
ea5b213ad4b161 drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2010-08-04  888  	connector = &intel_connector->base;
bb8a356088db8a drivers/gpu/drm/i915/intel_lvds.c         Zhenyu Wang                 2010-03-29  889  	drm_connector_init(dev, &intel_connector->base, &intel_lvds_connector_funcs,
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  890  			   DRM_MODE_CONNECTOR_LVDS);
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  891  
4ef69c7a64b78d drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2010-09-09  892  	drm_encoder_init(dev, &intel_encoder->base, &intel_lvds_enc_funcs,
580d8ed522e0eb drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2016-05-27  893  			 DRM_MODE_ENCODER_LVDS, "LVDS");
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  894  
c22834ecbb9ff4 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2012-06-30  895  	intel_encoder->enable = intel_enable_lvds;
f6736a1a7b846d drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2013-06-05  896  	intel_encoder->pre_enable = intel_pre_enable_lvds;
7ae892337e3357 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2013-03-27  897  	intel_encoder->compute_config = intel_lvds_compute_config;
d26a5b6e80c87f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-07-02  898  	if (HAS_PCH_SPLIT(dev_priv)) {
d26a5b6e80c87f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-07-02  899  		intel_encoder->disable = pch_disable_lvds;
d26a5b6e80c87f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-07-02  900  		intel_encoder->post_disable = pch_post_disable_lvds;
d26a5b6e80c87f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-07-02  901  	} else {
d26a5b6e80c87f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-07-02  902  		intel_encoder->disable = gmch_disable_lvds;
d26a5b6e80c87f drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-07-02  903  	}
b1dc332c4d1524 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2012-07-02  904  	intel_encoder->get_hw_state = intel_lvds_get_hw_state;
045ac3b5629d97 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2013-05-14  905  	intel_encoder->get_config = intel_lvds_get_config;
c0a52f8bd75573 drivers/gpu/drm/i915/display/intel_lvds.c Jani Nikula                 2021-08-25  906  	intel_encoder->update_pipe = intel_backlight_update;
d2008827d37a69 drivers/gpu/drm/i915/display/intel_lvds.c Ville Syrjälä               2020-10-01  907  	intel_encoder->shutdown = intel_lvds_shutdown;
b1dc332c4d1524 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2012-07-02  908  	intel_connector->get_hw_state = intel_connector_get_hw_state;
c22834ecbb9ff4 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2012-06-30  909  
df0e924883d029 drivers/gpu/drm/i915/intel_lvds.c         Chris Wilson                2010-09-09  910  	intel_connector_attach_encoder(intel_connector, intel_encoder);
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  911  
03cdc1d4f79573 drivers/gpu/drm/i915/intel_lvds.c         Pandiyan, Dhinakaran        2016-09-19  912  	intel_encoder->type = INTEL_OUTPUT_LVDS;
79f255a0c99cf5 drivers/gpu/drm/i915/intel_lvds.c         Ander Conselvan de Oliveira 2017-02-22  913  	intel_encoder->power_domain = POWER_DOMAIN_PORT_OTHER;
03cdc1d4f79573 drivers/gpu/drm/i915/intel_lvds.c         Pandiyan, Dhinakaran        2016-09-19  914  	intel_encoder->port = PORT_NONE;
bc079e8b1684e1 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2014-03-03  915  	intel_encoder->cloneable = 0;
005e95377249cb drivers/gpu/drm/i915/display/intel_lvds.c Matt Roper                  2021-03-19  916  	if (DISPLAY_VER(dev_priv) < 4)
981329ce3c3e13 drivers/gpu/drm/i915/display/intel_lvds.c Ville Syrjälä               2019-10-02  917  		intel_encoder->pipe_mask = BIT(PIPE_B);
2b0b27418a72f9 drivers/gpu/drm/i915/display/intel_lvds.c Ville Syrjälä               2019-10-02  918  	else
34053ee1897410 drivers/gpu/drm/i915/display/intel_lvds.c Ville Syrjälä               2019-10-02  919  		intel_encoder->pipe_mask = ~0;
27f8227b1e2b32 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2011-09-02  920  
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  921  	drm_connector_helper_add(connector, &intel_lvds_connector_helper_funcs);
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  922  	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  923  	connector->interlace_allowed = false;
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  924  	connector->doublescan_allowed = false;
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  925  
d0669d007542d7 drivers/gpu/drm/i915/intel_lvds.c         Ville Syrjälä               2015-09-18  926  	lvds_encoder->reg = lvds_reg;
7dec060675125f drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2012-09-11  927  
3fbe18d65d6605 drivers/gpu/drm/i915/intel_lvds.c         Zhao Yakui                  2009-06-22  928  	/* create the scaling mode property */
8b45330ad30193 drivers/gpu/drm/i915/intel_lvds.c         Maarten Lankhorst           2017-05-01  929  	allowed_scalers = BIT(DRM_MODE_SCALE_ASPECT);
8b45330ad30193 drivers/gpu/drm/i915/intel_lvds.c         Maarten Lankhorst           2017-05-01  930  	allowed_scalers |= BIT(DRM_MODE_SCALE_FULLSCREEN);
8b45330ad30193 drivers/gpu/drm/i915/intel_lvds.c         Maarten Lankhorst           2017-05-01  931  	allowed_scalers |= BIT(DRM_MODE_SCALE_CENTER);
8b45330ad30193 drivers/gpu/drm/i915/intel_lvds.c         Maarten Lankhorst           2017-05-01  932  	drm_connector_attach_scaling_mode_property(connector, allowed_scalers);
eead06dff9c346 drivers/gpu/drm/i915/intel_lvds.c         Maarten Lankhorst           2017-05-01  933  	connector->state->scaling_mode = DRM_MODE_SCALE_ASPECT;
ed6143b8f7537d drivers/gpu/drm/i915/intel_lvds.c         Imre Deak                   2016-08-10  934  
ed6143b8f7537d drivers/gpu/drm/i915/intel_lvds.c         Imre Deak                   2016-08-10  935  	intel_lvds_pps_get_hw_state(dev_priv, &lvds_encoder->init_pps);
ed6143b8f7537d drivers/gpu/drm/i915/intel_lvds.c         Imre Deak                   2016-08-10  936  	lvds_encoder->init_lvds_val = lvds;
ed6143b8f7537d drivers/gpu/drm/i915/intel_lvds.c         Imre Deak                   2016-08-10  937  
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  938  	/*
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  939  	 * LVDS discovery:
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  940  	 * 1) check for EDID on DDC
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  941  	 * 2) check for VBT data
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  942  	 * 3) check to see if LVDS is already on
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  943  	 *    if none of the above, no panel
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  944  	 */
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  945  
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  946  	/*
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  947  	 * Attempt to get the fixed panel mode from DDC.  Assume that the
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  948  	 * preferred mode is the right one.
79e539453b34e3 drivers/gpu/drm/i915/intel_lvds.c         Jesse Barnes                2008-11-07  949  	 */
4da98541d898d4 drivers/gpu/drm/i915/intel_lvds.c         Daniel Vetter               2014-03-21  950  	mutex_lock(&dev->mode_config.mutex);
72b9a6f4653066 drivers/gpu/drm/i915/display/intel_lvds.c Jani Nikula                 2022-08-05  951  	if (vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) {
72b9a6f4653066 drivers/gpu/drm/i915/display/intel_lvds.c Jani Nikula                 2022-08-05  952  		const struct edid *edid;
72b9a6f4653066 drivers/gpu/drm/i915/display/intel_lvds.c Jani Nikula                 2022-08-05  953  
72b9a6f4653066 drivers/gpu/drm/i915/display/intel_lvds.c Jani Nikula                 2022-08-05  954  		/* FIXME: Make drm_get_edid_switcheroo() return drm_edid */
4eddaeecf92341 drivers/gpu/drm/i915/intel_lvds.c         Lukas Wunner                2016-01-11  955  		edid = drm_get_edid_switcheroo(connector,
4eddaeecf92341 drivers/gpu/drm/i915/intel_lvds.c         Lukas Wunner                2016-01-11  956  					       intel_gmbus_get_adapter(dev_priv, pin));
9cd300e038d492 drivers/gpu/drm/i915/intel_lvds.c         Jani Nikula                 2012-10-19 @957  		if (edid) {

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
