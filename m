Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B435CB73;
	Tue, 27 Jan 2026 14:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525618; cv=none; b=DRgY0fcvkvVEWXwbsOirwR69yOpFSGYLuAHoGeNCl2DL6hanLm+c6pSjldzYcM2oaOfrzfhruSptRKC4uqOeklTdVLVvU6rRrVSV3OcRaAhdRDJWDWB1rxAXgcpf6MSxxkmDHUWr24ZojTNwUaCD+btRdrTxkn+i605oOKfHHNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525618; c=relaxed/simple;
	bh=qeF6KBgFP5avqyQiFYgcxOpWWQ43QPXtBq5gP2n2QcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnRPySIUyYgqo0ykQYBWQJXSj6ES1T0luu3T+v2+UPxhM+d/Y+RfO3yS9nuEIk4BBc9YwzR5NMp0JpiCu9paVFFk6u9IU4RS2Ew3Ces8zbdB/q0EnYpOlmBh1TEQ0BIoS4cTYw81vnzotKQmbbn73Ew0/7HSbhJ6kWyvUhqmK7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Wgm5yx5z; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Wgm5yx5z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bSxIxNUNI3JZZdzT2oaE//0ff+hEE28hvFGlvh9k1U8=; b=Wgm5yx5zWXyjQ60KEPVNstvSnk
	Q6fRTc7WIbXIPS7/is7dDaY1iCendtYoYsh/r8XCiMUw66DfQqs6nBgNfqz1+7K+/FdKjqQjbn+d/
	ff7Nswn3bKp+hqudW19VfDpOU8/zlCFhDY74WNw49tW4C7SGa/9uloAfKc8Qq8YbZLCE112TZ8dYG
	vAadYm/TgaLmCO9b73saAsDrwnmk4HRWsMl+/eaZUBKpkHjEcKkkHZPdVbXWxCA/+3PJyFbNkm4a/
	P6WkKeBQ5tGD6ogKaPEeudF1h8ueXsRZN4eji0UivYrWNizdQZl2JZN2hTjG+AKAQLN1tmuOD9gA2
	pIjaAftQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vkkRe-00H46x-9p; Tue, 27 Jan 2026 14:53:30 +0000
Date: Tue, 27 Jan 2026 06:53:26 -0800
From: Breno Leitao <leitao@debian.org>
To: Corey Minyard <corey@minyard.net>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, openipmi-developer@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH 2/2] ipmi: Consolidate the run to completion checking for
 xmit msgs lock
Message-ID: <aXjRS6AoRJtRa1Uq@gmail.com>
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
 <20260127135917.1597762-1-corey@minyard.net>
 <20260127135917.1597762-3-corey@minyard.net>
 <aXjOT9e11GSrMHiy@gmail.com>
 <aXjPrnG7ErymtHBx@mail.minyard.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjPrnG7ErymtHBx@mail.minyard.net>
X-Debian-User: leitao

On Tue, Jan 27, 2026 at 08:46:06AM -0600, Corey Minyard wrote:
> On Tue, Jan 27, 2026 at 06:41:48AM -0800, Breno Leitao wrote:
> > On Tue, Jan 27, 2026 at 07:54:40AM -0600, Corey Minyard wrote:
> > > It made things hard to read, move the check to a function.
> > > 
> > > Signed-off-by: Corey Minyard <corey@minyard.net>
> > > ---
> > >  drivers/char/ipmi/ipmi_msghandler.c | 40 ++++++++++++++++-------------
> > >  1 file changed, 22 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> > > index a590a67294e2..030828cdb778 100644
> > > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > > @@ -602,6 +602,20 @@ static int __ipmi_bmc_register(struct ipmi_smi *intf,
> > >  static int __scan_channels(struct ipmi_smi *intf,
> > >  				struct ipmi_device_id *id, bool rescan);
> > >  
> > > +static void ipmi_lock_xmit_msgs(struct ipmi_smi *intf, int run_to_completion,
> > > +				unsigned long *flags)
> > > +{
> > > +	if (!run_to_completion)
> > > +		spin_lock_irqsave(&intf->xmit_msgs_lock, *flags);
> > > +}
> > 
> > I usually see the opposite construction in most cases. Something like:
> > 
> > 	static void ipmi_lock_xmit_msgs(struct ipmi_smi *intf, int run_to_completion,
> > 					unsigned long *flags)
> > 	{
> > 		if (run_to_completion)
> > 			return;
> > 
> > 		spin_lock_irqsave(&intf->xmit_msgs_lock, *flags);
> > 	}
> 
> Yes, that's better, I've changed it.

Thanks. feel free to add:

Reviewed-by: Breno Leitao <leitao@debian.org>

Thanks for the quick replies,
--breno
