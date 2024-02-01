Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02F9157E9E;
	Thu,  1 Feb 2024 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706772252; cv=none; b=llpuPTkxU9n0HaBE2inY3pNZEArcwDvWIaCQYcc38Mto6GkPAD3E46+1g76eck7rF76238gbJ/FhnV0+1ApYCgyVKP+mJKukQetGKXUWAGzLMqQCFhXiV+fYrvoljeGwXbgpwDeWBgOJ+vffWj7nBw7d8Drk76HoMPztdzPPLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706772252; c=relaxed/simple;
	bh=0fL5yaC9W49Cav50sQsma+SuRbX8wW8c61CPpQ02/5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsjK23S9D8b6ivgfFjHJr2AvNds95oAsVJXV+DrVas19XS4efiN1OmZiw1idXHm/+RQUq1ZFrfVVvNp9dReQ4NuIpLmpw1vN+8vxH+e7NGaReb31TOH+OzvTKUpPWBDRDlPuXasdaNrYkIa595fQfRt0ujTDbxYTtdedFG9BjGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNK0yQiR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNK0yQiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706772251; x=1738308251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fL5yaC9W49Cav50sQsma+SuRbX8wW8c61CPpQ02/5o=;
  b=NNK0yQiRuaX/1figt3ZBScv07SiLqFveBT5d7WIV9iZp0X13YyXpB7d/
   HFaaVEWoHHu64w3vBNK5/gtHpW7vnBW219QYpsml3wwRtUhp3s3musxjJ
   DbygnCiLifWmbzKrNgcNteJtDQHlKryNYIclxNO30mw5Tiu9uD/pqHCm9
   TPx2TCxm03BCK9o4G0hTvw+JxfRRxCVb+E9s6bRKfnhzlKwj+59+xA+Rp
   jy9fcogN73iFyonsbK4LeAmEN1f21soBAYLmXYhqPsQXS44DxA3MZZKf3
   G8ZMq5etPQfbblgBVPjwge41BDKgxH/QzCxo02JmaZ0dpNtKtj0MOuqQ2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10586417"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="10586417"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 23:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="932103724"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="932103724"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2024 23:24:08 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVRQa-0002WI-19;
	Thu, 01 Feb 2024 07:24:04 +0000
Date: Thu, 1 Feb 2024 15:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 2573/3381] ld.lld: error: undefined symbol:
 snd_pcm_format_physical_width
