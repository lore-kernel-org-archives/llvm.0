Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552B137C48;
	Thu, 25 Jan 2024 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706215584; cv=none; b=mQGGjbcnBI3lVgKVgnyKlx5k6j4eK6HcIyH0kVb/w+B8vxAplfUNh9UcQCFXGijL67JMzwC3Ukd6YXZMQUZ4ezH1ZwyXifceBG8YjZz/yRl7XnsaG4GI4wWPhFprBQHAv5390C7dxkhrmXoSXQcqk64nVNuMqMoTv8V5F/WKqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706215584; c=relaxed/simple;
	bh=qt3bTu8mk7Mbfsz2GvX1ohHdsnOiP999J8bzxPs5kEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JgS/0qfsvKPl4SKiCoxVNdKG4Podq0IA1TG6YxHHHUTkjvj+9dmCJQvfqtLR6V50K+2raA8RqFitMeRUTPx3qqIp2qTjCWBjv6dnvs3r3GOq3ItvEU/aydno91CVDIRc7oZIoVepZ82xEwCsiX7E4YuBFB88L1b/RMt1XB2en/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb/ZqZJ2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb/ZqZJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706215582; x=1737751582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qt3bTu8mk7Mbfsz2GvX1ohHdsnOiP999J8bzxPs5kEQ=;
  b=Yb/ZqZJ2DqW1TniyThTpfGwey5pESWAwWxC2S6qai4EHfm9Fkh9TUA7M
   mK9WhHjYK3mqvdi7eafK2Ct9pZoDs1iHetR0WXDapB5Vc77GpTHiwKnjV
   ozJN35d8UuKqJra8lnFZu/xKTkqIkzRbXPlE0HPu0G00wCQgA9bQ5odhn
   lXXBxh5JvWS5LndNuVOHkHq4/dMfQXXxCTNPPBl6xlZQPgNTy9PbkvKIz
   TtspDF7BOk9z5a+lYAnNewp4dxKkZDMSUp/3oLgCuL96hf7GgCcPqbBm3
   9t/TrYnZAu0eNKz/Rb4favnkTCDUdkRdsSM+7fjqMNJnd9sughr9TJFXD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="8974475"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8974475"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 12:46:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="21180499"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2024 12:46:19 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT6c5-0000P2-1L;
	Thu, 25 Jan 2024 20:46:17 +0000
Date: Fri, 26 Jan 2024 04:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 9/21]
 drivers/hid/spi-hid/spi-hid-apple-core.c:151: warning: Function parameter or
 struct member 'id' not described in 'spihid_msg_hdr'
Message-ID: <202401260412.qXoWWG7Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   253645613d55bc9e62bb0b1811d009cd987f301f
commit: 372d4679f7251105cfe589c326eb5ee9b3d4f8a1 [9/21] WIP: HID: transport: spi: add Apple SPI transport
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240126/202401260412.qXoWWG7Z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260412.qXoWWG7Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260412.qXoWWG7Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/spi-hid/spi-hid-apple-core.c:151: warning: Function parameter or struct member 'id' not described in 'spihid_msg_hdr'
>> drivers/hid/spi-hid/spi-hid-apple-core.c:151: warning: Excess struct member 'msgid' description in 'spihid_msg_hdr'


vim +151 drivers/hid/spi-hid/spi-hid-apple-core.c

   119	
   120	/**
   121	 * struct spihid_msg_hdr - common header of protocol messages.
   122	 *
   123	 * Each message begins with fixed header, followed by a message-type specific
   124	 * payload, and ends with a 16-bit crc. Because of the varying lengths of the
   125	 * payload, the crc is defined at the end of each payload struct, rather than
   126	 * in this struct.
   127	 *
   128	 * @unknown0:	request type? output, input (0x10), feature, protocol
   129	 * @unknown1:	maybe report id?
   130	 * @unknown2:	mostly zero, in info request maybe device num
   131	 * @msgid:	incremented on each message, rolls over after 255; there is a
   132	 *		separate counter for each message type.
   133	 * @rsplen:	response length (the exact nature of this field is quite
   134	 *		speculative). On a request/write this is often the same as
   135	 *		@length, though in some cases it has been seen to be much larger
   136	 *		(e.g. 0x400); on a response/read this the same as on the
   137	 *		request; for reads that are not responses it is 0.
   138	 * @length:	length of the remainder of the data in the whole message
   139	 *		structure (after re-assembly in case of being split over
   140	 *		multiple spi-packets), minus the trailing crc. The total size
   141	 *		of a message is therefore @length + 10.
   142	 */
   143	
   144	struct spihid_msg_hdr {
   145		u8 unknown0;
   146		u8 unknown1;
   147		u8 unknown2;
   148		u8 id;
   149		__le16 rsplen;
   150		__le16 length;
 > 151	};
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
