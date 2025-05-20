Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496FE1B7F4;
	Tue, 20 May 2025 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767496; cv=none; b=RQBXbl+mRvd67CXx+r07zZDriBVCjjDDFQg+W/M2efhUUD6m/5+ObGODeWhTnPsOXiWmZkJw9TQCcKgmlpvYYwErdIKS9nYcn+rasE64oRroZumy4ijY0hb1eNT52HdF84SXMe1KISeXVHvGpeer3tMKh9di16hL9SBJT2UxqMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767496; c=relaxed/simple;
	bh=gwhd3YCbEb8EBIyVrDgqVx1K45tcDJc+NnGwEtaqEo8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SCcNaXuvak1EUly035hjNFBAb0oqI2I43J77xnAxBxapGh8nJvFBjYll4E3ldULsYEB/Gdy1IuB4GTKhUlHoNu/fv6tlkCW0lxVjpzYQOz9twwSc+NhNaMCW5FGofrmGWrHsDphWrwwAzSwCajLX0tjWEdSZx7JwDYbOAByO6vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Q544QARX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PaL7QA3+; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Q544QARX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PaL7QA3+"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 077ED25400CA;
	Tue, 20 May 2025 14:58:12 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-06.internal (MEProxy); Tue, 20 May 2025 14:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747767491;
	 x=1747853891; bh=TfodYBS0TR7xIlq2IqhE3XlfZHgSOstO3vT1+QQlxlE=; b=
	Q544QARXUkgybjkpMLtQPQT0G+90PdVGdMAQt9dOtGNmfsGE+SYPteJJIeEjPyA7
	gVyU0Wqcb9h9mfuGhxIceLL/e99Jp1fS77DhpiSpodhQoEhEqxLKqymqF8a3ASP2
	E5SPNGBUNCcewAeV37VZ7AMF3HM5SMiGN9SgtdoCFSewaEO9z62eWpHsY2g1F6n/
	ZeZISigOkkRVUwnVUrHYsZkBiP1D3A3cxQLQ88u/MWQsSvb7phbA6plk/h9qBMew
	IWEJoDAM68TV+5oVjXTfSYMj6447H2OOi9F1PfU7oWHbUn7DODoM+AqT4D3fmxzg
	FuK0FJjLr71hZ4l/osQ+Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747767491; x=
	1747853891; bh=TfodYBS0TR7xIlq2IqhE3XlfZHgSOstO3vT1+QQlxlE=; b=P
	aL7QA3+rDGxQGVoXsjuGXArXTPDNXTikkyA7aagGZ3HYKC9Kt+KNOf98z9jEYbn8
	7dHFcCBIXZJ0mHNITlx1S8GhS+0oJrwO4d6VnFCpzAVuXSB92wSDpOolx7/ZzkwZ
	DbVk6fd75TQFCkKGxKppszLG/oIH8wnFdcwmJdkQVY5L6qtUcG80kXsm9ZerTL3P
	wxPXVA4XiAt6mPwhvsZ3mssKePAgPw7M/obwOPhYl1eT92bC3jp3VO/1s3xyqF8M
	OCwDOL84+T3/SkB+mXDaiGf5V4vmLp5eySDVGKgSmaiWv3aTwkcsc/655cn03Gyy
	PfkqCGBjGrWk3yRZ/3C+w==
X-ME-Sender: <xms:w9AsaHLxQOP9s1W_zqHB1dNyFiAeo0GDOWNw2dIj8aXSLKHaOezB6A>
    <xme:w9AsaLJVodQuFYf2ECzJcX_oE0uCtuHqnh9fes8DAtuQP_NgbJESUShvEl9Z2Xeng
    WefkOlNJ7TKUH3dmCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdelkeculddtuddrgeefvddrtddtmd
    cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghn
    shhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtne
    cusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghf
    ufgtgfesthhqredtredtjeenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukh
    gvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepheevfffhgeelveevhedu
    gfevtdffhffgjeegffevueefffffkeevtdeuvdevteevnecuffhomhgrihhnpehkvghrnh
    gvlhdrohhrghdptddurdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvg
    hvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehm
    rghrihhordhlihhmohhntghivghllhhosegrmhgurdgtohhmpdhrtghpthhtoheplhhkph
    esihhnthgvlhdrtghomhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhho
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinh
    gvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehllhhvmheslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgr
    thdrtghomh
