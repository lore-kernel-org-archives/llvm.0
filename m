Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084747A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 09:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AF0C340EC;
	Thu, 10 Mar 2022 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1646904679;
	bh=DcJ1hfj1GWNM7xbrACMXqJpfy5RJJBKnXx2LrCwTs8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xqwa9YQf3QFd6YIwgIqk5fU9jR11K7Q7EJEL/jaZ9pZEiEL1UBCcWk7GXwXSXn9j/
	 735Tvv2VTvPkO4+2lqCMC/KQXClaVS+VuC9XZgNC3F3wNDbFfmfQkTZ7h7OPfq2toX
	 yc8X9geowJk/a4PxekMI5eMPSPytvxMpSZhQihQo=
Date: Thu, 10 Mar 2022 10:31:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: torvalds@linux-foundation.org, stable-commits@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: Patch "ARM: Do not use NOCROSSREFS directive with ld.lld" has
 been added to the 4.19-stable tree
Message-ID: <YinFYzenEjq99R3w@kroah.com>
References: <1646865178129106@kroah.com>
 <YiktjbXe/2XmjHrb@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiktjbXe/2XmjHrb@dev-arch.thelio-3990X>

On Wed, Mar 09, 2022 at 03:43:25PM -0700, Nathan Chancellor wrote:
> Hi Greg,
> 
> On Wed, Mar 09, 2022 at 11:32:58PM +0100, gregkh@linuxfoundation.org wrote:
> > 
> > This is a note to let you know that I've just added the patch titled
> > 
> >     ARM: Do not use NOCROSSREFS directive with ld.lld
> > 
> > to the 4.19-stable tree which can be found at:
> >     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary
> 
> <snip>
> 
> > +/*
> > + * ld.lld does not support NOCROSSREFS:
> > + * https://github.com/ClangBuiltLinux/linux/issues/1609
> > + */
> > +#ifdef CONFIG_LD_IS_LLD
> 
> Please cherry-pick commit b744b43f79cc ("kbuild: add CONFIG_LD_IS_LLD")
> to 4.19 so that this patch works as intended.

Now queued up, thanks.

> We do not link with ld.lld on 4.9 or 4.14 so the NOCROSSREFS patch is
> not technically needed there but it does no harm if it is.

I'll leave it as I'm sure there might be others out there that do that
(Android or ChromeOS?)  I already did the backport-by-hand work, might
as not waste it :)

thanks,

greg k-h
