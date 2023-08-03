Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A689440
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 07:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA3EC433CA;
	Thu,  3 Aug 2023 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691049536;
	bh=1qShQjYaIAI9saShacA94XNnUPtQtDSYRE2iho6abzY=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=X5FMQqqumM/BtJsfK0Fu1SCN37sHPSUYYuu5mUAHvrxMNd/Y1727sE74S8xxyvrJZ
	 Xtl3rvrVCavMPgA9E0vR6fldLQKUpuG+IJmARBgAGFXNNP9zUUlPkBUL3d2Ncm1HF1
	 kNT2Nmr0K7oyc+glmvPdmw6ORkkH2mYfAY4DSo1BomweTmw3wknwY43M1zZj/NVT3W
	 S+rNKMN7xwSTgcCvSnIwug4fFBsok2pTxV/Y+bsD26EotzssKvZwQfghe1tYRGmr1W
	 oXhd7m0I22D3TuzdDdqu9lR+oZvuOSIoeLjvE+cqU41JQgGkJyDecek9NVf0oFzlvf
	 5MVhgqE4xbiIw==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 4557D27C0054;
	Thu,  3 Aug 2023 03:58:55 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 03 Aug 2023 03:58:55 -0400
X-ME-Sender: <xms:Pl7LZJ-3J51E4ssLZq_jPPvqAfxn0O339l3SsaufWz-qlKL6uBu8bg>
    <xme:Pl7LZNskbAnLHD40mbyq3rc_Ff6uBSk6z34YhAfVm42v3bkjTc3-gKb2wMHnYbVMO
    t-UvcL1Qcd2FWnsvOU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkedugdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpedvlefhudeuveekueejuefhveefudefueetuddvieejffehffeiieet
    leejlefftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnh
    gupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Pl7LZHDLbAcR4nLf7eawaAtZE8Rzj8xxjAjrVk5F8SRsb_648I4qCQ>
    <xmx:Pl7LZNeqPNiZ1OS850XQSFUDHxJ3OhX1EXTuLF5XPrIxH7-uH5vZiA>
    <xmx:Pl7LZOOryb8J4d4EUUBFmhMu29VCRwMUfmmtu9DmeIqgbJIWiPLQDg>
    <xmx:P17LZNebZAJs5jRtVluuuJBE6ckHiEKYKhxHDsTW-VvfWjgXGnnLUA>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 97527B60089; Thu,  3 Aug 2023 03:58:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <b0e203e7-3b3c-40ad-8d99-e43415c0d3c5@app.fastmail.com>
In-Reply-To: 
 <CAMhs-H-2g2QF8NjZOknEop_3UFc_R3YYhpEveU2fc-Ks-iM1bA@mail.gmail.com>
References: <20230802092647.3000666-1-sergio.paracuellos@gmail.com>
 <CAKwvOd=SvHUPd8+sWtqgxghPEciD5sqPiggZx+OOEqxtJrML6Q@mail.gmail.com>
 <9a22ecee-ebb0-437e-bd2b-99b5c6944855@app.fastmail.com>
 <CAMhs-H-2g2QF8NjZOknEop_3UFc_R3YYhpEveU2fc-Ks-iM1bA@mail.gmail.com>
Date: Thu, 03 Aug 2023 09:58:34 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Sergio Paracuellos" <sergio.paracuellos@gmail.com>
Cc: "Michael Turquette" <mturquette@baylibre.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 clang-built-linux <llvm@lists.linux.dev>,
 "kernel test robot" <lkp@intel.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: ralink: mtmips: quiet unused variable warning
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023, at 00:35, Sergio Paracuellos wrote:
> Hi Arnd.=20
>
> El El jue, 3 ago 2023 a las 0:02, Arnd Bergmann <arnd@kernel.org> escr=
ibi=C3=B3:
>> On Wed, Aug 2, 2023, at 23:26, Nick Desaulniers wrote:
>> > On Wed, Aug 2, 2023 at 2:26=E2=80=AFAM Sergio Paracuellos <sergio.p=
aracuellos@gmail.com> wrote:
>> >>
>> >> When CONFIG_OF is disabled then the matching table is not referenc=
ed and
>> >> the following warning appears:
>> >>
>> >> drivers/clk/ralink/clk-mtmips.c:821:34: warning: unused variable '=
mtmips_of_match' [-Wunused-const-variable]
>> >> 821 |   static const struct of_device_id mtmips_of_match[] =3D {
>> >>     |                          ^
>> >>
>> >> Silence it declaring 'mtmips_of_match' with '__maybe_unused'.
>> >>
>> >> Fixes: 6f3b15586eef ("clk: ralink: add clock and reset driver for =
MTMIPS SoCs")
>> >> Reported-by: kernel test robot <lkp@intel.com>
>> >> Closes: https://lore.kernel.org/oe-kbuild-all/202307242310.CdOnd2p=
y-lkp@intel.com/
>> >> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>> >
>> > I think this is fine; Arnd or Nathan do you have a preference? or t=
houghts here?
>> >
>> > If not, thanks for the patch.
>> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>> >
>> > (I have a slight preference for wrapping the use in `#ifdef CONFIG_=
OF`
>> > since with the approach used by this patch, if all users are removed
>> > we will never get a warning for this var. But it's a weak preferenc=
e;
>> > it's more important to me that we don't have -Werror promote this
>> > warning to a build breakage)
>>=20
>> I don't understand why there are two match tables in the same
>> driver, with almost the same contents. I have not looked very
>> closely here, but why can't we just drop the mtmips_clk_of_match[]
>> table (the one without the .data fields) and use the same
>> table for both? Is this because of the ralink,rt2880-reset entry
>> that is missing in mtmips_of_match, or is that another bug?
>
> ralink,rt2880-reset is for old dts compatibility and only applies to=20
> reset driver. The one with data fields apply for clocks and is needed.

Ok, I see. It still looks like the two tables can simply be
merged by adding the ralink,rt2880-reset entry to mtmips_of_match[],
which will allow it to be used for mtmips_clk_driver (which doesn't
use the data) as well as for mtmips_clk_init() (which doesn't
need get called for ralink,rt2880-reset).

>> I also see that there is both a platform_driver instance for
>> late probing and a list of CLK_OF_DECLARE_DRIVER() entries.
>> Do we need both here?
>
> This system controller driver provide clock and reset controllers.=20
> Clock cannot be a platform driver since we need to set=20
> mips_hpr_frequency at a very early sargento. Reset stuff can be a=20
> platform driver so both of them are needed.

     Arnd
