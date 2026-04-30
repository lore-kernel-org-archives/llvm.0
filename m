Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D54627CB35;
	Thu, 30 Apr 2026 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777517494; cv=none; b=PCRvJQTH5z7lBAKyvkg0czQ7jupVzElJsXcjmLCIRPDbzj76ikN7RZuAlJORL6Y5LEgJD1TaNdhyqtIc3SqQYZ4YPXDQ0KJdI9BwJtCg6E4lOPR26QTWoenAh155OjULzDV14tNX3D39URUibdX5zx/hXoI334r+YHlf2goAgWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777517494; c=relaxed/simple;
	bh=FbHh3GB2PMshulXjKx4DAyIytlnn95XTE/CPR5cj9f8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cKPGOwuWy62Zxh+1khXjHNpR+R8UuG+SqUQV6uuIM/WQdKHq/76PQCH0LWP+g5Z+RmDjormidNGy9ELpliDRoBuCvJ/dKf9G5QY/pQeF7aVDQUq32nzC43bXxw0TMGDuOjXeJBvr/F7zxkzwcsOMRbnBAvFsroQdYgGXRWwx/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amodr0lS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amodr0lS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777517493; x=1809053493;
  h=date:from:to:cc:subject:message-id;
  bh=FbHh3GB2PMshulXjKx4DAyIytlnn95XTE/CPR5cj9f8=;
  b=amodr0lSS5YtIuXOUqHgn3GmfCwmeX7cJue0qpSYAfVMvOKIpQJq8VUK
   +sg0wTAXgKFctKqH38wm+6yQTFOfOJ6Je6RPDwe45Umj4Q2kJ35kRSuGh
   7u0KM467phsHHRVwD6TETvaUC5dNiJ8gU8DLUFdWWzkDMew8E1iNwLwdl
   ijmtQZMVIq9pudHO384QVNcwEDnpyrJ+cna+Dq4z7XAhdpFpi4rUGkXhF
   KNf1O3fKJdqL34e+CbpZhWfZFgNbiiDaGGWDzVnNtQp9hVfeZ9mKuoION
   4HZMd1fPDMiRtNUBwEpFS+3DQnnqr3FbsowLpmS8Q4BPU6L+ftNeNSQK8
   g==;
X-CSE-ConnectionGUID: N/4rtJkZQBWul9/iMLq0QA==
X-CSE-MsgGUID: M+D7ATSMSheVaeb1+FYHlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78482997"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78482997"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 19:51:32 -0700
X-CSE-ConnectionGUID: mzEy4jJ9R/e7zlimXFLfRw==
X-CSE-MsgGUID: aDvUy+KQRVGe+vTuJDWlng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="236216127"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Apr 2026 19:51:29 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIHUt-00000000Br6-1DRg;
	Thu, 30 Apr 2026 02:51:27 +0000
Date: Thu, 30 Apr 2026 10:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Kishon <kishon@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [phy:phy_7.2 26/27] drivers/usb/dwc3/dwc3-imx.c:74:3: error:
 call to undeclared function 'device_property_read_bool'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202604301015.UEm28qTG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git phy_7.2
head:   d097a6ebab1ffe9286cca190fe74d51b01d80dc3
commit: 9ed7a91a68cbba256d1a53c353bf6c62c7e056f0 [26/27] phy: remove temporary provider compatibility from consumer header
config: arm64-randconfig-003-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301015.UEm28qTG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301015.UEm28qTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301015.UEm28qTG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-imx.c:74:3: error: call to undeclared function 'device_property_read_bool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |                 device_property_read_bool(dev, "fsl,permanently-attached");
         |                 ^
