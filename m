Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656A820E7;
	Thu, 21 Sep 2023 16:22:11 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 5DCF45C00F5;
	Thu, 21 Sep 2023 12:22:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 21 Sep 2023 12:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695313330; x=1695399730; bh=Ak
	TeiXuh1R0GwYgW9icwMNtyaC+fPAA3UuL0o7kHtXA=; b=W9y15g3EH9bJjempT8
	+GXjIHTdeH+fnkwtU9PXakn42mnYK8z+ZMlKuE1CFY9ShkbOeKRK83GF+TgQ7vFs
	keJDMoHxcpFbYKYBKcWJFmuypitoogZonoH1PVJ0iLcp0hmoCkBnJrWAU+R0fCsn
	2RKYHax0XaNf1P5nUReAsS25zv3iCSY9Izp/gM8uILLcEyZ8OE9sP2DOo4zKY27H
	lYuVnxoztz6udfUbsxbfPPFWutBlglayYpCEj4hPSGQuxMA+4Rqajk9vKPZPdEeP
	XPhZc4KizcVml9Md5j+RLVKRwhfFA2SkmnuA4Y69p6ESEck1C/UxDsknfSq7UAJC
	JjSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695313330; x=1695399730; bh=AkTeiXuh1R0Gw
	YgW9icwMNtyaC+fPAA3UuL0o7kHtXA=; b=TjA3qLPBTIEtXUxpSuCxiujcGSSSt
	gYpHY3FMzLXHZpqT/lYBfIC11FEBr3hwqLB5TzhTUI7+B1ZUjKanZOUsXcQgL84N
	3fUxZcD7SS0lSMCRnluRzKiE7mlPw7DVvUcz2tj/9n93Dq7LAA5ZL6bUEGRHQNg+
	HegkzZPpqZlA0t61hS3fCNOoi25VLqcCoWralv5VPt+HShmvZLDkG2jSlp/jlUgT
	vBsGHyaG8DY5mA9xN6gz5stTdrvHdmH//Oc3QAVHOBh5rTRD1aWnOtIb/XpksVsU
	2oLjKPr824DnAAGK74YvPll0WKozQmNDp3sXJpWG67rRe1u53KI/vMdYw==
X-ME-Sender: <xms:sW0MZZE93hMTjKk52LCn1vqyxzJ4F947U0fqL5tatel9XhVwwyl7uA>
    <xme:sW0MZeWYkuidBxxE8NInlsTtLnnrrz3j_CXscCTdV4yRt6ioeun-B_jemQ7OFKpen
    Lyb5LjRY8R1hv-devE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekiedgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:sW0MZbIvRTxOfiUICkvF_9mdqbMJY3-XyK473LOH-ealMElDXsm0tQ>
    <xmx:sW0MZfGmSmuCAWxby9F501t-i1p9yT-EgXrHvfn1bCJgT9PpgAvKUA>
    <xmx:sW0MZfVeNeG14nBQw--M0pcIrOxKDFMhHcUKN-bKzu7MyWZVXRiqiw>
    <xmx:sm0MZaTfxSCuu0r6jGq3SUITIWXvzxeZrjQ-1YFpIoWtfdU0YF8TDQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6E6B5B6008D; Thu, 21 Sep 2023 12:22:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-761-gece9e40c48-fm-20230913.001-gece9e40c
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <e09527e8-ac2d-49e8-9e36-ea8e5f9ed8aa@app.fastmail.com>
In-Reply-To: <87pm2bzov8.wl-tiwai@suse.de>
References: <202309210751.TXlnuEMF-lkp@intel.com>
 <0a4644bc-d345-9988-2eb6-e95c8db06219@opensource.cirrus.com>
 <87pm2bzov8.wl-tiwai@suse.de>
Date: Thu, 21 Sep 2023 12:21:49 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Takashi Iwai" <tiwai@suse.de>,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>
Cc: "Thierry Reding" <treding@nvidia.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: Re: [tiwai-sound:for-next 36/38] sound/pci/hda/cirrus_scodec_test.c:151:60:
 error: initializer element is not a compile-time constant
Content-Type: text/plain

On Thu, Sep 21, 2023, at 08:34, Takashi Iwai wrote:
> On Thu, 21 Sep 2023 11:23:14 +0200, Richard Fitzgerald wrote:
>> On 21/9/23 00:35, kernel test robot wrote:

>> >     In file included from arch/hexagon/include/asm/io.h:337:
>> >     include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> >             val = __raw_readb(PCI_IOBASE + addr);
>> >                               ~~~~~~~~~~ ^
>> >     include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> >             val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>> >                                                             ~~~~~~~~~~ ^
>> >     include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>> >     #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>> >                                                       ^
>> 
>> This looks like it has nothing to do with cirrus_scodec_test, it's just
>> unfortunate that including gpio/driver.h results in also including io.h.
>
> Yeah, I believe this part is irrelevant can be ignored.  It's included
> as a part of (single) log.

Correct, it's a known bug that we've been working on for (literally) years,
it should be fixed soon by enforcing CONFIG_HAS_IOPORT soon to blank out
these functions on architectures that cannot support them. I hope we can
land the last patch for this in 6.7.

       Arnd
