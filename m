Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066C38B
	for <llvm@lists.linux.dev>; Fri, 21 Apr 2023 14:31:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 376595C0180;
	Fri, 21 Apr 2023 10:31:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 21 Apr 2023 10:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1682087461; x=1682173861; bh=ob
	qkcphqvBdAWuMSyr9Pl64QwA+BGq6GX8P7IjRDFMo=; b=adXBOo68IWWVLNpbR7
	XTdrYX6QuvQtcqZzG0y/PGRna4nQkqxhvCmx2PFZw6E8HQhvBu8YuttxyxSeSwmt
	ex3Z8HKdsMA+j33afFwRg1nUycgXXA9EqjHi2WZbF+2zKud1Si1vIJ9RICQ4tbfC
	fnBuHmL8nvKEOJE3I8Jp4Ak3hAV2oQHDymVGThGr8FhAEuuZ8OYkvMuJ7O2JFKR5
	61MOoRcj70iYHQtZjoLADZpOyenXjL1B752TDuQTVAkKJuutL/kYXRtgTyzLiuYO
	r/3orOzFknrsWAJ64W4Qqj2gVy7C/Q3rjyVGNiirlJNrOD8BzaN/IJmtY2JybRly
	tteQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1682087461; x=1682173861; bh=obqkcphqvBdAW
	uMSyr9Pl64QwA+BGq6GX8P7IjRDFMo=; b=gNB50BU/CdGiEojWS7vu5BksyMRZd
	OlxJEOs2ueNsgZUeagQpaCifJONqnXMRnNeXZ6WBeKFmDIdMq4gSwOyWpABT7YFM
	82ikp6ZGLZZlXE0mogvyi6m5dIoTqSwRwPdWOleGwlFzLpKxBtKT8QYAaOaOn2ay
	zLkZep1hHmwlYSP0323Av4Tl5sxfLJN7WPGEIKvc/xlT2rPrJvN0YvtvpmMU2nJM
	6uMowFldG2kBh0dbwY1H/Q/Je/FvqMi+bMxS56HN7G/l8maGNXq2hWeVXZ36FBVn
	oV3/p9Pr70otk+PnhfcjOCRo192dRUX38z06ZOZscgQsIfHFBEoLKmPGg==
X-ME-Sender: <xms:JJ5CZARgh8iDvyZxEt33ewlI5oCsZMoH1BT15JG5s-R_B0ZcQKZIyQ>
    <xme:JJ5CZNyVjUU3S4Rmo0pHRHMfbKgVKKbBALHhW5A_pLfsyUef_Rzstpv2d5q17JEjB
    1hnkgo5Vhw_DLsB3og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JJ5CZN3OHLhQj2rkrn4EP6tJjs0wp6xLXJTy5ZKzgovC5Yy6pczVHg>
    <xmx:JJ5CZEAOvuQ3uOpW7y_grZgGsaOwVnkpcYs_5G3UHEqzbH4WQpsbrQ>
    <xmx:JJ5CZJhV_QRKtaAHzt_VFwvqoA9_S9_7LENlM10l1GvBjOR03TwhiQ>
    <xmx:JZ5CZBwmuDwRbr11M2a-jMCI7Ph3Azy4pn1hNL_CybjUPcBPgACwJQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 65915B60086; Fri, 21 Apr 2023 10:31:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <5d13e927-3713-4b9e-b007-6be5671d46f2@app.fastmail.com>
In-Reply-To: <20230421130111.4041641-1-tudor.ambarus@linaro.org>
References: <20230421130111.4041641-1-tudor.ambarus@linaro.org>
Date: Fri, 21 Apr 2023 16:30:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Tom Rix" <trix@redhat.com>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: joneslee@google.com, "Peter Zijlstra" <peterz@infradead.org>,
 "Kees Cook" <keescook@chromium.org>, "Josh Poimboeuf" <jpoimboe@kernel.org>,
 zhaoyang.huang@unisoc.com, "Liam R. Howlett" <liam.howlett@oracle.com>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, "Mark Brown" <broonie@kernel.org>,
 "Dmitry Vyukov" <dvyukov@google.com>, nogikh@google.com
Subject: Re: [PATCH] Kconfig.debug: disable CONFIG_FRAME_WARN for KASAN_STACK &&
 CC_IS_CLANG by default
Content-Type: text/plain

On Fri, Apr 21, 2023, at 15:01, Tudor Ambarus wrote:

> The conclusion is that when KASAN is enabled the stack usage increases a
> bit, but nothing unmanageable ~30-70 bytes, whereas when enabling
> KASAN_STACK the stack usage is excessive, from ~1.7K to ~5.8K for these
> cases.
>
> Disable CONFIG_FRAME_WARN for KASAN_STACK && CC_IS_CLANG by default.
> Adventurers can still override the default value by input prompt or
> explicit values in defconfigs in case they feel that some real warnings
> are missed.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

I think we are still better off with the warning enabled. When someone
really wants to run a kernel with KASAN_STACK enabled, they should have
a chance to see what they are getting into and not report any runtime
bugs that come from stack overflow. 

      Arnd
