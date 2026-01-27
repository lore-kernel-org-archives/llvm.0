Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF803570BB
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769520159; cv=none; b=Wzx7NiXXUiokyOaF7obqFfA5UGendJkBDj21y1BFLXUuUiKsJdYagrpbF/Wr3spsLhV/dNLGhn2z1OjThEHqZYot57ybCneBleNAUc1ArM1j85EKAHWIzz+L6CSg4HZAgarNF/DefdLeB0WDuk3DlVv75lSMRYI+iU3Gk7TeIfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769520159; c=relaxed/simple;
	bh=OC6Ou7tpHN3rZQJZiImsSnNIIkxHSFq3cwoE9FA5LWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHWVLiL1AcXdePxhRxXoPEsj/Aaubxql/wCKRzGiM56h3myjP6BtpjDf6MsvpZs+t2qyPxS4wvQH2TNIzRT+CylR/yHxAbijCc2l0ulhTN6JpLLmzI6JDi0C0H30WJk7IsD+WgBZWkYJ6yZEybFFOvVxnvK7aSl9rJpSv0wNFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=aqUJVH1I; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="aqUJVH1I"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45c7f3a9676so4398162b6e.1
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 05:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1769520153; x=1770124953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPNv4ujSn5GBeWJw7SR5sa7VAXW0dXiZYUYtMsCoyQo=;
        b=aqUJVH1ImHWMHP0IEnqt5fGxT7ZFgvXKOgwxAcAIPk6s3atdZhDNJMe3vndeaxganj
         sIcc94FdiHyIS+kXUYz85f4h8TiL3rIAam2EyTiwrm3LsytlrW5EVq3JF1D68biAAkS1
         w8VvGwu1QRDQFf3U9YwAtqPH/O/G4sUKvQJ5dKlA3NDAhvm+NlJAKCHEDLU0xDF5ONJ/
         MC2uKM0PrDhp3VW4OuiCGNdg5DEOMYe6upquqE6KjcbC6KDhJGrkhkU+SbyKNHEpuJWX
         fZAF3lHDmdRmDC3DsCW1hiOWveq1AxH6s/xATjaJIwwgu77DQereus2a3F92vvJcTpWu
         QD7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769520153; x=1770124953;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SPNv4ujSn5GBeWJw7SR5sa7VAXW0dXiZYUYtMsCoyQo=;
        b=u1l4ZqhDJ1CSFHyJVLO/cqlqqxnlrzAAw9/j5OaYUQIso+dMrKf7TMjux/RBkkB5qq
         8LL0HsFGadCKyqwNok/H52cAne5VefJpcaIQbhfpqk0s+YUNcisYCcSHaGoNodjX/wfU
         msIYU53qF384du3pg0SafAOZMiI1g547TAPrmP5Nr+qgHJ3JvoIJmq3lz3dpQpsB2+Uf
         6oKJCET/RybdspcKBSE8fHCAVUq7HnUjN0LJOsrpOkjhYuf5oMeCKI/WqxSH7L0XdoEy
         c0H15kt0q4AjmFsquwPlUl6fyAQZVGP9JJyApRRLzllHKh9t7S99Iek00Skm2JbMgzCR
         NRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3N/zrQWpPxPTBnwRBsTp1Ps5cUjpGc0Gp8wPNtPQUyvZrTyfhGyPia4Ox3IkXL3HwKyjd@lists.linux.dev
X-Gm-Message-State: AOJu0YxnOzDRylm4x5qSy1vjMvGmn8VwiZZ4nsNBTjMexz4/X5Qt1G4D
	MElgNQhuJKJ+vvDy1WK9x2+iVsPqNLamthHsAb6ZI4On2U/feVW7y5Usfg1MK+/Qzyc=
X-Gm-Gg: AZuq6aLVfGKg4IQy5+k0knxGQI2LkyjaFYCjR/I7G+qbQYfpu3fQcovQHThAioV3JLw
	YHS9LrYzasxkRaXUqVj6LNzIuzHG9dg0myr3EVrS4Yr3uA01EvOrwD/6g8sJRXMUMQfhTFjKBbx
	g2XmbE1cMhVsWBdTR49uucIQyZMaa5QU7YWUUjSfr8k2pDvnuMMNIVOJiAwSMFm8EupqXYEslrQ
	28nvSbC3Fj2u05VdgMa0N1KWY5+Icc6b34pp8C9sAYtyQ3H6TYAyid8iMjK0+8J10O6TD4yyBW6
	ULytu6raCxfImcAqzv+qJsi5I8a4zISEpWY9DA0oe3bu855SdM6TVgyHQuADz4Dmj1xPBXnlUn8
	2bsxDYM9hAS97f6Q1T8ZwebWhH45c0RwJbyTTrskc1f9Cxxs6QbllmNyVEKmWe1gci5sSDMShaP
	RDizsMvauXo0s/0hdZWSXZ6JaFG2O5RlvzslWgGL7S2mrvhFih+Rx64D+Uicg/Ixgl1rzmdl8If
	d8=
