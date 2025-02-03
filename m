Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A9A25A622;
	Mon,  3 Feb 2025 04:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738557933; cv=none; b=pK0RC8i51kmSveC1LAELc9ArPuT7yoQo7b/sWMucQ0IqVk8W1M0ka6BeJjkJtmOPG6nuRe2Nb9Blneej6Emn3PvqP9PX4UTV0R6enu8pZ2WkXyszqAK1DDMEYHkO1lFZQuye4M1F5mqdolMEqtbxTG6/jGU4USd/Uu8+C+mf4Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738557933; c=relaxed/simple;
	bh=o40gREE9z3FJUocIF2EdhBdxl+ZmK7G05szDFss8YWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qeedqKPaXF7wQTmeyUmVxX/M+Y5peQGruF8O1OgpTahgdf/4RGYRYxcjWZCUatS2vl5843tjlFePMhDhi3m70kRYzkc38UEcBWM9jNmmw2HIpPqG7dMVulsRE5RIp9JSdHYl5WMGCpu6UO1VcNxef8yirmznQYesKadfCaalB+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/JZbLDR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/JZbLDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738557931; x=1770093931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o40gREE9z3FJUocIF2EdhBdxl+ZmK7G05szDFss8YWk=;
  b=R/JZbLDR2z1P6xdBGl5o09kzwF2yq4zQhDbWTfOsewttIAoDLW6HJqjk
   VJnNRIPBNQxKP1ypYja7SiJLqcoMjibuK/0/PwsLl0ZLQeG4tRbDUXU53
   N2L04Ydjpsdry1whMUFHJFVxB5pmzfJaWxfDgJD5S2Pg6/oIQ2BPUKfls
   7aQWzgsu7GpGgs1Mm+LqKq7GRTFWBjZ1I3Vd7CL8y9G67M2DHNA1q3hNb
   p3O3HnI5JL0bRfKwMzUIA49C79OiL3RSErxJ+ySFr9cmKmSYinPdpTTVm
   NSKOklpTJamin1sG3UI0HKl3V1sbhW8So2AmI3PeKUNnwvEt2m3sOc+mR
   w==;
X-CSE-ConnectionGUID: zxR3QWiFTtyfbI/8dC8KsQ==
X-CSE-MsgGUID: CxDsFES9ScKfvL9AMmyb/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39195737"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39195737"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 20:45:30 -0800
X-CSE-ConnectionGUID: P1BSQmfEQWWTYGHOFsSQaw==
X-CSE-MsgGUID: dZoiY73ESfa5+1aleAZ8bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111046062"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Feb 2025 20:45:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teoKs-000qUl-26;
	Mon, 03 Feb 2025 04:45:26 +0000
Date: Mon, 3 Feb 2025 12:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sheetal <sheetal@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileaMnh6H 1/9] sound/soc/tegra/tegra_isomgr_bw.c:44:37:
 warning: variable 'pcm_id' is uninitialized when used here
Message-ID: <202502031243.4biWFdNQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileaMnh6H
head:   500aea53057a952d584cbe1fa461c7adaaa9f655
commit: 0ecef4e6d1d8e542df8eab71d4aa782bb8ae84e9 [1/9] ASoC: tegra: Add interconnect support
config: arm-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031243.4biWFdNQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031243.4biWFdNQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031243.4biWFdNQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/tegra/tegra_isomgr_bw.c:44:37: warning: variable 'pcm_id' is uninitialized when used here [-Wuninitialized]
      44 |         if ((adma_isomgr->bw_per_dev[type][pcm_id] && is_running) ||
         |                                            ^~~~~~
   sound/soc/tegra/tegra_isomgr_bw.c:25:53: note: initialize the variable 'pcm_id' to silence this warning
      25 |         u32 type = substream->stream, bandwidth = 0, pcm_id;
         |                                                            ^
         |                                                             = 0
   1 warning generated.


vim +/pcm_id +44 sound/soc/tegra/tegra_isomgr_bw.c

    16	
    17	int tegra_isomgr_adma_setbw(struct snd_pcm_substream *substream,
    18				    struct snd_soc_dai *dai, bool is_running)
    19	{
    20		struct device *dev = dai->dev;
    21		struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
    22		struct tegra_adma_isomgr *adma_isomgr = admaif->adma_isomgr;
    23		struct snd_pcm_runtime *runtime = substream->runtime;
    24		struct snd_pcm *pcm = substream->pcm;
    25		u32 type = substream->stream, bandwidth = 0, pcm_id;
    26		int sample_bytes;
    27	
    28		if (!adma_isomgr)
    29			return 0;
    30	
    31		if (!runtime || !pcm)
    32			return -EINVAL;
    33	
    34		if (pcm->device >= adma_isomgr->max_pcm_device) {
    35			dev_err(dev, "%s: PCM device number %d is greater than %d\n", __func__,
    36				pcm->device, adma_isomgr->max_pcm_device);
    37			return -EINVAL;
    38		}
    39	
    40		/*
    41		 * No action if  stream is running and bandwidth is already set or
    42		 * stream is not running and bandwidth is already reset
    43		 */
  > 44		if ((adma_isomgr->bw_per_dev[type][pcm_id] && is_running) ||
    45		    (!adma_isomgr->bw_per_dev[type][pcm_id] && !is_running))
    46			return 0;
    47	
    48		if (is_running) {
    49			sample_bytes = snd_pcm_format_width(runtime->format) / 8;
    50			if (sample_bytes < 0)
    51				return sample_bytes;
    52	
    53			/* KB/s kilo bytes per sec */
    54			bandwidth = runtime->channels * (runtime->rate / 1000) *
    55					sample_bytes;
    56		}
    57	
    58		mutex_lock(&adma_isomgr->mutex);
    59	
    60		if (is_running) {
    61			if (bandwidth + adma_isomgr->current_bandwidth > adma_isomgr->max_bw)
    62				bandwidth = adma_isomgr->max_bw - adma_isomgr->current_bandwidth;
    63	
    64			adma_isomgr->current_bandwidth += bandwidth;
    65		} else {
    66			adma_isomgr->current_bandwidth -= adma_isomgr->bw_per_dev[type][pcm_id];
    67		}
    68	
    69		mutex_unlock(&adma_isomgr->mutex);
    70	
    71		adma_isomgr->bw_per_dev[type][pcm_id] = bandwidth;
    72	
    73		dev_dbg(dev, "Setting up bandwidth to %d KBps\n", adma_isomgr->current_bandwidth);
    74	
    75		return icc_set_bw(adma_isomgr->icc_path_handle,
    76				  adma_isomgr->current_bandwidth, adma_isomgr->max_bw);
    77	}
    78	EXPORT_SYMBOL(tegra_isomgr_adma_setbw);
    79	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
