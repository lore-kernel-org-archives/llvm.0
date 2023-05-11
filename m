Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B788F5A
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 08:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4C0C4339C;
	Thu, 11 May 2023 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683794982;
	bh=kU4TkgyYfUDHJ7HEAQDohA198Tgvy7e1CPxNDSwCOJE=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=HVF+KvvoEWN3vmwqFR8ozQ9MV0iEarFk2Q8nhj7NeoGjhDbdOwubxJd/b51xBeqw1
	 KeUD1gOfVC2kFufHN9I91YmoNTH1apn+u9nIVEbDDvSWeZ0s/yRRwSjuEvPZLWKehj
	 Jgg2r8Pu8GSC0eZyj2oelTVIcmDUFb4MCZOhKanX7tcKdnt5m4BcVOSE5f/+7lNS8O
	 PfuP9xbeWI192qcvNCALX7dgq6fgapv489+nHA/EBb30D7Fz5jcMF504unFpy+BrVN
	 VhKN09BuMjSdDXbA8ztOGdIeOzc4Hg7NwYGhy6h0z773nMRuwXI7ag3TlFmspx6eJl
	 9RQB+2pvF3kWQ==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 93BF227C0054;
	Thu, 11 May 2023 04:49:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 11 May 2023 04:49:41 -0400
X-ME-Sender: <xms:JaxcZKP_mFTi9VA4NRqxapQ97jngWhh536FfEc-jtSzr6-Y8T6lUTA>
    <xme:JaxcZI9mC8diPqE3xF6Mn3Mecp9DwIC8gsE4lGLvhqvRJQEeeBuKMiHFAH4ty7uEt
    fa9yeMOzhIlPLDG9Mk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegkedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhephedvtdeuvefhveevgefhgfefveelieeluddufeevueehtdejjeegheeg
    heekkeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghs
    mhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvd
    eigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JaxcZBR9M4MvjS7UJOhm6IuiuDx6DUu1gRfpGencZmK-Vm9rP4aruA>
    <xmx:JaxcZKulnwokahbogZc9Ui7IJfDycHkYLdRLKaX_AfHEVKBkQzwkEg>
    <xmx:JaxcZCfwuDQFnRZvb-jwMVArHkIcYcwppv9eNlsrRJIF3XW5YgTbrQ>
    <xmx:JaxcZGGbh8gbOPVnAlFYFwO4shc1XynRQtgcplyLQ4HmNN2dR7GZ2w>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EBED6B60086; Thu, 11 May 2023 04:49:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <73615d5f-d507-42aa-8689-7e80093c9f75@app.fastmail.com>
In-Reply-To: <e5c936bbbe81d11fb577098679376c64a83d4d4c.camel@linux.ibm.com>
References: <202305110634.RGuHbrxM-lkp@intel.com>
 <0474d84f-69cb-4c98-9833-695ed25bc65c@app.fastmail.com>
 <e5c936bbbe81d11fb577098679376c64a83d4d4c.camel@linux.ibm.com>
Date: Thu, 11 May 2023 10:49:19 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "kernel test robot" <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:289:5: warning:
 no previous prototype for function 'usb_hcd_amd_remote_wakeup_quirk'
Content-Type: text/plain

On Thu, May 11, 2023, at 10:06, Niklas Schnelle wrote:
> On Thu, 2023-05-11 at 09:21 +0200, Arnd Bergmann wrote:
>> On Thu, May 11, 2023, at 00:31, kernel test robot wrote:
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git 
>> > has_ioport_v4
>> > head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
>> > commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb: 
>> > pci-quirks: handle HAS_IOPORT dependencies
>> > config: x86_64-randconfig-a014 
>> > (https://download.01.org/0day-ci/archive/20230511/202305110634.RGuHbrxM-lkp@intel.com/config)
>> > 
>> > > > drivers/usb/host/pci-quirks.c:289:5: warning: no previous prototype for function 'usb_hcd_amd_remote_wakeup_quirk' [-Wmissing-prototypes]
>> >    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
>> >        ^
>> >    drivers/usb/host/pci-quirks.c:289:1: note: declare 'static' if the 
>> > function is not intended to be used outside of this translation unit
>> >    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
>> >    ^
>> >    static 
>> >    1 warning generated.
>> 
>> It looks like the declaration was dropped by accident, it should
>> have been moved into the #ifdef.
>> 
>>      Arnd
>
> I think I saw it but assumed that the extern declaration in
> include/linux/usb/hcd.h was enough. I guess before this was hidden by
> the missing CONFIG_USB_PCI_AMD. Should be fixed now.

Ok. It looks like linux/usb/hcd.h is just not included in quirks.c, 
so adding an #include should also fix it.

     Arnd
