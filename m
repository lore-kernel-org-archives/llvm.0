Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE243F8F0;
	Tue,  5 Dec 2023 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="esgqqk1U";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jgSYHoE3"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 449B75C010C;
	Tue,  5 Dec 2023 07:43:23 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 05 Dec 2023 07:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701780203; x=1701866603; bh=R6
	C2Q37f/L5sKgoWMTpe5XjLtx+3kmB+IHS3nraWcuI=; b=esgqqk1UZxGlK+yCbM
	f/AJuh0wywPkNjTQlamRDVvXpHwa8DZB+5imqSiBC/79A1YrAnncAzfySPB53T/O
	JieFkW1uhThqk2Z4jhGeUn0OS8HOxgDDCX2+pGzSQmyw+/g//qRH7/lp1KJ3aDHJ
	HBzohc+c+cDdgi4jj7eB/rxHXW2cTxh8V7w1tziLG96FYhB4euDxXzzHw/ROOCGU
	xM+/hwDMctg/DuVEFyjU44vbOOGDDGNZQyFqIVhtpa6OPQ1OOKe4y0QFzz6yyMxL
	frAhLbgnaXD9QKBfSZqyez5N/Xf3VNRHAdBPtozZCadg4JfS8faAZmXj5TcPnI/L
	co9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701780203; x=1701866603; bh=R6C2Q37f/L5sK
	goWMTpe5XjLtx+3kmB+IHS3nraWcuI=; b=jgSYHoE3Xx0ZiwkYXFaKfaAUtoWKB
	qcP77xhdAAMsVC6jT3DIHeSsRZ/lC07wsZpi3mK2HDYlg+EJu2obmNCsWGUHQafJ
	Si24MUsT+rD9giKiM/tKBEA4Vn2QMUGGyW5vM5TWEx5ENPK5KW3RtazA0OqJ3B0W
	a5Mu6MV2wVka8HX89ixQc1upNSRNpkLcTVglrk52OHndUCGw/0k4/DnYTdGVAyE5
	QRw21R9FOiETzj1K1XfbTEqlmS5c9ABu1WNn7a1yJHOB17Coed3QuxAJ5PaWWQTC
	h40tiyKUX0Q8bJzsxhgYmbtCf1oSYyIB4zXN+rGKweFY8IGbBRt39cz+A==
X-ME-Sender: <xms:6hpvZdK1UVCTCiWtfp9TpYvUvKiiCrEQTMN_D20BzFVESD4nBflGXg>
    <xme:6hpvZZIys50J8_GXQnLVwzgCxkUciMnmetxVQ3YzZR-VgsX4FYWuznvjNnU-5-Jkm
    ZbV2UOoiqOf9bi5Vpc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:6hpvZVsMtFa-5O3XgujPelIBJ4iumkhWtM9ijkxdnDITNACQFoAvEw>
    <xmx:6hpvZeZwikA0-sA434Mr4V0YmBK1ibQ5_EjdOOp3-UeYncXPPi8bUg>
    <xmx:6hpvZUZ6rKBoYisc2aYtLlenUizMN5qhK-jkhtWIk2npPJ7QL5NJ3Q>
    <xmx:6xpvZcHZt75ch6VbSUxEpLEKxq4sogCg1uZNbrmQNTV7ABKG-FAz9A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C4EBFB60089; Tue,  5 Dec 2023 07:43:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <7bdbb86a-ccf8-4a71-b25f-52a98ebf2d67@app.fastmail.com>
In-Reply-To: <202312051917.ldwRetjX-lkp@intel.com>
References: <202312051917.ldwRetjX-lkp@intel.com>
Date: Tue, 05 Dec 2023 13:42:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Linux Memory Management List" <linux-mm@kvack.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: Re: [linux-next:master 4620/4884] kernel/irq/generic-chip.c:210:9: error: call
 to undeclared function 'ioread32be'; ISO C99 and later do not support
 implicit function declarations
Content-Type: text/plain

On Tue, Dec 5, 2023, at 12:36, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
> master
> head:   0f5f12ac05f36f117e793656c3f560625e927f1b
> commit: 17229c19e5bf0b5dc8b68dc4ca4e7012e7da4747 [4620/4884] mips: 
> remove extraneous asm-generic/iomap.h include

> If you fix the issue in a separate patch/commit (i.e. not just a new 
> version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: 
> https://lore.kernel.org/oe-kbuild-all/202312051917.ldwRetjX-lkp@intel.com/
>
> Note: the linux-next/master HEAD 
> 0f5f12ac05f36f117e793656c3f560625e927f1b builds fine.
>       It may have been fixed somewhere.
>
> All error/warnings (new ones prefixed by >>):
>
>>> kernel/irq/generic-chip.c:210:9: error: call to undeclared function 'ioread32be'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      210 |         return ioread32be(addr);
>          |                ^

This patch depends on the asm-generic/io.h cleanup series by
Jiaxun Yang and Baoquan He, which I have in my asm-generic
tree.

I've added my patch on top now, as it fits the general idea,
so this can be dropped from -mm (and not merged into the mips
tree).

     Arnd
