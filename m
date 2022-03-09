Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCB45387
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFE6C340E8;
	Wed,  9 Mar 2022 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646865629;
	bh=qKJFJE0ylst9VCwNi3R9jMlbmYDqv0ekKnolKkzO0J8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iR6I9vK25qveU36llBpLd6G4GOfTeg0ZJyrtvmQ0/XnYuH88hrkSliPLtbNlYCkwC
	 ZVca7aZWcix+AsJKYPZljLtfxjImoQbNs592naBXzz8F7N7lmsOzauWPH1nmk7exJ9
	 g+YPsByx2uLoyNF0VaalW0D9H8U0S1tHzIn7YJTI=
Date: Wed, 9 Mar 2022 23:40:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev, stable <stable@vger.kernel.org>
Subject: Re: [PATCH] ARM: Do not use NOCROSSREFS directive with ld.lld
Message-ID: <Yiks2B/4Ouetagmk@kroah.com>
References: <20220309220726.1525113-1-nathan@kernel.org>
 <CAHk-=wi23APrArHX7bcrvKBDZYpHXbeyEW7dRsirwoSPCKgqJg@mail.gmail.com>
 <YikqFxHP+Y+lecbX@kroah.com>
 <CAHk-=whAL3L9gTPp5y7-dweM1xrOA+7aCtG9BvbeQk6Gaz-1UA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whAL3L9gTPp5y7-dweM1xrOA+7aCtG9BvbeQk6Gaz-1UA@mail.gmail.com>

On Wed, Mar 09, 2022 at 02:31:24PM -0800, Linus Torvalds wrote:
> On Wed, Mar 9, 2022 at 2:28 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > What about this one too:
> >         https://lore.kernel.org/r/20220309191633.2307110-1-nathan@kernel.org
> >
> > it should fix a arm64 build with clang.
> 
> Heh. That one just came as a pull from Catalin. It's now commit 52c9f93a9c48..

Great!
