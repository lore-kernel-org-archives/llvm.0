Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BCC47A881;
	Wed, 14 Oct 2026 20:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792009190; cv=none; b=LTwJppUCW3J++3l6vbnd4B/FhfN2YRhMl+0tqQAyXAEIMDq1Pn0R7kdfoSdS3cQmmIdiijh8t5AOqO3H1PTHXFBYWxrAhE1WxDzYCXISokwnxqf3fbYHSrEiyV72L6cuMxDt7VRYAOCOZ4t2XBMBVkJDr+Pf9wwOnalNe29IIMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792009190; c=relaxed/simple;
	bh=P0WBF/wz9WotxVezDgWS5cfXyWEipNWeQpFa9vHQgso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfr5CmENZJI7vD33rqMhnbS4qqIhGqZcKpGojj1TgawlzBiXSrxmCutn9PzZBGYLfggYJNZ3OWWQsl3CohDqP77dpcpN90/vDazSvfEK00H6wtP1JboptE8MlwM2zYSlx9q5Ip1fVlbqa580bpbzkjGZrEuF4BHFs1Y4Yf/TfZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGyil6e3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGyil6e3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792009188; x=1823545188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P0WBF/wz9WotxVezDgWS5cfXyWEipNWeQpFa9vHQgso=;
  b=GGyil6e3wIGD2o+FvAoBn08k8L7d8eIeKgFN9Br+0ZlaeNSKGCSi0DcB
   /5LrFixiaWXRdy22WuSVaTqGUV5mKQJKAA4tCagdSjeEO1fqJxbZ9+b7s
   wbY1FldJbavMPbwa8eNUV5UOD/S49WR28OJDk4HRc7unHNFHj52/qAnhx
   MtBzH80PojrmEo8NYFXhLQX/V09RTL69ls36lNpMeyzVxCjhWSTCi5YSG
   73S080uHDG30QaWS4bsXkiWjIYz+11KhKhvXHzI8rBrhoWC3qeT7DajZn
   IiM7ZUQrJabSZYEJuSx6Pb9+62NvBuusrtihGyImj6i2GKLwmrRzvrkjX
   Q==;
X-CSE-ConnectionGUID: J8tEnhtsSOeqbaZunQB0Ww==
X-CSE-MsgGUID: 7CEeIcBkRgiRiqgqLwO4Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="667727"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="667727"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 13:19:48 -0700
X-CSE-ConnectionGUID: ZrDByyW5QbWg2CSQyYO0mA==
X-CSE-MsgGUID: BInblgMUQQqssqBcMnc3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1483915"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Oct 2026 13:19:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH5Ru-00000000FAF-2qQ2;
	Wed, 14 Oct 2026 20:19:42 +0000
Date: Thu, 15 Oct 2026 04:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
Subject: Re: [PATCH 3/3] usb: dwc3: support two connectors sharing one HS
 data bus
Message-ID: <202610150418.XE8EkA7P-lkp@intel.com>
References: <20261013102927.1141696-4-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013102927.1141696-4-xiaqinghuan@mail.ustc.edu.cn>

Hi Qianhui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v7.3-rc7 next-20261012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qianhui-Xu/dt-bindings-usb-snps-dwc3-document-usb-psy-name/20261013-182925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20261013102927.1141696-4-xiaqinghuan%40mail.ustc.edu.cn
patch subject: [PATCH 3/3] usb: dwc3: support two connectors sharing one HS data bus
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261015/202610150418.XE8EkA7P-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610150418.XE8EkA7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150418.XE8EkA7P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/core.c:171:16: warning: variable 'mux_role' set but not used [-Wunused-but-set-variable]
     171 |         enum usb_role mux_role = USB_ROLE_NONE;
         |                       ^
   1 warning generated.


