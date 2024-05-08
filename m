Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED379E1
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 00:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715127831; cv=none; b=HKIFe9sssBmYYfkAzOxfeZuE5ACgiCk9C8N+oiRVmdxx3Gtm+VWyyrczOR6gwJ25YYxKl/Cs+XKBHMXCo+5MSwm6QjXgQfoVzk7npldvy3931N1DAYC9Um2NJzs5veZeuZnUgcovSuTtES7FIgQODQsr+ohUe7/BFvRnRT5lJM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715127831; c=relaxed/simple;
	bh=1da0pLj5XHUXhL0lSN1ETeHymYQMRKeJgc8KotxtGlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkEcjs2jh+90l6sRUv8h+NU3DBW6/b2QAJuNqvgIIOtEtLadZr0FZ9d7nH8rbY2Lx1AlJUJNVTVQY7viFOk9mqgE5Kl759L21oYdWy/dkmu8S1MNjyQeqco4vLNVXkM25fnMmLWrI8102fjY4ZsygI0simca6jwxZ1mgLo55bck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T8YbnFuW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T8YbnFuW"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ed835f3c3cso34922305ad.3
        for <llvm@lists.linux.dev>; Tue, 07 May 2024 17:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715127829; x=1715732629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09NWd9Q6j/agwIZs1K4w41dSpMpn7Xn/XB8A6O9Z+yU=;
        b=T8YbnFuW96mzHBAg8LX/Z9DFBZEpiCWHOn0v+BLFQzkKhvYNa2zeKQi0z30zUkGF7o
         qmwnTbWQTLw3r1Nb3yKCJzj28GYzidyt0M3aiDXrPyQ/2BVF8+SKqPu/jT6XujLeSleP
         TALBM3fLjceFhvKGc4bDkSlLLoxUUjP3dlsFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715127829; x=1715732629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09NWd9Q6j/agwIZs1K4w41dSpMpn7Xn/XB8A6O9Z+yU=;
        b=GbLUdAu3dFUSCqxqszEBFcx9jrovipOSJKsrg6099Cg3QbI0KJ15KpyKGypAhS98Q9
         LLJqQPZuR28ngnsmUfqfsxNLuAdTzzHlanhyBRy9xQsbb+ysMCT2MY7qly2RKYcgbgSx
         NRlLF5kJxyI/h0ghNMMi/ddJmOSepsoB81qcnplarR2VAurfRPf2IfGgaLKsqnVhlmoR
         BYNSBFYDjI/jRDPs7IQnoF/PzVxzBvb97QBPhlDPIqYZW9ctQhWQaOXmAfpmkADN1VnC
         tyvyuZk5GGuz8UDbcBrCGkV9keAAynVOrrjftUupRu8iqUiQP+ObAj5PkzE9V2BuP6tq
         Xk/w==
X-Forwarded-Encrypted: i=1; AJvYcCWp5t9qG6qETO9hC3RW/5lhue70+OHBADhsl1qN7+imG0gZpN3hPok+yRgb5EdBM3ZXWTAbvEN6K+nfvfYSe3I4eAVejA==
X-Gm-Message-State: AOJu0Yzztt4MLBW9G0SWssTKFj8RGXhHKoiZCZEDoqb0GQA+IvEAOYgM
	9gu+CstPSmsY/h2dUwi7bAsthdVgqHpdIPa+i77ODA4V0jNsybA+UZpBNBTEWg==
X-Google-Smtp-Source: AGHT+IHuemiCrxMSHKVE5rfjo+Q/DiytZ800PCNfDHJmUYfSE9kSJVG4tzAseUtRbGaNhTJISUEAdw==
X-Received: by 2002:a17:903:4286:b0:1e4:6232:367a with SMTP id d9443c01a7336-1eeb01993b8mr12268225ad.22.1715127829507;
        Tue, 07 May 2024 17:23:49 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id lg6-20020a170902fb8600b001eb7823164esm10550918plb.279.2024.05.07.17.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 17:23:49 -0700 (PDT)
Date: Tue, 7 May 2024 17:23:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] scsi: sr: fix unintentional arithmetic wraparound
Message-ID: <202405071715.BD7AA91C2@keescook>
References: <20240508-b4-b4-sio-sr_select_speed-v1-1-968906b908b7@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508-b4-b4-sio-sr_select_speed-v1-1-968906b908b7@google.com>

