Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEE52C9C
	for <llvm@lists.linux.dev>; Wed, 22 Dec 2021 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640178665; x=1671714665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=psSYKsC5oO4Ebn+yDldCJoTjmI7zbBCEHjAHWKbKGes=;
  b=DKWNGwgMk9fHeABcITdO82e+2nn1VkK/jH3MBh2tXAeNkjUXyF5jbXq4
   3/5hkd4G4l04XbiXPb8RzDDsY+BjR/P5HWmcSPtW29X6j2qPQQc87ncZk
   Rq280eGDlLBiJ/sOMO825hUzg1CXBqMI/8veMp6s7NwowzCVrt34aojKg
   Iqyzh8Dc0KSoDkV43yoB2bG/kBxHSLD7bOwijYm874usr3+LiH989r9zX
   uARAgTWxXMKkZB4kFImiJjc8w8u1BxuknvkQ5f+OGlbR410WmUKCkydhJ
   bTB72a5jxxPtz7FBPiySuqvns/ZRuusUHspiix+7fGd8XOWCqx1ChV3FX
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="220625005"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="220625005"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 05:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="664266809"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2021 05:10:43 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n01OE-0000Sv-CF; Wed, 22 Dec 2021 13:10:42 +0000
Date: Wed, 22 Dec 2021 21:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	contact@emersion.fr
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	dmitry.baryshkov@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie,
	daniel@ffwll.ch, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v2 1/6] =?iso-8859-1?Q?drm=2Fpl?=
 =?iso-8859-1?Q?ane=3A_Make_format=5Fmod=5Fsupported_truly=A0optional?=
