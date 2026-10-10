Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182E93603EE;
	Sat, 10 Oct 2026 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617875; cv=none; b=f2RJHPlC5kz8l3a+MErlTkp3I5cNDyAFn158huWHcNzsv/EpifmapS81FnE9jvufTe25rjC0d2M+dOKwxewtezocYg1bVnNWJ+b0k6KEesGBaMbtX22nV9dkLNdgQSRaKPc2jdECyxknDdueAudN/I0J/yb2rO1bUF8FkU40FmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617875; c=relaxed/simple;
	bh=81zzneQkm9DlTp2+i9sm+Fq6tE2dxkQHQWLTPITQrYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyo4GEJ9lDXxpk+UR2bZ+Gn+YD2qMm29ZlXfbTdpGSj6izozcQjl+hAhEwBGAZiHLUX0ilOv/bZH9k46NekWqEpuB5Gv42seOpo+Qk+5vuJe70UfOK4vDy+T/mvo3f1i2pPbT4H2lN4wlEKIPlzS511w9ksnNk1UZNiYbzCcRxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=la0eLuY3; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="la0eLuY3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791617874; x=1823153874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=81zzneQkm9DlTp2+i9sm+Fq6tE2dxkQHQWLTPITQrYE=;
  b=la0eLuY3bHbtYD8iu+JakZJWeke36IoFb7FiusRiQYihcEXVD96YrOgz
   rWZbOSaCBrbD8QltULiendX9bSIGxDxYyUU6+sOsLOxPEt3FHwQca31PY
   RFIQ0zk6BHrzx7YsmZYbpLfVLoyu05kq5n3PEN6zCZjQMJZjrEq1+W8RG
   w3N8JpaLU/V445mo5hZSAR7Mqzv7VTuutQwP5QKlQYPfX4cpYOdqK/OKJ
   KPuPNkU8GbI115XuBe2JnsXqYc6F4Fm+x0C09BSq2OXtTf9yTQPxsxC+r
   HJ1rpUdzC5pC43v6SGSBJdEi2Bsx5i+eJ4Xm8Su9TLOWDGO/dopflCCZU
   g==;
X-CSE-ConnectionGUID: 48JhWtIbR9y0z/eOxN8q0A==
X-CSE-MsgGUID: KDLo9EZsRZ+Ggjo3HNBPWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="315255"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="315255"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 00:37:51 -0700
X-CSE-ConnectionGUID: MVngr4iYR46NYRTVANZLzA==
X-CSE-MsgGUID: dk+EyF3nRXm9B3HDHcseyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="571998"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Oct 2026 00:37:48 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFReL-000000006z9-2hTs;
	Sat, 10 Oct 2026 07:37:45 +0000
Date: Sat, 10 Oct 2026 15:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] ASoC: airoha: Add support for AN7581 PCM driver
Message-ID: <202610101524.PIlCqVIG-lkp@intel.com>
References: <20261009111334.23522-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009111334.23522-3-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20261009]
[cannot apply to linus/master v7.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/ASoC-dt-bindings-airoha-Add-AN7581-PCM-controller/20261009-131331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261009111334.23522-3-ansuelsmth%40gmail.com
patch subject: [PATCH v3 2/2] ASoC: airoha: Add support for AN7581 PCM driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261010/202610101524.PIlCqVIG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 242243a5814307de825db3428662d67b064e2cbc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101524.PIlCqVIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101524.PIlCqVIG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/airoha/an7581-pcm.c:618:3: error: field designator 'pcm_construct' does not refer to any field in type 'const struct snd_soc_component_driver'
     618 |         .pcm_construct = an7581_pcm_new,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/airoha/an7581-pcm.c:778:14: warning: unused variable 'connection_type' [-Wunused-variable]
     778 |         const char *connection_type;
         |                     ^~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +618 sound/soc/airoha/an7581-pcm.c

   614	
   615	static const struct snd_soc_component_driver an7581_pcm_platform = {
   616		.name = "an7581-pcm-audio",
   617		.pointer = an7581_pcm_pointer,
 > 618		.pcm_construct = an7581_pcm_new,
   619	};
   620	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
