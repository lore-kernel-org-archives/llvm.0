Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71133EDE5D;
	Tue,  4 Aug 2026 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861525; cv=none; b=lJnCWnYAnoWq3GcoZ1mZKvktdoTclppktWPvEnWBfAUIprK0bQF35wQIdIXMqnXZDmW+P0U/BjY0GXluwy1sMhpNtSGJb0Y2l8wLgd/bfsqUV+YMpLtF59IHXVziErNtP8jovtUI8RnmsoNMTGtos9zdl7wvS7d76msV3HYJ2+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861525; c=relaxed/simple;
	bh=BN29c30rM1CVg6PVqplUtoYQiVgiycHPwV0YwQj8yt8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MPqR9JiybKXR/aAw1Cl+5p9+YGcE0wvad9pbPis+TOvglZNJ0hfeoBqlbS+DGpkvtvEI1vpfjCh0KFOeC6ZgLiUDx/N5V2OfEYjKwgvyRHEFa47x+u6jIHjzFl1WerE0VNx3/oWg29hQPQEe03Gy6mpy6aOMdeWAD9nEvm3XOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAI6WW+g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAI6WW+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7CD1F00A3E;
	Tue,  4 Aug 2026 16:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785861509;
	bh=WAirPRCGf/1333dctez2qffStYzY2tiwhsh+TDxtvKs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=VAI6WW+g6cDtS1SN5tLQMCg5XXuWh0DAcwEMi1QHNxKVtdmi9/gFDjJTUuBW3K/xE
	 7Y3lf5FI4mFz9oV953Nt4RnlSn1ZJjEGNdDF72EICw0Qs8mXGaj7M0onM2NPE+W0IT
	 gWtOE3KOwRXn5rUwPyD9LwsVSiSIzhwEsHWKCGZ9OtJSAn4iGBZHgNuthNBYCYR8tm
	 3bskM+qBKsYRaZzIkDPzrsu1RH5tTBJco1cAHhFfVk+YxyvI+iN3loqGZIcfxXBv+P
	 CoAk4wF/TcJW/2DrJFEHZ6P5txsBmsjxkBDjXooyumsrjHlMw8rCt/MrjdFX9r5QG/
	 l1E8Uxa8erT1w==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A9069198005A;
	Tue,  4 Aug 2026 12:38:27 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Tue, 04 Aug 2026 12:38:27 -0400
X-ME-Sender: <xms:gBVyatsLyObw_5ZlvbAIqScCRGlvJE6T8kMW2MLHexuZXWuoeOmlQw>
    <xme:gBVyahSiRrHG9d883qoL2dn_VR9NLoZUBZyDi5ORySuZ6Dw3a4ts5jBC1fpEwxMSv
    k6bIC78TFVSBHBpwKFZHjhFqnLMxpZxaKyLyR0ByoVmy6sqtc1guQ>
X-ME-Proxy-Cause: dmFkZTGB3CS03rqKc7WCu64gQ4WNNHMbSAX+8m1ERq9yoVsAbDitg8JQ5br4u19YNws+Cy
    GftgXYMCqWxlgPiuNr4qdcdAQ98RCN6/z2+oHeAGQ5c5nONgeSmtKqg3onWQ6Pn+GjQDIp
    fGzQESziDY0NAZv6EgXftw8HLcBhBPFmwj49C0JdodcxwM/7mOrGS3nrPUkR08UH8JPp4S
    HWdthsYMNcXgYWjTohVP3/e1ljHBCyjT3NNOdHmRcv1s1P+y8Jt3FgOkpAAhrTdUMv+ECy
    uo2Sf4asMnP512M0QtjhXayaTWzylOPydXWpFIwViawS46ZILI4KIkRdbxOx54wQVos9An
    LTruL03Z88xemcYm1is0/WAnKKLDav1MEgilpg9C01hinUdiO2CLDjdHp4uOD1+M7Ka5J5
    UJhuEU7mZgnRKShU7z6Ap1/gC9N4BsWx/Ju8grhv6lm6eB4O28VUigjgYXYsxpPd1XS6op
    IMLFbj9hafpgfZTReuU+1oyJnRS+AbJoj/uhIkfUWlP2ppfOhSKNZ9hiTspfbaS/5QV7Qy
    EI5sgmlJ7mXedH55U2lS7cM3EpAJAa5GVeUcFMCc/FtJw0Dx41X2ekzDSFsowfLewcRpPx
    lxIzHt+/F5M9OsRaSMExFHKrWBQPqQzkR1tVgWZ13RzyGKpjcS9FnlkPKM+w
X-ME-Proxy: <xmx:gxVyamcR9XnqETPn33SZiB_HAGg0xW6Z4MqyEBwk4dZ6Ym3kiFFaAw>
    <xmx:gxVyamuSXN2qtJoBsn57zvvV-PbfwP8a-O0lsymKiS5BDR1suSh-dw>
    <xmx:gxVyaliEhMkmJefpc4uaN6pxRErnLV9oOdwXaNsssb-37nIdKnwWVg>
    <xmx:gxVyamu1HTsCzF3dtbAkkktq9b1I4eSIH_64EXZ1QHHplJIRGgXh5g>
    <xmx:gxVyao9DNl87C4cYlcRXrCuDw3K1XC0h8lmPRuUhD8e_8JU-hr8VAT5E>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A5F20F80064; Tue,  4 Aug 2026 12:38:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 19:38:04 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>,
 "Maninder Singh" <maninder1.s@samsung.com>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 Onkarnath <onkarnath.1@samsung.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "Rohit Thapliyal" <r.thapliyal@samsung.com>,
 "Nick Desaulniers" <ndesaulniers@google.com>
