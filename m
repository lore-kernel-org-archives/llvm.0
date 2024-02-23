Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB2F78667;
	Fri, 23 Feb 2024 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708688002; cv=none; b=aqkeD/A8VNa788sdpZodBa5u8ShBqnRNd690Qw3Sd/thW/+/dnm/HAJs5Z5RKGwf68Iw5pceEEpnlMw2Fw8vhYJuedMe3WY/vfDvRwC1dg4sNMidV4MK5v+H6gURryiGbnrrseUv1GmMd7O8Q/xSprZFZ1sAOqkt4MkIlRVVtew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708688002; c=relaxed/simple;
	bh=TcK+Iw2zld5U2RS8+AAnETRmCK3lZzzCa7IpNlIpdrM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tqrVFU2F14PHTaFUQfUPHUOTMw4hS4fpgkljiYWKpc6hOtMajG+aJn6Fu6fWC0TIIlh3awNlCnpfXSv1Mhvg6qMq93FAc9Jp8dhylzehDUrzvby6m4nrsbtGL2VzQ9bobw86q0W4I1ZB5N3//q8OR+p3WvgmViNeEEq1aWQuYxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rL0WYRj5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rL0WYRj5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD46C43394;
	Fri, 23 Feb 2024 11:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708688002;
	bh=TcK+Iw2zld5U2RS8+AAnETRmCK3lZzzCa7IpNlIpdrM=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=rL0WYRj5M5K5hSRncrSWAAeJ4+vqwHZpD9E5SFTuVlEzAx8T7ZM7b44h8crUUcTbZ
	 tx7WM/6i8ji8z4sWf+yEJ0AjwA7IdIaMXxT1i67EL19LFY/yECgUFFA6ihnU4WVVrq
	 7Obki8/RxegVSleRfE1F7OEDWbpIXjoy6hQx1eUNZ+Why0Y3/PYPfJhgUbV9/+lZ1V
	 GswAjfoQ49Rzw23Ul5ji7AeTrd5LIro5+/6o2fp2W7L4WEoP2ZSosXKmyhIFQYXJlE
	 EoWLUPQVtXDXMc6LQrovq3M+XJwO03qu56kexKUqK9abKUxyn5rsOwG++/eg6D2URb
	 7Ep9DdBsoIMtg==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 27DFF1200066;
	Fri, 23 Feb 2024 06:33:21 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 23 Feb 2024 06:33:21 -0500
X-ME-Sender: <xms:gILYZTQgtF7EnfIGi6j_DWOw9hUgMliCKwVJHRCMupGhZsrHIKfVEw>
    <xme:gILYZUyKhjegUy3pzUSANi6AWCu22NkCoSw0oC50vrfkQ2ep0zJo_KwiLx6ytQF5T
    RuLzS2PM1a4S08_x_4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeigddvlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvveeigfetudegveeiledvgfevuedvgfetgeefieeijeejffeggeehudeg
    tdevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddv
    gedqvdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdrug
    gv
X-ME-Proxy: <xmx:gILYZY2C-eF67EaErq5p65cst5weL6F2OSyBaa_uDRP94U48S1RIMw>
    <xmx:gILYZTCwZke92r2KUFUPwtYSar2o-HdSJUrHK9tWuthakIZnRDoczA>
    <xmx:gILYZcjoh_EEdaW8Y18a9NxP8koF_AaP5JchDaGM64CBcqYivhgIIg>
    <xmx:gYLYZftGzCXSlfBg-NAqsPl81kQdWwXSceBsWycmZlsiJlQgKsT8dtidI1g>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 940ADB6008D; Fri, 23 Feb 2024 06:33:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <90459f4b-74b8-4e1a-9024-6536c7437a19@app.fastmail.com>
In-Reply-To: <69c27b568d423e7784dcb6eb578253f5e5df8194.camel@linux.ibm.com>
References: <202402180019.a2GWUA60-lkp@intel.com>
 <7e9c8f49-4f95-4dcb-a038-36bb5c895b20@app.fastmail.com>
 <69c27b568d423e7784dcb6eb578253f5e5df8194.camel@linux.ibm.com>
Date: Fri, 23 Feb 2024 12:33:00 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "kernel test robot" <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v6 19/19] lib/iomap.c:81:23: error: call to '_inb'
 declared with 'error' attribute: inb()) requires CONFIG_HAS_IOPORT
Content-Type: text/plain

On Fri, Feb 23, 2024, at 11:32, Niklas Schnelle wrote:
> On Sat, 2024-02-17 at 21:05 +0100, Arnd Bergmann wrote:
>> On Sat, Feb 17, 2024, at 17:13, kernel test robot wrote:
>
> Looking at this again I'm not sure. The IP_COND macro already selects
> between MMIO and I/O port access. Shouldn't we have something like:
>
> #ifdef CONFIG_HAS_IOPORT
> #define IO_COND(addr, is_pio, is_mmio) do {			\
> 	unsigned long port = (unsigned long __force)addr;	\
> 	if (port >= PIO_RESERVED) {				\
> 		is_mmio;					\
> 	} else if (port > PIO_OFFSET)
> {				\
> 		port &= PIO_MASK;				\
> 		is_pio;					
> 	\
> 	} else							\
> 		bad_io_access(port, #is_pio );			\
> } while (0)
> #else
> #define IO_COND(addr, is_pio, is_mmio) is_mmio
> #endif

I think that would work, but we should never need it, as
there should never be a configuration that has CONFIG_HAS_IOPORT=n
but CONFIG_GENERIC_IOMAP=y.

For architectures that do not require special instructions for
inb/outb, we get the defaults from asm-generic/io.h:

#ifndef CONFIG_GENERIC_IOMAP
#ifndef ioread8
#define ioread8 ioread8
static inline u8 ioread8(const volatile void __iomem *addr)
{
        return readb(addr);
}       
#endif

#ifndef ioread16
#define ioread16 ioread16
static inline u16 ioread16(const volatile void __iomem *addr)
{
        return readw(addr);
}
#endif

#ifndef ioread32
#define ioread32 ioread32
static inline u32 ioread32(const volatile void __iomem *addr)
{
        return readl(addr);
}
#endif

This works equally well for targets that have no I/O port
access at all and those that implement inl() as readl()
with an offset anyway.

    Arnd