>> drivers/usb/dwc3/dwc3-imx.c:184:55: error: array has incomplete element type 'const struct property_entry'
     184 | static const struct property_entry dwc3_imx_properties[] = {
         |                                                       ^
   include/linux/platform_device.h:20:8: note: forward declaration of 'struct property_entry'
      20 | struct property_entry;
         |        ^
>> drivers/usb/dwc3/dwc3-imx.c:185:2: error: call to undeclared function 'PROPERTY_ENTRY_BOOL'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     185 |         PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
         |         ^
>> drivers/usb/dwc3/dwc3-imx.c:190:35: error: variable has incomplete type 'const struct software_node'
     190 | static const struct software_node dwc3_imx_swnode = {
         |                                   ^
   include/linux/platform_device.h:166:15: note: forward declaration of 'struct software_node'
     166 |         const struct software_node *swnode;
         |                      ^
>> drivers/usb/dwc3/dwc3-imx.c:255:8: error: call to undeclared function 'device_add_software_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |         ret = device_add_software_node(dev, &dwc3_imx_swnode);
         |               ^
   drivers/usb/dwc3/dwc3-imx.c:255:8: note: did you mean 'device_add_of_node'?
   include/linux/device.h:1217:5: note: 'device_add_of_node' declared here
    1217 | int device_add_of_node(struct device *dev, struct device_node *of_node);
         |     ^
>> drivers/usb/dwc3/dwc3-imx.c:272:3: error: call to undeclared function 'device_remove_software_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     272 |                 device_remove_software_node(dev);
         |                 ^
   drivers/usb/dwc3/dwc3-imx.c:286:2: error: call to undeclared function 'device_remove_software_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |         device_remove_software_node(dev);
         |         ^
   7 errors generated.


vim +/device_property_read_bool +74 drivers/usb/dwc3/dwc3-imx.c

76fc9452a6bfb6 Xu Yang 2026-02-12   68  
76fc9452a6bfb6 Xu Yang 2026-02-12   69  static void dwc3_imx_get_property(struct dwc3_imx *dwc_imx)
76fc9452a6bfb6 Xu Yang 2026-02-12   70  {
76fc9452a6bfb6 Xu Yang 2026-02-12   71  	struct device	*dev = dwc_imx->dev;
76fc9452a6bfb6 Xu Yang 2026-02-12   72  
76fc9452a6bfb6 Xu Yang 2026-02-12   73  	dwc_imx->permanent_attached =
76fc9452a6bfb6 Xu Yang 2026-02-12  @74  		device_property_read_bool(dev, "fsl,permanently-attached");
76fc9452a6bfb6 Xu Yang 2026-02-12   75  	dwc_imx->disable_pwr_ctrl =
76fc9452a6bfb6 Xu Yang 2026-02-12   76  		device_property_read_bool(dev, "fsl,disable-port-power-control");
76fc9452a6bfb6 Xu Yang 2026-02-12   77  	dwc_imx->overcur_active_low =
76fc9452a6bfb6 Xu Yang 2026-02-12   78  		device_property_read_bool(dev, "fsl,over-current-active-low");
76fc9452a6bfb6 Xu Yang 2026-02-12   79  	dwc_imx->power_active_low =
76fc9452a6bfb6 Xu Yang 2026-02-12   80  		device_property_read_bool(dev, "fsl,power-active-low");
76fc9452a6bfb6 Xu Yang 2026-02-12   81  }
76fc9452a6bfb6 Xu Yang 2026-02-12   82  
76fc9452a6bfb6 Xu Yang 2026-02-12   83  static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
76fc9452a6bfb6 Xu Yang 2026-02-12   84  {
76fc9452a6bfb6 Xu Yang 2026-02-12   85  	u32		value;
76fc9452a6bfb6 Xu Yang 2026-02-12   86  
76fc9452a6bfb6 Xu Yang 2026-02-12   87  	if (!dwc_imx->glue_base)
76fc9452a6bfb6 Xu Yang 2026-02-12   88  		return;
76fc9452a6bfb6 Xu Yang 2026-02-12   89  
76fc9452a6bfb6 Xu Yang 2026-02-12   90  	value = readl(dwc_imx->glue_base + USB_CTRL0);
76fc9452a6bfb6 Xu Yang 2026-02-12   91  
76fc9452a6bfb6 Xu Yang 2026-02-12   92  	if (dwc_imx->permanent_attached)
76fc9452a6bfb6 Xu Yang 2026-02-12   93  		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
76fc9452a6bfb6 Xu Yang 2026-02-12   94  	else
76fc9452a6bfb6 Xu Yang 2026-02-12   95  		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
76fc9452a6bfb6 Xu Yang 2026-02-12   96  
76fc9452a6bfb6 Xu Yang 2026-02-12   97  	if (dwc_imx->disable_pwr_ctrl)
76fc9452a6bfb6 Xu Yang 2026-02-12   98  		value &= ~USB_CTRL0_PORTPWR_EN;
76fc9452a6bfb6 Xu Yang 2026-02-12   99  	else
76fc9452a6bfb6 Xu Yang 2026-02-12  100  		value |= USB_CTRL0_PORTPWR_EN;
76fc9452a6bfb6 Xu Yang 2026-02-12  101  
76fc9452a6bfb6 Xu Yang 2026-02-12  102  	writel(value, dwc_imx->glue_base + USB_CTRL0);
76fc9452a6bfb6 Xu Yang 2026-02-12  103  
76fc9452a6bfb6 Xu Yang 2026-02-12  104  	value = readl(dwc_imx->glue_base + USB_CTRL1);
76fc9452a6bfb6 Xu Yang 2026-02-12  105  	if (dwc_imx->overcur_active_low)
76fc9452a6bfb6 Xu Yang 2026-02-12  106  		value |= USB_CTRL1_OC_POLARITY;
76fc9452a6bfb6 Xu Yang 2026-02-12  107  	else
76fc9452a6bfb6 Xu Yang 2026-02-12  108  		value &= ~USB_CTRL1_OC_POLARITY;
76fc9452a6bfb6 Xu Yang 2026-02-12  109  
76fc9452a6bfb6 Xu Yang 2026-02-12  110  	if (dwc_imx->power_active_low)
76fc9452a6bfb6 Xu Yang 2026-02-12  111  		value |= USB_CTRL1_PWR_POLARITY;
76fc9452a6bfb6 Xu Yang 2026-02-12  112  	else
76fc9452a6bfb6 Xu Yang 2026-02-12  113  		value &= ~USB_CTRL1_PWR_POLARITY;
76fc9452a6bfb6 Xu Yang 2026-02-12  114  
76fc9452a6bfb6 Xu Yang 2026-02-12  115  	writel(value, dwc_imx->glue_base + USB_CTRL1);
76fc9452a6bfb6 Xu Yang 2026-02-12  116  }
76fc9452a6bfb6 Xu Yang 2026-02-12  117  
76fc9452a6bfb6 Xu Yang 2026-02-12  118  static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
76fc9452a6bfb6 Xu Yang 2026-02-12  119  {
76fc9452a6bfb6 Xu Yang 2026-02-12  120  	struct dwc3	*dwc = &dwc_imx->dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  121  	u32		val;
76fc9452a6bfb6 Xu Yang 2026-02-12  122  
76fc9452a6bfb6 Xu Yang 2026-02-12  123  	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
76fc9452a6bfb6 Xu Yang 2026-02-12  124  
76fc9452a6bfb6 Xu Yang 2026-02-12  125  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
76fc9452a6bfb6 Xu Yang 2026-02-12  126  		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
76fc9452a6bfb6 Xu Yang 2026-02-12  127  		if (PMSG_IS_AUTO(msg))
76fc9452a6bfb6 Xu Yang 2026-02-12  128  			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
76fc9452a6bfb6 Xu Yang 2026-02-12  129  	} else {
76fc9452a6bfb6 Xu Yang 2026-02-12  130  		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
76fc9452a6bfb6 Xu Yang 2026-02-12  131  		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
76fc9452a6bfb6 Xu Yang 2026-02-12  132  	}
76fc9452a6bfb6 Xu Yang 2026-02-12  133  
76fc9452a6bfb6 Xu Yang 2026-02-12  134  	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
76fc9452a6bfb6 Xu Yang 2026-02-12  135  }
76fc9452a6bfb6 Xu Yang 2026-02-12  136  
76fc9452a6bfb6 Xu Yang 2026-02-12  137  static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
76fc9452a6bfb6 Xu Yang 2026-02-12  138  {
76fc9452a6bfb6 Xu Yang 2026-02-12  139  	u32	val;
76fc9452a6bfb6 Xu Yang 2026-02-12  140  
76fc9452a6bfb6 Xu Yang 2026-02-12  141  	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
76fc9452a6bfb6 Xu Yang 2026-02-12  142  	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
76fc9452a6bfb6 Xu Yang 2026-02-12  143  	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
76fc9452a6bfb6 Xu Yang 2026-02-12  144  }
76fc9452a6bfb6 Xu Yang 2026-02-12  145  
76fc9452a6bfb6 Xu Yang 2026-02-12  146  static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
76fc9452a6bfb6 Xu Yang 2026-02-12  147  {
76fc9452a6bfb6 Xu Yang 2026-02-12  148  	struct dwc3_imx	*dwc_imx = data;
76fc9452a6bfb6 Xu Yang 2026-02-12  149  	struct dwc3	*dwc = &dwc_imx->dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  150  
76fc9452a6bfb6 Xu Yang 2026-02-12  151  	if (!dwc_imx->pm_suspended)
76fc9452a6bfb6 Xu Yang 2026-02-12  152  		return IRQ_HANDLED;
76fc9452a6bfb6 Xu Yang 2026-02-12  153  
76fc9452a6bfb6 Xu Yang 2026-02-12  154  	disable_irq_nosync(dwc_imx->irq);
76fc9452a6bfb6 Xu Yang 2026-02-12  155  	dwc_imx->wakeup_pending = true;
76fc9452a6bfb6 Xu Yang 2026-02-12  156  
76fc9452a6bfb6 Xu Yang 2026-02-12  157  	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
76fc9452a6bfb6 Xu Yang 2026-02-12  158  		pm_runtime_resume(&dwc->xhci->dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  159  	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
76fc9452a6bfb6 Xu Yang 2026-02-12  160  		pm_runtime_get(dwc->dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  161  
76fc9452a6bfb6 Xu Yang 2026-02-12  162  	return IRQ_HANDLED;
76fc9452a6bfb6 Xu Yang 2026-02-12  163  }
76fc9452a6bfb6 Xu Yang 2026-02-12  164  
76fc9452a6bfb6 Xu Yang 2026-02-12  165  static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
76fc9452a6bfb6 Xu Yang 2026-02-12  166  {
76fc9452a6bfb6 Xu Yang 2026-02-12  167  	if (role == USB_ROLE_HOST)
76fc9452a6bfb6 Xu Yang 2026-02-12  168  		/*
76fc9452a6bfb6 Xu Yang 2026-02-12  169  		 * For xhci host, we need disable dwc core auto
76fc9452a6bfb6 Xu Yang 2026-02-12  170  		 * suspend, because during this auto suspend delay(5s),
76fc9452a6bfb6 Xu Yang 2026-02-12  171  		 * xhci host RUN_STOP is cleared and wakeup is not
76fc9452a6bfb6 Xu Yang 2026-02-12  172  		 * enabled, if device is inserted, xhci host can't
76fc9452a6bfb6 Xu Yang 2026-02-12  173  		 * response the connection.
76fc9452a6bfb6 Xu Yang 2026-02-12  174  		 */
76fc9452a6bfb6 Xu Yang 2026-02-12  175  		pm_runtime_dont_use_autosuspend(dwc->dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  176  	else
76fc9452a6bfb6 Xu Yang 2026-02-12  177  		pm_runtime_use_autosuspend(dwc->dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  178  }
76fc9452a6bfb6 Xu Yang 2026-02-12  179  
76fc9452a6bfb6 Xu Yang 2026-02-12  180  static struct dwc3_glue_ops dwc3_imx_glue_ops = {
76fc9452a6bfb6 Xu Yang 2026-02-12  181  	.pre_set_role = dwc3_imx_pre_set_role,
76fc9452a6bfb6 Xu Yang 2026-02-12  182  };
76fc9452a6bfb6 Xu Yang 2026-02-12  183  
76fc9452a6bfb6 Xu Yang 2026-02-12 @184  static const struct property_entry dwc3_imx_properties[] = {
76fc9452a6bfb6 Xu Yang 2026-02-12 @185  	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
76fc9452a6bfb6 Xu Yang 2026-02-12  186  	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
76fc9452a6bfb6 Xu Yang 2026-02-12  187  	{},
76fc9452a6bfb6 Xu Yang 2026-02-12  188  };
76fc9452a6bfb6 Xu Yang 2026-02-12  189  
76fc9452a6bfb6 Xu Yang 2026-02-12 @190  static const struct software_node dwc3_imx_swnode = {
76fc9452a6bfb6 Xu Yang 2026-02-12  191  	.properties = dwc3_imx_properties,
76fc9452a6bfb6 Xu Yang 2026-02-12  192  };
76fc9452a6bfb6 Xu Yang 2026-02-12  193  
76fc9452a6bfb6 Xu Yang 2026-02-12  194  static int dwc3_imx_probe(struct platform_device *pdev)
76fc9452a6bfb6 Xu Yang 2026-02-12  195  {
76fc9452a6bfb6 Xu Yang 2026-02-12  196  	struct device		*dev = &pdev->dev;
76fc9452a6bfb6 Xu Yang 2026-02-12  197  	struct dwc3_imx		*dwc_imx;
76fc9452a6bfb6 Xu Yang 2026-02-12  198  	struct dwc3		*dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  199  	struct resource		*res;
76fc9452a6bfb6 Xu Yang 2026-02-12  200  	const char		*irq_name;
76fc9452a6bfb6 Xu Yang 2026-02-12  201  	struct dwc3_probe_data	probe_data = {};
76fc9452a6bfb6 Xu Yang 2026-02-12  202  	int			ret, irq;
76fc9452a6bfb6 Xu Yang 2026-02-12  203  
76fc9452a6bfb6 Xu Yang 2026-02-12  204  	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
76fc9452a6bfb6 Xu Yang 2026-02-12  205  	if (!dwc_imx)
76fc9452a6bfb6 Xu Yang 2026-02-12  206  		return -ENOMEM;
76fc9452a6bfb6 Xu Yang 2026-02-12  207  
76fc9452a6bfb6 Xu Yang 2026-02-12  208  	platform_set_drvdata(pdev, dwc_imx);
76fc9452a6bfb6 Xu Yang 2026-02-12  209  	dwc_imx->dev = dev;
76fc9452a6bfb6 Xu Yang 2026-02-12  210  
76fc9452a6bfb6 Xu Yang 2026-02-12  211  	dwc3_imx_get_property(dwc_imx);
76fc9452a6bfb6 Xu Yang 2026-02-12  212  
76fc9452a6bfb6 Xu Yang 2026-02-12  213  	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
76fc9452a6bfb6 Xu Yang 2026-02-12  214  	if (IS_ERR(dwc_imx->blkctl_base))
76fc9452a6bfb6 Xu Yang 2026-02-12  215  		return PTR_ERR(dwc_imx->blkctl_base);
76fc9452a6bfb6 Xu Yang 2026-02-12  216  
76fc9452a6bfb6 Xu Yang 2026-02-12  217  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
76fc9452a6bfb6 Xu Yang 2026-02-12  218  	if (!res) {
76fc9452a6bfb6 Xu Yang 2026-02-12  219  		dev_warn(dev, "Base address for glue layer missing\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  220  	} else {
76fc9452a6bfb6 Xu Yang 2026-02-12  221  		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
76fc9452a6bfb6 Xu Yang 2026-02-12  222  		if (IS_ERR(dwc_imx->glue_base))
76fc9452a6bfb6 Xu Yang 2026-02-12  223  			return PTR_ERR(dwc_imx->glue_base);
76fc9452a6bfb6 Xu Yang 2026-02-12  224  	}
76fc9452a6bfb6 Xu Yang 2026-02-12  225  
76fc9452a6bfb6 Xu Yang 2026-02-12  226  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
76fc9452a6bfb6 Xu Yang 2026-02-12  227  	if (!res)
76fc9452a6bfb6 Xu Yang 2026-02-12  228  		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  229  
76fc9452a6bfb6 Xu Yang 2026-02-12  230  	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
76fc9452a6bfb6 Xu Yang 2026-02-12  231  	if (IS_ERR(dwc_imx->hsio_clk))
76fc9452a6bfb6 Xu Yang 2026-02-12  232  		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
76fc9452a6bfb6 Xu Yang 2026-02-12  233  				     "Failed to get hsio clk\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  234  
76fc9452a6bfb6 Xu Yang 2026-02-12  235  	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
76fc9452a6bfb6 Xu Yang 2026-02-12  236  	if (IS_ERR(dwc_imx->suspend_clk))
76fc9452a6bfb6 Xu Yang 2026-02-12  237  		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
76fc9452a6bfb6 Xu Yang 2026-02-12  238  				     "Failed to get suspend clk\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  239  
76fc9452a6bfb6 Xu Yang 2026-02-12  240  	irq = platform_get_irq_byname(pdev, "wakeup");
76fc9452a6bfb6 Xu Yang 2026-02-12  241  	if (irq < 0)
76fc9452a6bfb6 Xu Yang 2026-02-12  242  		return irq;
76fc9452a6bfb6 Xu Yang 2026-02-12  243  	dwc_imx->irq = irq;
76fc9452a6bfb6 Xu Yang 2026-02-12  244  
76fc9452a6bfb6 Xu Yang 2026-02-12  245  	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
76fc9452a6bfb6 Xu Yang 2026-02-12  246  	if (!irq_name)
76fc9452a6bfb6 Xu Yang 2026-02-12  247  		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  248  
76fc9452a6bfb6 Xu Yang 2026-02-12  249  	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
76fc9452a6bfb6 Xu Yang 2026-02-12  250  					IRQF_ONESHOT | IRQF_NO_AUTOEN,
76fc9452a6bfb6 Xu Yang 2026-02-12  251  					irq_name, dwc_imx);
76fc9452a6bfb6 Xu Yang 2026-02-12  252  	if (ret)
76fc9452a6bfb6 Xu Yang 2026-02-12  253  		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
76fc9452a6bfb6 Xu Yang 2026-02-12  254  
76fc9452a6bfb6 Xu Yang 2026-02-12 @255  	ret = device_add_software_node(dev, &dwc3_imx_swnode);
76fc9452a6bfb6 Xu Yang 2026-02-12  256  	if (ret)
76fc9452a6bfb6 Xu Yang 2026-02-12  257  		return dev_err_probe(dev, ret, "failed to add software node\n");
76fc9452a6bfb6 Xu Yang 2026-02-12  258  
76fc9452a6bfb6 Xu Yang 2026-02-12  259  	dwc3_imx_configure_glue(dwc_imx);
76fc9452a6bfb6 Xu Yang 2026-02-12  260  
76fc9452a6bfb6 Xu Yang 2026-02-12  261  	dwc = &dwc_imx->dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  262  	dwc->dev = dev;
76fc9452a6bfb6 Xu Yang 2026-02-12  263  	dwc->glue_ops = &dwc3_imx_glue_ops;
76fc9452a6bfb6 Xu Yang 2026-02-12  264  
76fc9452a6bfb6 Xu Yang 2026-02-12  265  	probe_data.res = res;
76fc9452a6bfb6 Xu Yang 2026-02-12  266  	probe_data.dwc = dwc;
76fc9452a6bfb6 Xu Yang 2026-02-12  267  	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
76fc9452a6bfb6 Xu Yang 2026-02-12  268  	probe_data.properties.needs_full_reinit = true;
76fc9452a6bfb6 Xu Yang 2026-02-12  269  
76fc9452a6bfb6 Xu Yang 2026-02-12  270  	ret = dwc3_core_probe(&probe_data);
76fc9452a6bfb6 Xu Yang 2026-02-12  271  	if (ret) {
76fc9452a6bfb6 Xu Yang 2026-02-12 @272  		device_remove_software_node(dev);
76fc9452a6bfb6 Xu Yang 2026-02-12  273  		return ret;
76fc9452a6bfb6 Xu Yang 2026-02-12  274  	}
76fc9452a6bfb6 Xu Yang 2026-02-12  275  
76fc9452a6bfb6 Xu Yang 2026-02-12  276  	device_set_wakeup_capable(dev, true);
76fc9452a6bfb6 Xu Yang 2026-02-12  277  	return 0;
76fc9452a6bfb6 Xu Yang 2026-02-12  278  }
76fc9452a6bfb6 Xu Yang 2026-02-12  279  

:::::: The code at line 74 was first introduced by commit
:::::: 76fc9452a6bfb63a297fa0410d5368a691ed411b usb: dwc3: introduce flatten model driver of i.MX Soc

:::::: TO: Xu Yang <xu.yang_2@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