X-ME-Proxy: <xmx:w9AsaPvAJ88ySP78s5qU2RCGwvS_gNrtjzaFBSwiJBsoF70zMUgkzQ>
    <xmx:w9AsaAYZlsHLuT1FJrmuyDgOfoZSBqH7XKIJx7DVxXYKVj88it1jcg>
    <xmx:w9AsaObPL8lGIDqTe4JW0F3VlsxB4FN_6Lu60DtItbwQdJkTlUS2fw>
    <xmx:w9AsaEDFEjvpsH2i9qkpAkmb3TDv1jVu1Wg5u5zAVOoH-vFBCV0P3Q>
    <xmx:w9AsaPX4DMXZJKVI9peuCkNp5C-TAEgyGGKr5Ny8xjw6n1RcR76MnfHI>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5075078006C; Tue, 20 May 2025 14:58:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: T0aeaa973f372da87
Date: Tue, 20 May 2025 20:57:51 +0200
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "kernel test robot" <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>
Message-Id: <387b9c8a-8289-4352-a740-f3bd580d9f43@app.fastmail.com>
In-Reply-To: <9adefaf8-b327-5730-664d-2741a1406c36@linux.intel.com>
References: <202505090418.DaeaXe4i-lkp@intel.com>
 <83e5ee5d-de9d-51c5-457e-803b0b7a57cd@linux.intel.com>
 <9adefaf8-b327-5730-664d-2741a1406c36@linux.intel.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 74/89]
 drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incomplete type
 'struct acpi_s2idle_dev_ops'
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 20 May 2025, at 3:40 PM, Ilpo J=C3=A4rvinen wrote:
> Luke,
>
> Ping? This is still unsolved.

Oh, my apologies. I've not had much time for kernel work recently but I =
will try to get to this sometime this week. Thank you for bringing to my=
 attention.

>
> On Fri, 9 May 2025, Ilpo J=C3=A4rvinen wrote:
>> On Fri, 9 May 2025, kernel test robot wrote:
>>=20
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platf=
orm-drivers-x86.git review-ilpo-next
>> > head:   83579675331059689e2869bf752ca9e17fadbd82
>> > commit: feea7bd6b02d43a794e3f065650d89cf8d8e8e59 [74/89] platform/x=
86: asus-wmi: Refactor Ally suspend/resume
>> > config: x86_64-buildonly-randconfig-004-20250509 (https://download.=
01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/conf=
ig)
>> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-projec=
t 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
>> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/reproduce)
>> >=20
>> > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe=
4i-lkp@intel.com/
>> >=20
>> > All errors (new ones prefixed by >>):
>> >=20
>> > >> drivers/platform/x86/asus-wmi.c:5028:35: error: variable has inc=
omplete type 'struct acpi_s2idle_dev_ops'
>> >     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_o=
ps =3D {
>> >          |                                   ^
>> >    drivers/platform/x86/asus-wmi.c:5028:15: note: forward declarati=
on of 'struct acpi_s2idle_dev_ops'
>> >     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_o=
ps =3D {
>> >          |               ^
>> > >> drivers/platform/x86/asus-wmi.c:5063:8: error: call to undeclare=
d function 'acpi_register_lps0_dev'; ISO C99 and later do not support im=
plicit function declarations [-Wimplicit-function-declaration]
>> >     5063 |         ret =3D acpi_register_lps0_dev(&asus_ally_s2idle=
_dev_ops);
>> >          |               ^
>> > >> drivers/platform/x86/asus-wmi.c:5099:2: error: call to undeclare=
d function 'acpi_unregister_lps0_dev'; ISO C99 and later do not support =
implicit function declarations [-Wimplicit-function-declaration]
>> >     5099 |         acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_o=
ps);
>> >          |         ^
>> >    3 errors generated.
>> >=20
>> >=20
>> > vim +5028 drivers/platform/x86/asus-wmi.c
>> >=20
>> >   5026=09
>> >   5027	/* Use only for Ally devices due to the wake_on_ac */
>> > > 5028	static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops =3D=
 {
>> >   5029		.restore =3D asus_ally_s2idle_restore,
>> >   5030	};
>> >   5031=09
>>=20
>> > > 5063		ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
>>=20
>> > > 5099		acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>>=20
>> Hi Luke,
>>=20
>> It seems CONFIG_SUSPEND is not defined in this config leading to the=20
>> failure. Can you please look at this as I was slight unsure what way =
the=20
>> fix should go although it looked like some ifdeffery is necessary and=20
>> probably wrapping those register/unregister functions.
>>=20
>>=20
>
> --=20
>  i.