X-Received: by 2002:a05:6808:c3e9:b0:450:1eae:96e9 with SMTP id 5614622812f47-45efc122f3emr893352b6e.7.1769520153474;
        Tue, 27 Jan 2026 05:22:33 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:a1a5:d807:e7a1:53eb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-408afba74bfsm9488054fac.13.2026.01.27.05.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:22:32 -0800 (PST)
Date: Tue, 27 Jan 2026 07:22:28 -0600
From: Corey Minyard <corey@minyard.net>
To: Breno Leitao <leitao@debian.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH] ipmi: Fix use-after-free and list corruption on sender
 error
Message-ID: <aXi8FMlZoja1aVGA@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
 <20260127-ipmi-v1-1-ba5cc90f516f@debian.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-ipmi-v1-1-ba5cc90f516f@debian.org>

On Tue, Jan 27, 2026 at 01:57:59AM -0800, Breno Leitao wrote:
> When the SMI sender returns an error, smi_work() delivers an error
> response but then jumps back to restart without cleaning up properly:
> 
> 1. intf->curr_msg is not cleared, so no new message is pulled
> 2. newmsg still points to the message, causing sender() to be called
>    again with the same message
> 3. If sender() fails again, deliver_err_response() is called with
>    the same recv_msg that was already queued for delivery

Yes, this is indeed a problem and your analysis is correct.  It looks
like it designed with this in mind and never properly completed.

However, there are some problems with your fix:

* You leave the message in intf->curr_msg after it has been freed, which
  can result in a use after free or other incorrect behavior.  It might
  be ok in this case, but it's a bad idea in general.

* The send_failed flags is unnecessary, you could just check for
  newmsg.

* Doing the lock/unlock in error handling is not a big deal.
  That should be an exceptional case.  Adding the check every
  time in the normal flow is probably more expensive in the long run.

I'll send out a patch for this.  I also want to change the locks
and run to completion check, it's hurting my eyes the way it is now.

Thank you for the report, I really appreaciate it.

-corey

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
> Fix by introducing a send_failed flag that signals when sender()
> returns an error. At the restart label, inside the existing spinlock
> critical section, check this flag and clear curr_msg if set. This
> ensures:
> 
> - The smi_msg is always freed after sender error
> - curr_msg is cleared so the next iteration pulls a new message
> - No stale pointers remain that could cause use-after-free
> - Only one lock acquisition per iteration (avoids extra lock/unlock
>   in the error path)
> 
> Fixes: 9cf93a8fa9513 ("ipmi: Allow an SMI sender to return an error")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 3f48fc6ab596d..81259c93261fb 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -4816,6 +4816,7 @@ static void smi_work(struct work_struct *t)
>  	int run_to_completion = READ_ONCE(intf->run_to_completion);
>  	struct ipmi_smi_msg *newmsg = NULL;
>  	struct ipmi_recv_msg *msg, *msg2;
> +	bool send_failed = false;
>  	int cc;
>  
>  	/*
> @@ -4828,6 +4829,16 @@ static void smi_work(struct work_struct *t)
>  restart:
>  	if (!run_to_completion)
>  		spin_lock_irqsave(&intf->xmit_msgs_lock, flags);
> +	if (send_failed) {
> +		/*
> +		 * Sender failed, clear curr_msg so we can pull a new
> +		 * message. Do not clear it unconditionally as a message
> +		 * may be in flight from a previous run.
> +		 */
> +		intf->curr_msg = NULL;
> +		send_failed = false;
> +	}
> +	newmsg = NULL;
>  	if (intf->curr_msg == NULL && !intf->in_shutdown) {
>  		struct list_head *entry = NULL;
>  
> @@ -4852,8 +4863,14 @@ static void smi_work(struct work_struct *t)
>  			if (newmsg->recv_msg)
>  				deliver_err_response(intf,
>  						     newmsg->recv_msg, cc);
> -			else
> -				ipmi_free_smi_msg(newmsg);
> +			/*
> +			 * Sender returned error, the lower layer did not
> +			 * take ownership of the message. The transaction
> +			 * is abandoned - the user has been notified via
> +			 * deliver_err_response() above.
> +			 */
> +			ipmi_free_smi_msg(newmsg);
> +			send_failed = true;
>  			goto restart;
>  		}
>  	}
> 
> -- 
> 2.47.3
> 
