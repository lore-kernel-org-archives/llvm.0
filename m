Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A569E56A;
	Fri, 23 May 2025 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748003831; cv=none; b=B8c7VMpi7elOiBpQzjMmYrxrh/3n6Dny+YyIQFQLFHjdQ+dWMpxAp1phldY61UVx43AyZpuZccjyCFJP8Llxojs1FWDRw3UoYVbw1rIZ5oznKt20308wZtAeVT5hekkBPnQcfhontQQApG9X9xyGA0vz21s30sDxyzcd0z7R+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748003831; c=relaxed/simple;
	bh=LhQwRYzlgGsRT68uBKaKAkCMV47VvhhvyKhApLAqeb8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JRNbnWdkKqd2Y6HR+nvG5hCRX3wQANkk+vbk4OzkWGGhUysHpDiZr+YmTCpdbM4JMgouLjEZWsU9gjLIX6i1FUPrBmDwP16JhpA8SonU6lIcfaIv04XaUu0Wf22t+oaTYgB02xAPsjYMLOY09S9SDs7oUCNTHrM1cW5Bi5w2xKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=OFVE8lD1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m3V6hdcg; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="OFVE8lD1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m3V6hdcg"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 2733A1380262;
	Fri, 23 May 2025 08:37:07 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-06.internal (MEProxy); Fri, 23 May 2025 08:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1748003827;
	 x=1748090227; bh=dpudGsSWMKEypP6M40ojzPBR5iAe1IoKacn36zCuKb8=; b=
	OFVE8lD1ds2y8nS2yGYYDV0l/JkAK/fEudMGmvyyFGib+5M/VedzVzD2XlTYVff6
	BlyZD65qV1l7nodE8qRgMG+jLtW/0DzEN3yluDROPu/pe//ufVDJ+JcFBvZsKZbd
	Xid6ZLyM800pD9+9lw/3K506XlRgnDz5YC3F8I6BS8as+g8dgiSu1akApdWBc0Hm
	TYGHvgbT9WcQQGnoC2DhkqOZ4GpBlMEwyPnDV3NpVi4tZKpy+DoA/hNlOBRMil01
	AQDtm7u8zWHgCpe/vmrn1t6cvXDOv6kwLgWq2g+fBcGSXnQvj0TZWVJuGfp4upzz
	CIIpTEbdd6pLzxMz7xlvdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1748003827; x=
	1748090227; bh=dpudGsSWMKEypP6M40ojzPBR5iAe1IoKacn36zCuKb8=; b=m
	3V6hdcgWTdq2HUfldaVx1b/13jUYFdRfQnvS9lIsUpXIST9UWgNr3m5zutZeQYXr
	8rZqtQT5IkKSlq2BBl9E6GRgwLmPrYnd3G0oKWQmmcE0WslAxo7Din5j5I2J+4jE
	vUZ1lIrKO4ywHDV12mW+LrSouGgIXRNgHtdHF8yLoxF14tjV4JpNfjwgTbG2X5uj
	2zsJMiSv8rDsia97V4SkLgB7FsMBotegt8O6iV4CzXOG9rntxhVOSISlmb7goaFj
	Gu1MsrOLNR7p2xktnIJc38FNYyEzXoMQiJoOIoQLJd7CItIttiKzo6bT6UIZ/8sE
	BmCTQ88T+F4/YnTiHNCTA==
X-ME-Sender: <xms:8mswaCr8XVf_VMqPnjsdmkNM7dTvmA1-JPGpVGEDIT1pkoU7fDkD7g>
    <xme:8mswaAo2QM4NMM7W_qhhGFZu70UnqzvvX8pRONmpWsvQfEsq9WD1Oba-VSJEWmKEp
    sXE9ibQVm8GBLnkcC4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekkeeiucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtqhertdertdejnecuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluh
    hkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpeehveffhfegleevveeh
    udfgvedtfffhgfejgeffveeufeffffekvedtuedvveetveenucffohhmrghinhepkhgvrh
    hnvghlrdhorhhgpddtuddrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdrug
    gvvhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    mhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdprhgtphhtthhopehlkh
    hpsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhk
    oheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvih
    hnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhlvhhmsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughh
    rghtrdgtohhm
X-ME-Proxy: <xmx:8mswaHNWfPYX7q7AE8Fui9SsIzXbShpi9owCYfW8HZyKCscvDiQAng>
    <xmx:8mswaB6Ng1n_tcy1chPQR0WABgso3T7Ww8jrhkPlvIrBPc8ajAdVdg>
    <xmx:8mswaB7Ot6WNPkhFuTkAnmoQdzt_crwdHsGh2uFGTBO6lj3ZTjxHFw>
    <xmx:8mswaBhTADu7MlNOfKy9WGVKMQM6YfrO8jCRpJeiP5FiXaOKaDHyAg>
    <xmx:82swaA062t9j8VmaLM_1UNZMOcgtCq7efj2nAYp6rSSvrqmWcmVORzgS>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 24D1B78006C; Fri, 23 May 2025 08:37:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T0aeaa973f372da87
