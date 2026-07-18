Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352DF5733E;
	Sat, 18 Jul 2026 18:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784397730; cv=none; b=N9i8R152ifLj+1ZgUz+0qL8Mm8tR1+rcXaJoicIhOd5BTF6qMYxyoc16bntTzFY2RWEVBbSUauv0T6oneRlqH6gC+eZNdpB4R0tQkDoF9XIzt8VJmEnXgX/IC+/L7i1kDA9nG0lA6M8bOSF0G2Bf6+SwAx3DVXwJt2LPbjNvlO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784397730; c=relaxed/simple;
	bh=o/xkKb0m/JCUhkiHXdam6Z0euffWWFHrB9pqjW/IOgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q1dVZu7Bssbdcg63M93ivUN6/jfEDRWU/oE+WGuYQmtBljuMls6p/8zZTwiykwPIdnMZnuffatbx+TIeeAorEvGfkar1H+/XUu1fKl5NwNKOZ/3F4VfWQFPmH5r2d/xxeG1S8TChfqkRgJbgVO/2fkaiG2lt+x2UFO5iQsCuSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRFK79X0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRFK79X0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784397728; x=1815933728;
  h=date:from:to:cc:subject:message-id;
  bh=o/xkKb0m/JCUhkiHXdam6Z0euffWWFHrB9pqjW/IOgE=;
  b=eRFK79X0hDIfcwTqtI/8OSp1++SZVRHfgvMzi7SR1KOi68wfTcvsJyXB
   7TDWHXCxVgQHPNYHR9h0AuT2GVNSzHll2c2UGFOE13twTV5Tbi5aM5m+b
   JW85SDSFHf31kHWafK79QHB5xHfQNeJp3cp839nVihPTP60C0Mebj5fMP
   /mPqlWdTXB15uPuATQELWg0fW30RkOgrneuUzRQ+0/CeGXQzhR0vtIEDr
   Bc3FLytk8zYkn5IoCSRw6xoIB3y6kN2tGfTuwuYAbwkVgKt0JodAOWqTy
   43NCttZxWuxLDTMhbGEaIMAQ3JamLssQVudgcV/wfPH3RAiBXiize8N24
   w==;
X-CSE-ConnectionGUID: ggjAFf8ORIuuqSzaQo02Yw==
X-CSE-MsgGUID: far5ddhvRdiBkDk/Iql2Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="95685645"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="95685645"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 11:02:08 -0700
X-CSE-ConnectionGUID: a8HcneO3R2WC8JMOytukbA==
X-CSE-MsgGUID: s39WojjVSaaxtkLOAxT53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="281528189"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2026 11:02:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl9MR-00000000Uzi-3XX5;
	Sat, 18 Jul 2026 18:02:03 +0000
Date: Sun, 19 Jul 2026 02:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-07-17-2 301/301]
 sound/soc/codecs/wm_adsp_fw_find_test.c:280:48: warning: variable 'test_dev'
 is uninitialized when used here
Message-ID: <202607190112.eofUgdqV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-17-2
head:   0031be0dff2c86cbb204c3d1bb5ee9797cb9cb53
commit: 9c663d9f6ce80b79e42d5b9ae67b3f980bfceaa0 [301/301] ASoC: add test-hack method
config: i386-randconfig-007-20260718 (https://download.01.org/0day-ci/archive/20260719/202607190112.eofUgdqV-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190112.eofUgdqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190112.eofUgdqV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wm_adsp_fw_find_test.c:280:48: warning: variable 'test_dev' is uninitialized when used here [-Wuninitialized]
     280 |         priv->dsp.component = snd_soc_component_alloc(test_dev);
         |                                                       ^~~~~~~~
   sound/soc/codecs/wm_adsp_fw_find_test.c:272:25: note: initialize the variable 'test_dev' to silence this warning
     272 |         struct device *test_dev;
         |                                ^
         |                                 = NULL
   1 warning generated.


vim +/test_dev +280 sound/soc/codecs/wm_adsp_fw_find_test.c

   268	
   269	static int wm_adsp_fw_find_test_case_init(struct kunit *test)
   270	{
   271		struct wm_adsp_fw_find_test *priv;
   272		struct device *test_dev;
   273		int ret;
   274	
   275		priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
   276		if (!priv)
   277			return -ENOMEM;
   278	
   279		/* Require dummy struct snd_soc_component for the alsa name prefix string */
 > 280		priv->dsp.component = snd_soc_component_alloc(test_dev);
   281		if (!priv->dsp.component)
   282			return -ENOMEM;
   283	
   284		test->priv = priv;
   285	
   286		/* Create dummy amp device */
   287		test_dev = kunit_device_register(test, "wm_adsp_test_drv");
   288		if (IS_ERR(test_dev))
   289			return PTR_ERR(test_dev);
   290	
   291		priv->dsp.cs_dsp.dev = get_device(test_dev);
   292		if (!priv->dsp.cs_dsp.dev)
   293			return -ENODEV;
   294	
   295		ret = kunit_add_action_or_reset(test, _put_device_wrapper, priv->dsp.cs_dsp.dev);
   296		if (ret)
   297			return ret;
   298	
   299		return 0;
   300	}
   301	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
