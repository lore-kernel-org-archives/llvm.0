Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F4C1B8E9
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 07:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD83C433EF
	for <llvm@lists.linux.dev>; Thu, 11 May 2023 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683789685;
	bh=qAYHNGs0LFOOnmVkEABSLN/ePjnMD+mmOhN8OQ3Tov8=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=tTI7tw+WAWJAlGucoWWc0Lyqux7lEmxv+nJ2Ih3GKAHy/DDJ0MvVV/sB5EuGw+Lc2
	 B4mAUy72mFwaRq54Pqk7i8unk+9HVdHGuLy8HHHw0bJjDWk+0zROIApK1VaXbrZSNz
	 ANeWf5a1w3C5GxZD26okD0It0MgUhLEP5cIMV/rq1jNi1SToRRAWtOC9aoos25Okb/
	 zOBeyp1b4Gj8D/WD884QTuIF9WQFw3rmA2L2PgTvY/fQsGXMxZETG6xDzoKpa7cSVa
	 I7/EdPEQR1uRDI1J3A/HeWzT8OP+ll4zj8VdW+gDXn2GJrU6q/sFodOAA6UPJJMjXF
	 qp6wc6cL4iJng==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id ABEA227C0054;
	Thu, 11 May 2023 03:21:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 11 May 2023 03:21:24 -0400
X-ME-Sender: <xms:dJdcZEHeHo6cZQrx1MtzzvS9WL7kAEl_jNu8regns4_gqUx4Y90G5g>
    <xme:dJdcZNUjtcjbjuxN4Sd_xwGx_bZlfZnsKkmSzCsauj527m4k8SfdBpGyRULDuMloS
    CMdwYzokX6ZfG-oa5s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegjedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpeehvddtueevhfevveeghffgfeevleeileduudefveeuhedtjeejgeeh
    geehkeekteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedqvdekjedttd
    dvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggv
X-ME-Proxy: <xmx:dJdcZOL3Dekp8hEtReHoM0AxgsQS4jeCUKr1DXL7LUG1PikTlv2REg>
    <xmx:dJdcZGED44xAxEkNJeqa7eZB9kRTuwegVNYTx042i8r4yt-OXJxLcw>
    <xmx:dJdcZKVaYWkNyYg7GzerzZ4NGdKCgm3NLF2yNERK054wTO9v4TVR_A>
    <xmx:dJdcZNe5uP-kc2DXC7iBHK3q4pkrWHtC9dABnRfXx7FC4fH9UrpARw>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6CE1BB60086; Thu, 11 May 2023 03:21:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <0474d84f-69cb-4c98-9833-695ed25bc65c@app.fastmail.com>
In-Reply-To: <202305110634.RGuHbrxM-lkp@intel.com>
References: <202305110634.RGuHbrxM-lkp@intel.com>
Date: Thu, 11 May 2023 09:21:03 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "kernel test robot" <lkp@intel.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:289:5: warning:
 no previous prototype for function 'usb_hcd_amd_remote_wakeup_quirk'
Content-Type: text/plain

On Thu, May 11, 2023, at 00:31, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git 
> has_ioport_v4
> head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
> commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb: 
> pci-quirks: handle HAS_IOPORT dependencies
> config: x86_64-randconfig-a014 
> (https://download.01.org/0day-ci/archive/20230511/202305110634.RGuHbrxM-lkp@intel.com/config)
>
>>> drivers/usb/host/pci-quirks.c:289:5: warning: no previous prototype for function 'usb_hcd_amd_remote_wakeup_quirk' [-Wmissing-prototypes]
>    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
>        ^
>    drivers/usb/host/pci-quirks.c:289:1: note: declare 'static' if the 
> function is not intended to be used outside of this translation unit
>    int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
>    ^
>    static 
>    1 warning generated.

It looks like the declaration was dropped by accident, it should
have been moved into the #ifdef.

     Arnd