Date: Fri, 23 May 2025 14:36:45 +0200
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "kernel test robot" <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>
Message-Id: <9f01fbd2-1732-4728-91f6-925153568b2f@app.fastmail.com>
In-Reply-To: <3f8a14a6-04e0-d03e-fc95-d335c352c4d8@linux.intel.com>
References: <202505090418.DaeaXe4i-lkp@intel.com>
 <83e5ee5d-de9d-51c5-457e-803b0b7a57cd@linux.intel.com>
 <9adefaf8-b327-5730-664d-2741a1406c36@linux.intel.com>
 <387b9c8a-8289-4352-a740-f3bd580d9f43@app.fastmail.com>
 <3f8a14a6-04e0-d03e-fc95-d335c352c4d8@linux.intel.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 74/89]
 drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incomplete type
 'struct acpi_s2idle_dev_ops'
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 23 May 2025, at 2:17 PM, Ilpo J=C3=A4rvinen wrote:
> On Tue, 20 May 2025, Luke Jones wrote:
>
>> On Tue, 20 May 2025, at 3:40 PM, Ilpo J=C3=A4rvinen wrote:
>> > Luke,
>> >
>> > Ping? This is still unsolved.
>>=20
>> Oh, my apologies. I've not had much time for kernel work recently but=
 I=20
>> will try to get to this sometime this week. Thank you for bringing to=
 my=20
>> attention.
>
> Hi,
>
> Regrettably, I'll probably end up reverting this commit as I'm not goi=
ng=20
> send a PR early next week with known problems still unsolved. Delaying=
 PR
> is not going the be an option in this round due to the lamparray=20
> controversy.
>
> I couldn't add the #ifdeffery myself as I was unsure what should be do=
ne=20
> for asus_hotk_prepare().

I understand. I have some time right now to fixup, when I fix are you ok=
ay with a separate patch as suggested by the robot? I will apply on plat=
form-drivers-x86/review-ilpo-next

> --=20
>  i.
>
>> > On Fri, 9 May 2025, Ilpo J=C3=A4rvinen wrote:
>> >> On Fri, 9 May 2025, kernel test robot wrote:
>> >>=20
>> >> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/pl=
atform-drivers-x86.git review-ilpo-next
>> >> > head:   83579675331059689e2869bf752ca9e17fadbd82
>> >> > commit: feea7bd6b02d43a794e3f065650d89cf8d8e8e59 [74/89] platfor=
m/x86: asus-wmi: Refactor Ally suspend/resume
>> >> > config: x86_64-buildonly-randconfig-004-20250509 (https://downlo=
ad.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/c=
onfig)
>> >> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-pro=
ject 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
>> >> > reproduce (this is a W=3D1 build): (https://download.01.org/0day=
-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/reproduce)
>> >> >=20
>> >> > If you fix the issue in a separate patch/commit (i.e. not just a=
 new version of
>> >> > the same patch/commit), kindly add following tags
>> >> > | Reported-by: kernel test robot <lkp@intel.com>
>> >> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.Dae=
aXe4i-lkp@intel.com/
>> >> >=20
>> >> > All errors (new ones prefixed by >>):
>> >> >=20
>> >> > >> drivers/platform/x86/asus-wmi.c:5028:35: error: variable has =
incomplete type 'struct acpi_s2idle_dev_ops'
>> >> >     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_de=
v_ops =3D {
>> >> >          |                                   ^
>> >> >    drivers/platform/x86/asus-wmi.c:5028:15: note: forward declar=
ation of 'struct acpi_s2idle_dev_ops'
>> >> >     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_de=
v_ops =3D {
>> >> >          |               ^
>> >> > >> drivers/platform/x86/asus-wmi.c:5063:8: error: call to undecl=
ared function 'acpi_register_lps0_dev'; ISO C99 and later do not support=
 implicit function declarations [-Wimplicit-function-declaration]
>> >> >     5063 |         ret =3D acpi_register_lps0_dev(&asus_ally_s2i=
dle_dev_ops);
>> >> >          |               ^
>> >> > >> drivers/platform/x86/asus-wmi.c:5099:2: error: call to undecl=
ared function 'acpi_unregister_lps0_dev'; ISO C99 and later do not suppo=
rt implicit function declarations [-Wimplicit-function-declaration]
>> >> >     5099 |         acpi_unregister_lps0_dev(&asus_ally_s2idle_de=
v_ops);
>> >> >          |         ^
>> >> >    3 errors generated.
>> >> >=20
>> >> >=20
>> >> > vim +5028 drivers/platform/x86/asus-wmi.c
>> >> >=20
>> >> >   5026=09
>> >> >   5027	/* Use only for Ally devices due to the wake_on_ac */
>> >> > > 5028	static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_op=
s =3D {
>> >> >   5029		.restore =3D asus_ally_s2idle_restore,
>> >> >   5030	};
>> >> >   5031=09
>> >>=20
>> >> > > 5063		ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops=
);
>> >>=20
>> >> > > 5099		acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>> >>=20
>> >> Hi Luke,
>> >>=20
>> >> It seems CONFIG_SUSPEND is not defined in this config leading to t=
he=20
>> >> failure. Can you please look at this as I was slight unsure what w=
ay the=20
>> >> fix should go although it looked like some ifdeffery is necessary =
and=20
>> >> probably wrapping those register/unregister functions.
>> >>=20
>> >>=20
>> >
>> > --=20
>> >  i.
>>