On Wed, May 08, 2024 at 12:02:27AM +0000, Justin Stitt wrote:
> Running syzkaller with the newly reintroduced signed integer overflow
> sanitizer produces this report:
> 
> [   65.194362] ------------[ cut here ]------------
> [   65.197752] UBSAN: signed-integer-overflow in ../drivers/scsi/sr_ioctl.c:436:9
> [   65.203607] -2147483648 * 177 cannot be represented in type 'int'
> [   65.207911] CPU: 2 PID: 10416 Comm: syz-executor.1 Not tainted 6.8.0-rc2-00035-gb3ef86b5a957 #1
> [   65.213585] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   65.219923] Call Trace:
> [   65.221556]  <TASK>
> [   65.223029]  dump_stack_lvl+0x93/0xd0
> [   65.225573]  handle_overflow+0x171/0x1b0
> [   65.228219]  sr_select_speed+0xeb/0xf0
> [   65.230786]  ? __pm_runtime_resume+0xe6/0x130
> [   65.233606]  sr_block_ioctl+0x15d/0x1d0
> ...
> 
> Historically, the signed integer overflow sanitizer did not work in the
> kernel due to its interaction with `-fwrapv` but this has since been
> changed [1] in the newest version of Clang. It was re-enabled in the
> kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
> sanitizer").
> 
> Let's add an extra check to make sure we don't exceed 0xffff/177 (350)
> since 0xffff is the max speed. This has two benefits: 1) we deal with
> integer overflow before it happens and 2) we properly respect the max
> speed of 0xffff. There are some "magic" numbers here but I did not want
> to change more than what was necessary.
> 
> Link: https://github.com/llvm/llvm-project/pull/82432 [1]
> Closes: https://github.com/KSPP/linux/issues/357
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Here's the syzkaller reproducer:
> r0 = openat$cdrom(0xffffffffffffff9c, &(0x7f0000000140), 0x800, 0x0)
> ioctl$CDROM_SELECT_SPEED(r0, 0x5322, 0x7ee9f7c1)
> 
> ... which was used against Kees' tree here (v6.8rc2):
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=wip/v6.9-rc2/unsigned-overflow-sanitizer
> 
> ... with this config:
> https://gist.github.com/JustinStitt/824976568b0f228ccbcbe49f3dee9bf4
> ---
>  drivers/scsi/sr_ioctl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/sr_ioctl.c b/drivers/scsi/sr_ioctl.c
> index 5b0b35e60e61..2d78bcf68eb3 100644
> --- a/drivers/scsi/sr_ioctl.c
> +++ b/drivers/scsi/sr_ioctl.c
> @@ -430,7 +430,8 @@ int sr_select_speed(struct cdrom_device_info *cdi, int speed)
>  	Scsi_CD *cd = cdi->handle;
>  	struct packet_command cgc;
>  
> -	if (speed == 0)
> +	/* avoid exceeding the max speed or overflowing integer bounds */
> +	if (speed == 0 || speed > 0xffff / 177)
>  		speed = 0xffff;	/* set to max */
>  	else
>  		speed *= 177;	/* Nx to kbyte/s */

I didn't see a "speed < 0" check, so I went to check the type on "speed"
and found it to be "int". So I'd expect such a check, but then I looked at
the interface: I think it's wrong that "speed" is an int at all. There's
only 1 caller, and 1 implementation of "select_speed":

$ git grep '\.select_speed'
drivers/scsi/sr.c:      .select_speed           = sr_select_speed,

static int cdrom_ioctl_select_speed(struct cdrom_device_info *cdi,
                unsigned long arg)
{
	...
        return cdi->ops->select_speed(cdi, arg);
}

And the arg there is unsigned long (?!).

So I think probably the prototype should be changed to unsigned long,
and then it can clamp the "speed" argument:

+	/* avoid exceeding the max speed or overflowing integer bounds */
+	speed = clamp(0, speed, 0xffff / 177);
 	if (speed == 0)
  		speed = 0xffff;	/* set to max */
  	else
  		speed *= 177;	/* Nx to kbyte/s */

Then the "negative" values go away are then correctly treated as
"too big" in the clamping.

-Kees

-- 
Kees Cook
