Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C43335CBD6;
	Tue, 27 Jan 2026 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524920; cv=none; b=AwMywGZBDwAOiT2gaAQR9Exef6kz47zGx+nm00oNZy8ou5UcF96kUvuZaTZqOjLmBFuLRCh/c6TRmdjSA4JyG+LnX7vnvy1VkOEMuCaU8nj1UDMTbhwkRk6prJlKUwgil22k6I2f3bLbuYmo5lgt6RNTdb/Pvugf7LnTzPENXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524920; c=relaxed/simple;
	bh=nOJMleFQwRTuI8EsoJd7yFxpjEuDY2HASPjwGVrg3qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJtuHc82wbLBK/KQNUXIuxRDzmUaKqdXVMsjciRh6l25zgtSMoMJAI6NOxyMKtM8hB74CDqy8fxIzzPJXBBqwU78Ilmi8wAy9+XVK84KzGclA+5F2EEpvW3Bb0D32+iLUw4cr9PUF+vXrFtwRS/1yjuVFDSWReTB9JKBeHpAGE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=K/dNVEaq; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="K/dNVEaq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zsBRO4+fp1yefoYsEvfEeQFyQqvbsFnILehglhch05w=; b=K/dNVEaqMpiZ5RPMCkWKJvFxY5
	phfjZHxJbGujYCnFYDe9KQfAcG+6mFeCLqSJfRyAtLA7qhLRlVV5iqgRs4dwpA4KdHyA49CP/RNwZ
	mB/CM7SjBQYGvkJkrJ114gjdaDFTXsfHpHtvx10mF7E0T+EmHR0ACUI6Fs7fjFr7KrMKJ2TUqxKm3
	wVjt+6cPqN0sRBf4AKbzx6ZZ0VjIf8ahiSqLdiBrwfjSkveVngAn8ozLF0W3g+wPKJVXmT06nx/Bz
	tfCzD345/K1d3hl+tUsE9MzgDRTUAm6t9SV12hlTVz+M5oNBB+Jr/ysMoHHr6kVW76+lac7lKlqqp
	usvr3Kpg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vkkGP-00H3ke-4M; Tue, 27 Jan 2026 14:41:53 +0000
Date: Tue, 27 Jan 2026 06:41:48 -0800
From: Breno Leitao <leitao@debian.org>
To: Corey Minyard <corey@minyard.net>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, openipmi-developer@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH 2/2] ipmi: Consolidate the run to completion checking for
 xmit msgs lock
Message-ID: <aXjOT9e11GSrMHiy@gmail.com>
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
 <20260127135917.1597762-1-corey@minyard.net>
 <20260127135917.1597762-3-corey@minyard.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127135917.1597762-3-corey@minyard.net>
X-Debian-User: leitao

On Tue, Jan 27, 2026 at 07:54:40AM -0600, Corey Minyard wrote:
> It made things hard to read, move the check to a function.
> 
> Signed-off-by: Corey Minyard <corey@minyard.net>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 40 ++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index a590a67294e2..030828cdb778 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -602,6 +602,20 @@ static int __ipmi_bmc_register(struct ipmi_smi *intf,
>  static int __scan_channels(struct ipmi_smi *intf,
>  				struct ipmi_device_id *id, bool rescan);
>  
> +static void ipmi_lock_xmit_msgs(struct ipmi_smi *intf, int run_to_completion,
> +				unsigned long *flags)
> +{
> +	if (!run_to_completion)
> +		spin_lock_irqsave(&intf->xmit_msgs_lock, *flags);
> +}

I usually see the opposite construction in most cases. Something like:

	static void ipmi_lock_xmit_msgs(struct ipmi_smi *intf, int run_to_completion,
					unsigned long *flags)
	{
		if (run_to_completion)
			return;

		spin_lock_irqsave(&intf->xmit_msgs_lock, *flags);
	}

Thanks for doing this, this looks way better!
--breno
