Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF83C273D6D;
	Sat, 11 Apr 2026 01:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775871657; cv=none; b=KGPs/UScYNanLBG7Tospe9Aaj8iwaSOObLZxQJLko3MYCya7NWSXgz0/K1aGfRHv2+koPno7mofVcZr2AfliZxEYLUtN3HIo1+/wKqLdVzi156RSaSTUY1j3pEOHRN2TXpbURsdnTBr5ee4VTHNmTD+4mUT73oKVJDRY/Wde+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775871657; c=relaxed/simple;
	bh=0U5WzvMh4iUY/cJt5Tr7FwpenbOKGlYGsRwooH6SzHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CLr1u16LwUwxFW81h5xIVu6ZNJHo2sFiwps/0qlwyqq8bp3ma6USvkBHvk2zGZI8+1yp94SXDV5dbASaEa9vw+FsDoe/fQO4jtLF3X8uWqBWubJTKNb20G8Kqp5ox2+YO+EN9PogKVUBT0ssjMoFjxGGUv+dqd5YLE9XegXm6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Osw613ds; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Osw613ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775871656; x=1807407656;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0U5WzvMh4iUY/cJt5Tr7FwpenbOKGlYGsRwooH6SzHQ=;
  b=Osw613ds/vU2NsKk/4Bf+TX8ouWmrWrH1c9SmNIF/QT7gE3170GWr0AT
   Rbu9XL0NHRPVfm30zTJ31N0hh/YxWGwgoWD4brUKX264gCPvj6iqYt7LD
   ikdEsLREULLnwBou/HeEhpvIsKm0W491uKSAjzfBq6dW5PGDHkofSKmlW
   IoOseQrycCZWLutuGWLtcN6qYwrZVoIMGZ+h6iRuT+JRebTeRSjbDhykN
   CaMxm81qHfMW3BxFKFLdVrRZKDp3nmqlFgyPVEu9Cp/h6dHzZ53kvIb8o
   t2BM+jggt+VRsk4neaMtmxEJTtopi/uPNOLtNnSoTNe+moDifiukU8tcr
   w==;
X-CSE-ConnectionGUID: d2Dev88LQxywcLhxp6dLGQ==
X-CSE-MsgGUID: slxZDnaHQfmvOCwtAMDqdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87187387"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87187387"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 18:40:54 -0700
X-CSE-ConnectionGUID: NuddFSYuQtqdzqcmQMazNQ==
X-CSE-MsgGUID: XiHLW7ohRJiHqDo/XkIIJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="230988206"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2026 18:40:51 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBNL7-000000000ap-1nyp;
	Sat, 11 Apr 2026 01:40:49 +0000
Date: Sat, 11 Apr 2026 09:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 15/38] drivers/ptp/ptp_vmclock.c:687:5:
 warning: format specifies type 'unsigned long long' but the argument has type
 'resource_size_t' (aka 'unsigned int')
Message-ID: <202604110913.TD4h4vVK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git clea=
nups
head:   4f7b68811bb6be347b794010429e839e7a23b9d8
commit: 7fb0a26394a1f8378dcf335ea5ad47d32621e080 [15/38] ptp: ptp_vmclock: =
Replace get_cycles() usage
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260411/20=
2604110913.TD4h4vVK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260411/202604110913.TD4h4vVK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110913.TD4h4vVK-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c:78:11: error: __int128 is not supported on thi=
s target
      78 |         unsigned __int128 res =3D (unsigned __int128)delta * per=
iod;
         |                  ^
   drivers/ptp/ptp_vmclock.c:78:36: error: __int128 is not supported on thi=
s target
      78 |         unsigned __int128 res =3D (unsigned __int128)delta * per=
iod;
         |                                           ^
>> drivers/ptp/ptp_vmclock.c:687:5: warning: format specifies type 'unsigne=
d long long' but the argument has type 'resource_size_t' (aka 'unsigned int=
') [-Wformat]
     686 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                                                    ~~~~
         |                                                    %x
     687 |                          resource_size(&st->res));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt=
(fmt), ##__VA_ARGS__)
         |                                                                 =
 ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk=
_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);               =
        \
         |                              ~~~    ^~~~~~~~~~~
   1 warning and 2 errors generated.


vim +687 drivers/ptp/ptp_vmclock.c

