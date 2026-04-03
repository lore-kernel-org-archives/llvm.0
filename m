Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3B37F00A;
	Fri,  3 Apr 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205725; cv=none; b=D0Ec/7Dcqx2/rxrtQ1mloDzVsW4H3vd8+AxkXdRigERovAvUe4946/4HVsggwAg+pbZVn0T7CN+Qb8fqdlACxIB1ltD1f1PS+9rtcjN1GF20PD1HwYoKgqMvkJqjYJ7y1GyUFizgm1NrOhkWLmB4HR1vUTRN6Fk77wTCNpyIOV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205725; c=relaxed/simple;
	bh=OM7JAe9idMfjXGZ/45XJ/LV7IOy95UVMAYPkep6LA7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rSSg+OkYcD+CetBIwv2/iYIEXHWqmICwW57BMSdYkFkjR4ESlNJ3tDjuNd5V8XJ3lcC7sZ7bFECF/nihoVFBva5E/3dM//RQmZius3TSACmIGLGhGol7jHbBrGzh2lQhu7fXBANNjWYej5ffdtFj49WAIzHPZNZE0lE2XY36PNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqbEOCTG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqbEOCTG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205721; x=1806741721;
  h=date:from:to:cc:subject:message-id;
  bh=OM7JAe9idMfjXGZ/45XJ/LV7IOy95UVMAYPkep6LA7c=;
  b=eqbEOCTG4eXMppAWj9WeJK41rZqI3ipbVhA9xnfS3xg1AJuenjjPrnl6
   gesZX2/DHSFAoRVmLi7rVYw4sUyc5F8rSRSlz1zBU8+9s+hcJzA25KGLr
   Z4jyAF1DHglgF/oLpnuwYV9PXBiE1hCK8ecdgXQlREtoBMbmYV5/1iJAQ
   Sdx2rVjGAHNckbg/R8naWxHlLzGb3UIzTlu8OZDGOazyD3e79iUkbngYA
   AAqmprGY2YyfrzuRkHQdwt9JJQ8S/Jd04D7yAzw045aOuXtwSg34f3k1m
   So0dk0Avg8OFfA7bQbQSBcNiEdQeaxpiQIfMOFYqdED+afH2q9oASgCwk
   g==;
X-CSE-ConnectionGUID: d0/RqTQ1TsiNXHp2sGUi6A==
X-CSE-MsgGUID: ZRnf8Ql4SBOl+V8QSd2XPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852146"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:59 -0700
X-CSE-ConnectionGUID: uNNi8nbyQc2E0d1TtQdXQA==
X-CSE-MsgGUID: EUJPpgEhQIO6xqhXA3rnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943094"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:41:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a6E-00000000133-2uXN;
	Fri, 03 Apr 2026 08:41:54 +0000
Date: Fri, 03 Apr 2026 16:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Subject: [sailus-media-tree:pld 24/32]
 drivers/media/v4l2-core/v4l2-fwnode.c:831:3: error: call to undeclared
 function '__acpi_handle_debug'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202604022233.XxAwrVdV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git pld
head:   b8c5b499767feb946c184029ff272276a036623e
commit: 010794c2fea2ddf1d1556e40bcd97c3c3b952825 [24/32] media: v4l: fwnode: Support ACPI's _PLD for v4l2_fwnode_device_parse
config: hexagon-randconfig-001-20260402 (https://download.01.org/0day-ci/archive/20260402/202604022233.XxAwrVdV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022233.XxAwrVdV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022233.XxAwrVdV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-fwnode.c:831:3: error: call to undeclared function '__acpi_handle_debug'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     831 |                 acpi_handle_debug(ACPI_HANDLE(dev), "cannot obtain _PLD\n");
         |                 ^
   include/linux/acpi.h:1275:26: note: expanded from macro 'acpi_handle_debug'
    1275 |         _dynamic_func_call(fmt, __acpi_handle_debug,                    \
         |                                 ^
   1 error generated.


vim +/__acpi_handle_debug +831 drivers/media/v4l2-core/v4l2-fwnode.c

   820	
   821	static int v4l2_fwnode_device_parse_acpi(struct device *dev,
   822						 struct v4l2_fwnode_device_properties *props)
   823	{
   824		struct acpi_pld_info *pld;
   825		int ret = 0;
   826	
   827		if (!is_acpi_device_node(dev_fwnode(dev)))
   828			return 0;
   829	
   830		if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
 > 831			acpi_handle_debug(ACPI_HANDLE(dev), "cannot obtain _PLD\n");
   832			return 0;
   833		}
   834	
   835		if (props->orientation == V4L2_FWNODE_PROPERTY_UNSET) {
   836			switch (pld->panel) {
   837			case ACPI_PLD_PANEL_FRONT:
   838				props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
   839				break;
   840			case ACPI_PLD_PANEL_BACK:
   841				props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
   842				break;
   843			case ACPI_PLD_PANEL_TOP:
   844			case ACPI_PLD_PANEL_LEFT:
   845			case ACPI_PLD_PANEL_RIGHT:
   846			case ACPI_PLD_PANEL_UNKNOWN:
   847				props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
   848				break;
   849			default:
   850				acpi_handle_warn(ACPI_HANDLE(dev),
   851						 "invalid panel %u in _PLD\n",
   852						 pld->panel);
   853				ret = -EINVAL;
   854				goto done;
   855			}
   856		}
   857	
   858		if (props->rotation == V4L2_FWNODE_PROPERTY_UNSET) {
   859			switch (pld->rotation) {
   860			case 0 ... 7:
   861				props->rotation = pld->rotation * 45;
   862				break;
   863			default:
   864				acpi_handle_warn(ACPI_HANDLE(dev),
   865						 "invalid rotation %u in _PLD\n",
   866						 pld->rotation);
   867				ret = -EINVAL;
   868				goto done;
   869			}
   870		}
   871	
   872	done:
   873		ACPI_FREE(pld);
   874		return ret;
   875	}
   876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
