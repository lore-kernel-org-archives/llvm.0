Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135A65385
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 22:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217F9C340E8;
	Wed,  9 Mar 2022 22:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646864925;
	bh=53qItwjn/BOmlYHVisMW1+2o9gev8Fumk6b56V5DF4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IHRpf7i80XWydJ7OMX3De3fLyunRWD7QtdlZ6l02HGYZrNTOnP4QZIqRwHM49ALsE
	 OWJzWlKOaGmo1H2LAqUxjZlSh5FMvqHpPYIaL1WEGCat/6g32JdGUIcwQk05Gjck7p
	 fogirSCWlWD+hpKX+jV9ZPAzTuRSychthC1+rL4w=
Date: Wed, 9 Mar 2022 23:28:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev, stable <stable@vger.kernel.org>
Subject: Re: [PATCH] ARM: Do not use NOCROSSREFS directive with ld.lld
Message-ID: <YikqFxHP+Y+lecbX@kroah.com>
References: <20220309220726.1525113-1-nathan@kernel.org>
 <CAHk-=wi23APrArHX7bcrvKBDZYpHXbeyEW7dRsirwoSPCKgqJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi23APrArHX7bcrvKBDZYpHXbeyEW7dRsirwoSPCKgqJg@mail.gmail.com>

On Wed, Mar 09, 2022 at 02:15:23PM -0800, Linus Torvalds wrote:
> On Wed, Mar 9, 2022 at 2:11 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > It would be nice if this could be applied directly to unblock our CI if
> > there are no objections.
> 
> Applied.
> 
> Greg - yet another small fixup. It's commit 36168e387fa7 in my tree.

Thanks will go queue that up now.

What about this one too:
	https://lore.kernel.org/r/20220309191633.2307110-1-nathan@kernel.org

it should fix a arm64 build with clang.

thanks,

greg k-h
