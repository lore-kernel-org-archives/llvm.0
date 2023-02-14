Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B10BC0A3
	for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 21:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDC6C4339B;
	Tue, 14 Feb 2023 21:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676411624;
	bh=+Xm/IjO7zOYY3xtxffSO9GMqU3xo7Wj16H3ovl72Lag=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=TI5jfe0bqw1qT6byRbqj5cSofRTau19hgFr22yxIPJY6Yfb8R0kLlKMjarPC945uK
	 zR1ZKU2cVLWITnO4sm7zjxhhHDTJOa+VYT4fuUtkwigTYhGlE21+L7jWCEyEP1steC
	 rAUTkM0pGfOOl80bqRA3wehpV2hmzs+xV3sfsL0RoJFERlK2aLuGQQILpFXYOFr9Tr
	 AQExbdXDr+8ilpjK7NfCYJbYnYRVoG+m6SZrxvp7AvvXDhimF7MVUvV3IMVenonYzZ
	 9lL1Q1zN5R7KEcjt8U1iiEQkf47iLyiKrZnRZm+rsDNPIiCJN8ucF+QCP6CpadXCoZ
	 FvV0x35H3XsIw==
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 59ED527C0054;
	Tue, 14 Feb 2023 16:53:42 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 14 Feb 2023 16:53:42 -0500
X-ME-Sender: <xms:5QLsYykLywU9a7QODpMhMK8rwDpxGAJjTlX2M37AvFOkv0D8yYC4ag>
    <xme:5QLsY52yPANFM6sOHhhntpXOq-Og6G9wysQmbNNlgilqXuVe4Cmi2-xXjGbByzjbt
    3kUu0a3j3qiKdkMw-8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeifedgudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtf
    frrghtthgvrhhnpefgffejleeluddugfejueeiteefvddtgfeutefhvdfgudfhveekgeeh
    gfevledvudenucffohhmrghinhepphgrshhtvggsihhnrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrg
    hrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:5QLsYwpzba8Eln08MFe5Wu_FAeR8DIjIyLkAYgaKz4m2E_QkUyhrKw>
    <xmx:5QLsY2ljEAW9qw1jcAe5ZMZsLUPAgiWJNQBTr_G9BV88JM5XzPCsrg>
    <xmx:5QLsYw1uWtA_NKPTj_XoHwaV3BHigDL91Pj8iZcYNN60hZCUYpQy1w>
    <xmx:5gLsY1tlKk1fX_LUbWv7R2B8S4Q9mjHS33JTDQSbHt9xC5SZ91BSmg>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BAD14B60086; Tue, 14 Feb 2023 16:53:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <85de69eb-5d71-4b29-ba83-c0258d58b807@app.fastmail.com>
In-Reply-To: <63ec01f0.170a0220.94c76.011e@mx.google.com>
References: <20230214132831.2118392-1-arnd@kernel.org>
 <63ec01f0.170a0220.94c76.011e@mx.google.com>
Date: Tue, 14 Feb 2023 22:53:14 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Kees Cook" <keescook@chromium.org>
Cc: "Brian King" <brking@us.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "James Bottomley" <James.Bottomley@steeleye.com>,
 "Damien Le Moal" <damien.lemoal@opensource.wdc.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Niklas Cassel" <niklas.cassel@wdc.com>,
 "John Garry" <john.g.garry@oracle.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] [v2] scsi: ipr: work around fortify-string warning
Content-Type: text/plain

On Tue, Feb 14, 2023, at 22:49, Kees Cook wrote:
> On Tue, Feb 14, 2023 at 02:28:08PM +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The ipr_log_vpd_compact() function triggers a fortified memcpy() warning
>> about a potential string overflow with all versions of clang:
>
> Perhaps this is arch or config specific? I haven't been able to reproduce
> this for some reason.

I saw it on three arm32 randconfig builds out
of a few thousand, with clang-15, clang-16 and
clang-17. See [1] for one config that triggered
it with recent linux-next based tree.

     Arnd

[1] https://pastebin.com/c9FEjzKe
