Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D418B7C
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 21:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DFDC34100;
	Mon, 28 Mar 2022 21:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648504385;
	bh=oNs0fACiFDhDkycLiYXHQaGNFojDAo6v1AQHrYGCu2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHpsLaobXbTDIEC9UlU7FeCro6s04ki/GTaTC4isZ1IWnqRP64A5mrdUXa9SW0W4g
	 p5beKLeP5sC+e5P7DnSaN6lUYQtDf7WwWGfVPeAGwaigqcmMPwbbevsDxl3aj0uzxV
	 k6Xtf88KB2UI7zCUzeM/L4NZQKfIOyJzJp5U/oixBMbKXQPOjFEA+ckYxCX8XWi7Yg
	 arCAFU7rp2lE5YvvIarvIWfgo8ELcZxnl3rN9Bwvq1q7xoU9ZnJjwmOVuReck7RfG4
	 9wtmv2QOD4KNYksX8bPVDg3kkMEPcyeNg/nxQFHUnRSaAzGf8HvdS5b4uvDcSFhjZd
	 yuEQ6mLBnDDsg==
Date: Mon, 28 Mar 2022 14:52:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org, linux-next@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: s390 defconfig fails to build after
 4afeb670710efa5cd5ed8b1d9f2d22d6ce332bcc
Message-ID: <YkIuOnd6SWBYuKLz@dev-arch.thelio-3990X>
References: <YkH/rRikE2CilpqU@dev-arch.thelio-3990X>
 <your-ad-here.call-01648503866-ext-8764@work.hours>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <your-ad-here.call-01648503866-ext-8764@work.hours>

On Mon, Mar 28, 2022 at 11:44:26PM +0200, Vasily Gorbik wrote:
> On Mon, Mar 28, 2022 at 11:34:21AM -0700, Nathan Chancellor wrote:
> > Hi all,
> > 
> > Apologies if this has been reported or fixed already, I did not see a
> > report when searching lore.kernel.org and it is reproducible as of
> > commit 7dcfe50f58d2 ("s390/pci: rename get_zdev_by_bus() to
> > zdev_from_bus()") in s390/linux.git.
> > 
> > Our continuous integration noticed a build failure on next-20220328 in
> > arch/s390/kernel/entry.S, which does not appear to be compiler specific,
> > as I can reproduce this with GCC easily:
> > 
> > https://builds.tuxbuild.com/2716QwFVG9408TJ43vkEc7trVCI/build.log
> > 
> > $ make -skj"$(nproc)" ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- defconfig arch/s390/kernel/entry.o
> > arch/s390/kernel/entry.S: Assembler messages:
> > arch/s390/kernel/entry.S:335: Error: Unrecognized opcode: `jgnop'
> > arch/s390/kernel/entry.S:493: Error: Unrecognized opcode: `jgnop'
> > arch/s390/kernel/entry.S:494: Error: Unrecognized opcode: `jgnop'
> 
> Thank you for reporting this!
> 
> jgnop mnemonic has been introduced with binutils commit
> b10b530a4566 ("IBM Z: Add support for HLASM extended mnemonics")
> 
> and is part of binutils-2_36 and newer.
> 
> I fixed it by using old "brcl 0,0" alternative here:
> https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/commit/?h=features&id=faf79934e65aff90284725518a5ec3c2241c65ae

Awesome, thank you a lot for the quick fix!

Cheers,
Nathan
