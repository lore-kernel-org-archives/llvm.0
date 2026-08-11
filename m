Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4482E36AB54
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 03:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418488; cv=none; b=BarfAG8X6bE8HUwfxSljU+0XM8VBuDrmx910WK0Y7Trc76LY/tN1gshqk1JsbYOawvJgL+ZLyMR1jxRE0zVg5PVEpjn549c6jtLMEvX8WzSVr1myFHRd/Oa94uxZzaMpCqBCkkjCgviWwydX5+17K3GDdIMfAgOVFF+uER06NBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418488; c=relaxed/simple;
	bh=A67nTvL3S0f5pXXi3bamCM1SiNXYu2ZVAm2b/1+zW94=;
	h=Mime-Version:Subject:From:To:CC:In-Reply-To:Message-ID:Date:
	 Content-Type:References; b=Hc+HqpbOxFg3PychJzBUx2wzDBZB9RoVhq64Ffqz5LuEvP8mMk7bjUsNljmVk33s1FDDM6LgC6oYP0XtURQRLEg3ucQtL6x3KznpSBgt7tBEuo3qhS7tOZRSFaqMTubhilf5Z0KV8tJ+2kdOaH+7lKxFUVPeDZA+7qFspVPT6Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=POPJ0LWf; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="POPJ0LWf"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260811032122epoutp029b0349289640ed43ed9953e74d243208~KoiUjEjsg2286222862epoutp02E
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 03:21:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260811032122epoutp029b0349289640ed43ed9953e74d243208~KoiUjEjsg2286222862epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1786418482;
	bh=A67nTvL3S0f5pXXi3bamCM1SiNXYu2ZVAm2b/1+zW94=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=POPJ0LWf/7/dGa9Brfj1tco+n1PE/NmCGYPNKaHW8zqgKcBOveuMF8jsipUewb42P
	 wtfdLXUJLvwjAlEE3rToh4tAPEXQUPYPQYkEu+iCTKO7PNThcBB6UgGG3/AmA5xutE
	 z/eFsyzoJeiPWNPfob6cqKUQ+rECvJENg6n2ax/Q=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260811032122epcas5p2f7b76e4134904673c8632b7f12dc1d71~KoiUGHP6A1041910419epcas5p2f;
	Tue, 11 Aug 2026 03:21:22 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hJxjZ0XRLz2SSKg; Tue, 11 Aug
	2026 03:21:22 +0000 (GMT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: RE: [PATCH v2] arm: backtrace-clang: fix wrong sp usage for
 unwinding
Reply-To: maninder1.s@samsung.com
Sender: Maninder Singh <maninder1.s@samsung.com>
From: Maninder Singh <maninder1.s@samsung.com>
To: Nick Desaulniers <ndesaulniers@google.com>
CC: "ardb@kernel.org" <ardb@kernel.org>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "nathan@kernel.org" <nathan@kernel.org>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"morbo@google.com" <morbo@google.com>, "justinstitt@google.com"
	<justinstitt@google.com>, Onkarnath <onkarnath.1@samsung.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Rohit Thapliyal <r.thapliyal@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <CAKwvOdk=ydGGmeDnoYYNLhe0pSmDZ1FgSoB2W_985avY07Ga7g@mail.gmail.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260811032121epcms5p6e9ed3e8970f4b4aaf1f17aa8ae91f0b0@epcms5p6>
Date: Tue, 11 Aug 2026 08:51:21 +0530
X-CMS-MailID: 20260811032121epcms5p6e9ed3e8970f4b4aaf1f17aa8ae91f0b0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260805045522epcas5p39659721ef26a447b71e860c2990a60c0
References: <CAKwvOdk=ydGGmeDnoYYNLhe0pSmDZ1FgSoB2W_985avY07Ga7g@mail.gmail.com>
	<20260805045514.1599433-1-maninder1.s@samsung.com>
	<CGME20260805045522epcas5p39659721ef26a447b71e860c2990a60c0@epcms5p6>

Hi Nick,

> Suggested-by:=C2=A0=20Ard=20Biesheuvel=20<ardb=40kernel.org>=0D=0A>=20Rev=
iewed-by:=20Nick=20Desaulniers=20<ndesaulniers=40google.com>=0D=0A>=20=0D=
=0A>=20Thanks=20for=20reporting=20the=20issue=20and=20sending=20a=20patch.=
=20Thanks=20for=20Ard=20for=0D=0A>=20suggesting=20a=20better=20fix.=0D=0A>=
=20I=20assume=20you=20all=20know=20how=20to=20submit=20patches=20to=0D=0A>=
=20https://www.arm.linux.org.uk/developer/patches/=0D=0A>=20=0D=0A=0D=0A=0D=
=0AThanks=20for=20reviewing=20the=20patch,=20Actually=20I=20was=20not=20awa=
re=20that=20ARM=20patches=0D=0Ahas=20to=20go=20through=20this=20way.=0D=0AM=
aybe=20that=20is=20the=20reason=20my=20last=202=20bugfixes=20are=20also=20i=
gnored=20from=20ARM=20side=20:)=0D=0Ahttps://lkml.org/lkml/2026/4/27/265=0D=
=0A=0D=0ASo=20I=20was=20checking=20the=20way=20and=20created=20account=20th=
ere=20to=20submit=20the=20patch.=0D=0AI=20will=20post=20the=20patch=20to=20=
suggested=20site=20today=20for=20further=20checking.=0D=0Ahttps://www.arm.l=
inux.org.uk/developer/patches/=0D=0A=0D=0A=0D=0AThanks=20Again,=0D=0AManind=
er=20Singh=0D=0A