20503272422693 David Woodhouse  2024-10-06  662 =20
20503272422693 David Woodhouse  2024-10-06  663  static int vmclock_probe(s=
truct platform_device *pdev)
20503272422693 David Woodhouse  2024-10-06  664  {
20503272422693 David Woodhouse  2024-10-06  665  	struct device *dev =3D &p=
dev->dev;
20503272422693 David Woodhouse  2024-10-06  666  	struct vmclock_state *st;
20503272422693 David Woodhouse  2024-10-06  667  	int ret;
20503272422693 David Woodhouse  2024-10-06  668 =20
20503272422693 David Woodhouse  2024-10-06  669  	st =3D devm_kzalloc(dev, =
sizeof(*st), GFP_KERNEL);
20503272422693 David Woodhouse  2024-10-06  670  	if (!st)
20503272422693 David Woodhouse  2024-10-06  671  		return -ENOMEM;
20503272422693 David Woodhouse  2024-10-06  672 =20
ac1e7404924cb4 David Woodhouse  2026-01-30  673  #if IS_ENABLED(CONFIG_ACPI)
20503272422693 David Woodhouse  2024-10-06  674  	if (has_acpi_companion(de=
v))
20503272422693 David Woodhouse  2024-10-06  675  		ret =3D vmclock_probe_ac=
pi(dev, st);
20503272422693 David Woodhouse  2024-10-06  676  	else
ac1e7404924cb4 David Woodhouse  2026-01-30  677  #endif
ddc867d0b5db6f David Woodhouse  2026-01-30  678  		ret =3D vmclock_probe_dt=
(dev, st);
20503272422693 David Woodhouse  2024-10-06  679 =20
20503272422693 David Woodhouse  2024-10-06  680  	if (ret) {
20503272422693 David Woodhouse  2024-10-06  681  		dev_info(dev, "Failed to=
 obtain physical address: %d\n", ret);
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  682  		return ret;
20503272422693 David Woodhouse  2024-10-06  683  	}
20503272422693 David Woodhouse  2024-10-06  684 =20
20503272422693 David Woodhouse  2024-10-06  685  	if (resource_size(&st->re=
s) < VMCLOCK_MIN_SIZE) {
20503272422693 David Woodhouse  2024-10-06  686  		dev_info(dev, "Region to=
o small (0x%llx)\n",
20503272422693 David Woodhouse  2024-10-06 @687  			 resource_size(&st->res=
));
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  688  		return -EINVAL;
20503272422693 David Woodhouse  2024-10-06  689  	}
20503272422693 David Woodhouse  2024-10-06  690  	st->clk =3D devm_memremap=
(dev, st->res.start, resource_size(&st->res),
20503272422693 David Woodhouse  2024-10-06  691  				MEMREMAP_WB | MEMREMAP=
_DEC);
20503272422693 David Woodhouse  2024-10-06  692  	if (IS_ERR(st->clk)) {
20503272422693 David Woodhouse  2024-10-06  693  		ret =3D PTR_ERR(st->clk);
20503272422693 David Woodhouse  2024-10-06  694  		dev_info(dev, "failed to=
 map shared memory\n");
20503272422693 David Woodhouse  2024-10-06  695  		st->clk =3D NULL;
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  696  		return ret;
20503272422693 David Woodhouse  2024-10-06  697  	}
20503272422693 David Woodhouse  2024-10-06  698 =20
20503272422693 David Woodhouse  2024-10-06  699  	if (le32_to_cpu(st->clk->=
magic) !=3D VMCLOCK_MAGIC ||
20503272422693 David Woodhouse  2024-10-06  700  	    le32_to_cpu(st->clk->=
size) > resource_size(&st->res) ||
20503272422693 David Woodhouse  2024-10-06  701  	    le16_to_cpu(st->clk->=
version) !=3D 1) {
20503272422693 David Woodhouse  2024-10-06  702  		dev_info(dev, "vmclock m=
agic fields invalid\n");
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  703  		return -EINVAL;
20503272422693 David Woodhouse  2024-10-06  704  	}
20503272422693 David Woodhouse  2024-10-06  705 =20
20503272422693 David Woodhouse  2024-10-06  706  	ret =3D ida_alloc(&vmcloc=
k_ida, GFP_KERNEL);
20503272422693 David Woodhouse  2024-10-06  707  	if (ret < 0)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  708  		return ret;
20503272422693 David Woodhouse  2024-10-06  709 =20
20503272422693 David Woodhouse  2024-10-06  710  	st->index =3D ret;
20503272422693 David Woodhouse  2024-10-06  711  	ret =3D devm_add_action_o=
r_reset(&pdev->dev, vmclock_put_idx, st);
20503272422693 David Woodhouse  2024-10-06  712  	if (ret)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  713  		return ret;
20503272422693 David Woodhouse  2024-10-06  714 =20
20503272422693 David Woodhouse  2024-10-06  715  	st->name =3D devm_kasprin=
tf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  716  	if (!st->name)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  717  		return -ENOMEM;
20503272422693 David Woodhouse  2024-10-06  718 =20
39e926c3a21b25 Thomas Wei=C3=9Fschuh 2025-02-07  719  	st->miscdev.minor =
=3D MISC_DYNAMIC_MINOR;
39e926c3a21b25 Thomas Wei=C3=9Fschuh 2025-02-07  720 =20
3b1526ddb25452 Babis Chalios    2026-01-30  721  	init_waitqueue_head(&st->=
disrupt_wait);
3b1526ddb25452 Babis Chalios    2026-01-30  722  	dev->driver_data =3D st;
3b1526ddb25452 Babis Chalios    2026-01-30  723 =20
3b1526ddb25452 Babis Chalios    2026-01-30  724  	ret =3D devm_add_action_o=
r_reset(&pdev->dev, vmclock_remove, dev);
3b1526ddb25452 Babis Chalios    2026-01-30  725  	if (ret)
3b1526ddb25452 Babis Chalios    2026-01-30  726  		return ret;
3b1526ddb25452 Babis Chalios    2026-01-30  727 =20
3b1526ddb25452 Babis Chalios    2026-01-30  728  	ret =3D vmclock_setup_not=
ification(dev, st);
9a884c3800b207 Thomas Wei=C3=9Fschuh 2025-02-07  729  	if (ret)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  730  		return ret;
9a884c3800b207 Thomas Wei=C3=9Fschuh 2025-02-07  731 =20
20503272422693 David Woodhouse  2024-10-06  732  	/*
20503272422693 David Woodhouse  2024-10-06  733  	 * If the structure is bi=
g enough, it can be mapped to userspace.
20503272422693 David Woodhouse  2024-10-06  734  	 * Theoretically a guest =
OS even using larger pages could still
20503272422693 David Woodhouse  2024-10-06  735  	 * use 4KiB PTEs to map s=
maller MMIO regions like this, but let's
20503272422693 David Woodhouse  2024-10-06  736  	 * cross that bridge if/w=
hen we come to it.
20503272422693 David Woodhouse  2024-10-06  737  	 */
20503272422693 David Woodhouse  2024-10-06  738  	if (le32_to_cpu(st->clk->=
size) >=3D PAGE_SIZE) {
20503272422693 David Woodhouse  2024-10-06  739  		st->miscdev.fops =3D &vm=
clock_miscdev_fops;
20503272422693 David Woodhouse  2024-10-06  740  		st->miscdev.name =3D st-=
>name;
20503272422693 David Woodhouse  2024-10-06  741 =20
20503272422693 David Woodhouse  2024-10-06  742  		ret =3D misc_register(&s=
t->miscdev);
20503272422693 David Woodhouse  2024-10-06  743  		if (ret)
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  744  			return ret;
20503272422693 David Woodhouse  2024-10-06  745  	}
20503272422693 David Woodhouse  2024-10-06  746 =20
20503272422693 David Woodhouse  2024-10-06  747  	/* If there is valid cloc=
k information, register a PTP clock */
20503272422693 David Woodhouse  2024-10-06  748  	if (VMCLOCK_FIELD_PRESENT=
(st->clk, time_frac_sec)) {
20503272422693 David Woodhouse  2024-10-06  749  		/* Can return a silent N=
ULL, or an error. */
20503272422693 David Woodhouse  2024-10-06  750  		st->ptp_clock =3D vmcloc=
k_ptp_register(dev, st);
20503272422693 David Woodhouse  2024-10-06  751  		if (IS_ERR(st->ptp_clock=
)) {
20503272422693 David Woodhouse  2024-10-06  752  			ret =3D PTR_ERR(st->ptp=
_clock);
20503272422693 David Woodhouse  2024-10-06  753  			st->ptp_clock =3D NULL;
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  754  			return ret;
20503272422693 David Woodhouse  2024-10-06  755  		}
20503272422693 David Woodhouse  2024-10-06  756  	}
20503272422693 David Woodhouse  2024-10-06  757 =20
20503272422693 David Woodhouse  2024-10-06  758  	if (!st->miscdev.minor &&=
 !st->ptp_clock) {
20503272422693 David Woodhouse  2024-10-06  759  		/* Neither miscdev nor P=
TP registered */
20503272422693 David Woodhouse  2024-10-06  760  		dev_info(dev, "vmclock: =
Neither miscdev nor PTP available; not registering\n");
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  761  		return -ENODEV;
20503272422693 David Woodhouse  2024-10-06  762  	}
20503272422693 David Woodhouse  2024-10-06  763 =20
20503272422693 David Woodhouse  2024-10-06  764  	dev_info(dev, "%s: regist=
ered %s%s%s\n", st->name,
20503272422693 David Woodhouse  2024-10-06  765  		 st->miscdev.minor ? "mi=
scdev" : "",
20503272422693 David Woodhouse  2024-10-06  766  		 (st->miscdev.minor && s=
t->ptp_clock) ? ", " : "",
20503272422693 David Woodhouse  2024-10-06  767  		 st->ptp_clock ? "PTP" :=
 "");
20503272422693 David Woodhouse  2024-10-06  768 =20
b4c1fde5ced93d Thomas Wei=C3=9Fschuh 2025-02-07  769  	return 0;
20503272422693 David Woodhouse  2024-10-06  770  }
20503272422693 David Woodhouse  2024-10-06  771 =20

:::::: The code at line 687 was first introduced by commit
:::::: 20503272422693d793b84f88bf23fe4e955d3a33 ptp: Add support for the AM=
ZNC10C 'vmclock' device

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
