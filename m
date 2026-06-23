Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63413318EE2;
	Tue, 23 Jun 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220653; cv=none; b=WsLrnOiRqk4bHVb0DZWZUDXASFvFmHPxeqFNH21JIfnAkZlTNq2S3fsds/ZiK8+eCA0+Q2zpticqP5z9M+D9x5/GJ1WkTIpXq8Uc8TFYguClzUknn+vx9FVehawFaBb3DQAUNDSA1SxJe0anxrnMo1TrPiLGn6nn+iEn9bV1J0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220653; c=relaxed/simple;
	bh=bF1W3tRSGWOjuxXT3L9B99cQpZWU4sHqObEwLhfjZ4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bACpinud/y+++HEH/LFHLup4LSh0dDC10dMkF5a2qBMm5RN7SkfymqE1EfZdqOW1YW5aVPStGmle/7GJvd/SnYWc1gCGFHOO1PW68lnbfllckR5KyB5N0uVmCpkvGXXxaIHMukNy5q1nc84tUnCu2bFuzPJo6o5omFUoer2QypQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=azzx7gqz; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="azzx7gqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782220649; x=1813756649;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bF1W3tRSGWOjuxXT3L9B99cQpZWU4sHqObEwLhfjZ4M=;
  b=azzx7gqzL96VYWxVeHoEw/jGNLwVdEwMmx6mLWGeKDshQmyLbhdP5W/f
   oVEovOb9Q385QnvsllcR8vsryvOLkuVXC7awaGQ94NQVMQGnRKXIz0OkU
   upAoD58evv2CdHtQls2ZzExx3g0SOc/4G+6KEAS4GwrqtZwiRVczpqb4X
   iRndUAz2FYciLGGRVeG/jBsoNTwaaYDNN4g/gKJTW394m/dMeEAkcNrll
   iCn3p3pY2Tr8GhNuotOUBnMPkk/svHo4hsggxFeStPVkYWNcRiWcxXnfY
   zU6/ocYWF8Okm+Tk+Yjtja4W3b+RWL9r2wl5w3P566ACAM1MlY4rM2HyK
   A==;
X-CSE-ConnectionGUID: s+sb8hGDQDWZPT94sQfe3w==
X-CSE-MsgGUID: U8bn1MhlTryz1vxMFYvFkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94078843"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94078843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 06:17:28 -0700
X-CSE-ConnectionGUID: 37ATukB3Soiuep1LL0IzjA==
X-CSE-MsgGUID: KUz4U02kSZeD2qlRMhI0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253394532"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2026 06:17:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc10G-000000002Y5-2GfL;
	Tue, 23 Jun 2026 13:17:24 +0000
Date: Tue, 23 Jun 2026 21:16:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 14/36] drivers/ptp/ptp_vmclock.c:682:5:
 warning: format specifies type 'unsigned long long' but the argument has type
 'resource_size_t' (aka 'unsigned int')
Message-ID: <202606232119.pdl8d0Yl-lkp@intel.com>
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
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: de40e94c2ee6a5610211cba9e82eb50db165e6d1 [14/36] ptp: ptp_vmclock: =
Replace get_cycles() usage
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260623/20=
2606232119.pdl8d0Yl-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260623/202606232119.pdl8d0Yl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606232119.pdl8d0Yl-lkp@i=
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
>> drivers/ptp/ptp_vmclock.c:682:5: warning: format specifies type 'unsigne=
d long long' but the argument has type 'resource_size_t' (aka 'unsigned int=
') [-Wformat]
     681 |                 dev_info(dev, "Region too small (0x%llx)\n",
         |                                                    ~~~~
         |                                                    %x
     682 |                          resource_size(&st->res));
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


vim +682 drivers/ptp/ptp_vmclock.c

