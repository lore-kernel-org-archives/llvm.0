Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB308107A9;
	Sun, 14 Jul 2024 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720937167; cv=none; b=ufWZ98SjDaKe6u3J+G018T9ybMwvXpIV3sNT09Q+WL7MPS2p5Bz6RijoznWoLD3zT2O4Ae+jV76shRp/CU9eoepEmC6d+EYXsDwAuL3HI63cI0GDscoruw1h7p69JOcBXlnsAk0TOIYAD6UuSrarmlimTT0LURb++I76dH3Sp7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720937167; c=relaxed/simple;
	bh=Fbpi7tJia4mAM0GyaDcucp8NWrNKWHc8yr78peDMe+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWXdMNIBvamsb47p292waByS77FI/8Ahzkv/7WgyDqBnF1DlhYNhL/9NMGNTOwRai7ib2bd2jHBXtvxOf11cDTDgiqktssqL6Yis0DYlTfJlrdBEDuw3on+z2Sb5LlMvHx69/Skzu66LX/DOroPyUYScGeMPpf2wU4hwS17ZIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4FPlZi4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4FPlZi4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720937165; x=1752473165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fbpi7tJia4mAM0GyaDcucp8NWrNKWHc8yr78peDMe+8=;
  b=n4FPlZi4YmABavHSQ3nU5YHXRLdpOEDPJmEp4kzNarJ1q6sj8isN2LBU
   gtNfm0BpKbFpJaAsF6tjTicgQNJ713U32Gfs2DIpaYWAcGESWG7PyedR0
   Z4KVGaxer0ke+ISUpEGuvYTU76IJW6O0e07Uxyy6tzs8ic4iB6bGxUlxJ
   YDQAi97MNXQepI1cLNmy9zTMP7NClF41ChxMFvSddtA6zzgZojOYgPdRg
   dgd0msk9lkoeppJ7IriD+QbHhb/Fyb1RCSqeoBJCLrvMKoHsqA6E3UZQN
   IOuxTAOC/kVhhvkQeMhsqYnO2SXX0I9mfpIq5jrs+jwuEa8QBzv6fh9qM
   Q==;
X-CSE-ConnectionGUID: e9Wxeb/zTwmMS1PBtDxrfw==
X-CSE-MsgGUID: M02dx+/vT/GrrbmyCeo1kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="35878765"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="35878765"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 23:06:04 -0700
X-CSE-ConnectionGUID: r+QG4RWyQZ2ro0C9hEPqIQ==
X-CSE-MsgGUID: 7a0KZwmGQOSe6ic1luFR/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; 
   d="scan'208";a="80387807"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2024 23:06:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSsMy-000d94-2s;
	Sun, 14 Jul 2024 06:06:00 +0000
Date: Sun, 14 Jul 2024 14:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2032/12880]
 drivers/gpu/drm/sti/sti_plane.h:32:28: error: bitwise operation between
 different enumeration types ('enum sti_plane_type' and 'enum
 sti_plane_id_of_type')
Message-ID: <202407141328.FvzzbIHF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a [2032/12880] drm/sti: Allow build with COMPILE_TEST=y
config: arm-randconfig-001-20240714 (https://download.01.org/0day-ci/archive/20240714/202407141328.FvzzbIHF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240714/202407141328.FvzzbIHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407141328.FvzzbIHF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/sti/sti_hqvdp.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/sti/sti_hqvdp.c:24:
   In file included from drivers/gpu/drm/sti/sti_compositor.h:15:
   In file included from drivers/gpu/drm/sti/sti_mixer.h:17:
>> drivers/gpu/drm/sti/sti_plane.h:32:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
      32 |         STI_GDP_0       = STI_GDP | STI_ID_0,
         |                           ~~~~~~~ ^ ~~~~~~~~
   drivers/gpu/drm/sti/sti_plane.h:33:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
      33 |         STI_GDP_1       = STI_GDP | STI_ID_1,
         |                           ~~~~~~~ ^ ~~~~~~~~
   drivers/gpu/drm/sti/sti_plane.h:34:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
      34 |         STI_GDP_2       = STI_GDP | STI_ID_2,
         |                           ~~~~~~~ ^ ~~~~~~~~
   drivers/gpu/drm/sti/sti_plane.h:35:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
      35 |         STI_GDP_3       = STI_GDP | STI_ID_3,
         |                           ~~~~~~~ ^ ~~~~~~~~
   drivers/gpu/drm/sti/sti_plane.h:36:28: error: bitwise operation between different enumeration types ('enum sti_plane_type' and 'enum sti_plane_id_of_type') [-Werror,-Wenum-enum-conversion]
      36 |         STI_HQVDP_0     = STI_VDP | STI_ID_0,
         |                           ~~~~~~~ ^ ~~~~~~~~
   6 errors generated.


vim +32 drivers/gpu/drm/sti/sti_plane.h

871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  30  
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  31  enum sti_plane_desc {
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31 @32  	STI_GDP_0       = STI_GDP | STI_ID_0,
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  33  	STI_GDP_1       = STI_GDP | STI_ID_1,
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  34  	STI_GDP_2       = STI_GDP | STI_ID_2,
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  35  	STI_GDP_3       = STI_GDP | STI_ID_3,
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  36  	STI_HQVDP_0     = STI_VDP | STI_ID_0,
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  37  	STI_CURSOR      = STI_CUR,
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  38  	STI_BACK        = STI_BCK
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  39  };
871bcdfea68560 drivers/gpu/drm/sti/sti_drm_plane.h Vincent Abriou 2015-07-31  40  

:::::: The code at line 32 was first introduced by commit
:::::: 871bcdfea68560991bd650406e47a801ab9d635d drm/sti: code clean up

:::::: TO: Vincent Abriou <vincent.abriou@st.com>
:::::: CC: Benjamin Gaignard <benjamin.gaignard@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
