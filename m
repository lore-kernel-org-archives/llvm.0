Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6486915480
	for <llvm@lists.linux.dev>; Thu, 29 Jun 2023 19:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC3FC433C8;
	Thu, 29 Jun 2023 19:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688066328;
	bh=Hn/Tt7hlIr+QmKqvZiH75scl6AlCHCF2VqhTStwBfRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Piu5rACK+FNY8+FlyN05/7HkZj4V1kPdkUkeuPvQiP7GHkm3wdAji7vjLQYlgXiZk
	 k0E4L3o0RSkzIgKjYiIPEFI14C4YYWtWaGPKxPzJ6boApyuuxwwfRkeRrsQxleoXTi
	 bSrQpAAAQE3zN8gzLK8j19EPWDLCGjz249qTeGOQ=
Date: Thu, 29 Jun 2023 21:18:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>, linux-usb@vger.kernel.org
Subject: Re: UBSAN spat in valid xhci code in Linus's current tree (6.4+)
Message-ID: <2023062943-sixtyfold-flap-e7a0@gregkh>
References: <2023062945-fencing-pebble-0411@gregkh>
 <202306291147.4CE126CE5@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306291147.4CE126CE5@keescook>

On Thu, Jun 29, 2023 at 11:58:43AM -0700, Kees Cook wrote:
> On Thu, Jun 29, 2023 at 05:36:51PM +0200, Greg KH wrote:
> > Boris just reported to me a UBSAN splat in the USB xhci driver in
> > Linus's tree that wasn't present in 6.4-final, and given that no USB
> > changes are merged yet there, I was confused.
> > 
> > Turns out, I think you all missed a "variable length" structure in the
> > xhci driver, which UBSAN is calling out a being an overrun, when really
> > it isn't (it's just written that way...)
> > 
> > The splat is:
> > 
> > UBSAN: array-index-out-of-bounds in drivers/usb/host/xhci-hub.c:231:31
> > index 1 is out of range for type '__le32 [1]'
> > CPU: 0 PID: 1556 Comm: kworker/0:2 Not tainted 6.4.0+ #7
> 
> This is fixed here, a couple weeks ago, but maybe it missed your tree:
> https://lore.kernel.org/lkml/20230614181307.gonna.256-kees@kernel.org/
> 
> Would you prefer I carry it?

To confirm, that's already in my tree and will be going to Linus for
6.5-rc1.

thanks,

greg k-h
