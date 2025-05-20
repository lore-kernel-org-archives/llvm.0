Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7B51B0416;
	Tue, 20 May 2025 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748457; cv=none; b=filsndQohheUcXa+xkenQRX1EyciqGx/w/rXTdTyjVHilN5vg/2iG+J4LWmKVnGFWgVJDJYL8QWN+AQyDqlM6/aN8MBxgHLavXovPyvT2trKcumK9ZBybf8FUVKbyAG3C8E38bjHwEv310KdlGctiEuTgFTc6JHjeKHdcUZY2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748457; c=relaxed/simple;
	bh=4Da8sbcJpW86NJQEA+qpqrzIVmF5Bz/QY1s2D+KxHec=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UvzJxghqXmEvQLZas1gGTdQD2a00u/j3wOCitWF+4XfhVzaP2xqr2SRUxATvBq7tS71Y93jh3MCR6MIE06RrKn/6hGvNlnzn+bl6gKrQYRf7mrkFfh+MswP1Ro+5TAFrCVIep2Oas62ND8ABGUpnTGR1Pp1lH3wSHRnlFpoRaLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJ2Po1FZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJ2Po1FZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747748456; x=1779284456;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4Da8sbcJpW86NJQEA+qpqrzIVmF5Bz/QY1s2D+KxHec=;
  b=nJ2Po1FZ7MsGXhH9pCPdOfDN6Thixvj+jS+svUkFr60hZ1sSo/UBCsGl
   4ydxCFGSU50JcM/rU7n8U+GkYMQEjxLETwoSRqPHJw41eqWz6wBrvwfl/
   xYOaDxKip5dUaGdFkWWXfGaa4v84oVXschG9OR8/kaUX6ayhvf6si+R3K
   suF52p+61+zPiRWTl14PlEaekth5udFDepAAgTsBuNFq8xgPDCwTSYX3Y
   7Y+qV4F76VzKAPTqz+U19v7bqp1yieYSnAFSmqm9jHe8llqyCvOMa7nNI
   UCw4M6umKDS9a+8SY4ke/ZLn3E8utpEzv/kOOJYuun65OcXJAuUBMOvGm
   w==;
X-CSE-ConnectionGUID: e6/1YP/QQkGhuT6FohEmmg==
X-CSE-MsgGUID: +3g0gfOAQfGYgMH6FWxZyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49665431"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49665431"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 06:40:55 -0700
X-CSE-ConnectionGUID: MpBMBaPtR12liekaRMeyVw==
X-CSE-MsgGUID: S4Lk2ywfTq+QaZm+1u4VZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144671241"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 06:40:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 16:40:48 +0300 (EEST)
To: "Luke D. Jones" <luke@ljones.dev>
cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
    oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 74/89]
 drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incomplete type
 'struct acpi_s2idle_dev_ops'
In-Reply-To: <83e5ee5d-de9d-51c5-457e-803b0b7a57cd@linux.intel.com>
Message-ID: <9adefaf8-b327-5730-664d-2741a1406c36@linux.intel.com>
References: <202505090418.DaeaXe4i-lkp@intel.com> <83e5ee5d-de9d-51c5-457e-803b0b7a57cd@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1008686699-1747748448=:936"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1008686699-1747748448=:936
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

Luke,

Ping? This is still unsolved.

On Fri, 9 May 2025, Ilpo J=E4rvinen wrote:
> On Fri, 9 May 2025, kernel test robot wrote:
>=20
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-=
drivers-x86.git review-ilpo-next
> > head:   83579675331059689e2869bf752ca9e17fadbd82
> > commit: feea7bd6b02d43a794e3f065650d89cf8d8e8e59 [74/89] platform/x86: =
asus-wmi: Refactor Ally suspend/resume
> > config: x86_64-buildonly-randconfig-004-20250509 (https://download.01.o=
rg/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/config)
> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58=
df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250509/202505090418.DaeaXe4i-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe4i-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> > >> drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incompl=
ete type 'struct acpi_s2idle_dev_ops'
> >     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops =
=3D {
> >          |                                   ^
> >    drivers/platform/x86/asus-wmi.c:5028:15: note: forward declaration o=
f 'struct acpi_s2idle_dev_ops'
> >     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops =
=3D {
> >          |               ^
> > >> drivers/platform/x86/asus-wmi.c:5063:8: error: call to undeclared fu=
nction 'acpi_register_lps0_dev'; ISO C99 and later do not support implicit =
function declarations [-Wimplicit-function-declaration]
> >     5063 |         ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev=
_ops);
> >          |               ^
> > >> drivers/platform/x86/asus-wmi.c:5099:2: error: call to undeclared fu=
nction 'acpi_unregister_lps0_dev'; ISO C99 and later do not support implici=
t function declarations [-Wimplicit-function-declaration]
> >     5099 |         acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
> >          |         ^
> >    3 errors generated.
> >=20
> >=20
> > vim +5028 drivers/platform/x86/asus-wmi.c
> >=20
> >   5026=09
> >   5027=09/* Use only for Ally devices due to the wake_on_ac */
> > > 5028=09static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops =3D=
 {
> >   5029=09=09.restore =3D asus_ally_s2idle_restore,
> >   5030=09};
> >   5031=09
>=20
> > > 5063=09=09ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
>=20
> > > 5099=09=09acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>=20
> Hi Luke,
>=20
> It seems CONFIG_SUSPEND is not defined in this config leading to the=20
> failure. Can you please look at this as I was slight unsure what way the=
=20
> fix should go although it looked like some ifdeffery is necessary and=20
> probably wrapping those register/unregister functions.
>=20
>=20

--=20
 i.

--8323328-1008686699-1747748448=:936--
