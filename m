Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F08E33121F;
	Fri, 10 Jul 2026 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783711090; cv=none; b=O7mCbz1bhoPkDY9tXrFuRCoMNSFw+vikGVZz8ti4qhJSQrYeo/SagZrB1A/UeiDcuH8VqI7/V6QR0uFb5+W9MZNZNpRGtkX4klE7MEa1M6dsCwFHQsxU7TZVcJ+C0930IGfcjDIgqn5ypBpYyncRSIzx4CDzC26YKJrQEMXXuIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783711090; c=relaxed/simple;
	bh=2U0aLcLDGNOA93LV8u1qOTnrjqBRNYbHHVerl/FtJ1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVyOQGULnwXSWIYF55UlOuNAINibpO9Och4hhbdTyX7UCV4TyBNJ7l3TmG6KNvgA83s1ExU3FK4qTR6twUsAEsXhZ4MNrMYf4iHjpIX0aF/PN1wK7r0qDiGsqLON0LP9TSDtkaNmTQWJ4EXOAU18azWlcBzqyjQ5glSyvSY+34Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5qKez8J; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5qKez8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783711088; x=1815247088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2U0aLcLDGNOA93LV8u1qOTnrjqBRNYbHHVerl/FtJ1s=;
  b=S5qKez8Jq4eKfb7aADbtviUzGM1xefPX/1eyldlGUGaaXzHOXEeRQ2O3
   foBrFvi80y72YPZ53pFJnAheZ3v2xCMNeVlEEVwCPy1FRo863QCh7PKDr
   ACPWYICFBMk+jNEFx8vTdMgXrTnGJwH/w5k+U0KHQKQ3tn/BHY/MCv03x
   4MTnIUM+BQ5IanrrlRSAclS7uxKtegJqECaUhrlttBrBlCQRVYnSjXnR7
   lDGjOd8dfDNNCo/sP678QRiSz7cVfxCHa2TeYptBdbZBWHBiheh/6Vdrm
   AJhefgFiIffHfZMoYapaXShh0Po+Y4seT5ACplnIvpVLnMpkKE3SfG3Br
   g==;
X-CSE-ConnectionGUID: wxveFJyRTjSTVlD72mT/xA==
X-CSE-MsgGUID: 1puZ2QakQH+V+lBghbQfkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84435253"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84435253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 12:18:08 -0700
X-CSE-ConnectionGUID: WYArwfLqTVuK6N7Bm+RxfQ==
X-CSE-MsgGUID: h8wxA/nSTuSbYNqwM8kysQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253843474"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 10 Jul 2026 12:18:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiGja-00000000JHd-3B5J;
	Fri, 10 Jul 2026 19:18:02 +0000
Date: Sat, 11 Jul 2026 03:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH] usb: typec: ucsi: ucsi_glink: Prevent suspend during
 UCSI notification handling
Message-ID: <202607110241.diOWToQ0-lkp@intel.com>
References: <20260710-ucsi_glink_wakeup-v1-1-7d97ea628d92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-ucsi_glink_wakeup-v1-1-7d97ea628d92@oss.qualcomm.com>

Hi Jishnu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2cb6eac064c8334418a76999468f68696a8dfe71]

url:    https://github.com/intel-lab-lkp/linux/commits/Jishnu-Prakash/usb-typec-ucsi-ucsi_glink-Prevent-suspend-during-UCSI-notification-handling/20260710-182232
base:   2cb6eac064c8334418a76999468f68696a8dfe71
patch link:    https://lore.kernel.org/r/20260710-ucsi_glink_wakeup-v1-1-7d97ea628d92%40oss.qualcomm.com
patch subject: [PATCH] usb: typec: ucsi: ucsi_glink: Prevent suspend during UCSI notification handling
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260711/202607110241.diOWToQ0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110241.diOWToQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110241.diOWToQ0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/typec/ucsi/ucsi_glink.c:352:39: error: no member named 'wakeup' in 'struct dev_pm_info'
     352 |                 pm_wakeup_ws_event(ucsi->dev->power.wakeup,
         |                                    ~~~~~~~~~~~~~~~~ ^
   1 error generated.


vim +352 drivers/usb/typec/ucsi/ucsi_glink.c

   338	
   339	static void pmic_glink_ucsi_callback(const void *data, size_t len, void *priv)
   340	{
   341		struct pmic_glink_ucsi *ucsi = priv;
   342		const struct pmic_glink_hdr *hdr = data;
   343	
   344		switch (le32_to_cpu(hdr->opcode)) {
   345		case UC_UCSI_READ_BUF_REQ:
   346			pmic_glink_ucsi_read_ack(ucsi, data, len);
   347			break;
   348		case UC_UCSI_WRITE_BUF_REQ:
   349			pmic_glink_ucsi_write_ack(ucsi, data, len);
   350			break;
   351		case UC_UCSI_USBC_NOTIFY_IND:
 > 352			pm_wakeup_ws_event(ucsi->dev->power.wakeup,
   353					   UCSI_GLINK_WAKEUP_TIMEOUT_MS, true);
   354			schedule_work(&ucsi->notify_work);
   355			break;
   356		}
   357	}
   358	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
