Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC16C267729;
	Fri, 14 Feb 2025 17:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739555757; cv=none; b=CyRWXJkUO90R0hnP0ouUMUrebx+eYEIAd73JrqrFzRNxBMNovLJNP8hWiju7q99b0Ci8kHum61EwPCb3cS947967U8FlKYK1TgjLv92ktDi75nWjnJN+eYnginlIGAcVwJy2J3YEk45vSRP+Ze2P8tbh2tElXnGMkAznet+UAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739555757; c=relaxed/simple;
	bh=a3QQFj5HeGSn8NpNzdXrnsf+XZAwJc965qiSwoolv7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SYib28BLm1TriMRgv7vaIZt9GEYLf/ndlKd9sG9EByJjoIvvk61k4I1kG4Omt+jaInIJrA5zW8bGGRK0fSBnP7qzau8Y8ZUmT2dLc4BrTaQXBpQNy81QpdRRp4pFIy3lkOE0Nerq3cEm4OSRX0z+O/TTzqM2j54CocGWuHKGFdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpw2EAun; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpw2EAun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739555755; x=1771091755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3QQFj5HeGSn8NpNzdXrnsf+XZAwJc965qiSwoolv7E=;
  b=gpw2EAunSw50R71gtrD9x3f+jcDYYQrkTk94HHB1osULebrUwxnUmylv
   S4Ua+lqccqmVNZBkIQ2wiaEw+XLAAFj/eZQv9f86GSa90exkPOn8FcsB9
   0rN0hv5aIwqH1pUx1yD0IvUhyFRLFZbS+1YPOpVi7smLcxM5yHz/7lveH
   OmDCXrxe7dZsNmO9OWyNTyhO+LLZrxmdJnNyrg9d0BGrrloHs6VWvK2//
   FrZhqeNLIpOYGqL82ddplpBbd0V9KzHDDNr9feLA+FitubC2M+aofCpyr
   5Oq8C5iYx1X1LcLlSTzUJo2FeQ9/wB3D6nOqtUQwDUhffbzjN4/IU+FwC
   w==;
X-CSE-ConnectionGUID: 7vJ0njisQrmfKyBl32cpZA==
X-CSE-MsgGUID: jxnfoWY7Q6eGsCxYPvmi3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39545138"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="39545138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 09:55:54 -0800
X-CSE-ConnectionGUID: 4OWY9cPuTlanbTUiJES+rg==
X-CSE-MsgGUID: PpO0EMNKS12b0AnV18C7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117644666"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Feb 2025 09:55:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tizuo-0019zZ-2r;
	Fri, 14 Feb 2025 17:55:50 +0000
Date: Sat, 15 Feb 2025 01:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 51/52] sound/usb/qcom/mixer_usb_offload.c:131:3:
 warning: 'sprintf' will always overflow; destination buffer has size 34, but
 format string expands to at least 38
Message-ID: <202502150149.mKpbIR83-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   c26f6731b8da887f1fb92d4654da57a19a266466
commit: b8a7c987d82f97c4a9929a395923e5a2242cdaf5 [51/52] ALSA: usb-audio: qcom: Add USB offload route kcontrol
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502150149.mKpbIR83-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150149.mKpbIR83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150149.mKpbIR83-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/usb/qcom/mixer_usb_offload.c:6:
   In file included from include/linux/usb.h:19:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/usb/qcom/mixer_usb_offload.c:131:3: warning: 'sprintf' will always overflow; destination buffer has size 34, but format string expands to at least 38 [-Wformat-overflow]
     131 |                 sprintf(ctl_name, "USB Offload Playback Card Route PCM#%d",
         |                 ^
   sound/usb/qcom/mixer_usb_offload.c:147:3: warning: 'sprintf' will always overflow; destination buffer has size 34, but format string expands to at least 37 [-Wformat-overflow]
     147 |                 sprintf(ctl_name, "USB Offload Playback PCM Route PCM#%d",
         |                 ^
   5 warnings generated.


vim +/sprintf +131 sound/usb/qcom/mixer_usb_offload.c

   100	
   101	/**
   102	 * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
   103	 * @chip: USB SND chip device
   104	 *
   105	 * Creates a sound control for a USB audio device, so that applications can
   106	 * query for if there is an available USB audio offload path, and which
   107	 * card is managing it.
   108	 */
   109	int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
   110	{
   111		struct usb_device *udev = chip->dev;
   112		struct snd_kcontrol_new *chip_kctl;
   113		struct snd_usb_substream *subs;
   114		struct snd_usb_stream *as;
   115		char ctl_name[34];
   116		int ret;
   117	
   118		list_for_each_entry(as, &chip->pcm_list, list) {
   119			subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
   120			if (!subs->ep_num || as->pcm_index > 0xff)
   121				continue;
   122	
   123			chip_kctl = &snd_usb_offload_mapped_card_ctl;
   124			chip_kctl->count = 1;
   125			/*
   126			 * Store the associated USB SND card number and PCM index for
   127			 * the kctl.
   128			 */
   129			chip_kctl->private_value = as->pcm_index |
   130						  chip->card->number << 16;
 > 131			sprintf(ctl_name, "USB Offload Playback Card Route PCM#%d",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