20503272422693d David Woodhouse  2024-10-06  657 =20
20503272422693d David Woodhouse  2024-10-06  658  static int vmclock_probe(=
struct platform_device *pdev)
20503272422693d David Woodhouse  2024-10-06  659  {
20503272422693d David Woodhouse  2024-10-06  660  	struct device *dev =3D &=
pdev->dev;
20503272422693d David Woodhouse  2024-10-06  661  	struct vmclock_state *st;
20503272422693d David Woodhouse  2024-10-06  662  	int ret;
20503272422693d David Woodhouse  2024-10-06  663 =20
20503272422693d David Woodhouse  2024-10-06  664  	st =3D devm_kzalloc(dev,=
 sizeof(*st), GFP_KERNEL);
20503272422693d David Woodhouse  2024-10-06  665  	if (!st)
20503272422693d David Woodhouse  2024-10-06  666  		return -ENOMEM;
20503272422693d David Woodhouse  2024-10-06  667 =20
ac1e7404924cb4a David Woodhouse  2026-01-30  668  #if IS_ENABLED(CONFIG_ACP=
I)
20503272422693d David Woodhouse  2024-10-06  669  	if (has_acpi_companion(d=
ev))
20503272422693d David Woodhouse  2024-10-06  670  		ret =3D vmclock_probe_a=
cpi(dev, st);
20503272422693d David Woodhouse  2024-10-06  671  	else
ac1e7404924cb4a David Woodhouse  2026-01-30  672  #endif
ddc867d0b5db6f6 David Woodhouse  2026-01-30  673  		ret =3D vmclock_probe_d=
t(dev, st);
20503272422693d David Woodhouse  2024-10-06  674 =20
20503272422693d David Woodhouse  2024-10-06  675  	if (ret) {
20503272422693d David Woodhouse  2024-10-06  676  		dev_info(dev, "Failed t=
o obtain physical address: %d\n", ret);
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  677  		return ret;
20503272422693d David Woodhouse  2024-10-06  678  	}
20503272422693d David Woodhouse  2024-10-06  679 =20
20503272422693d David Woodhouse  2024-10-06  680  	if (resource_size(&st->r=
es) < VMCLOCK_MIN_SIZE) {
20503272422693d David Woodhouse  2024-10-06  681  		dev_info(dev, "Region t=
oo small (0x%llx)\n",
20503272422693d David Woodhouse  2024-10-06 @682  			 resource_size(&st->re=
s));
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  683  		return -EINVAL;
20503272422693d David Woodhouse  2024-10-06  684  	}
20503272422693d David Woodhouse  2024-10-06  685  	st->clk =3D devm_memrema=
p(dev, st->res.start, resource_size(&st->res),
20503272422693d David Woodhouse  2024-10-06  686  				MEMREMAP_WB | MEMREMA=
P_DEC);
20503272422693d David Woodhouse  2024-10-06  687  	if (IS_ERR(st->clk)) {
20503272422693d David Woodhouse  2024-10-06  688  		ret =3D PTR_ERR(st->clk=
);
20503272422693d David Woodhouse  2024-10-06  689  		dev_info(dev, "failed t=
o map shared memory\n");
20503272422693d David Woodhouse  2024-10-06  690  		st->clk =3D NULL;
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  691  		return ret;
20503272422693d David Woodhouse  2024-10-06  692  	}
20503272422693d David Woodhouse  2024-10-06  693 =20
20503272422693d David Woodhouse  2024-10-06  694  	if (le32_to_cpu(st->clk-=
>magic) !=3D VMCLOCK_MAGIC ||
20503272422693d David Woodhouse  2024-10-06  695  	    le32_to_cpu(st->clk-=
>size) > resource_size(&st->res) ||
20503272422693d David Woodhouse  2024-10-06  696  	    le16_to_cpu(st->clk-=
>version) !=3D 1) {
20503272422693d David Woodhouse  2024-10-06  697  		dev_info(dev, "vmclock =
magic fields invalid\n");
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  698  		return -EINVAL;
20503272422693d David Woodhouse  2024-10-06  699  	}
20503272422693d David Woodhouse  2024-10-06  700 =20
20503272422693d David Woodhouse  2024-10-06  701  	ret =3D ida_alloc(&vmclo=
ck_ida, GFP_KERNEL);
20503272422693d David Woodhouse  2024-10-06  702  	if (ret < 0)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  703  		return ret;
20503272422693d David Woodhouse  2024-10-06  704 =20
20503272422693d David Woodhouse  2024-10-06  705  	st->index =3D ret;
20503272422693d David Woodhouse  2024-10-06  706  	ret =3D devm_add_action_=
or_reset(&pdev->dev, vmclock_put_idx, st);
20503272422693d David Woodhouse  2024-10-06  707  	if (ret)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  708  		return ret;
20503272422693d David Woodhouse  2024-10-06  709 =20
20503272422693d David Woodhouse  2024-10-06  710  	st->name =3D devm_kaspri=
ntf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  711  	if (!st->name)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  712  		return -ENOMEM;
20503272422693d David Woodhouse  2024-10-06  713 =20
39e926c3a21b25a Thomas Wei=C3=9Fschuh 2025-02-07  714  	st->miscdev.minor =
=3D MISC_DYNAMIC_MINOR;
39e926c3a21b25a Thomas Wei=C3=9Fschuh 2025-02-07  715 =20
3b1526ddb254523 Babis Chalios    2026-01-30  716  	init_waitqueue_head(&st-=
>disrupt_wait);
3b1526ddb254523 Babis Chalios    2026-01-30  717  	dev->driver_data =3D st;
3b1526ddb254523 Babis Chalios    2026-01-30  718 =20
3b1526ddb254523 Babis Chalios    2026-01-30  719  	ret =3D devm_add_action_=
or_reset(&pdev->dev, vmclock_remove, dev);
3b1526ddb254523 Babis Chalios    2026-01-30  720  	if (ret)
3b1526ddb254523 Babis Chalios    2026-01-30  721  		return ret;
3b1526ddb254523 Babis Chalios    2026-01-30  722 =20
3b1526ddb254523 Babis Chalios    2026-01-30  723  	ret =3D vmclock_setup_no=
tification(dev, st);
9a884c3800b207b Thomas Wei=C3=9Fschuh 2025-02-07  724  	if (ret)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  725  		return ret;
9a884c3800b207b Thomas Wei=C3=9Fschuh 2025-02-07  726 =20
20503272422693d David Woodhouse  2024-10-06  727  	/*
20503272422693d David Woodhouse  2024-10-06  728  	 * If the structure is b=
ig enough, it can be mapped to userspace.
20503272422693d David Woodhouse  2024-10-06  729  	 * Theoretically a guest=
 OS even using larger pages could still
20503272422693d David Woodhouse  2024-10-06  730  	 * use 4KiB PTEs to map =
smaller MMIO regions like this, but let's
20503272422693d David Woodhouse  2024-10-06  731  	 * cross that bridge if/=
when we come to it.
20503272422693d David Woodhouse  2024-10-06  732  	 */
20503272422693d David Woodhouse  2024-10-06  733  	if (le32_to_cpu(st->clk-=
>size) >=3D PAGE_SIZE) {
20503272422693d David Woodhouse  2024-10-06  734  		st->miscdev.fops =3D &v=
mclock_miscdev_fops;
20503272422693d David Woodhouse  2024-10-06  735  		st->miscdev.name =3D st=
->name;
20503272422693d David Woodhouse  2024-10-06  736 =20
20503272422693d David Woodhouse  2024-10-06  737  		ret =3D misc_register(&=
st->miscdev);
20503272422693d David Woodhouse  2024-10-06  738  		if (ret)
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  739  			return ret;
20503272422693d David Woodhouse  2024-10-06  740  	}
20503272422693d David Woodhouse  2024-10-06  741 =20
20503272422693d David Woodhouse  2024-10-06  742  	/* If there is valid clo=
ck information, register a PTP clock */
20503272422693d David Woodhouse  2024-10-06  743  	if (VMCLOCK_FIELD_PRESEN=
T(st->clk, time_frac_sec)) {
20503272422693d David Woodhouse  2024-10-06  744  		/* Can return a silent =
NULL, or an error. */
20503272422693d David Woodhouse  2024-10-06  745  		st->ptp_clock =3D vmclo=
ck_ptp_register(dev, st);
20503272422693d David Woodhouse  2024-10-06  746  		if (IS_ERR(st->ptp_cloc=
k)) {
20503272422693d David Woodhouse  2024-10-06  747  			ret =3D PTR_ERR(st->pt=
p_clock);
20503272422693d David Woodhouse  2024-10-06  748  			st->ptp_clock =3D NULL;
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  749  			return ret;
20503272422693d David Woodhouse  2024-10-06  750  		}
20503272422693d David Woodhouse  2024-10-06  751  	}
20503272422693d David Woodhouse  2024-10-06  752 =20
20503272422693d David Woodhouse  2024-10-06  753  	if (!st->miscdev.minor &=
& !st->ptp_clock) {
20503272422693d David Woodhouse  2024-10-06  754  		/* Neither miscdev nor =
PTP registered */
20503272422693d David Woodhouse  2024-10-06  755  		dev_info(dev, "vmclock:=
 Neither miscdev nor PTP available; not registering\n");
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  756  		return -ENODEV;
20503272422693d David Woodhouse  2024-10-06  757  	}
20503272422693d David Woodhouse  2024-10-06  758 =20
20503272422693d David Woodhouse  2024-10-06  759  	dev_info(dev, "%s: regis=
tered %s%s%s\n", st->name,
20503272422693d David Woodhouse  2024-10-06  760  		 st->miscdev.minor ? "m=
iscdev" : "",
20503272422693d David Woodhouse  2024-10-06  761  		 (st->miscdev.minor && =
st->ptp_clock) ? ", " : "",
20503272422693d David Woodhouse  2024-10-06  762  		 st->ptp_clock ? "PTP" =
: "");
20503272422693d David Woodhouse  2024-10-06  763 =20
b4c1fde5ced93d9 Thomas Wei=C3=9Fschuh 2025-02-07  764  	return 0;
20503272422693d David Woodhouse  2024-10-06  765  }
20503272422693d David Woodhouse  2024-10-06  766 =20

:::::: The code at line 682 was first introduced by commit
:::::: 20503272422693d793b84f88bf23fe4e955d3a33 ptp: Add support for the AM=
ZNC10C 'vmclock' device

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
