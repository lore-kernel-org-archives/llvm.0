Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1754E20E8
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 03:19:47 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4KtMWX3hQxz4xXh;
	Wed,  4 May 2022 13:19:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1651634379;
	bh=dx0pYKCWg/7xO+Xxz9/wH02elJnU6V0zNRaze2rHkO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=og4YXSe0xIAvMRF3oSOzvqUewub0MWtZ5/k3jXnsc03uOTx73qmHm4PBnKXPS3ZXa
	 E3SiHwWcXqjQAkmjCrGoy8M0q0vqQ0qyOE0GSalEsjC6s2u/Fe6aTclMSCuUUbpJCi
	 W9PUXoNhmMUGHpiJ+xNieY6ykTF/QrMiepccS3Ofxg7Oy5nL5ERI7P3TB/VVxJiJa2
	 3vVWH6+mo6BX1TJm1XW/8mF366uI0MWCQSbwtZbT0+8JDQs7gFIIRL1xKzZpitLUtJ
	 dALX44cjaDZ1XOUna68EJN+jeC7AkrcGBpfCBqflMeQ09StIn/fPtpGifovRuwlQxP
	 2UTZ/GS8Sx/wg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin
 <sashal@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix
 <trix@redhat.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev
Subject: Re: Apply d799769188529abc6cbf035a10087a51f7832b6b to 5.17 and 5.15?
In-Reply-To: <YnGfyLAkB3NG+Ms2@dev-arch.thelio-3990X>
References: <Yl8pNxSGUgeHZ1FT@dev-arch.thelio-3990X>
 <877d7ig9oz.fsf@mpe.ellerman.id.au>
 <YmF0iajmlAg6Kj9I@dev-fedora.thelio-3990X>
 <YnGfyLAkB3NG+Ms2@dev-arch.thelio-3990X>
Date: Wed, 04 May 2022 13:19:32 +1000
Message-ID: <87o80eugqj.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nathan Chancellor <nathan@kernel.org> writes:
> On Thu, Apr 21, 2022 at 08:13:13AM -0700, Nathan Chancellor wrote:
>> On Thu, Apr 21, 2022 at 05:46:52PM +1000, Michael Ellerman wrote:
>> > Nathan Chancellor <nathan@kernel.org> writes:
>> > > Hi Greg, Sasha, and Michael,
>> > >
>> > > Commit d79976918852 ("powerpc/64: Add UADDR64 relocation support") fixes
>> > > a boot failure with CONFIG_RELOCATABLE=y kernels linked with recent
>> > > versions of ld.lld [1]. Additionally, it resolves a separate boot
>> > > failure that Paul Menzel reported [2] with ld.lld 13.0.0. Is this a
>> > > reasonable backport for 5.17 and 5.15? It applies cleanly, resolves both
>> > > problems, and does not appear to cause any other issues in my testing
>> > > for both trees but I was curious what Michael's opinion was, as I am far
>> > > from a PowerPC expert.
>> > >
>> > > This change does apply cleanly to 5.10 (I did not try earlier branches)
>> > > but there are other changes needed for ld.lld to link CONFIG_RELOCATABLE
>> > > kernels in that branch so to avoid any regressions, I think it is safe
>> > > to just focus on 5.15 and 5.17.
>> > 
>> > I considered tagging it for stable, but I wanted it to get a bit of
>> > testing first, it's a reasonably big patch.
>> > 
>> > I think we're reasonably confident it doesn't introduce any new bugs,
>> > but more testing time is always good.
>> > 
>> > So I guess I'd be inclined to wait another week or so before requesting
>> > a stable backport?
>> 
>> Sure, thanks for the response! I'll ping this thread on Monday, May 2nd,
>> so that we have two more RC releases to try and flush out any lingering
>> issues. If you do receive any reports of regressions, please let me
>> know.
>
> I decided to wait an extra day just to give people the opportunity to
> install -rc5 and run it through their tests. I have not heard of any
> reports yet, are there any further objections?

No objection.

cheers
