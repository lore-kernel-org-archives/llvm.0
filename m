Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3B34A3E;
	Sat, 24 Jan 2026 00:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769213138; cv=none; b=dyzGz3PIVljOoDVGROBJg5G86UDZ/vPAo6hD1xDktYj1kmzUgLcRJKXsCqntNMPSV77M7xPFnMK7f0k4xAvT0NHMNOoeKe/ZHw6nVvm91fI+Pi9rTWf6l4yKJUmdzaGo5w2aqpHVxgI/9rVr1F6QxcrHmVlKrZxZELr68PwCZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769213138; c=relaxed/simple;
	bh=MGKmhxm4L5H7Hig0poCVDvgVGLgBC56GmtML4LTST9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpJA9ljZHx9SUBLdihaSUcNKbFj+5iosmIaqDus+pgkFs2XjGT49VsbQ7XHmP0Cy+EPsIPljuGJnvH6Xym12UGzXswHlJ3DtYFm1EK5TgBVWwbeai5FIXGDJKz2bdxIa4Ts9Pxj+9mVsuqsLPU7Ed8LcAth68nHKbqDzItK+Jmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aaFRKybH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aaFRKybH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769213137; x=1800749137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGKmhxm4L5H7Hig0poCVDvgVGLgBC56GmtML4LTST9M=;
  b=aaFRKybHsoZNN2GMuwBliYaea1r+tEvTdaoYwMmvUP69L7QM6CsMi49O
   s8oDzcMnCD90jpPCmWdXvp8eojQ5wKIYNoN/ebY5Nk5APCnCs2LDFghqu
   N7YYHHd/NgFWN5r4Cj+x7jqdcyzj+fknq5j7EcHnqsXCRnnnxSyaYRA0c
   a0Km9kfenTp1+uW6STs1he8gHPLyKnaHsq7qQoHF0pHJMtxUcaC596RGF
   b78cpBgrhnStAAJHW1J5Y34qTqV4ATL3In7TGS9bu+mXT0P3o1ngkfEDE
   wXOUT/j01ZlbprTW7O3v7nCmwMW1ASlSXdJ5q+WFkXpKapwuTkThu3P0h
   A==;
X-CSE-ConnectionGUID: zhyFKPm7ScOcjPiJrMKMlw==
X-CSE-MsgGUID: /lUdyYUkSbeb21+PYMY1qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74330690"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74330690"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 16:05:37 -0800
X-CSE-ConnectionGUID: 5IfPgRPUTyKDB8ZRx07LCA==
X-CSE-MsgGUID: knC+wmAgQfqn3xIRuMd9cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207193418"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jan 2026 16:05:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjR9e-00000000Ubu-1j6o;
	Sat, 24 Jan 2026 00:05:30 +0000
Date: Sat, 24 Jan 2026 08:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jaroslav Kysela <perex@perex.cz>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH v3 3/4] mfd: cs42l43: Add support for the B variant
Message-ID: <202601240759.oXmYGyUC-lkp@intel.com>
References: <20260123150945.100038-4-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123150945.100038-4-mstrozek@opensource.cirrus.com>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-sound/for-next lee-leds/for-leds-next linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Strozek/ASoC-sdw_utils-Add-CS42L43B-codec-info/20260123-233105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260123150945.100038-4-mstrozek%40opensource.cirrus.com
patch subject: [PATCH v3 3/4] mfd: cs42l43: Add support for the B variant
config: x86_64-randconfig-003-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240759.oXmYGyUC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240759.oXmYGyUC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240759.oXmYGyUC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/cs42l43-i2c.c:50:24: warning: cast to smaller integer type 'int' from 'const void *' [-Wvoid-pointer-to-int-cast]
      50 |         cs42l43->variant_id = (int)device_get_match_data(cs42l43->dev);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +50 drivers/mfd/cs42l43-i2c.c

    37	
    38	static int cs42l43_i2c_probe(struct i2c_client *i2c)
    39	{
    40		struct cs42l43 *cs42l43;
    41	
    42		cs42l43 = devm_kzalloc(&i2c->dev, sizeof(*cs42l43), GFP_KERNEL);
    43		if (!cs42l43)
    44			return -ENOMEM;
    45	
    46		cs42l43->dev = &i2c->dev;
    47		cs42l43->irq = i2c->irq;
    48		/* A device on an I2C is always attached by definition. */
    49		cs42l43->attached = true;
  > 50		cs42l43->variant_id = (int)device_get_match_data(cs42l43->dev);
    51	
    52		cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
    53		if (IS_ERR(cs42l43->regmap))
    54			return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->regmap),
    55					     "Failed to allocate regmap\n");
    56	
    57		return cs42l43_dev_probe(cs42l43);
    58	}
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
