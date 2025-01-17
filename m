Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C466B8C11;
	Fri, 17 Jan 2025 04:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737088187; cv=none; b=KN9vZ2NV2kRN5cD7FkWGZJfcaLByL6odtKfUO7Cgdr7PPYzOtBoCJ0bXD8MV4GSEjm82DbL1FHBy0k9RpOQviawhgIOwIRj3dl1xBGcQHy6PQPdeufh1eGnxB9GL+aGwebNbbj54jmmG8Sx3aL0tQfYdjrccz+Dz87rosS4S3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737088187; c=relaxed/simple;
	bh=e7grCUa5RPLwryiaep5Bboq4EyWATbbIu7AULWuGyDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZprI0RgC0nxKdGZbO/brs255v5PRtNYaG+2sYJR//EqxYtsbEif3O4iIJi49oCjnzqp84F6XhkHjxBrCJrhul2FevRQDEsE5kqODIvhCrkFLeywWm+1RqQvW2/YOyAxy9Ga7pTbC2Ocru3nSYi1U0WgF8/s9g3gh90luZyCXgRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2zsc7O+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2zsc7O+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737088185; x=1768624185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e7grCUa5RPLwryiaep5Bboq4EyWATbbIu7AULWuGyDQ=;
  b=d2zsc7O+48L0nAB4XQ3xsYma9sMgpOm1dus+85XlAs1u/MtN0sO/1xGh
   vWw2XC0wZQsScT3bwQNLUPsIdkKmgwTCNsGuIVUdj4f+4tFZtwyy0fsUs
   ZtqW9F0+UeGNZkbNf9FHOxw9aYSNKRM+RHBBoIwYI16/jTgxmWDqCO6PT
   iOVOrGY2LSVS2Cm9O85+DgrMZBbUKsjONuQhdfAb/h2Hrx+75su3HBqy/
   b2IKj3cTmvEPz5ddCiL3ZZ+499AcaMSgOc87ikRPMhaQmNaSqrPltTAP4
   OZx9qodit4qPWXtPMV0QxRYcgmhLDhUw5FNyR2xfrJLPsi42nVvjG5hnG
   w==;
X-CSE-ConnectionGUID: noOifuQfQvKtX0jyLyycng==
X-CSE-MsgGUID: xsLHqNzLRpGb8md7tyciEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37200808"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37200808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 20:29:45 -0800
X-CSE-ConnectionGUID: bqiafdS2TciUamcVjDPQPA==
X-CSE-MsgGUID: iJNdnIZTSBe5s+uRkXPu/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="110687167"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 16 Jan 2025 20:29:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYdzK-000SkZ-0H;
	Fri, 17 Jan 2025 04:29:42 +0000
Date: Fri, 17 Jan 2025 12:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-01-16-2 5/23]
 sound/soc/generic/simple-card-utils.c:163:3: error: cannot jump from this
 goto statement to its label
Message-ID: <202501171254.lIYnYUBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-01-16-2
head:   e3977d58d39b9fd3d4f04615aa580d4fa702aa0e
commit: 4c4c651f7d815de29d5f68a918ca6deda49fcd84 [5/23] ASoC: simple-card-utils: use snd_soc_ret()
config: i386-randconfig-013-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171254.lIYnYUBA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171254.lIYnYUBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171254.lIYnYUBA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/generic/simple-card-utils.c:163:3: error: cannot jump from this goto statement to its label
     163 |                 goto end;
         |                 ^
   sound/soc/generic/simple-card-utils.c:165:7: note: jump bypasses initialization of variable with __attribute__((cleanup))
     165 |         u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
         |              ^
   sound/soc/generic/simple-card-utils.c:157:3: error: cannot jump from this goto statement to its label
     157 |                 goto end;
         |                 ^
   sound/soc/generic/simple-card-utils.c:165:7: note: jump bypasses initialization of variable with __attribute__((cleanup))
     165 |         u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
         |              ^
   2 errors generated.


vim +163 sound/soc/generic/simple-card-utils.c

   142	
   143	int simple_util_parse_tdm_width_map(struct simple_util_priv *priv, struct device_node *np,
   144					    struct simple_util_dai *dai)
   145	{
   146		struct device *dev = simple_priv_to_dev(priv);
   147		int n, i, ret;
   148		u32 *p;
   149	
   150		n = of_property_count_elems_of_size(np, "dai-tdm-slot-width-map", sizeof(u32));
   151		if (n <= 0)
   152			return 0;
   153	
   154		if (n % 3) {
   155			dev_err(dev, "Invalid number of cells for dai-tdm-slot-width-map\n");
   156			ret = -EINVAL;
   157			goto end;
   158		}
   159	
   160		ret = -ENOMEM;
   161		dai->tdm_width_map = devm_kcalloc(dev, n, sizeof(*dai->tdm_width_map), GFP_KERNEL);
   162		if (!dai->tdm_width_map)
 > 163			goto end;
   164	
   165		u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
   166		if (!array_values)
   167			goto end;
   168	
   169		ret = of_property_read_u32_array(np, "dai-tdm-slot-width-map", array_values, n);
   170		if (ret < 0) {
   171			dev_err(dev, "Could not read dai-tdm-slot-width-map: %d\n", ret);
   172			goto end;
   173		}
   174	
   175		p = array_values;
   176		for (i = 0; i < n / 3; ++i) {
   177			dai->tdm_width_map[i].sample_bits = *p++;
   178			dai->tdm_width_map[i].slot_width = *p++;
   179			dai->tdm_width_map[i].slot_count = *p++;
   180		}
   181	
   182		dai->n_tdm_widths = i;
   183		ret = 0;
   184	end:
   185		return simple_ret(priv, ret);
   186	}
   187	EXPORT_SYMBOL_GPL(simple_util_parse_tdm_width_map);
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
