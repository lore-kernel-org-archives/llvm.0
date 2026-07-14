Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFD73644D4;
	Tue, 14 Jul 2026 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784039081; cv=none; b=hfvqq/RAsCd0yfsiQfJrSGgV26pELHhaxCZiNRcxM27om1f24CozKfHlo3hyIP6Ofav7xw73fxX8/nNlT9RrSDFuBYIFewO1XzPedeiwouq9uXfkOs724Uj+pey2QARSXqi0VMBTCLtsB87SCLLQuJ40qE7D+HegwDCkTWXB/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784039081; c=relaxed/simple;
	bh=H/ZL9XREbQ3O7qC+BDXNj/X+Nj529R9ch2SbashdD6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPotEWBhimnPvPNgyank4jovEpuj99dvVTxgj0MfEhdWcdPTxpIPzCEoE8OQZs53yUM5t2Fda6w6CFhLBwy8Cg6w5mtAeZXZTyJ2XpZ+c+9LEeqjaizzjK+E7mugTwg/UC7ZIufiotwKNQNvtIOa/5fEm4UGdY1VpTb7mE8m5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bw4A9APk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bw4A9APk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784039079; x=1815575079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H/ZL9XREbQ3O7qC+BDXNj/X+Nj529R9ch2SbashdD6k=;
  b=bw4A9APkmNogHbRSXjoI47zIQy3TUx/frEJghNoKuPv3/tji+A50I2C4
   gARuTrTy7wHfbM71EEo6HxNUv5SwxeSjzIGpIWD6C48SK4OFElJO1H3W2
   2jla1/5ec3/ITwX136F5SCvnBhcLqIeWcQTKAu1RuF76dPoxHEX0JPTaq
   uktrF3vCUm1QFx/l2ZeeanjNsD5BDeUsP3iiJvqS5mbFuz0tfSzIHJyNe
   TjefFPN7JUXeyZSXZGBjty3MTgGxW30Os/RXu/U/cdpx9dSrMd3U7M4mO
   vRkzl39VvgzkwULekjE8WdB4sb8p/UUKad8dmVUxc0JMP7snqbxEiRi7B
   Q==;
X-CSE-ConnectionGUID: ZHWjGo7US2qcSF5MzMeVrA==
X-CSE-MsgGUID: nQ3EvFCWTgyrl4PXACqQJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84780979"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84780979"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 07:24:38 -0700
X-CSE-ConnectionGUID: cqN4UK6vTsGet2s2YYn5EA==
X-CSE-MsgGUID: oehtI87aTMiS5jK3QdhnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="255924900"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Jul 2026 07:24:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wje3l-00000000Mia-0hby;
	Tue, 14 Jul 2026 14:24:33 +0000
Date: Tue, 14 Jul 2026 22:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency
 and UAF bugs
Message-ID: <202607142224.5HqGONfe-lkp@intel.com>
References: <20260713181602.773-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>

Hi Alfie,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Alfie-Varghese/staging-media-meson-vdec-fix-advanced-concurrency-and-UAF-bugs/20260714-023427
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260713181602.773-1-alfievarghese22%40gmail.com
patch subject: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency and UAF bugs
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260714/202607142224.5HqGONfe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142224.5HqGONfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142224.5HqGONfe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/meson/vdec/vdec.c:156:28: error: no member named 'm2m_dev' in 'struct amvdec_session'
     156 |         v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
         |                             ~~~~  ^
   1 error generated.


vim +156 drivers/staging/media/meson/vdec/vdec.c

3e7f51bd96077a Maxime Jourdan 2019-06-06  151  
3e7f51bd96077a Maxime Jourdan 2019-06-06  152  static void vdec_m2m_job_abort(void *priv)
3e7f51bd96077a Maxime Jourdan 2019-06-06  153  {
3e7f51bd96077a Maxime Jourdan 2019-06-06  154  	struct amvdec_session *sess = priv;
3e7f51bd96077a Maxime Jourdan 2019-06-06  155  
3e7f51bd96077a Maxime Jourdan 2019-06-06 @156  	v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
3e7f51bd96077a Maxime Jourdan 2019-06-06  157  }
3e7f51bd96077a Maxime Jourdan 2019-06-06  158  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
