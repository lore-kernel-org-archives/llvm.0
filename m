Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7A0223328;
	Thu,  4 Sep 2025 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010351; cv=none; b=V1NjoZO1ZtaFHm1hlEse7/cLBXidpkD77W4Fz1V5pgkwHqbQXHy8CxF5O64fGNzJbpjmwoowI6GSj44LLkFzKGu4CX+8mkt4inQjOE9KUwme+9DWVnce+4iqM6zFrT5PwnOtUXnwW+iaVHwZIGD4BG1P3D0GAVWDPn89cR70Kow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010351; c=relaxed/simple;
	bh=fODPQuazUhzIXcrOVissOgZN6RxqkXm+I9fvTVso/kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekaK59yClNNwExcpbFtUHLn56U+oBTskkQiCFC3Y0wUPMOo69AcIMrgQWPrzqt6kCmoerZGJKBD4Z5CnpfyodoFBbgghh+weks/uVYp9XHZF6qqQXqszUPv381KnW3x5yNQ7pYF+Fnx4KN8MpFA6g3rHuPllNp/uxInLAzLwquY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqfvPQCQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqfvPQCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757010350; x=1788546350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fODPQuazUhzIXcrOVissOgZN6RxqkXm+I9fvTVso/kw=;
  b=mqfvPQCQ/Xf1leHiBIb7PUr0Bir7+BNm5qf9dpJvckO6oS2N5aTJVnNb
   jB7mFUnscgcQEgxjlW2c9fzJ30jcsemS95GH3dPewiztWlvFXXlEvKRut
   CefFgCdm4xbDjy2cI94cnjVv87psE4GGxJxeAoVfUnK/97Aee816zCW3M
   yFgpOS4cNXucqZdFO5jvFf/p6uqOkAUIicNqLQq4XE0SsUQfFQkkIb2EO
   jlmuVrWePE88d5WmNa275rD3u3QVom55B0jSDJ0aknOAsKyhhhbN+hN1m
   n6qMxQv5DynEiW0geoy9PBQbv4jJugvtcLb6PYnfVlRt4g0jl/VvTKQLq
   A==;
X-CSE-ConnectionGUID: 6BKlbjA/RI67Q+uBXtN0Iw==
X-CSE-MsgGUID: U58amnzYQu6c3xooH1VjUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76815858"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="76815858"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 11:25:50 -0700
X-CSE-ConnectionGUID: zBHdrTl7S9yy4bqqmzmJtg==
X-CSE-MsgGUID: 4Vn3UJaJRUmjB7jTV0qmCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; 
   d="scan'208";a="176305149"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 11:25:46 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuEeV-0005cN-1t;
	Thu, 04 Sep 2025 18:25:43 +0000
Date: Fri, 5 Sep 2025 02:25:21 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Young <admiyo@os.amperecomputing.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Huisong Li <lihuisong@huawei.com>
Subject: Re: [PATCH net-next v28 1/1] mctp pcc: Implement MCTP over PCC
 Transport
Message-ID: <202509050150.wt57Mjwg-lkp@intel.com>
References: <20250904040544.598469-2-admiyo@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904040544.598469-2-admiyo@os.amperecomputing.com>

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Young/mctp-pcc-Implement-MCTP-over-PCC-Transport/20250904-120728
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250904040544.598469-2-admiyo%40os.amperecomputing.com
patch subject: [PATCH net-next v28 1/1] mctp pcc: Implement MCTP over PCC Transport
config: i386-buildonly-randconfig-005-20250905 (https://download.01.org/0day-ci/archive/20250905/202509050150.wt57Mjwg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509050150.wt57Mjwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509050150.wt57Mjwg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/mctp/mctp-pcc.c:327:6: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
     327 |         if (rc)
         |             ^~
   drivers/net/mctp/mctp-pcc.c:303:8: note: initialize the variable 'rc' to silence this warning
     303 |         int rc;
         |               ^
         |                = 0
   1 warning generated.


vim +/rc +327 drivers/net/mctp/mctp-pcc.c

   293	
   294	static int mctp_pcc_driver_add(struct acpi_device *acpi_dev)
   295	{
   296		struct mctp_pcc_lookup_context context = {0};
   297		struct mctp_pcc_ndev *mctp_pcc_ndev;
   298		struct device *dev = &acpi_dev->dev;
   299		struct net_device *ndev;
   300		acpi_handle dev_handle;
   301		acpi_status status;
   302		char name[32];
   303		int rc;
   304	
   305		dev_dbg(dev, "Adding mctp_pcc device for HID %s\n",
   306			acpi_device_hid(acpi_dev));
   307		dev_handle = acpi_device_handle(acpi_dev);
   308		status = acpi_walk_resources(dev_handle, "_CRS", lookup_pcct_indices,
   309					     &context);
   310		if (!ACPI_SUCCESS(status)) {
   311			dev_err(dev, "FAILURE to lookup PCC indexes from CRS\n");
   312			return -EINVAL;
   313		}
   314	
   315		snprintf(name, sizeof(name), "mctppcc%d", context.inbox_index);
   316		ndev = alloc_netdev(sizeof(*mctp_pcc_ndev), name, NET_NAME_PREDICTABLE,
   317				    mctp_pcc_setup);
   318		if (!ndev)
   319			return -ENOMEM;
   320	
   321		mctp_pcc_ndev = netdev_priv(ndev);
   322	
   323		mctp_pcc_initialize_mailbox(dev, &mctp_pcc_ndev->inbox,
   324					    context.inbox_index);
   325		mctp_pcc_initialize_mailbox(dev, &mctp_pcc_ndev->outbox,
   326					    context.outbox_index);
 > 327		if (rc)
   328			goto free_netdev;
   329	
   330		mctp_pcc_ndev->outbox.client.tx_done = mctp_pcc_tx_done;
   331		mctp_pcc_ndev->acpi_device = acpi_dev;
   332		mctp_pcc_ndev->ndev = ndev;
   333		acpi_dev->driver_data = mctp_pcc_ndev;
   334	
   335		initialize_MTU(ndev);
   336	
   337		rc = mctp_register_netdev(ndev, NULL, MCTP_PHYS_BINDING_PCC);
   338		if (rc)
   339			goto free_netdev;
   340	
   341		return devm_add_action_or_reset(dev, mctp_cleanup_netdev, ndev);
   342	free_netdev:
   343		free_netdev(ndev);
   344		return rc;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
