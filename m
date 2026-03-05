Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576531D61A3;
	Thu,  5 Mar 2026 04:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772684453; cv=none; b=hISk4Xb/kZO6aR6jmYRsB3trPWUsnMpfr80RQKvvLQEmA1VB3cQD0zhQH6Gpepmt+hymMhcLInlql8Inb/wCQ+L6upOwGbg4aVXvfaNNX2QHFkT7OQq4dujI53hQsQ14Zw+yuoowpwWck+oUIw/2Ko2gVzKwgWZ75MVBrKdrx/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772684453; c=relaxed/simple;
	bh=rwzheNDW+lOxCuTlt6Q/dE1VPSEPfFW3aRr1NzUYCA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVUUDft1CE3qnFMnxU35jImJG9ebXJyNw9Qse+VO+/EjMuxmrg5JxfhP9yZu57a0c6FVrdlq46p/HAcSJya22gRK4M3KEXze1mIBc6Ot0bJHJMciBc+C8OgABmx7LGWJeFpQzm5P33OuVXz9pdC2P+uyKO2dWUfmoDR/FP5XDiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjffKefi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjffKefi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772684451; x=1804220451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rwzheNDW+lOxCuTlt6Q/dE1VPSEPfFW3aRr1NzUYCA4=;
  b=EjffKefijrgvNVuLwaBtSPK8F3aqyPBQ5DibJz7YrZfPm2norIwdz2cH
   j6tzN3pfjb14IJedDgPhnqgQHorjsaavX8+lbuSXbKVdreeGKovB6oMCu
   QXakyrh2QnEnPHI+b8JHsyvQChMAWe3z0iusnVbffHBAAZ6qLajti/0pn
   iJqkh4VD0lj6gYYvVYqG3cCepNY1V6rK11bxpGPccSS4OX5btLwtzCEYC
   c9DT55i6QWQ9RssHfotNoZji1/7wrCwQLqL8FipXyed4XDafvM9Ygk7IS
   StfcxUlHZxQTTqno47SNNxiYO3YFo1G1QKHK6sFeFSwkOPYUUt6apeh2m
   A==;
X-CSE-ConnectionGUID: oq7iF6iaRke/4/JfsE0o0Q==
X-CSE-MsgGUID: XWhnUYEWRtyz+WKbfcjJ1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73675133"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73675133"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:20:50 -0800
X-CSE-ConnectionGUID: b7te/GcGQFq9ik40uy83OQ==
X-CSE-MsgGUID: PculmDjPRs2RPA0SjCs9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="222706440"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Mar 2026 20:20:48 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy0C4-0000000005R-0HSC;
	Thu, 05 Mar 2026 04:20:18 +0000
Date: Thu, 5 Mar 2026 12:19:38 +0800
From: kernel test robot <lkp@intel.com>
To: songxiebing <songxiebing@kylinos.cn>, tiwai@suse.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/intel: Synchronize the module parameter values
 of the power_save
Message-ID: <202603051210.99ca99nW-lkp@intel.com>
References: <20260302081218.771520-1-songxiebing@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302081218.771520-1-songxiebing@kylinos.cn>

Hi songxiebing,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v7.0-rc2 next-20260304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/songxiebing/ALSA-hda-intel-Synchronize-the-module-parameter-values-of-the-power_save/20260302-161555
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260302081218.771520-1-songxiebing%40kylinos.cn
patch subject: [PATCH] ALSA: hda/intel: Synchronize the module parameter values of the power_save
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603051210.99ca99nW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051210.99ca99nW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051210.99ca99nW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/hda/controllers/intel.c:2309:13: error: expression is not assignable
    2309 |         power_save = val;
         |         ~~~~~~~~~~ ^
   1 error generated.


vim +2309 sound/hda/controllers/intel.c

  2289	
  2290	static void set_default_power_save(struct azx *chip)
  2291	{
  2292		struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
  2293		int val = power_save;
  2294	
  2295		if (pm_blacklist < 0) {
  2296			const struct snd_pci_quirk *q;
  2297	
  2298			q = snd_pci_quirk_lookup(chip->pci, power_save_denylist);
  2299			if (q && val) {
  2300				dev_info(chip->card->dev, "device %04x:%04x is on the power_save denylist, forcing power_save to 0\n",
  2301					 q->subvendor, q->subdevice);
  2302				val = 0;
  2303				hda->runtime_pm_disabled = 1;
  2304			}
  2305		} else if (pm_blacklist > 0) {
  2306			dev_info(chip->card->dev, "Forcing power_save to 0 via option\n");
  2307			val = 0;
  2308		}
> 2309		power_save = val;
  2310		snd_hda_set_power_save(&chip->bus, val * 1000);
  2311	}
  2312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
