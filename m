Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA05158A3C;
	Fri,  3 May 2024 19:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714764292; cv=none; b=nQCyvmJDOJfjuVulHByQIs//Y0/poazQKeNNIKbj4n+ScjqJkX37NfUNzdEWvBu34c/vf+UC26Y3r1+0SiYJGY6CgC8kbVn7/LQY9j1+e0fSqRYT4NwQHWBKPzhVI9nzduLvGNnq8u4M9nCZ45nAkObTAIRphCZZUCCv/JVd1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714764292; c=relaxed/simple;
	bh=J74U89n7Ds/frvyh5tqzsoNGG9T/gBtCYwTk1HZs67U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPwFGZz7LyFi6s8ICy76Rw/SQZLLRSFaguekzVKdaBtogLSaANsCsVnPHwk6nzgf1bNfvUYXyhYBTOoV+3zMxjNySHuAP6D8LDKcUWP94HOLOpYe30Jga5Tj8YLyQqsOcAj1CTgTa7AFMk4MuHmNHy7hNu/kmvkVQa2vCEqUKtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PboJNIan; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PboJNIan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714764290; x=1746300290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J74U89n7Ds/frvyh5tqzsoNGG9T/gBtCYwTk1HZs67U=;
  b=PboJNIanhMj8CE0nZEANs3JDiVgdKImJ5XLxiXmtya62OecsC2tG2wH4
   EK16FtYmtg5pqBlA/zVvfHxLe+lC0Xo2Rr+RGJjyu2jG3DuStDIo5zovT
   HKXZi752pYd3i37fUBcRjIs5dCisdYyBsmClQT/pKZNrxbutFAxcxZDu4
   7fkUrgaiJwVBu3PgxVaErp7roHwRYwKfBX/diGPDTfyod/0hfLxUJyJg0
   O1my5haC14YcV+uWpn70UznlO8eQJHNmL5M+nEYyxYcjbMnZ0Gs1pr5Cv
   Xt9P+UpLwoVd3IcTnRBuJAg0boSWdUy6oDpkM0grmF0+dMLWwszTcWSx8
   w==;
X-CSE-ConnectionGUID: eMAGQYXjSoSNn2eUUYH52g==
X-CSE-MsgGUID: t+G25Y/3Rp2Ge/PuGTtLhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10432516"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10432516"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 12:24:50 -0700
X-CSE-ConnectionGUID: qGnOMDzfTTmJUm7G9CyB6w==
X-CSE-MsgGUID: tzEGLkq3Rq+WXUsClmUCig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="64975668"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 May 2024 12:24:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2yWU-000C2q-0a;
	Fri, 03 May 2024 19:24:46 +0000
Date: Sat, 4 May 2024 03:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/200-dcp 200/210]
 drivers/gpu/drm/apple/audio.c:413:6: warning: variable 'ret' set but not
 used
Message-ID: <202405040317.xJ6Ar8ue-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   38ae67fe4628d642a9dc626b9ba75bb2ac4bd701
commit: 35a895171434f74b9b12efa9c7c3251983586bde [200/210] gpu: drm: apple: Add DCP audio driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240504/202405040317.xJ6Ar8ue-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040317.xJ6Ar8ue-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040317.xJ6Ar8ue-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/apple/audio.c:16:
   In file included from include/linux/of_dma.h:14:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/apple/audio.c:207:16: error: call to undeclared function 'snd_interval_rate_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |         return snd_interval_rate_bits(r, hits.rates);
         |                ^
>> drivers/gpu/drm/apple/audio.c:413:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     413 |         int ret;
         |             ^
   6 warnings and 1 error generated.


vim +/ret +413 drivers/gpu/drm/apple/audio.c

   407	
   408	
   409	static int dcpaud_create_chmap_ctl(struct dcp_audio *dcpaud)
   410	{
   411		struct snd_pcm *pcm = dcpaud->substream->pcm;
   412		struct snd_pcm_chmap *chmap_info;
 > 413		int ret;
   414	
   415		ret = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK, NULL,
   416					     dcp_pcm_hw.channels_max, 0, &chmap_info);
   417	
   418		chmap_info->kctl->get = dcpaud_chmap_ctl_get;
   419		chmap_info->chmap = hdmi_codec_8ch_chmaps;
   420		chmap_info->private_data = dcpaud;
   421	
   422		return 0;
   423	}
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