vim +/mux_role +171 drivers/usb/dwc3/core.c

   165	
   166	static void __dwc3_set_mode(struct work_struct *work)
   167	{
   168		struct dwc3 *dwc = work_to_dwc(work);
   169		unsigned long flags;
   170		struct dwc3_role_mux *mux = dwc->role_mux;
 > 171		enum usb_role mux_role = USB_ROLE_NONE;
   172		int mux_port = 0;
   173		int ret;
   174		u32 reg;
   175		u32 desired_dr_role;
   176		int i;
   177	
   178		mutex_lock(&dwc->mutex);
   179		spin_lock_irqsave(&dwc->lock, flags);
   180		desired_dr_role = dwc->desired_dr_role;
   181		if (mux) {
   182			mux_port = mux->desired_port;
   183			mux_role = mux->desired_role;
   184		}
   185		spin_unlock_irqrestore(&dwc->lock, flags);
   186	
   187		if (mux && READ_ONCE(mux->error))
   188			goto out;
   189	
   190		pm_runtime_get_sync(dwc->dev);
   191	
   192		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_OTG)
   193			dwc3_otg_update(dwc, 0);
   194	
   195		if (!desired_dr_role)
   196			goto out;
   197	
   198		if (desired_dr_role == dwc->current_dr_role &&
   199		    (!mux || mux_port == mux->active_port))
   200			goto out;
   201	
   202		if (desired_dr_role == DWC3_GCTL_PRTCAP_OTG && dwc->edev)
   203			goto out;
   204	
   205		switch (dwc->current_dr_role) {
   206		case DWC3_GCTL_PRTCAP_HOST:
   207			dwc3_host_exit(dwc);
   208			break;
   209		case DWC3_GCTL_PRTCAP_DEVICE:
   210			dwc3_gadget_exit(dwc);
   211			dwc3_event_buffers_cleanup(dwc);
   212			break;
   213		case DWC3_GCTL_PRTCAP_OTG:
   214			dwc3_otg_exit(dwc);
   215			spin_lock_irqsave(&dwc->lock, flags);
   216			dwc->desired_otg_role = DWC3_OTG_ROLE_IDLE;
   217			spin_unlock_irqrestore(&dwc->lock, flags);
   218			dwc3_otg_update(dwc, 1);
   219			break;
   220		default:
   221			break;
   222		}
   223	
   224		/*
   225		 * When current_dr_role is not set, there's no role switching.
   226		 * Only perform GCTL.CoreSoftReset when there's DRD role switching.
   227		 */
   228		if (dwc->current_dr_role && ((DWC3_IP_IS(DWC3) ||
   229				DWC3_VER_IS_PRIOR(DWC31, 190A)) &&
   230				desired_dr_role != DWC3_GCTL_PRTCAP_OTG)) {
   231			reg = dwc3_readl(dwc, DWC3_GCTL);
   232			reg |= DWC3_GCTL_CORESOFTRESET;
   233			dwc3_writel(dwc, DWC3_GCTL, reg);
   234	
   235			/*
   236			 * Wait for internal clocks to synchronized. DWC_usb31 and
   237			 * DWC_usb32 may need at least 50ms (less for DWC_usb3). To
   238			 * keep it consistent across different IPs, let's wait up to
   239			 * 100ms before clearing GCTL.CORESOFTRESET.
   240			 */
   241			msleep(100);
   242	
   243			reg = dwc3_readl(dwc, DWC3_GCTL);
   244			reg &= ~DWC3_GCTL_CORESOFTRESET;
   245			dwc3_writel(dwc, DWC3_GCTL, reg);
   246		}
   247	
   248		/*
   249		 * The previous host/gadget has been torn down above, so it is safe to
   250		 * move the shared HS data path to the requesting connector.
   251		 */
   252		if (mux && mux_port != mux->active_port) {
   253			ret = gpiod_direction_output(mux->select, mux_port);
   254			if (ret) {
   255				WRITE_ONCE(mux->error, ret);
   256				goto out;
   257			}
   258	
   259			spin_lock_irqsave(&dwc->lock, flags);
   260			mux->active_port = mux_port;
   261			spin_unlock_irqrestore(&dwc->lock, flags);
   262		}
   263	
   264		spin_lock_irqsave(&dwc->lock, flags);
   265	
   266		dwc3_set_prtcap(dwc, desired_dr_role, false);
   267	
   268		spin_unlock_irqrestore(&dwc->lock, flags);
   269	
   270		switch (desired_dr_role) {
   271		case DWC3_GCTL_PRTCAP_HOST:
   272			ret = dwc3_host_init(dwc);
   273			if (ret) {
   274				dev_err(dwc->dev, "failed to initialize host\n");
   275			} else {
   276				if (dwc->usb2_phy)
   277					otg_set_vbus(dwc->usb2_phy->otg, true);
   278	
   279				for (i = 0; i < dwc->num_usb2_ports; i++)
   280					phy_set_mode(dwc->usb2_generic_phy[i], PHY_MODE_USB_HOST);
   281				for (i = 0; i < dwc->num_usb3_ports; i++)
   282					phy_set_mode(dwc->usb3_generic_phy[i], PHY_MODE_USB_HOST);
   283	
   284				if (dwc->dis_split_quirk) {
   285					reg = dwc3_readl(dwc, DWC3_GUCTL3);
   286					reg |= DWC3_GUCTL3_SPLITDISABLE;
   287					dwc3_writel(dwc, DWC3_GUCTL3, reg);
   288				}
   289			}
   290			break;
   291		case DWC3_GCTL_PRTCAP_DEVICE:
   292			dwc3_core_soft_reset(dwc);
   293	
   294			dwc3_event_buffers_setup(dwc);
   295	
   296			if (dwc->usb2_phy)
   297				otg_set_vbus(dwc->usb2_phy->otg, false);
   298			phy_set_mode(dwc->usb2_generic_phy[0], PHY_MODE_USB_DEVICE);
   299			phy_set_mode(dwc->usb3_generic_phy[0], PHY_MODE_USB_DEVICE);
   300	
   301			ret = dwc3_gadget_init(dwc);
   302			if (ret)
   303				dev_err(dwc->dev, "failed to initialize peripheral\n");
   304			break;
   305		case DWC3_GCTL_PRTCAP_OTG:
   306			dwc3_otg_init(dwc);
   307			dwc3_otg_update(dwc, 0);
   308			break;
   309		default:
   310			break;
   311		}
   312	
   313	out:
   314		pm_runtime_put_autosuspend(dwc->dev);
   315		mutex_unlock(&dwc->mutex);
   316	}
   317	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
