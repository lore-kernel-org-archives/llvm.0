Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659CD35CBD6
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769525173; cv=none; b=Qd3OdTqDO494qaDi/9SaUL7m5gjWnqHmiwwtKzkxZgEI+y57BZ1mt+4BedP5yMH2rI7AIL+WZk5sciBdLlrqcpusKE3cGRFAaqkA/9gefZArQkWF0PkVuX5fmqzbI8odsOrmn86HLKhxeVBcSrr9mEyvcarGZxkrUiRZynZz8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769525173; c=relaxed/simple;
	bh=fv2CQ15AU5d5Aod1Cu0Nr1aIgUDyc6KxS+DtPfjyvK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPJDOstfudpBzkZ+9w6VMco8hINjybbbA9ykICmMVvvF7vDoNnzX6G9uH8K+vjRFxq3BS9XUi1e6HwtAJa2K91e95Bcxm8FFjEx9Ed04sQZM4VLg8Ui96rkNO/MQ29TdA2nKHZFk+TybxMyPP39+Lp1j4xZZHsxqJineLSjRMjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=LxSP68+5; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="LxSP68+5"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4044854464fso3118763fac.3
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 06:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1769525171; x=1770129971; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgGF8ctS0K4niRH9iziMpNUnP6faXj3JV6+BPJJ9b/E=;
        b=LxSP68+5kV9Jsbus+Khggt1nRD4AHryPunR6JHIjZHsuYg7RSC8yDMh3l1fXlMqTSX
         opUOLmsO9URHiDRg1Gm4K201W5muq1cpaY80Xb6QK4cVMsFWsESc7p2qXuIzk0S+uQqb
         AjpEJ77DK4rKlV0tiwodS3vZWTotqExyou/w4QSyQ80llPZhISZYtuotUaPFhZ2CxNxF
         XuSYU+PIms+DHchZ0QVO3EJ2rG+38w5DSpJ2YYThpnDbP1tfTGe90YrEC/p+TZ+2dmC6
         i6keIhrCU6WBz+QEdQZRBNKavQlmkZOAh3fPWLeSQhhJxVTNJU0f8soa5wmUdp7VSBV5
         3t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769525171; x=1770129971;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgGF8ctS0K4niRH9iziMpNUnP6faXj3JV6+BPJJ9b/E=;
        b=N1jenD4PmUVemQ7f6fdawgpVKn1mQPMufjQSTqnacFG7XB1JlD6fGnPSi1tAgJkjEF
         8UALuBWZivOfOlUPx3SMW10OD9X+GhKEGNs9xpRAWvqkpWJPEbBXzIzR99C9xKonNpPS
         +y3P2rXQnERy7K1mf8om7MSJhBoeVuDBhZJQwWg0bYz+Ita1EGPnAcAGbzBtqwA4IZdq
         YXXI8g4VRbjS69YWCYBlCbxjnIJQ2QRC+WES0qRQ2DEWceRphfkXfdJVxpeNK75dWSCm
         UPgyAZcvg5L4nVACxrVersHhpCKwoCdboMzSgazfmeKfw8jFZXBWfu3njcJ0GP1IIJUX
         D2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXEUTG/O1//4xOEebU1pk2Y8HgqER0LbyfRkeFlUojgwI7aOvhBifuuuuXSEkiqKC1xcg5k@lists.linux.dev
X-Gm-Message-State: AOJu0YyZIHXfbUaDyFuEGEkPi6WZumAvuGmmQSuKV1ni2QhWEPfkPuRU
	CusL95Hlam5A+NJukRzbrl0KJV9v71hLnTmtlBszz8jRXf+jree8dgEj7z4IGVMyNi0=
X-Gm-Gg: AZuq6aKiDMHarute2Ds1q04P16v7J6MAHaUEuNgjoxG5KFd9BuD9g7FtSopVlbYxi1O
	+lJ94IMuUOPoiNVvz2kR+/eYkosF/LsvDTkj3fY0FfpXhzi0yPydYSx2HWaFp6gKeXuh3egNiCt
	vlmCxV+d5al1AYhgxd4xeXkCnEp18BVnsu09XhS2F0wKA+advd8AC7tLL59aNrefGyKjItnSgya
	WxgEg4tY/bKjnEK1HpV7mH+13ajqYpfxklbS3m8Ji3iSc5SWG15G1GsqhE7KJS2P0Oj6Xg3YxOB
	TGxXKByNWORaC4cCAg69xpDZ4ACwzqzK5xRAy6TXhO/VuA+dutLhbrzMp29rZJrWN6LPLvIBeY2
	jPQ8AiwNv1bGLq73CiohFhqL5BsdfMLY/UHlL9+fMELNSc5XODNI4Cctdhk9x+eK2D7u0S4z3On
	+pdI3EfO3Hd70l1HKwT+8D6Aa4pcOSBT9uogY7SWMUl04Qmy+IurRY1tWK+i1AIPazm55STolcz
	TUDZWE3mfhBcw==
X-Received: by 2002:a05:6870:3846:b0:349:de3c:bfc5 with SMTP id 586e51a60fabf-4093fc81ca3mr1148844fac.7.1769525171085;
        Tue, 27 Jan 2026 06:46:11 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:a1a5:d807:e7a1:53eb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-408af7ff54dsm9092668fac.1.2026.01.27.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:46:09 -0800 (PST)
Date: Tue, 27 Jan 2026 08:46:06 -0600
From: Corey Minyard <corey@minyard.net>
To: Breno Leitao <leitao@debian.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] ipmi: Consolidate the run to completion checking for
 xmit msgs lock
Message-ID: <aXjPrnG7ErymtHBx@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260127-ipmi-v1-0-ba5cc90f516f@debian.org>
 <20260127135917.1597762-1-corey@minyard.net>
 <20260127135917.1597762-3-corey@minyard.net>
 <aXjOT9e11GSrMHiy@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjOT9e11GSrMHiy@gmail.com>

On Tue, Jan 27, 2026 at 06:41:48AM -0800, Breno Leitao wrote:
> On Tue, Jan 27, 2026 at 07:54:40AM -0600, Corey Minyard wrote:
> > It made things hard to read, move the check to a function.
> > 
> > Signed-off-by: Corey Minyard <corey@minyard.net>
> > ---
> >  drivers/char/ipmi/ipmi_msghandler.c | 40 ++++++++++++++++-------------
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> > index a590a67294e2..030828cdb778 100644
> > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > @@ -602,6 +602,20 @@ static int __ipmi_bmc_register(struct ipmi_smi *intf,
> >  static int __scan_channels(struct ipmi_smi *intf,
> >  				struct ipmi_device_id *id, bool rescan);
> >  
> > +static void ipmi_lock_xmit_msgs(struct ipmi_smi *intf, int run_to_completion,
> > +				unsigned long *flags)
> > +{
> > +	if (!run_to_completion)
> > +		spin_lock_irqsave(&intf->xmit_msgs_lock, *flags);
> > +}
> 
> I usually see the opposite construction in most cases. Something like:
> 
> 	static void ipmi_lock_xmit_msgs(struct ipmi_smi *intf, int run_to_completion,
> 					unsigned long *flags)
> 	{
> 		if (run_to_completion)
> 			return;
> 
> 		spin_lock_irqsave(&intf->xmit_msgs_lock, *flags);
> 	}

Yes, that's better, I've changed it.

> 
> Thanks for doing this, this looks way better!

No problem.  It was more for my own benefit :-).

-corey

> --breno
