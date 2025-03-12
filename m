Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910BB22E402;
	Wed, 12 Mar 2025 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741772966; cv=none; b=OjO4uswo9sGv9LkfqcB1ZBkc58QHCASIOq9gKK7lfyVNNaots1YEtLyC+/vvr4b4Yy36l2g7k/7brxmp/idQo9LE7CFrYUkDBaKr2DPLN6DfWJdeC8LYVM7uIDPPj4QP6yj2MM1bJxFRYbM9T8rZDUy0CTXCSPZ6JnpsCyFrQlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741772966; c=relaxed/simple;
	bh=6cIHaf8n2MGHfB7HUZRwa6dWKZUQtMPxrG91sLvolaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADx6F+1SbI8yRcRk4pH+HRVJNKCQQDPJPCFw4WrdKF+MG39ANJC260sdGcHxtUvAiqd6T2DPZya3RwrRhoD0MpYexvFfI/pKjslfnqxnV2xj4S+sXTNqBL08mbZ9IImerqXalrZd6O8gCxtLt7tgSAhqyleHQleJZhuMN0soTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGtS75gG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGtS75gG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741772964; x=1773308964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6cIHaf8n2MGHfB7HUZRwa6dWKZUQtMPxrG91sLvolaQ=;
  b=QGtS75gGnGKqBoPPTPNlA2PKbQWNRpQkpi8Bc5eTcODuEzhKkDD5F6sH
   Txd9Cshy6jPhInRGaoUGPnPhaAf42+DBeoBTT0h6U+6cLYf9IJlOV4d5G
   nyLF8FKOiGQipCNW8aqmZv6YAf26EHgdS1clrbHHwXrV2chKqzjR7czqH
   TE5oh09JKEvD5DpCY2CFYdZsP8Aa+AMDD6dEMWSJQw7iAUf78p0npq6Lp
   pT8YWO3cm35RIOvtg4DkSEIr3AzaDgFjlh5aSf+QE7kztfBf3v+PW7Phk
   /8AgOIjfwwM7sUHv3tS2hqtLUFFIz9KpXkvF0sm0Xu2LJtxSFGTzWlAFA
   w==;
X-CSE-ConnectionGUID: ghSM+YwKRLuGrL+Xnpuxww==
X-CSE-MsgGUID: OSJIusNnSvCokvDSBQTUVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42951172"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42951172"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:49:23 -0700
X-CSE-ConnectionGUID: us/AYu5WTfS4nrwQiL8e7Q==
X-CSE-MsgGUID: EFM2kq5NRk2eQKDhrnyU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="125651018"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2025 02:49:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsIiF-0008M9-1Q;
	Wed, 12 Mar 2025 09:49:19 +0000
Date: Wed, 12 Mar 2025 17:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-03-10 38/38]
 sound/soc/soc-core.c:2895:94: error: 'name' undeclared
Message-ID: <202503121707.7uy59yhb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-03-10
head:   3cd5211f02160f7e5270a6beef85b045e9e59acb
commit: 3cd5211f02160f7e5270a6beef85b045e9e59acb [38/38] ASoC: soc-core: merge snd_soc_unregister_component() and snd_soc_unregister_component_by_driver()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250312/202503121707.7uy59yhb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121707.7uy59yhb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121707.7uy59yhb-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-core.c: In function 'snd_soc_unregister_component_by_driver':
>> sound/soc/soc-core.c:2895:94: error: 'name' undeclared (first use in this function)
    2895 |                 struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, name);
         |                                                                                              ^~~~
   sound/soc/soc-core.c:2895:94: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/soc-core.c:2888:21: warning: variable 'driver_name' set but not used [-Wunused-but-set-variable]
    2888 |         const char *driver_name = NULL;
         |                     ^~~~~~~~~~~


vim +/name +2895 sound/soc/soc-core.c

  2877	
  2878	/**
  2879	 * snd_soc_unregister_component_by_driver - Unregister component using a given driver
  2880	 * from the ASoC core
  2881	 *
  2882	 * @dev: The device to unregister
  2883	 * @component_driver: The component driver to unregister
  2884	 */
  2885	void snd_soc_unregister_component_by_driver(struct device *dev,
  2886						    const struct snd_soc_component_driver *component_driver)
  2887	{
  2888		const char *driver_name = NULL;
  2889	
  2890		if (component_driver)
  2891			driver_name = component_driver->name;
  2892	
  2893		mutex_lock(&client_mutex);
  2894		while (1) {
> 2895			struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, name);
  2896	
  2897			if (!component)
  2898				break;
  2899	
  2900			snd_soc_del_component_unlocked(component);
  2901		}
  2902		mutex_unlock(&client_mutex);
  2903	}
  2904	EXPORT_SYMBOL_GPL(snd_soc_unregister_component_by_driver);
  2905	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