Message-ID: <202112222123.OJy3roxk-lkp@intel.com>
References: <20211222090552.25972-2-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211222090552.25972-2-jose.exposito89@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "José,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on v5.16-rc6 next-20211221]
[cannot apply to drm/drm-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jos-Exp-sito/Add-missing-format_mod_supported-functions/20211222-170806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
config: arm-randconfig-r031-20211222 (https://download.01.org/0day-ci/archive/20211222/202112222123.OJy3roxk-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project de4e0195ae1c39f1c3b07834b8e32c113f4f20eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/0a433a79da79d35aa0b0130be9f44ef3e8fd9b08
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jos-Exp-sito/Add-missing-format_mod_supported-functions/20211222-170806
        git checkout 0a433a79da79d35aa0b0130be9f44ef3e8fd9b08
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_plane.c:222:1: warning: unused label 'done' [-Wunused-label]
   done:
   ^~~~~
   1 warning generated.


vim +/done +222 drivers/gpu/drm/drm_plane.c

db1689aa61bd1e Ben Widawsky  2017-07-23  163  
db1689aa61bd1e Ben Widawsky  2017-07-23  164  static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
db1689aa61bd1e Ben Widawsky  2017-07-23  165  {
db1689aa61bd1e Ben Widawsky  2017-07-23  166  	const struct drm_mode_config *config = &dev->mode_config;
db1689aa61bd1e Ben Widawsky  2017-07-23  167  	struct drm_property_blob *blob;
db1689aa61bd1e Ben Widawsky  2017-07-23  168  	struct drm_format_modifier *mod;
db1689aa61bd1e Ben Widawsky  2017-07-23  169  	size_t blob_size, formats_size, modifiers_size;
db1689aa61bd1e Ben Widawsky  2017-07-23  170  	struct drm_format_modifier_blob *blob_data;
db1689aa61bd1e Ben Widawsky  2017-07-23  171  	unsigned int i, j;
db1689aa61bd1e Ben Widawsky  2017-07-23  172  
db1689aa61bd1e Ben Widawsky  2017-07-23  173  	formats_size = sizeof(__u32) * plane->format_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  174  	if (WARN_ON(!formats_size)) {
db1689aa61bd1e Ben Widawsky  2017-07-23  175  		/* 0 formats are never expected */
db1689aa61bd1e Ben Widawsky  2017-07-23  176  		return 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  177  	}
db1689aa61bd1e Ben Widawsky  2017-07-23  178  
db1689aa61bd1e Ben Widawsky  2017-07-23  179  	modifiers_size =
db1689aa61bd1e Ben Widawsky  2017-07-23  180  		sizeof(struct drm_format_modifier) * plane->modifier_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  181  
db1689aa61bd1e Ben Widawsky  2017-07-23  182  	blob_size = sizeof(struct drm_format_modifier_blob);
db1689aa61bd1e Ben Widawsky  2017-07-23  183  	/* Modifiers offset is a pointer to a struct with a 64 bit field so it
db1689aa61bd1e Ben Widawsky  2017-07-23  184  	 * should be naturally aligned to 8B.
db1689aa61bd1e Ben Widawsky  2017-07-23  185  	 */
db1689aa61bd1e Ben Widawsky  2017-07-23  186  	BUILD_BUG_ON(sizeof(struct drm_format_modifier_blob) % 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  187  	blob_size += ALIGN(formats_size, 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  188  	blob_size += modifiers_size;
db1689aa61bd1e Ben Widawsky  2017-07-23  189  
db1689aa61bd1e Ben Widawsky  2017-07-23  190  	blob = drm_property_create_blob(dev, blob_size, NULL);
db1689aa61bd1e Ben Widawsky  2017-07-23  191  	if (IS_ERR(blob))
db1689aa61bd1e Ben Widawsky  2017-07-23  192  		return -1;
db1689aa61bd1e Ben Widawsky  2017-07-23  193  
11b83e3fbc4196 Ville Syrjälä 2018-02-23  194  	blob_data = blob->data;
db1689aa61bd1e Ben Widawsky  2017-07-23  195  	blob_data->version = FORMAT_BLOB_CURRENT;
db1689aa61bd1e Ben Widawsky  2017-07-23  196  	blob_data->count_formats = plane->format_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  197  	blob_data->formats_offset = sizeof(struct drm_format_modifier_blob);
db1689aa61bd1e Ben Widawsky  2017-07-23  198  	blob_data->count_modifiers = plane->modifier_count;
db1689aa61bd1e Ben Widawsky  2017-07-23  199  
db1689aa61bd1e Ben Widawsky  2017-07-23  200  	blob_data->modifiers_offset =
db1689aa61bd1e Ben Widawsky  2017-07-23  201  		ALIGN(blob_data->formats_offset + formats_size, 8);
db1689aa61bd1e Ben Widawsky  2017-07-23  202  
db1689aa61bd1e Ben Widawsky  2017-07-23  203  	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
db1689aa61bd1e Ben Widawsky  2017-07-23  204  
db1689aa61bd1e Ben Widawsky  2017-07-23  205  	mod = modifiers_ptr(blob_data);
db1689aa61bd1e Ben Widawsky  2017-07-23  206  	for (i = 0; i < plane->modifier_count; i++) {
db1689aa61bd1e Ben Widawsky  2017-07-23  207  		for (j = 0; j < plane->format_count; j++) {
0a433a79da79d3 José Expósito 2021-12-22  208  			if (!plane->funcs->format_mod_supported ||
0a433a79da79d3 José Expósito 2021-12-22  209  			    plane->funcs->format_mod_supported(plane,
db1689aa61bd1e Ben Widawsky  2017-07-23  210  							       plane->format_types[j],
db1689aa61bd1e Ben Widawsky  2017-07-23  211  							       plane->modifiers[i])) {
aadd41485bb227 Dan Carpenter 2017-08-09  212  				mod->formats |= 1ULL << j;
db1689aa61bd1e Ben Widawsky  2017-07-23  213  			}
db1689aa61bd1e Ben Widawsky  2017-07-23  214  		}
db1689aa61bd1e Ben Widawsky  2017-07-23  215  
db1689aa61bd1e Ben Widawsky  2017-07-23  216  		mod->modifier = plane->modifiers[i];
db1689aa61bd1e Ben Widawsky  2017-07-23  217  		mod->offset = 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  218  		mod->pad = 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  219  		mod++;
db1689aa61bd1e Ben Widawsky  2017-07-23  220  	}
db1689aa61bd1e Ben Widawsky  2017-07-23  221  
db1689aa61bd1e Ben Widawsky  2017-07-23 @222  done:
db1689aa61bd1e Ben Widawsky  2017-07-23  223  	drm_object_attach_property(&plane->base, config->modifiers_property,
db1689aa61bd1e Ben Widawsky  2017-07-23  224  				   blob->base.id);
db1689aa61bd1e Ben Widawsky  2017-07-23  225  
db1689aa61bd1e Ben Widawsky  2017-07-23  226  	return 0;
db1689aa61bd1e Ben Widawsky  2017-07-23  227  }
db1689aa61bd1e Ben Widawsky  2017-07-23  228  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