Message-Id: <07e390cf-05ac-479e-9c34-d02b9897104c@app.fastmail.com>
In-Reply-To: <20260803182255.GC1067866@ax162>
References: 
 <CGME20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
 <20260729034101epcms5p4ac85b52aef78052cbc03d5913a7300b5@epcms5p4>
 <20260803182255.GC1067866@ax162>
Subject: Re: [PATCH 1/1] arm: backtrace-clang: fix wrong sp usage for unwinding
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello all,

On Mon, 3 Aug 2026, at 21:22, Nathan Chancellor wrote:
> Hi Maninder,
>
> On Wed, Jul 29, 2026 at 09:11:01AM +0530, Maninder Singh wrote:
>> Ping! Any comments?
>
> I am not that familiar with this code but maybe Nick (whose address I
> have now updated to point to a better one) or Ard could help take a
> look? Original patch is at
>
>   https://lore.kernel.org/20260624054916.1571701-1-maninder1.s@samsung=
.com/
>
> but I have left it inline as well.
>
>> > show_stack() can be called for any task, however c_backtrace always=
 unwinds
>> > frames based on the "sp" register. This results in printing the bac=
ktrace of
>> > the current task instead of the target task.
>> >=20
>> > Try with normal TC:
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > =C2=A0 =C2=A0 =C2=A0  for_each_process(p) {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  sched_show_task(p=
);
>> > =C2=A0 =C2=A0 =C2=A0  }
>> >=20
>> > [7.433271] task:kthreadd=C2=A0 =C2=A0 =C2=A0 =C2=A0 state:S stack:0=
=C2=A0 =C2=A0  pid:2=C2=A0 =C2=A0  tgid:2=C2=A0 =C2=A0  ppid:0=C2=A0 =C2=
=A0 =C2=A0 task_flags:0x208040 flags:0x00000000
>> > [7.433633] Call trace:
>> > [7.433640] [<80113418>] (dump_backtrace) from [<80113510>] (show_st=
ack+0x14/0x18)
>> > ..
>> > [7.433676] [<8016749c>] (sched_show_task) from [<803cb324>] (meminf=
o_proc_show+0x6c/0x930)
>> > [7.434019]=C2=A0 r5:8158e300 r4:8b4882d0
>> > [7.434024] [<803cb324>] (meminfo_proc_show) from [<80365788>] (seq_=
read_iter+0x148/0x4bc)
>> > [7.434045] [<80365788>] (seq_read_iter) from [<803c044c>] (proc_reg=
_read_iter+0xb8/0xc4)
>> > [7.434060] [<803c044c>] (proc_reg_read_iter) from [<80377104>] (cop=
y_splice_read+0x228/0x308)
>> >=20
>> > It should unwind frame based on passed "fp".
>> > (CONFIG_UNWINDER_FRAME_POINTER=3Dy)
>> >=20
>> > With fix:
>> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > [13.933732] task:kthreadd=C2=A0 =C2=A0 =C2=A0 =C2=A0 state:S stack:=
0=C2=A0 =C2=A0  pid:2=C2=A0 =C2=A0  tgid:2=C2=A0 =C2=A0  ppid:0=C2=A0 =C2=
=A0 =C2=A0 task_flags:0x208040 flags:0x00000000
>> > [13.934165] Call trace:
>> > [13.934604] [<80afa1a8>] (schedule) from [<8015426c>] (kthreadd+0x1=
24/0x208)
>> > [13.934654]=C2=A0 r10:8100bbf0 r4:8116f440
>> > [13.934664] [<8015426c>] (kthreadd) from [<8010010c>] (ret_from_for=
k+0x14/0x28)
>> > [13.934691] Exception stack(0xf081df9c to 0xf081dfe4)
>> >=20
>> > Additionally, the extra manipulation of "sp" register appears unnec=
essary in the "current"
>> > task also since the "fp" register is already provided.
>> >=20
>> > Signed-off-by: Onkarnath=20
>> > Signed-off-by: Maninder Singh=20
>> > ---
>> >  arch/arm/lib/backtrace-clang.S | 4 ----
>> >  1 file changed, 4 deletions(-)
>> >=20
>> > diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrac=
e-clang.S
>> > index 290c52a60fc6..993410a6afd1 100644
>> > --- a/arch/arm/lib/backtrace-clang.S
>> > +++ b/arch/arm/lib/backtrace-clang.S
>> > @@ -105,10 +105,6 @@ ENDPROC(c_backtrace)
>> >  		moveq	mask, #0xfc000003
>> >  		movne	mask, #0		@ mask for 32-bit
>> > =20
>> > -/*
>> > - * Switches the current frame to be the frame for dump_stack.
>> > - */
>> > -		add	frame, sp, #24		@ switch to false frame
>> >  for_each_frame:	tst	frame, mask		@ Check for address exceptions
>> >  		bne	no_frame
>> > =20

The existing code does seem to be broken, as the provided frame pointer
value is ignored entirely.

However, by removing this add, you are skipping the false frame, which
was added to ensure that calling c_backtrace() from dump_backtrace()
does not miss any frames when regs =3D=3D NULL.

So I think the correct approach here is to make the add conditional
on whether frame =3D=3D fp, which will be the case when c_backtrace()
is called from dump_backtrace() with a NULL regs argument.

I.e.,

  cmp    frame, fp
  addeq  frame, sp, #24

