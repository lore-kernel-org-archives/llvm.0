Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ABD1C1AD6;
	Tue,  8 Oct 2024 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375708; cv=none; b=DUqpcUFXU2MOHCXQF5dBjcqzUKVINtE2MSLgSijZMj9kCECM5dJm6Nm39fgOyB4HFvgdYV3LIOz1odt8m5bmYeuFBBmFuBvdj3uaO/LOuge1n/7hBP/d+IpblK6IbQSco0orc5IntkgCMO/QrSMKVGdXoWdld/UM/LimGQDZFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375708; c=relaxed/simple;
	bh=VDpf9/wkNVw6+eD/6ygGxcYnIzmLwJk/4ULDXyGGR80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSOrx/BnCRyjjUyA0W4XhOoLf5j8UAnxoOub23qFnCECNLsJQPz2wbmvecGXoyLfRsa+8mN22BV7j3KkPllGKJvpDBohP8brmImamkQyauERzTqMexS6UGNTnYtg4TiT3r3lUlUs52aOSXGDOj9KWNDpxJEpNONl2OfEqEalVok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPE78sLv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPE78sLv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728375706; x=1759911706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VDpf9/wkNVw6+eD/6ygGxcYnIzmLwJk/4ULDXyGGR80=;
  b=MPE78sLvSyNJKa4L8eGbfo1fw4RetNdi5rUbarg2yX9djR6wjj8Y4azq
   P49PhjEn3dIzAH1ObNHbiB6T7a5arUlDfAHbib64xqeDEnVmCWYkj5QCP
   QzvAl2d5AJ6dkym/WhXHSROXdsMDhiOm87pduxVPEOuJ87Vmn2BcqMpC/
   i2+/wXv0VoqTho+mxvxc4NJgYtlDa4JQGksbgZUoZPZ2RtRcRpuv3KYU/
   2we8+MDUdApRgUXrmqqA+BJqPF74OCZnGDVwcEAufYMYqEFzfs8TtKVzY
   80KarGAFyETyFUzl94avG6F1bSGH04/YQsANKfqk3DjGQLZIDICHPxdLJ
   g==;
X-CSE-ConnectionGUID: EsWgDhOMR7m4ZDZkjuwgIA==
X-CSE-MsgGUID: SehThCmfSzKa2gqExepfEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38118282"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="38118282"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 01:21:45 -0700
X-CSE-ConnectionGUID: 7Oez9WmLSUuIu35SHXCIhw==
X-CSE-MsgGUID: 3dZ7tbTCRUqnAvtDqZvINg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; 
   d="scan'208";a="113216392"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Oct 2024 01:21:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy5TQ-00065U-1a;
	Tue, 08 Oct 2024 08:21:40 +0000
Date: Tue, 8 Oct 2024 16:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Stockhausen <markus.stockhausen@gmx.de>,
	linux-phy@lists.infradead.org, chris.packham@alliedtelesis.co.nz,
	devicetree@vger.kernel.org, krzk@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH v2 3/3] phy: Integrate Realtek Otto SerDes driver into
 build system
Message-ID: <202410081607.EKE62jfx-lkp@intel.com>
References: <20241007163623.3274510-4-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163623.3274510-4-markus.stockhausen@gmx.de>

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on krzk-dt/for-next linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Stockhausen/dt-bindings-phy-add-realtek-otto-serdes-PHY-binding/20241008-003929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241007163623.3274510-4-markus.stockhausen%40gmx.de
patch subject: [PATCH v2 3/3] phy: Integrate Realtek Otto SerDes driver into build system
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241008/202410081607.EKE62jfx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410081607.EKE62jfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410081607.EKE62jfx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/realtek/phy-rtk-otto-serdes.c:490:15: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     490 |         if (sid >= 2 || sid <= 9)
         |             ~~~~~~~~~^~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:509:15: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
     509 |         if (sid >= 2 || sid <= 9)
         |             ~~~~~~~~~^~~~~~~~~~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:686:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     686 |         if (ret)
         |             ^~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:677:9: note: initialize the variable 'ret' to silence this warning
     677 |         int ret;
         |                ^
         |                 = 0
   drivers/phy/realtek/phy-rtk-otto-serdes.c:706:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     706 |         if (ret)
         |             ^~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:697:9: note: initialize the variable 'ret' to silence this warning
     697 |         int ret;
         |                ^
         |                 = 0
   drivers/phy/realtek/phy-rtk-otto-serdes.c:723:7: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     723 |         if (!ret)
         |              ^~~
   drivers/phy/realtek/phy-rtk-otto-serdes.c:717:9: note: initialize the variable 'ret' to silence this warning
     717 |         int ret;
         |                ^
         |                 = 0
