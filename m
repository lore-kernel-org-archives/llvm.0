Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7A55380
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hO6nMsAjIrauPmSG8esEq0mx0nDka42aMxFu0e4IIHw=; b=A1y+Xzc6JdVnOO/+zhLQor3FCv
	9SDtnAQI5XFc3t47zPterpIh8EkB2fOEnAs7gHwxSFpD00jyN3fFmvJ6TnEXdWrlHBcjzUlYQNA6T
	fGNqjOvDqTtyBYUnLzRExIEZKXlcTHf+263EFT5ASNhS4zID0MIDCFWHbqgxAm5eMgJav17I7qpHb
	DOvFKoPODNXbjxQdqDFetseQzsZ8P00sWlgWXsH9opfjslPLYlPK3YY6IzcascMZp+fjvBB6yPVDG
	p7HifaP3xak7Xbk+MbuBGWDIWoVzbqG6kgH0xqCJF2a/wGniGLXx0sBvErX4o1+T77TTm8B3gJjMN
	BLH33+DQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59246)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qVpzR-0001Le-1P;
	Tue, 15 Aug 2023 10:05:25 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qVpzQ-0006qq-Fb; Tue, 15 Aug 2023 10:05:24 +0100
Date: Tue, 15 Aug 2023 10:05:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [arm:for-next 4/4] arch/arm/vfp/vfpmodule.c:324:13: error:
 static declaration of 'VFP_bounce' follows non-static declaration
Message-ID: <ZNs/1GB10P1zq5bU@shell.armlinux.org.uk>
References: <202308150547.m54XHV12-lkp@intel.com>
 <ZNql2TqaVFnMKlzJ@shell.armlinux.org.uk>
 <7dfa4337-fc2f-4a02-a12e-f94feca7362b@app.fastmail.com>
 <CAMj1kXE_Rehybm_ANRYcDqPT8q7SPJ_Yxw9HLNNg9SsmTk17zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXE_Rehybm_ANRYcDqPT8q7SPJ_Yxw9HLNNg9SsmTk17zA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Aug 15, 2023 at 10:39:31AM +0200, Ard Biesheuvel wrote:
> On Tue, 15 Aug 2023 at 00:16, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Aug 15, 2023, at 00:08, Russell King (Oracle) wrote:
> > > On Tue, Aug 15, 2023 at 05:06:03AM +0800, kernel test robot wrote:
> > >>    1 error generated.
> > >
> > > I'm guessing this is a conflict between Arnd's patch
> > >
> > > ae1f8d793a19 ("ARM: 9304/1: add prototype for function called only from asm")
> > >
> > > merged in v6.5-rc1 and Ard's patch, and that part of Arnd's patch
> > > needs to be reverted since VFP_bounce is now static. Agreed?
> >
> > Yes, with Ard's change, the prototype I added is neither required nor correct.
> >
> > My series contained another patch that added a prototype for
> > vfp_entry(), and this is also obsoleted by Ard's series, but you
> > did not merge it anyway, so it's all good on that one.
> >
> 
> When you sent out that series, I mentioned the conflict with
> vfp_entry() [13/16], but I failed to spot that the same series had
> another patch that added the VFP_bounce() declaration, which is the
> one that is now conflicting.
> 
> So we just need a patch that drops the VFP_bounce() declaration,
> right? Should I send that out and drop it into the patch system?

http://git.armlinux.org.uk/cgit/linux-arm.git/commit/?h=for-next&id=a6f307c20d649e5f1da280bee7ed160de74de2ff

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
