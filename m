Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8439E7E;
	Tue, 20 Dec 2022 21:26:30 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 3EF68320094C;
	Tue, 20 Dec 2022 16:26:29 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 20 Dec 2022 16:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1671571588; x=1671657988; bh=Er6LRT7I67
	2GdUMVLbPtNvEaaXPFDEyp+r/rnl5epMk=; b=j2YK24lNl2+43QVn3RNKka0Zk2
	PRcP6wKsgidT4NQIrM5pzpAVDW+vD8gLmStada07SR1BvDa91flyBrurqDhdBQ3t
	Gkbm7p/EwoG5s6b6aJemq1hNRP49DzGUumB9IZHvR7V0v1bPS7pXaRnsA1fu1Gxt
	Sfr2Ez0WAiD9SEOJdaM7aQFxDmLRqIJ7RUrlqpjhaxQNAKg1Ch1h480TVowhTTf2
	bf7u9M+1mi6tvNeZvFVbPUfFgYgjFDZdQ+HudprSo4CEosCRSdPuoZt6da63Afy3
	vmc1J6HQcp/SIdimt4TbZjmHiFVfRC3tqj7lCL3FFFVcqheDbO8mB2ieEyMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671571588; x=1671657988; bh=Er6LRT7I672GdUMVLbPtNvEaaXPF
	DEyp+r/rnl5epMk=; b=VQtHAm0TJ7b8c1iF8XdQ2m6+rv8HE33oC7rpkhfy1roe
	AkkKK4tXEBUTugJKTaTOvyI7S9OQDWGxT3/xt/L0wtLGl/VM/KDU6jBezjsiVYga
	ni5jHZYTd+Ni9SXVQoDBIgSKhBHHTGQlsI+4KpbiTpkPLNbanyxZDhb0+q2g+20b
	y1Yxk1v0JXmFgr0ZwqNhB6quDfnOqvg/QzsBtPe+s1TE6IHnZAHBEuqSi/Kcl5/S
	hyyxw9F/rjw05PwsgL9UR+fMjcXrD7kVgmwWAZ1gQW1MRc0h5pfv0DGnlPbuyPeX
	SV0HYQB1f3nXq8PpYckmzq/crUHFRT/WtCOuEs21XA==
X-ME-Sender: <xms:hCiiY2U1EJy35GeWzAaqkMkNVHO4A4gU-hYLfzVP7QhPoTS0WLj_Hw>
    <xme:hCiiYymW8RkUtapf7h2VM2CE3l88T0hq6jx6SKy3NmlTfH9gVY6xso0ZJPKj8hW9_
    Go2Atv1tVIUaKoiofs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeigdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnuges
    rghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeeigeeuvdekheevudeiteegudfgje
    ehuefghfettddvteeuteekhfehudfhtefgvdenucffohhmrghinhepkhgvrhhnvghlrdho
    rhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:hCiiY6Yd8gsnfFBWGQS9_9q1-ePMVkQMURq8u8qX8j-ODffJWVL_ZQ>
    <xmx:hCiiY9UvpSojHJDTpLKUC8E9lA4Un3G_17F5xqnnN1cRk96Fiffzhw>
    <xmx:hCiiYwmA7ptet6Xp7fPKtruXzvTQe3V0YuOkDHEhVZ-XoGbuo1IJjg>
    <xmx:hCiiY8uAIGhfRBtMeVxa3N0zrC9mR1B0BJKrvnJ_XRuV7LrKZQZqsw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9BCAFB60086; Tue, 20 Dec 2022 16:26:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <b41e5a55-397f-4e86-a1aa-8874114f23c7@app.fastmail.com>
In-Reply-To: <202212200558.lK9x1KW0-lkp@intel.com>
References: <202212200558.lK9x1KW0-lkp@intel.com>
Date: Tue, 20 Dec 2022 22:26:07 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, "Jan Kara" <jack@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [jack-fs:for_next 17/20] fs/udf/namei.c:1250:12: warning: stack frame size
 (1536) exceeds limit (1024) in 'udf_rename'
Content-Type: text/plain

On Mon, Dec 19, 2022, at 22:47, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git 
> for_next
> head:   288b92cc9d904b35f73c8e0b0c99592999702685
> commit: e4fefb466e1317384788946a1b81b577e8e730b9 [17/20] udf: Convert 
> udf_rename() to new directory iteration code
> config: arm-randconfig-r046-20221218
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 
> 98b13979fb05f3ed288a900deb843e7b27589e58)
> reproduce (this is a W=1 build):

I see this as well, the problem is clearly the three instances of
struct udf_fileident_iter on the stack, each of them containing
a 256 character string along with ~100 bytes of other data.

    Arnd