>> drivers/phy/realtek/phy-rtk-otto-serdes.c:868:1: error: incompatible function pointer types passing 'ssize_t (struct seq_file *, void *)' (aka 'long (struct seq_file *, void *)') to parameter of type 'int (*)(struct seq_file *, void *)' [-Wincompatible-function-pointer-types]
     868 | DEFINE_SHOW_STORE_ATTRIBUTE(rtsds_dbg_mode);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:223:27: note: expanded from macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     223 |         return single_open(file, __name ## _show, inode->i_private);    \
         |                                  ^~~~~~~~~~~~~~~
   <scratch space>:49:1: note: expanded from here
      49 | rtsds_dbg_mode_show
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:176:38: note: passing argument to parameter here
     176 | int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
         |                                      ^
   drivers/phy/realtek/phy-rtk-otto-serdes.c:891:1: error: incompatible function pointer types passing 'ssize_t (struct seq_file *, void *)' (aka 'long (struct seq_file *, void *)') to parameter of type 'int (*)(struct seq_file *, void *)' [-Wincompatible-function-pointer-types]
     891 | DEFINE_SHOW_STORE_ATTRIBUTE(rtsds_dbg_reset);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:223:27: note: expanded from macro 'DEFINE_SHOW_STORE_ATTRIBUTE'
     223 |         return single_open(file, __name ## _show, inode->i_private);    \
         |                                  ^~~~~~~~~~~~~~~
   <scratch space>:54:1: note: expanded from here
      54 | rtsds_dbg_reset_show
         | ^~~~~~~~~~~~~~~~~~~~
   include/linux/seq_file.h:176:38: note: passing argument to parameter here
     176 | int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
         |                                      ^
   5 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +868 drivers/phy/realtek/phy-rtk-otto-serdes.c

40f1aea80b53b8 Markus Stockhausen 2024-10-07  847  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  848  static ssize_t rtsds_dbg_mode_write(struct file *file, const char __user *userbuf,
40f1aea80b53b8 Markus Stockhausen 2024-10-07  849  				size_t count, loff_t *ppos)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  850  {
40f1aea80b53b8 Markus Stockhausen 2024-10-07  851  	struct seq_file *seqf = file->private_data;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  852  	struct rtsds_macro *macro = dev_get_drvdata(seqf->private);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  853  	struct rtsds_ctrl *ctrl = macro->ctrl;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  854  	int ret, hwmode, phymode, sid = macro->sid;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  855  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  856  	ret = kstrtou32_from_user(userbuf, count, 16, &hwmode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  857  	if (ret)
40f1aea80b53b8 Markus Stockhausen 2024-10-07  858  		return ret;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  859  	/*
40f1aea80b53b8 Markus Stockhausen 2024-10-07  860  	 * Allow to set arbitrary modes into the SerDes to improve error analysis. Accept that
40f1aea80b53b8 Markus Stockhausen 2024-10-07  861  	 * this might confuse the internal state tracking.
40f1aea80b53b8 Markus Stockhausen 2024-10-07  862  	 */
40f1aea80b53b8 Markus Stockhausen 2024-10-07  863  	phymode = rtsds_hwmode_to_phymode(ctrl, hwmode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  864  	rtsds_phy_set_mode_int(ctrl, sid, phymode, hwmode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  865  
40f1aea80b53b8 Markus Stockhausen 2024-10-07  866  	return count;
40f1aea80b53b8 Markus Stockhausen 2024-10-07  867  }
40f1aea80b53b8 Markus Stockhausen 2024-10-07 @868  DEFINE_SHOW_STORE_ATTRIBUTE(rtsds_dbg_mode);
40f1aea80b53b8 Markus Stockhausen 2024-10-07  869  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
