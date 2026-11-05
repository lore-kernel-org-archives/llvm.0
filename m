Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912952;
	b=cfdq+78c3WVHhGuvTPBRvKDl7HXeUHP29e2BkhKe1fKQKZZ6cvXygTT7a/bEro2oEl6g
	 hOhBFh44V46EGxsQ/Lsn5BPaBCHxy2Wd/gKdQt7xaH7O2dMjXeHtmZrs/OmZBg1sZ0jzq
	 s+0sGqO5q79PopBG7mpCv8Bb06yv9+3lJjtHDPvVLbAAMk0sf0yAVGI50e2tCv2i785dO
	 PTMeNxrdeCPQOhULd+iyHjb7q6dfxRAsRD0wzUcRWEP6p4gaecsSSegxALMdBJSKBffme
	 9Ad5AQh0FOBEMQGP7tL46VBRA2bOii0MdM3jNtpFis0p1HaUQ2FIToYnuGQVFzL7KKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912952;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mmXsAkOvTe3WVQAMlZboYyv00aEx2jHw2gWIu9EAFE0=;
	b=g2a8xZzXlq5RaaPoiU1GNXd441z1eS0GZOUmZS9R2OFOxNDYccxJwkYgxcw1piMdhzRe
	 aMgb+nwqH7u/zyVHHlOMgyduMHxkdBEnXVb0EHjQOnP+sM523TQsJyPbDuftkxJQsSHsc
	 NOkzxqyNFXYNl+IGA6J2GSrUev+Vow2omrwZNnQNDWUFd3DMEwfS2Q1S91AWfxJCb8nxS
	 qbbu1LoHZ/WxR6hq97oJzC21P+kPakebqE21o77h1/w2OZ7oSxEo+HS5RA60pnjtUaVcl
	 V6NhJNl5lpQj/34yYpJDy6v5FciCgV1P4QdvHXXYU1pIPQ0rkE7q07fYgFyjTmIji3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IRmExOyB;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C169606D805;
	Thu,  5 Nov 2026 21:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C169606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IRmExOyB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793912951; x=1825448951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=15sfF/mRhvZ1F7gdjnRCZKZBTwsyrEZmFW3hQmxHWxo=;
  b=IRmExOyB7SgM0TwjrCrjAeih6W6sdQnJ1p222CTiK3mYVICs+fMdXyvm
   w52DWwPacEnoyma0DEfRR15HAJwb3Gu3NYmunvjAgs9oCeu++Wwkaewhn
   kCUzI6eME/PPjHtv5Z7E0GO65YjC/y9p77IrhOiAxz9kHFo+gpkVAkcFT
   /qHo3Er8SU3pIPkpIw9kop38CCupea+nlK43E9taA8KMPolmAhwr3sRKY
   5kIzPKlNEN6QrdkIVaXF8mmPmVj/bkdFAM8zZ95Q3lwVwmLBabYo5/KPk
   wVazWacyApXnTakvIWTbVZxTDIDdrEeGp/daNm7mrySRC/F0xy5FGrKYL
   A==;
X-CSE-ConnectionGUID: ndMbOmgqRA6BN228bzdhXA==
X-CSE-MsgGUID: mqxA10piQtqDSIAqvGWgoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2623514"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2623514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 13:09:10 -0800
X-CSE-ConnectionGUID: hgM2W9RuSFC+rx2wvSI2pw==
X-CSE-MsgGUID: w+vm6vohQn6zuZh1/0dk1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6944811"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2026 13:09:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP4hk-00000000mrj-3UBk;
	Thu, 05 Nov 2026 21:09:04 +0000
Date: Fri, 6 Nov 2026 05:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: Nikhil Gautam <nikhilgtr@gmail.com>, linux-iio@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: Re: [PATCH v5] iio: chemical: ccs811: Make sampling frequency
 configurable
Message-ID: <202611060402.20veo4W8-lkp@intel.com>
References: <20261104151138.9968-1-nikhilgtr@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151138.9968-1-nikhilgtr@gmail.com>

Hi Nikhil,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikhil-Gautam/iio-chemical-ccs811-Make-sampling-frequency-configurable/20261104-204138
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20261104151138.9968-1-nikhilgtr%40gmail.com
patch subject: [PATCH v5] iio: chemical: ccs811: Make sampling frequency configurable
config: x86_64-randconfig-1004-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060402.20veo4W8-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060402.20veo4W8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060402.20veo4W8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/chemical/ccs811.c:359:2: error: cannot jump from switch statement to this case label
     359 |         default:
         |         ^
   drivers/iio/chemical/ccs811.c:354:42: note: jump bypasses initialization of variable with __attribute__((cleanup))
     354 |                 IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
         |                                                        ^
   1 error generated.


vim +359 drivers/iio/chemical/ccs811.c

   345	
   346	static int ccs811_write_raw(struct iio_dev *indio_dev,
   347				    struct iio_chan_spec const *chan,
   348				    int val, int val2, long mask)
   349	{
   350		struct ccs811_data *data = iio_priv(indio_dev);
   351	
   352		switch (mask) {
   353		case IIO_CHAN_INFO_SAMP_FREQ:
   354			IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
   355			if (IIO_DEV_ACQUIRE_FAILED(claim))
   356				return -EBUSY;
   357	
   358			return ccs811_set_sampling_freq(data, val, val2);
 > 359		default:
   360			return -EINVAL;
   361		}
   362	}
   363	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
