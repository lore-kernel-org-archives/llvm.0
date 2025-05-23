Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA102F3E;
	Fri, 23 May 2025 12:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002663; cv=none; b=fnE2WlGahimcDFaq3PORdbcW8Z3ZdVA+yH0GnGAmZyPAO7fhNSmoW3DiPeMM1QmxkAnYCl1oFAylu+rTeRGe4egJsCigkI930IpIWI6emuGlBr5EQbZA0C862w5aI1T8YRzd//KD1FjF3qR1Qx7hPSlVtmsEIDyj+TCSxp9VkHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002663; c=relaxed/simple;
	bh=T1nGN7m0+2+qS5y7l7WPR7dBiubm7P0J36WTObQFzPw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t0NYRL9og+xyDIuWt5CHdIKrsNH4vlGQF681+c22OlupHIHSbctiuBfFr7J6TL07wvbLhlaS027tXQmogw7MDd3kaVWrCNqlSmp6fyzoqI27Vzxsiw9tr8qs7ABClFosEw9k0b55rg3hQVfdwvP09B0WFrGyhp5KsLj0PfsdVM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bnvtmkq6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bnvtmkq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748002662; x=1779538662;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=T1nGN7m0+2+qS5y7l7WPR7dBiubm7P0J36WTObQFzPw=;
  b=Bnvtmkq6xAdMP2BVBc9uyy0KE5c0VdhxVvj653JMU5Xg4WQ3WBVroygm
   eX0vstfAyPdZufbici4RoczKToTe1ZgiLhFanNNfy3d66oBfPNvkqgnfI
   28Qag5dPvck4Vvbivke0yv3A93WHTv8M2z8Iruje8tgTbxUlHxUSA+o3M
   gkeV/cyBee03pGRsGf8xfeRu5EcctFV0Z6n97IQ632VGXkmBKKiqZ1Q6N
   VvRT8MDacjHneqDqQ7I9dpHM1l0TGaOGHkaAWmNifFlstbVbs0iCVCJnG
   yjKnYjUN7QhfmoJmDrYJiYS7QsRDzQa7+ZtgI9DKyA6rFU6KuxMpTvKjR
   A==;
X-CSE-ConnectionGUID: ixnfwj5jTduMKmd+DVnrAg==
X-CSE-MsgGUID: lJDpL392TFuRNTXRjNUq0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="72584358"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="72584358"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 05:17:40 -0700
X-CSE-ConnectionGUID: Zc4bVDAwRyS149Bvuli/kQ==
X-CSE-MsgGUID: 063sw49mSECIQV/rmL8w8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="140988774"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 05:17:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 23 May 2025 15:17:34 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
    oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 74/89]
 drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incomplete type
 'struct acpi_s2idle_dev_ops'
In-Reply-To: <387b9c8a-8289-4352-a740-f3bd580d9f43@app.fastmail.com>
Message-ID: <3f8a14a6-04e0-d03e-fc95-d335c352c4d8@linux.intel.com>
References: <202505090418.DaeaXe4i-lkp@intel.com> <83e5ee5d-de9d-51c5-457e-803b0b7a57cd@linux.intel.com> <9adefaf8-b327-5730-664d-2741a1406c36@linux.intel.com> <387b9c8a-8289-4352-a740-f3bd580d9f43@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1892256129-1748002354=:21466"
Content-ID: <ad1b510c-7590-968a-369a-6a06d8669cab@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1892256129-1748002354=:21466
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <9b5ffe5f-37c4-85b9-1fac-6df5be79b46b@linux.intel.com>

On Tue, 20 May 2025, Luke Jones wrote:

> On Tue, 20 May 2025, at 3:40 PM, Ilpo J=E4rvinen wrote:
> > Luke,
> >
> > Ping? This is still unsolved.
>=20
> Oh, my apologies. I've not had much time for kernel work recently but I=
=20
> will try to get to this sometime this week. Thank you for bringing to my=
=20
> attention.

Hi,

Regrettably, I'll probably end up reverting this commit as I'm not going=20
send a PR early next week with known problems still unsolved. Delaying PR
is not going the be an option in this round due to the lamparray=20
controversy.

I couldn't add the #ifdeffery myself as I was unsure what should be done=20
for asus_hotk_prepare().

--=20
 i.

> > On Fri, 9 May 2025, Ilpo J=E4rvinen wrote:
> >> On Fri, 9 May 2025, kernel test robot wrote:
> >>=20
> >> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platfo=
rm-drivers-x86.git review-ilpo-next
> >> > head:   83579675331059689e2869bf752ca9e17fadbd82
> >> > commit: feea7bd6b02d43a794e3f065650d89cf8d8e8e59 [74/89] platform/x8=
6: asus-wmi: Refactor Ally suspend/resume
> >> > config: x86_64-buildonly-randconfig-004-20250509 (https://download.0=
1.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/config)
> >> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project=
 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> >> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/=
archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/reproduce)
> >> >=20
> >> > If you fix the issue in a separate patch/commit (i.e. not just a new=
 version of
> >> > the same patch/commit), kindly add following tags
> >> > | Reported-by: kernel test robot <lkp@intel.com>
> >> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe4=
i-lkp@intel.com/
> >> >=20
> >> > All errors (new ones prefixed by >>):
> >> >=20
> >> > >> drivers/platform/x86/asus-wmi.c:5028:35: error: variable has inco=
mplete type 'struct acpi_s2idle_dev_ops'
> >> >     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_op=
s =3D {
> >> >          |                                   ^
> >> >    drivers/platform/x86/asus-wmi.c:5028:15: note: forward declaratio=
n of 'struct acpi_s2idle_dev_ops'
> >> >     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_op=
s =3D {
> >> >          |               ^
> >> > >> drivers/platform/x86/asus-wmi.c:5063:8: error: call to undeclared=
 function 'acpi_register_lps0_dev'; ISO C99 and later do not support implic=
it function declarations [-Wimplicit-function-declaration]
> >> >     5063 |         ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_=
dev_ops);
> >> >          |               ^
> >> > >> drivers/platform/x86/asus-wmi.c:5099:2: error: call to undeclared=
 function 'acpi_unregister_lps0_dev'; ISO C99 and later do not support impl=
icit function declarations [-Wimplicit-function-declaration]
> >> >     5099 |         acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_op=
s);
> >> >          |         ^
> >> >    3 errors generated.
> >> >=20
> >> >=20
> >> > vim +5028 drivers/platform/x86/asus-wmi.c
> >> >=20
> >> >   5026=09
> >> >   5027=09/* Use only for Ally devices due to the wake_on_ac */
> >> > > 5028=09static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops =
=3D {
> >> >   5029=09=09.restore =3D asus_ally_s2idle_restore,
> >> >   5030=09};
> >> >   5031=09
> >>=20
> >> > > 5063=09=09ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops=
);
> >>=20
> >> > > 5099=09=09acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
> >>=20
> >> Hi Luke,
> >>=20
> >> It seems CONFIG_SUSPEND is not defined in this config leading to the=
=20
> >> failure. Can you please look at this as I was slight unsure what way t=
he=20
> >> fix should go although it looked like some ifdeffery is necessary and=
=20
> >> probably wrapping those register/unregister functions.
> >>=20
> >>=20
> >
> > --=20
> >  i.
>=20
--8323328-1892256129-1748002354=:21466--
