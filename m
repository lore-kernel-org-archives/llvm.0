Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E451F9F7A;
	Mon,  4 Aug 2025 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754319241; cv=none; b=dTu9dxG/hY/DRzqEpxzVPAhAhqzjauXm9wAVHV6b4beJ0fNIhYYiZwayxcjcOja3kiOno3jp8u6gWY/MsQ8O4lkxm1+NQcDX+e7COfiTZ4aosfLCEZHKy+NqYYbPh8MvxuHwIRQuy0Jqj1WVQ2O7LRHrpmyCh3yrbCmOZs5Ga9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754319241; c=relaxed/simple;
	bh=5a8vM/Mb91kTjb/vSOmxh+YNJwab9PXTqNeITTi4mYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMyKoHgxMLMFkVEzGMGdWnX4kApRKbckj0Tz5bJJik05ll7mTKr6/xqU6OUfNSh+1Ccf1b4ZVo0LRnLuEFF2y57E8dRPYH/ywIkOkyfqVeCRtuWBSqnY2a1jbJBjdnRWjw6yQVbEK47ookJHM4pMSsnUi+C2MknHZ74eQYjmfdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjEgnTIX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjEgnTIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754319238; x=1785855238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5a8vM/Mb91kTjb/vSOmxh+YNJwab9PXTqNeITTi4mYQ=;
  b=hjEgnTIXk/CZEPcH4tgKqqQ0PwlR3fZ7Vu7oPyRmZLqCQzWx5tkt/Apo
   GS5YDz/CIt0wHoDmC82wmjU9+mw4IBiWyuRozSIl7GNO3qPASXIf6+rk/
   /YTqh5mfVHJOdox+C2wxFIcVloJcSwvTFt/fLf7R28W2sadZA1H9IzrfM
   EatCRFZTs0K6aXixb9hB/K2xJ/E4KFSZKJRw6NgmiSPRfPvWlrZxR7VDU
   THCyolLQONU2LRo5c6aEHvyCXHIAMN21Of8ywJpRmkT2Kz7IL4u1DvOlX
   wzSnYy00RjIcq2PiDHUyIBQdhD1nZ9nDN67FoEyUlc4yxgYeqEUTnsO8e
   g==;
X-CSE-ConnectionGUID: 0uTnHpTzR+qlNlYMLV9QTA==
X-CSE-MsgGUID: 69dSgTh7TDqBfTm/akCcWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="55635329"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="55635329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 07:53:57 -0700
X-CSE-ConnectionGUID: UsTZ36QYTtingaaaKiB8ww==
X-CSE-MsgGUID: kz3pHOVoSiyDnKey+EdOvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="195021292"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Aug 2025 07:53:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiwZW-000059-1K;
	Mon, 04 Aug 2025 14:53:54 +0000
Date: Mon, 4 Aug 2025 22:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 18/19]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:987:18: warning: format
 specifies type 'long' but the argument has type '__size_t' (aka 'unsigned
 int')
Message-ID: <202508042201.aI0hBZCq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   17ba359286a86638c4d3a3b5bb2ba3a19db1d898
commit: 7ebaa0bb0d52e5d9c2b7967868b0e3932847b854 [18/19] HID: Add Apple DockChannel HID transport driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250804/202508042201.aI0hBZCq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508042201.aI0hBZCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508042201.aI0hBZCq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/dockchannel-hid/dockchannel-hid.c:987:18: warning: format specifies type 'long' but the argument has type '__size_t' (aka 'unsigned int') [-Wformat]
     986 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                                                         ~~~
         |                                                                         %zu
     987 |                         shdr->length, hdr->length - sizeof(*shdr));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +987 drivers/hid/dockchannel-hid/dockchannel-hid.c

   979	
   980	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   981	{
   982		struct dchid_subhdr *shdr = (void *)data;
   983		u8 *payload = data + sizeof(*shdr);
   984	
   985		if (shdr->length + sizeof(*shdr) > hdr->length) {
   986			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
 > 987				shdr->length, hdr->length - sizeof(*shdr));
   988			return;
   989		}
   990		if (shdr->flags != iface->out_flags) {
   991			dev_err(iface->dchid->dev,
   992				"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
   993				shdr->flags, iface->out_flags);
   994			return;
   995		}
   996	
   997		if (shdr->length < 1) {
   998			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
   999			return;
  1000		}
  1001		if (iface->tx_seq != hdr->seq) {
  1002			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
  1003				iface->tx_seq, hdr->seq);
  1004			return;
  1005		}
  1006		if (iface->out_report != payload[0]) {
  1007			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
  1008				iface->out_report, payload[0]);
  1009			return;
  1010		}
  1011	
  1012		if (iface->resp_buf && iface->resp_size)
  1013			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
  1014	
  1015		iface->resp_size = shdr->length;
  1016		iface->out_report = -1;
  1017		iface->retcode = shdr->retcode;
  1018		complete(&iface->out_complete);
  1019	}
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
