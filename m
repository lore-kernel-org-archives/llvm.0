Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7D51EB35;
	Wed, 13 Dec 2023 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="OeWmRn2e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="V2mKFiH8"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id A19F83200AA0;
	Wed, 13 Dec 2023 05:32:02 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 13 Dec 2023 05:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702463522; x=1702549922; bh=2UvyKqBiEw
	BjmNleMGmhPJQ0z3wl4PHvvlYjmFYg4wM=; b=OeWmRn2eRERS+5vXxd87VrFnBT
	YkG04PZvnByEZGYMK1/I/2rT6STj94A3roYeI8GFldEzkhUdqMLnaSKA25BS7ijb
	ceLu8Wes5LUUkYF/BSdp36U3nJUu1J6Ed56hBmn8Nl4xXgsJmqyzVVN9U/wMgnA3
	CNkJFFmeTi6L56pu+hcEO3gxorOzUlCjWAq439QgXCWJfV9o3GDKl6Ko2EngYLk/
	Ie3Yexd6fekxx54z2SUxT3e0A5djt33jGVqdW154UqhdPNomoxI6XLEVz+6KH5qn
	brT4h6orQci5XFbGsoH4J+8KzsdV87oKTKeIp/I/frBOwhAUtby9GXF2S04w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702463522; x=1702549922; bh=2UvyKqBiEwBjmNleMGmhPJQ0z3wl
	4PHvvlYjmFYg4wM=; b=V2mKFiH8RuiJZx7N7rrcWubLfMlHeOaJaGby+ZRuCOGj
	mhJn0SSRCAsl9C7iNE+VDKHHjMtelSDlrAQi5KDvAi4yP7S9wm850koP6UsuMhUO
	KQica2zZ7+NEy+qbi+TZiuUcZNuYOSbdPezde9kQplhdLelS4WnqxawYJsIKXJOb
	HNVYq+PluFPNUtF10wHX4DlA4EAa6bNLEG/L1ZiI7qYjtESisT+Fp1+t4mz4xVs+
	4vfr73QS8uIZPMVYjkOtf4nNteuHUXR45UorBDjBTsg++t1Zap1ZQ6Bsp5EH0aby
	UgrebKxTTzzrh96EdLLo0GDJgyOuV9KGsfAbJaZjFQ==
X-ME-Sender: <xms:IYh5ZZwSEE8IIV7XRpqKLE5s15ZISJFGPAge6OHk6VRwGnfYOWZv5g>
    <xme:IYh5ZZQwVtKPG1lsELSGlzZAVQ1H7uw-vez1VR3I6gUXuBhjSX4KuCn_gDopu_F7m
    vObBYkAyEXCdwK2r8E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeliedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepfefhtdegvdfhudetgedvkefgfeeftedvgfelgfeugeeluddvheeiveeiieeh
    udejnecuffhomhgrihhnpedtuddrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Ioh5ZTX_JxYiHudsef-rhfUNSh_2bM7NUZrFAfeGfNgNLofIvrnEOg>
    <xmx:Ioh5ZbizEN7FdPSXdpeTHSXgsY3qaNssigu9dzsxQY_w_dFLAsBNvg>
    <xmx:Ioh5ZbCZdwiuD_gJDgWxcch5rjzWogy79jweKfVoDicN9mVMOp1dqg>
    <xmx:Ioh5ZeMsGqMeszNR14g9jRo7e_Mn1gbm5OjYCU-8_5cdb5_tpfS59g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E511DB6008D; Wed, 13 Dec 2023 05:32:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <08daec27-c762-457d-b576-7f8fa722765c@app.fastmail.com>
In-Reply-To: <202312131823.hO2NP34f-lkp@intel.com>
References: <202312131823.hO2NP34f-lkp@intel.com>
Date: Wed, 13 Dec 2023 11:31:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, "David Howells" <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7115/7300] ld.lld: error: undefined symbol: __bad_xchg
Content-Type: text/plain

On Wed, Dec 13, 2023, at 11:05, kernel test robot wrote:

> commit: 4a0d72ea10ce156eb2 [7115/7300] afs:  Overhaul invalidation handling to better support RO volumes
> config: arm-randconfig-003-20231213 
> (https://download.01.org/0day-ci/archive/20231213/202312131823.hO2NP34f-lkp@intel.com/config)
> All errors (new ones prefixed by >>):
>
>>> ld.lld: error: undefined symbol: __bad_xchg
>    >>> referenced by callback.c
>    >>>               fs/afs/callback.o:(__afs_break_callback) in 
> archive vmlinux.a
>    >>> referenced by rotate.c
>    >>>               fs/afs/rotate.o:(afs_select_fileserver) in archive 
> vmlinux.a

I saw the same thing, and this seems to be broken on all 32-bit
architectures:

@@ -79,9 +79,9 @@ void __afs_break_callback(struct afs_vnode *vnode, enum afs_cb_break_reason reas
        _enter("");
 
        clear_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
-       if (test_and_clear_bit(AFS_VNODE_CB_PROMISED, &vnode->flags)) {
+       if (xchg(&vnode->cb_expires_at, AFS_NO_CB_PROMISE) != AFS_NO_CB_PROMISE) {
                vnode->cb_break++;

I tried to replace this with xchg64(), but that only exists on
one architectures (unlike cmpxchg64(), which is on most but not
all 32-bit ones).

If this has to be an atomic operation, the only portable way I see
is to change cb_expires_at into an atomic64_t and modify
all references to use atomic operations.

     Arnd
