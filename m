Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7B332621;
	Fri, 18 Sep 2026 23:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789774495; cv=none; b=Xviu7JwwURoo7ZL7eLDM2n9UAE04g+zM/C5VwW/VdgSQW1bI/vYQOrhPscEL5NdyyhhLoZfPyNgWrx+qVBlfYoXxKZViLlHRuIF+MyNmbFsFzSxz8HLo87igr/+PI3rhZVhQq9Lti+NrRCt7SMh8emM60lZ7DTLP3I3nM2Iyf0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789774495; c=relaxed/simple;
	bh=+CIDY4tHCBcNN6f3HQI80T/KHLCZoSJvg0NcmfaQzrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nq3LKTLh+PY5PAo5tSRPaWswj9xz0qeYAaUHItUR4kQZjgUhIhJRZm8qSDoKo1P2PTgqsxQ4sVXiX2A97mMEcojuIlRacHhWn111jI+jr5QdayLTPYdfY1rkKtwUOi1VqK5MDu+Q1wxFOVczZkdYttei99dziGz1gSW2/uATYTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbQbUXVZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbQbUXVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789774494; x=1821310494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+CIDY4tHCBcNN6f3HQI80T/KHLCZoSJvg0NcmfaQzrk=;
  b=HbQbUXVZyYArbQBBPDWdHqt+ayc92aV5o6OpC/t4FpsknaH03IxJ9oYf
   c1gShB+60cYgGAojx5zt5uPiO5lny4ahabNh1EK/AlxyWVs+qcqEdkjp2
   MmekpxU9r78+zs/ce7CCxoPCQmWVwypdAymYigKfU3nvE2lrcmbccuJ7q
   0bsGg6bizR6DgY3rz+d6V3Cu9+SaYVcOT84kvpmroTcSGVCXHwJsiAq9I
   9edl7X6CsI01b9Rs0yZeLjQ2JW2xSwYxcv+1jDkosYYNSdMzSbJg4/P34
   4tc47Xn4SnYuk2Z2xwh9ZKoCrSmH0/2GVVAAsmfSQ/oIDcYuo3qK/MB87
   A==;
X-CSE-ConnectionGUID: PwFzNEBDS+OZ2ObUp+mJZQ==
X-CSE-MsgGUID: t6rYcfCETi2/y6YMClk79A==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89240467"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89240467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 16:34:53 -0700
X-CSE-ConnectionGUID: 9nJ7BauOSNyLmg3WxQ3PeQ==
X-CSE-MsgGUID: DOzcEQl8Q6CsGqwOAV14zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271964200"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2026 16:34:51 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7i6O-00000000ASb-1mkJ;
	Fri, 18 Sep 2026 23:34:44 +0000
Date: Sat, 19 Sep 2026 07:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Zihao <guozh23@xiaopeng.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: Re: [PATCH] media: cobalt: bound the dv timings to the descriptor
 buffers
Message-ID: <202609190745.z2mFq2RW-lkp@intel.com>
References: <20260918072526.2478529-1-guozh23@xiaopeng.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918072526.2478529-1-guozh23@xiaopeng.com>

Hi Guo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master sailus-media-tree/master linus/master v7.3-rc3 next-20260918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Zihao/media-cobalt-bound-the-dv-timings-to-the-descriptor-buffers/20260918-152526
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260918072526.2478529-1-guozh23%40xiaopeng.com
patch subject: [PATCH] media: cobalt: bound the dv timings to the descriptor buffers
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260919/202609190745.z2mFq2RW-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190745.z2mFq2RW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190745.z2mFq2RW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/cobalt/cobalt-v4l2.c:635:3: error: use of undeclared identifier 'cobalt'
     635 |                 cobalt_info("timings %ux%u out of range\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     636 |                             timings->bt.width, timings->bt.height);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/cobalt/cobalt-driver.h:160:45: note: expanded from macro 'cobalt_info'
     160 | #define cobalt_info(fmt, arg...) v4l2_info(&cobalt->v4l2_dev, fmt, ## arg)
         |                                             ^~~~~~
   1 error generated.


vim +/cobalt +635 drivers/media/pci/cobalt/cobalt-v4l2.c

   615	
   616	static int cobalt_s_dv_timings(struct file *file, void *priv,
   617					    struct v4l2_dv_timings *timings)
   618	{
   619		struct cobalt_stream *s = video_drvdata(file);
   620		int err;
   621	
   622		if (s->input == 1) {
   623			*timings = cea1080p60;
   624			return 0;
   625		}
   626	
   627		if (v4l2_match_dv_timings(timings, &s->timings, 0, true))
   628			return 0;
   629	
   630		if (vb2_is_busy(&s->q))
   631			return -EBUSY;
   632	
   633		if (timings->bt.width > COBALT_MAX_WIDTH ||
   634		    timings->bt.height > COBALT_MAX_HEIGHT) {
 > 635			cobalt_info("timings %ux%u out of range\n",
   636				    timings->bt.width, timings->bt.height);
   637			return -EINVAL;
   638		}
   639	
   640		err = v4l2_subdev_call(s->sd,
   641				pad, s_dv_timings, 0, timings);
   642		if (!err) {
   643			s->timings = *timings;
   644			s->width = timings->bt.width;
   645			s->height = timings->bt.height;
   646			s->stride = timings->bt.width * s->bpp;
   647		}
   648		return err;
   649	}
   650	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
