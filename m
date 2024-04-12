Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944238C15;
	Fri, 12 Apr 2024 05:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712898455; cv=none; b=Oq1RynWNJudSP1XJ2mREjEjaHW+85A0Uv2/Gj8BBexobVzp7pZeNxwBZLmpxLF6nnKKmJhmcrui6jzdffOMlBnXgOh6zKZeAdZ33rZ5vuP67AAAkUXSj2LAzic+0dcLl5BScvyswa9lUVOKrlyNZO0LWO2+snk2KbGvSuu3YvYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712898455; c=relaxed/simple;
	bh=GeNrzTv9ab+0ef/bNIzh19/V6Iwla0D1zpEQc5y5VcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5coT0dIQF4PVJIrpgDaF+yuj/p5EXQeUHksXtL4AD02BpOdSu4iTAKPFuoPvucPaDotz7VA+xqgXU6pAq8Bwmw8Mg15Yq75zRnnetpbviqL9DCmnrtAbowficKZt6sbjw38I9jtZsmb5DJPqMbnG9V5dmAnBTlgfBFsuMGh/uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YpTnlrL4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YpTnlrL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712898454; x=1744434454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GeNrzTv9ab+0ef/bNIzh19/V6Iwla0D1zpEQc5y5VcE=;
  b=YpTnlrL4BSagFMtvgLClANiuaf5+aYAsarkqNNMhPBgRtEI2gLgOxTc2
   GJ+6gLgeDiPs7w5AiKoVO+I+97tWdmro38pO2rZuRw+fjjgQ36rye2IxD
   oLnMQLQ6gBoV1sxSigXSQd61vU4f6WGJfhazSIOiYLWRlfUo7fkICPES8
   ngE71DE2uuEM8kpacYTPqv2p3WNwW8vKDkvJa3flXITSUmS3xWUhuv7ew
   vAhCEqRv+V6P+JIojtq/xXfKlLkX4Q7xpUR8hmPPCkzZomKBPrCqcozNw
   SktavtgUa63BWrL9kxz/WFyei7Ess8jYz1GYIfWWr7C47L2t61skMtkzS
   w==;
X-CSE-ConnectionGUID: 2Za52xG8Q+q4aj43EYJAHw==
X-CSE-MsgGUID: sHrpYieNSTWfarIbDJXr9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8509582"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8509582"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 22:07:33 -0700
X-CSE-ConnectionGUID: lT11SKFTTryQFBPaRfmoKg==
X-CSE-MsgGUID: a2Bb8C+wR+G2C9+lOUXCPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="21555520"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Apr 2024 22:07:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv98K-0009Or-0e;
	Fri, 12 Apr 2024 05:07:28 +0000
Date: Fri, 12 Apr 2024 13:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bart Van Assche <bvanassche@acm.org>,
	John Garry <john.g.garry@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [mkp-scsi:for-next 112/118] drivers/usb/storage/uas.c:828:3: error:
 implicit declaration of function 'blk_queue_max_hw_sectors' is invalid in
 C99
Message-ID: <202404121322.E6zfTcHX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   8e50d1ee8f4cdae5cba87b93de4819feb79bd049
commit: a2ad002485c492354d572d743f60af0057ebe04e [112/118] scsi: block: Remove now unused queue limits helpers
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240412/202404121322.E6zfTcHX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121322.E6zfTcHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121322.E6zfTcHX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/storage/uas.c:828:3: error: implicit declaration of function 'blk_queue_max_hw_sectors' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   blk_queue_max_hw_sectors(sdev->request_queue, 64);
                   ^
   drivers/usb/storage/uas.c:828:3: note: did you mean 'queue_max_hw_sectors'?
   include/linux/blkdev.h:1137:28: note: 'queue_max_hw_sectors' declared here
   static inline unsigned int queue_max_hw_sectors(const struct request_queue *q)
                              ^
   1 error generated.


vim +/blk_queue_max_hw_sectors +828 drivers/usb/storage/uas.c

1363074667a6b7 Hans de Goede      2016-04-12  819  
115bb1ffa54c39 Matthew Wilcox     2010-10-07  820  static int uas_slave_alloc(struct scsi_device *sdev)
115bb1ffa54c39 Matthew Wilcox     2010-10-07  821  {
ee136af4a064c2 Hans de Goede      2015-04-21  822  	struct uas_dev_info *devinfo =
ee136af4a064c2 Hans de Goede      2015-04-21  823  		(struct uas_dev_info *)sdev->host->hostdata;
ee136af4a064c2 Hans de Goede      2015-04-21  824  
ee136af4a064c2 Hans de Goede      2015-04-21  825  	sdev->hostdata = devinfo;
37599f9603bed3 Hans de Goede      2013-11-15  826  
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04  827  	if (devinfo->flags & US_FL_MAX_SECTORS_64)
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04 @828  		blk_queue_max_hw_sectors(sdev->request_queue, 64);
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04  829  	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04  830  		blk_queue_max_hw_sectors(sdev->request_queue, 240);
d5c65d32dc240b Greg Kroah-Hartman 2020-12-04  831  
115bb1ffa54c39 Matthew Wilcox     2010-10-07  832  	return 0;
115bb1ffa54c39 Matthew Wilcox     2010-10-07  833  }
115bb1ffa54c39 Matthew Wilcox     2010-10-07  834  

:::::: The code at line 828 was first introduced by commit
:::::: d5c65d32dc240bf600d9e54250a8133e93ece60a Revert "uas: fix sdev->host->dma_dev"

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
