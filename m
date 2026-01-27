Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D035CB7F;
	Tue, 27 Jan 2026 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524817; cv=none; b=j6mBOYKO4msj+VbMhA1be2NHxXfEaNgotYU2+WaaozeTwliivrh9rrjHwqT5vo6d21c4d8Xl36oSH3aRc6zc/O8YiBvRltY2puOdBkuOVoc0L4L3ZqjPMNpwEKBLTniOhyv08+BjdR4we8QfbBndRo2mStFf1piEHKkYSv1T9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524817; c=relaxed/simple;
	bh=7ZOtp7fu4vEym+z2Bu3UmEjb59iLGxMzwqNPikVDCOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5BEfN/6LMJgYtN9hDFTj49PtZlG6h4bwQqu/CI+C+Bw1mvVGQrTJwDDXQV8v6ZCH6To4OBQ3nkt+YsDwVgx1XsMU5Jdn09p1I+4gkyyhpk23rA52lGzKo6v0h6RQxhChTtbBvvoWTh1ifJ8u1itA6CyxVbxHnxMpPDlQUua6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=SAbTimth; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="SAbTimth"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sSCRTJkHjV6hfRcqDI9HgGinn8gN2MRzlQFI0aQb7Yk=; b=SAbTimthHgOBBaPpbxBm3SiA4h
	SZ8CdhLnrmsnxaq2OCezRH5uphD9RhS2q8RYMus2eYqStH4BUF9P8KE1agn2oMB48ZKIcXbqAQV9P
	Zies7tGHssbJg0CeKSSzVi9nsT6ksCIBUlG7CfKAThi8HLKCPL2kguGaYCgGfCnvhiGsilMF6NEs+
	j2jpa8kT4x/1GrjB4xsRzaj6cCH1NS/88Wz7ZzAwGNK7h+FutLGQ7VJUmMx3geV4dkONRlUxq6g/G
	B3YlCtdv44S4+k6iaTWUp/tPk7dgNHy3UkiFCeZoFqqtFzeTn0ZFkPoF3I1lavB85MAucsEvmILDv
	hNGbqIvQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vkkEi-00H3iR-TZ; Tue, 27 Jan 2026 14:40:09 +0000
Date: Tue, 27 Jan 2026 06:40:04 -0800
From: Breno Leitao <leitao@debian.org>
To: Corey Minyard <corey@minyard.net>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, openipmi-developer@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH 1/2] ipmi: Fix use-after-free and list corruption on
 sender error
Message-ID: <aXjOK6ff9Va2hiNU@gmail.com>
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
 <20260127135917.1597762-1-corey@minyard.net>
 <20260127135917.1597762-2-corey@minyard.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127135917.1597762-2-corey@minyard.net>
X-Debian-User: leitao

On Tue, Jan 27, 2026 at 07:54:39AM -0600, Corey Minyard wrote:
> The analysis from Breno:
> 
> When the SMI sender returns an error, smi_work() delivers an error
> response but then jumps back to restart without cleaning up properly:
> 
> 1. intf->curr_msg is not cleared, so no new message is pulled
> 2. newmsg still points to the message, causing sender() to be called
>    again with the same message
> 3. If sender() fails again, deliver_err_response() is called with
>    the same recv_msg that was already queued for delivery
> 
> This causes list_add corruption ("list_add double add") because the
> recv_msg is added to the user_msgs list twice. Subsequently, the
> corrupted list leads to use-after-free when the memory is freed and
> reused, and eventually a NULL pointer dereference when accessing
> recv_msg->done.
> 
> The buggy sequence:
> 
>   sender() fails
>     -> deliver_err_response(recv_msg)  // recv_msg queued for delivery
>     -> goto restart                    // curr_msg not cleared!
>   sender() fails again (same message!)
>     -> deliver_err_response(recv_msg)  // tries to queue same recv_msg
>     -> LIST CORRUPTION
> 
> Fix this by freeing the message and setting it to NULL on a send error.
> Also, always free the newmsg on a send error, otherwise it will leak.
> 
> Reported-by: Breno Leitao <leitao@debian.org>
> Fixes: 9cf93a8fa9513 ("ipmi: Allow an SMI sender to return an error")
> Signed-off-by: Corey Minyard <corey@minyard.net>

Reviewed-by: Breno Leitao <leitao@debian.org>

--breno
