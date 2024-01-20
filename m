Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A98CF4E2;
	Sat, 20 Jan 2024 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705758523; cv=none; b=ESCX9Ee94Bg4FL6IMEkhCTf9RQA02u7AmJUgreKlsMyGTdVWhM1jd2i0NmlK3oOCgr2Mav1d1kfjIaIKo1ZYb5HKs57XwCv9Z1eTBkNFngk5A25CIBKaXJOaBKaTkJiKrXzVHoNbGsGqHa/1e+iEhTK4R7gLY1+1KOb+WaxsIzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705758523; c=relaxed/simple;
	bh=v+iDCzT6k68T/ubfDoc2DJlaF6So7IVF+l7GBNp3bLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7dCoSiaMY0G+DLTkfjjgRQEa8R2mIeiy98JjrR60F77N83w/iwVSqIbVwN2lMCL+or+iOkIYYgTh+JYKciomKHZRAVnJ9FK0pJU18/0sG0Eov4QS/werpkv9MmjAjph8dyXQgxC4gb6F54q6m1lSpvrfGgYx9PZmWAnlfGLsSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4X1B0tg; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4X1B0tg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705758522; x=1737294522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v+iDCzT6k68T/ubfDoc2DJlaF6So7IVF+l7GBNp3bLk=;
  b=Z4X1B0tgi0/Hcdwkr60LOiW87SAO6RUmfbajVh2GR80lzHy+l1HICX9F
   uYpBgxESGO/3PJr8+/CgCeu1mTZ2jljjvc4BfjIBRrns4mNmKt1V6fhEa
   Gfhrkryga9z8XMMbPt4O6oUD21FNCIIByIpkbB1dhqK2MjRaF7oRglkJx
   a67rhaUoBS7WP/1DZ1DNXsvIXhUlJ/vO+NEp9H7/dnEaeceOkLBvjEM+x
   1T1o0ORMOY1s22OO8L5rasnTRiFizwQUViKGy0XgApubmnfnpfVVfwaqL
   f6kVR8uCNn1zt1A/2KPZb8S2m15lK5kojrHeODPBASdUhYqR6ZcZQ5PaP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="398100161"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="398100161"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 05:48:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1032186604"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="1032186604"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2024 05:48:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRBi9-00057y-32;
	Sat, 20 Jan 2024 13:48:37 +0000
Date: Sat, 20 Jan 2024 21:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v12 13/15] media: vivid: add fixed point test controls
Message-ID: <202401202119.lXkMF2LU-lkp@intel.com>
References: <1705581128-4604-14-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1705581128-4604-14-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20240118-211929
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1705581128-4604-14-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH v12 13/15] media: vivid: add fixed point test controls
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240120/202401202119.lXkMF2LU-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d92ce344bf641e6bb025b41b3f1a77dd25e2b3e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401202119.lXkMF2LU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401202119.lXkMF2LU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/test-drivers/vivid/vivid-ctrls.c:195:3: error: field designator 'fraction_bits' does not refer to any field in type 'const struct v4l2_ctrl_config'
     195 |         .fraction_bits = 16,
         |         ~^~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-ctrls.c:206:3: error: field designator 'fraction_bits' does not refer to any field in type 'const struct v4l2_ctrl_config'
     206 |         .fraction_bits = 63,
         |         ~^~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +195 drivers/media/test-drivers/vivid/vivid-ctrls.c

   186	
   187	static const struct v4l2_ctrl_config vivid_ctrl_int32_q16 = {
   188		.ops = &vivid_user_gen_ctrl_ops,
   189		.id = VIVID_CID_INT_Q4_16,
   190		.name = "Integer 32 Bits Q4.16",
   191		.type = V4L2_CTRL_TYPE_INTEGER,
   192		.min = v4l2_ctrl_fp_compose(-16, 0, 16),
   193		.max = v4l2_ctrl_fp_compose(15, 0xffff, 16),
   194		.step = 1,
 > 195		.fraction_bits = 16,
   196	};
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
