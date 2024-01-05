Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAE7224FC;
	Fri,  5 Jan 2024 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeE0vxTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704445161; x=1735981161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ks2+xYNE5v8HJ+DUBBYAIXUvR427vNYvkVJ6If+iDbo=;
  b=aeE0vxToxWQU9UFEMrCZGLKvN/NHqEo1en9l67kOuW+EkaxBK9zM7znX
   jg0DwFL8ZOi0IhnBZ3F4yWcn5Khh7V+l9JJaARRmilCe54W5yLzq6EQt3
   dPsmFchITS55Qo6H4YEKDlc9B1NEFRuifLJ+7Qx4kIaxJ5qB5euCaG9Cw
   BbIImvvLOVOJlfJJcgZu6X2IX7h1z5L9TPiNuRRMMpelf+m8aITvRmhbJ
   XcMrqd/0KUB0tfKZWn8jU6NtZRHEih7z6S4Vb8JWHTRTe3QAHIPdDuPue
   9KYkn+GTTckwJUOAuG0MpaBgjwEWeR2lnzBOcsAbBrv0tUTbA8eBwz5Ll
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4572102"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4572102"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:59:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="924184475"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="924184475"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2024 00:59:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLg2n-00011o-0w;
	Fri, 05 Jan 2024 08:59:09 +0000
Date: Fri, 5 Jan 2024 16:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 11453/12662] sound/ac97/bus.c:112:20: error: use
 of undeclared identifier 'ac97_bus_type'
Message-ID: <202401051634.qQSC02IQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
commit: 66e82d219924f6112509f7e8f8e687fcc81a16e3 [11453/12662] ALSA: mark all struct bus_type as const
config: x86_64-buildonly-randconfig-003-20240105 (https://download.01.org/0day-ci/archive/20240105/202401051634.qQSC02IQ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051634.qQSC02IQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051634.qQSC02IQ-lkp@intel.com/

Note: the linux-next/master HEAD e2425464bc87159274879ab30f9d4fe624b9fcd2 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> sound/ac97/bus.c:112:20: error: use of undeclared identifier 'ac97_bus_type'
     112 |         codec->dev.bus = &ac97_bus_type;
         |                           ^
   sound/ac97/bus.c:191:21: error: use of undeclared identifier 'ac97_bus_type'
     191 |         drv->driver.bus = &ac97_bus_type;
         |                            ^
   2 errors generated.


vim +/ac97_bus_type +112 sound/ac97/bus.c

74426fbff66eea Robert Jarzmik 2017-09-02   99  
74426fbff66eea Robert Jarzmik 2017-09-02  100  static int ac97_codec_add(struct ac97_controller *ac97_ctrl, int idx,
74426fbff66eea Robert Jarzmik 2017-09-02  101  		   unsigned int vendor_id)
74426fbff66eea Robert Jarzmik 2017-09-02  102  {
74426fbff66eea Robert Jarzmik 2017-09-02  103  	struct ac97_codec_device *codec;
74426fbff66eea Robert Jarzmik 2017-09-02  104  	int ret;
74426fbff66eea Robert Jarzmik 2017-09-02  105  
74426fbff66eea Robert Jarzmik 2017-09-02  106  	codec = kzalloc(sizeof(*codec), GFP_KERNEL);
74426fbff66eea Robert Jarzmik 2017-09-02  107  	if (!codec)
74426fbff66eea Robert Jarzmik 2017-09-02  108  		return -ENOMEM;
74426fbff66eea Robert Jarzmik 2017-09-02  109  	ac97_ctrl->codecs[idx] = codec;
74426fbff66eea Robert Jarzmik 2017-09-02  110  	codec->vendor_id = vendor_id;
74426fbff66eea Robert Jarzmik 2017-09-02  111  	codec->dev.release = ac97_codec_release;
74426fbff66eea Robert Jarzmik 2017-09-02 @112  	codec->dev.bus = &ac97_bus_type;
74426fbff66eea Robert Jarzmik 2017-09-02  113  	codec->dev.parent = &ac97_ctrl->adap;
74426fbff66eea Robert Jarzmik 2017-09-02  114  	codec->num = idx;
74426fbff66eea Robert Jarzmik 2017-09-02  115  	codec->ac97_ctrl = ac97_ctrl;
74426fbff66eea Robert Jarzmik 2017-09-02  116  
74426fbff66eea Robert Jarzmik 2017-09-02  117  	device_initialize(&codec->dev);
74426fbff66eea Robert Jarzmik 2017-09-02  118  	dev_set_name(&codec->dev, "%s:%u", dev_name(ac97_ctrl->parent), idx);
2225a3e6af78e6 Robert Jarzmik 2018-06-22  119  	codec->dev.of_node = ac97_of_get_child_device(ac97_ctrl, idx,
2225a3e6af78e6 Robert Jarzmik 2018-06-22  120  						      vendor_id);
74426fbff66eea Robert Jarzmik 2017-09-02  121  
74426fbff66eea Robert Jarzmik 2017-09-02  122  	ret = device_add(&codec->dev);
607975b30db41a Ding Xiang     2019-07-23  123  	if (ret) {
74426fbff66eea Robert Jarzmik 2017-09-02  124  		put_device(&codec->dev);
74426fbff66eea Robert Jarzmik 2017-09-02  125  		return ret;
74426fbff66eea Robert Jarzmik 2017-09-02  126  	}
74426fbff66eea Robert Jarzmik 2017-09-02  127  
607975b30db41a Ding Xiang     2019-07-23  128  	return 0;
607975b30db41a Ding Xiang     2019-07-23  129  }
607975b30db41a Ding Xiang     2019-07-23  130  

:::::: The code at line 112 was first introduced by commit
:::::: 74426fbff66eea8e8d1f42c8238c268d1e63a832 ALSA: ac97: add an ac97 bus

:::::: TO: Robert Jarzmik <robert.jarzmik@free.fr>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
