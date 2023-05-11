Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F81C747;
	Thu, 11 May 2023 10:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13CCC433D2;
	Thu, 11 May 2023 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683800887;
	bh=YQBBlf6460hat49SMSw0E4vcpVclaF31GHF1eKeJqO4=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=r6i3yJFAZn0L/VjKJjy/Q2YMoWwqpjXxqN85m6bwkCMtqGx1YQY+Qh/9RVf335Oc4
	 ThKDHnkl1yKAFFFy00bCDoPEebqiv3rRVecj3xHQKnSkWBr55rQST2q9rPvE2Js8pt
	 UyEuP5102NuXWptWc5RJZGINbE2CoUeSu/qWznqVifMcQjRd4Xe+RgWqWbaNTvPXtd
	 n4Gl04i8+SQHqXXvJGp8HUle9bHlthhmZE2jwBiN1iSJBE4jDhnMXSWv7r5Q7yoXZz
	 KP1YqghLgkRVZ5SyljGuEsnETTk95B79n/S7TNcpjettrklqhpGK9TS2CQUB3bVEfU
	 i+N56SVZT2k8w==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id B0F3427C0054;
	Thu, 11 May 2023 06:28:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 11 May 2023 06:28:05 -0400
X-ME-Sender: <xms:NcNcZO-YkcbAcWYAFxl2JXzVY7Mwys-G2xPCSTO_RI4amBCubRj6UA>
    <xme:NcNcZOvzruE-udcPh9eOPtuCgYRUTZSsbkHYvYVpCYG0egDW91NumCNLAfLrUzmmf
    IWDsdBBFsk8n8DVemc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepvdeviefgtedugeevieelvdfgveeuvdfgteegfeeiieejjeffgeeghedu
    gedtveehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
    vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
    guvg
X-ME-Proxy: <xmx:NcNcZEBVp-RkB_iDzF81hP6igI0a3IcV5XvAWm_xFih5SyZ0SfXDOQ>
    <xmx:NcNcZGc4ug32hlZD1BalTUBRjusPyxIRgtsnj2yWK7YpjnF8oqqxmg>
    <xmx:NcNcZDNSLrQqVzzY9VzJoe6YgDRu66Ma86-L8gNDdYcAZVo7-iBaLQ>
    <xmx:NcNcZJ1JQ6nFb4F9dEjyyiuDpHeLC_7Iiz8vsgpmiq4Xa7HEB7RRoQ>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6B337B60086; Thu, 11 May 2023 06:28:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <363ef5bd-0278-4589-8c74-752451ccd362@app.fastmail.com>
In-Reply-To: <c593b7b3f3d42545ca07424a6ab5afb268c150a2.camel@linux.ibm.com>
References: <202305110634.RGuHbrxM-lkp@intel.com>
 <0474d84f-69cb-4c98-9833-695ed25bc65c@app.fastmail.com>
 <e5c936bbbe81d11fb577098679376c64a83d4d4c.camel@linux.ibm.com>
 <73615d5f-d507-42aa-8689-7e80093c9f75@app.fastmail.com>
 <c593b7b3f3d42545ca07424a6ab5afb268c150a2.camel@linux.ibm.com>
Date: Thu, 11 May 2023 12:27:45 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "kernel test robot" <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:289:5: warning:
 no previous prototype for function 'usb_hcd_amd_remote_wakeup_quirk'
Content-Type: text/plain

On Thu, May 11, 2023, at 11:34, Niklas Schnelle wrote:
> On Thu, 2023-05-11 at 10:49 +0200, Arnd Bergmann wrote:
>> > 
>> > I think I saw it but assumed that the extern declaration in
>> > include/linux/usb/hcd.h was enough. I guess before this was hidden by
>> > the missing CONFIG_USB_PCI_AMD. Should be fixed now.
>> 
>> Ok. It looks like linux/usb/hcd.h is just not included in quirks.c, 
>> so adding an #include should also fix it.
>
> It feels a little cleaner to keep it in pci-quirks.h where it was
> before the patch. I just wonder if we then also need an #ifdef
> CONFIG_USB_PCI_AMD around the extern declaration?

I generally prefer not to have an #ifdef around an extern declaration
unless there is a 'static inline' version in the #else path.

    Arnd