Message-ID: <202402011519.RwyEbkrS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   51b70ff55ed88edd19b080a524063446bcc34b62
commit: 3e39acf56ededdebd1033349a16b704839b94b28 [2573/3381] ALSA: core: Add sound core KUnit test
config: hexagon-randconfig-r015-20220417 (https://download.01.org/0day-ci/archive/20240201/202402011519.RwyEbkrS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402011519.RwyEbkrS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402011519.RwyEbkrS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: snd_pcm_format_physical_width
   >>> referenced by sound_kunit.c:102 (sound/core/sound_kunit.c:102)
   >>>               sound/core/sound_kunit.o:(test_phys_format_size) in archive vmlinux.a
   >>> referenced by sound_kunit.c:102 (sound/core/sound_kunit.c:102)
   >>>               sound/core/sound_kunit.o:(test_phys_format_size) in archive vmlinux.a
   >>> referenced by sound_kunit.c:102 (sound/core/sound_kunit.c:102)
   >>>               sound/core/sound_kunit.o:(test_phys_format_size) in archive vmlinux.a
   >>> referenced 13 more times
--
>> ld.lld: error: undefined symbol: snd_pcm_format_width
   >>> referenced by sound_kunit.c:115 (sound/core/sound_kunit.c:115)
   >>>               sound/core/sound_kunit.o:(test_format_width) in archive vmlinux.a
   >>> referenced by sound_kunit.c:115 (sound/core/sound_kunit.c:115)
   >>>               sound/core/sound_kunit.o:(test_format_width) in archive vmlinux.a
   >>> referenced by sound_kunit.c:115 (sound/core/sound_kunit.c:115)
   >>>               sound/core/sound_kunit.o:(test_format_width) in archive vmlinux.a
   >>> referenced 17 more times
--
>> ld.lld: error: undefined symbol: snd_pcm_format_little_endian
   >>> referenced by sound_kunit.c:143 (sound/core/sound_kunit.c:143)
   >>>               sound/core/sound_kunit.o:(test_format_endianness) in archive vmlinux.a
   >>> referenced by sound_kunit.c:143 (sound/core/sound_kunit.c:143)
   >>>               sound/core/sound_kunit.o:(test_format_endianness) in archive vmlinux.a
   >>> referenced by sound_kunit.c:143 (sound/core/sound_kunit.c:143)
   >>>               sound/core/sound_kunit.o:(test_format_endianness) in archive vmlinux.a
   >>> referenced 7 more times
--
>> ld.lld: error: undefined symbol: snd_pcm_format_big_endian
   >>> referenced by sound_kunit.c:145 (sound/core/sound_kunit.c:145)
   >>>               sound/core/sound_kunit.o:(test_format_endianness) in archive vmlinux.a
   >>> referenced by sound_kunit.c:145 (sound/core/sound_kunit.c:145)
   >>>               sound/core/sound_kunit.o:(test_format_endianness) in archive vmlinux.a
   >>> referenced by sound_kunit.c:145 (sound/core/sound_kunit.c:145)
   >>>               sound/core/sound_kunit.o:(test_format_endianness) in archive vmlinux.a
   >>> referenced 7 more times
--
>> ld.lld: error: undefined symbol: snd_pcm_format_signed
   >>> referenced by sound_kunit.c:128 (sound/core/sound_kunit.c:128)
   >>>               sound/core/sound_kunit.o:(test_format_signed) in archive vmlinux.a
   >>> referenced by sound_kunit.c:128 (sound/core/sound_kunit.c:128)
   >>>               sound/core/sound_kunit.o:(test_format_signed) in archive vmlinux.a
   >>> referenced by sound_kunit.c:128 (sound/core/sound_kunit.c:128)
   >>>               sound/core/sound_kunit.o:(test_format_signed) in archive vmlinux.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: snd_pcm_format_unsigned
   >>> referenced by sound_kunit.c:130 (sound/core/sound_kunit.c:130)
   >>>               sound/core/sound_kunit.o:(test_format_signed) in archive vmlinux.a
   >>> referenced by sound_kunit.c:130 (sound/core/sound_kunit.c:130)
   >>>               sound/core/sound_kunit.o:(test_format_signed) in archive vmlinux.a
   >>> referenced by sound_kunit.c:130 (sound/core/sound_kunit.c:130)
   >>>               sound/core/sound_kunit.o:(test_format_signed) in archive vmlinux.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: snd_pcm_format_set_silence
   >>> referenced by sound_kunit.c:161 (sound/core/sound_kunit.c:161)
   >>>               sound/core/sound_kunit.o:(test_format_fill_silence) in archive vmlinux.a
   >>> referenced by sound_kunit.c:161 (sound/core/sound_kunit.c:161)
   >>>               sound/core/sound_kunit.o:(test_format_fill_silence) in archive vmlinux.a
   >>> referenced by sound_kunit.c:179 (sound/core/sound_kunit.c:179)
   >>>               sound/core/sound_kunit.o:(test_format_fill_silence) in archive vmlinux.a
   >>> referenced 3 more times
--
>> ld.lld: error: undefined symbol: snd_pcm_format_name
   >>> referenced by sound_kunit.c:269 (sound/core/sound_kunit.c:269)
   >>>               sound/core/sound_kunit.o:(test_pcm_format_name) in archive vmlinux.a
   >>> referenced by sound_kunit.c:269 (sound/core/sound_kunit.c:269)
   >>>               sound/core/sound_kunit.o:(test_pcm_format_name) in archive vmlinux.a
   >>> referenced by sound_kunit.c:269 (sound/core/sound_kunit.c:269)
   >>>               sound/core/sound_kunit.o:(test_pcm_format_name) in archive vmlinux.a
   >>> referenced 9 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
