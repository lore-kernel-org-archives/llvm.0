Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3E717C2;
	Wed,  9 Nov 2022 16:34:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 05595320095C;
	Wed,  9 Nov 2022 11:34:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 09 Nov 2022 11:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1668011647; x=1668098047; bh=vf6slSTLfl
	XSo7HmunYNB3fD2m+0dPwzrqQNVxEXyyE=; b=AGw/EkF6ZaIg5rtWkoZtyufz3h
	uyJXvcyoHntQW5xAs193MV0uABNYhXJB6tUhQgVwMwnfHAQiXW0FjybkJQ7BaotP
	eVxLeoWc7Lg7GVSI9R7RvTN0h2So91cX14MCjufShnMskxdzdmowkZyQSvVcDrhf
	7JCH3hJLK7d6z0oJvHFrBWkXBixhV6OYLgv6+cuaCQA5exhabR3PFp/uKP/m2EzJ
	CbvJXuTUrG8PeMgjYK1M7PO4fWwgOVFYVqTIq6m9VPP0rPK15OaNanDHPyIoL2LF
	TBtjmGTlH05b/XOinj1GTlokbvwsUe9y7iuORVc/Ly40RXujT1xZFLTcLT7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668011647; x=1668098047; bh=vf6slSTLflXSo7HmunYNB3fD2m+0
	dPwzrqQNVxEXyyE=; b=eULJb+3r0jKVFOLc+5ORm9kMw0tXRw2QubwIwBdyTBvU
	HnU3v19Y+crxsNfgYOzJqlhaZeCo/QRKOC5Ct58E3OqDNFEj/DQvGiJ4AjqUZ/Vr
	ItMUPZEx0B5Xaa1+lKsYpXJE8JVqMTy39QW9ibXDndQOmsfyDwpVpIKeyDID0L6r
	aOJp2zVed/aNbB6asLtoMVmvaXOrazgEMk7T1k7RQNy2ujbyH1te6erCp0QuDtyo
	7PXawHiw6mTJ/9kslSiqHso5ttViudByr3Zo245mXH1d+w9nrGHgKAoCwfyrSXQO
	adrfbI4PUs2h9sgvNZNCu/aT7gnD+9dkido/QKsWVw==
X-ME-Sender: <xms:f9ZrY45-vl4veTSc-0wkgznrjWwRlkgzDp9ntAfykWg4LHf3KX0qJQ>
    <xme:f9ZrY56SrZOoYMLRi3rWgnJra2XmAQ8ynVgHBRVz4n6AlLvl9XWNH8m_8bFUMqHw0
    e7DOiUI_S5urM3U0x4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgdeklecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegr
    rhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepvefhffeltdegheeffffhtdegvdehje
    dtgfekueevgfduffettedtkeekueefhedunecuffhomhgrihhnpehkvghrnhgvlhdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:f9ZrY3e5qfeY9Q37mZHf_OsOle_3drWvdIIuwE2WngictA80uT-_Jg>
    <xmx:f9ZrY9JNfGDrekyVNYDRoC8B8QuwzhoA0zPnSJMiDQ6tlIIPPSJvtQ>
    <xmx:f9ZrY8KSs9js0RcdRaDTSdnt2VtR_y8w_Udv-9KN23ij8-gz3RGRdA>
    <xmx:f9ZrYzV2IegOVsptMxVPRF5PVppVjLtxqDsCgveDhINAm8NnyuYWbg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1034DB60086; Wed,  9 Nov 2022 11:34:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <aea446bf-0f06-4636-9ebc-acc2bdc0c30e@app.fastmail.com>
In-Reply-To: <202211092229.qTe1ff7F-lkp@intel.com>
References: <202211092229.qTe1ff7F-lkp@intel.com>
Date: Wed, 09 Nov 2022 17:33:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>,
 "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 4222/6614] rswitch.c:undefined reference to
 `ptp_clock_index'
Content-Type: text/plain

On Wed, Nov 9, 2022, at 15:21, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
):
>
>    s390x-linux-ld: DWARF error: could not find abbrev number 4453
>    drivers/net/ethernet/renesas/rswitch.o: in function `rswitch_get_ts_info':
>>> rswitch.c:(.text+0x2a28): undefined reference to `ptp_clock_index'
>    s390x-linux-ld: DWARF error: could not find abbrev number 11
>    drivers/net/ethernet/renesas/rcar_gen4_ptp.o: in function 
> `rcar_gen4_ptp_register':
>>> rcar_gen4_ptp.c:(.text+0xd6): undefined reference to `ptp_clock_register'
>    s390x-linux-ld: drivers/net/ethernet/renesas/rcar_gen4_ptp.o: in 
> function `rcar_gen4_ptp_unregister':
>>> rcar_gen4_ptp.c:(.text+0x198): undefined reference to `ptp_clock_unregister'

This usually means the driver needs an extra Kconfig dependency:

       depends on PTP_1588_CLOCK_OPTIONAL
