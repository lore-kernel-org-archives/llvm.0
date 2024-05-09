Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7521292E5
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 22:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715292089; cv=none; b=oICBVrYmaifvehDMXs+wh67JyE9dvc1iScS76HmOR6CuAG5b8lPyitOlZ1TWwijP2RoL9Zrba7OlkGBCQj/ATibJx+zYpk6D6HpMAjcRUceNTo+aFzJbJu3N1mbwgbfcGB2KHWSsWq1XgLa45P5AwI0ct0ThvDFZl1aWsY9bLYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715292089; c=relaxed/simple;
	bh=eTFM0lR+pV19/1K9nIEi52f8o0e9EXmBU+po3xooddM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4jLVE8iebmLGVSSEXnT6mGYH96jRGGu1RHNt+TqBpd+bKN1gHE+yoIA4YVNU+knhFSTNmUcJ2i+ua7uLUNM9AHkIC27P/Hxfxtu+DARHZDc/tjxGi6CujWbHfoSTLSw6YSDkeuEA7M/ntlaD4KVP08memnATaQt7imuUVV54nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AcFkMFBn; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AcFkMFBn"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5b273b9f1deso596414eaf.3
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 15:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715292087; x=1715896887; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZVCnwpSsnSCs9fQXtvRvnFquz+a/pLR0kXJSXFyRYE=;
        b=AcFkMFBnhQwZiV3uGFr294tWLdPIrkPTwKWnYyyQyPIpVPt9xDCg1lxT943c4nUYny
         9Bwy2qbNiPgt/CXRtN4zKCNSbMTj+1GeyAlL1Xl5GCXLvEBjodrGhn5xon4Nim3dXBHf
         tRQQrIRLTcr67LHjpJ05weeDrjbQm3yTwLPUoFimIwbOJyYbqcJc/lvA0/Lqe4Q3m2Jn
         t6ghqqK3p8QZOTTSB+Ns6ToNnGGH+bEewxDqsDABREZwn+bGwC85r1WU3iPflXiHkntM
         WEQD3FXanKplbFMqLZZEcYHSI1ndhUNyX1vEmRaf30w3q5aZjg1PFkqANtYBIWbhD68h
         EiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715292087; x=1715896887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZVCnwpSsnSCs9fQXtvRvnFquz+a/pLR0kXJSXFyRYE=;
        b=dzkdALo+UTH/94yi4KGV6rhLWK7ZuTL5rbmT7LmPCnC/rmukqGWTOQ0J/2oDXmVklu
         XLJauk+oPcASoK4CrfpQx9Umr3h78eVm0zMa20IbMc6dZ9RckYFAj7E2vZmN7rJL8VZk
         IlCz3CqEy8Ck2FU6odf+4pY+raIe9uXYUhrbTNWXR858UnXONAigixItMWbBOSGpak0a
         XhqQqbdmQry0jICLpGmQHLI76iRKTaI60uwTOKStrJWm6EItHI8BLgie0n5dF0o2CMSv
         DcO0V6ziOlmTkN2hOGhWMBt6+dgD6A/AZrhdncV9CbjyXz8aAqO4kD9E7ydC5OWt9Bjr
         /rIA==
X-Forwarded-Encrypted: i=1; AJvYcCWo+5DBG6IvY2O9HlPVYDPnWFx2KHf6udnblpAed6NyHR8SeDsK3eBKarldVnFBbNVn6TbbJX8MPkQNP30E9l7DMm1yJg==
X-Gm-Message-State: AOJu0YzycvRVCOaAqYC/63OF8ThGALQihugw5tNUJC8XKhl4VYjvwerz
	EEB7u0QtlUU/I7xqAhIqL9qmWS1SEX3w5cmDbx6u44BCYboNEjvV+KbZgBYNtWyeP6BWc9kYX4c
	kVldz2Yl95BLce+549HQBqg1cXSp1qaOC5Ie0
X-Google-Smtp-Source: AGHT+IFpfKHeAJ/sLsyM3Lqv/tlwttE2S4Wv1c320CoQA2YSLvZHSj8nXYLIh/V4Chy5bfd4fN2VsBQBoGoTLlan748=
X-Received: by 2002:a05:6358:7e41:b0:17e:bfb8:dd86 with SMTP id
 e5c5f4694b2df-193bb401498mr92029755d.3.1715292087108; Thu, 09 May 2024
 15:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-b4-sio-scrollback-delta-v1-1-4164d162a2b8@google.com> <f7775510-09d8-41ef-97b2-0457e721a9ec@kernel.org>
In-Reply-To: <f7775510-09d8-41ef-97b2-0457e721a9ec@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 9 May 2024 15:01:14 -0700
Message-ID: <CAFhGd8qkYYQZi37Tsj-V5pN5S4xhcyUeAZj1of2kTXG+EtVMgg@mail.gmail.com>
Subject: Re: [PATCH] tty: vt: saturate scrollback_delta to avoid overflow
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 8, 2024 at 11:31=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
>
> And what is actually broken, given signed overflow is well defined under
> the -fwrapv wings?
>

well-defined code can still be broken.

We want to better safeguard against accidental overflow as this is the
root cause of many bugs/vulnerabilities. So, in this spirit, we
recently enhanced the signed-integer-overflow sanitizer and its
ability to function with -fwrapv enabled [1]. On the Kernel side of
things, Kees' tree [2] has done a lot of the groundwork to get this
sanitizer enabled and less noisy.

WIth all that being said, my solution to this problem in this
particular instance is not the most elegant, as you rightly pointed
out.


> > diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> > index 9b5b98dfc8b4..b4768336868e 100644
> > --- a/drivers/tty/vt/vt.c
> > +++ b/drivers/tty/vt/vt.c
> > @@ -308,7 +308,14 @@ static inline void scrolldelta(int lines)
> >       /* FIXME */
> >       /* scrolldelta needs some kind of consistency lock, but the BKL w=
as
> >          and still is not protecting versus the scheduled back end */
> > -     scrollback_delta +=3D lines;
> > +
> > +     /* saturate scrollback_delta so that it never wraps around */
> > +     if (lines > 0 && unlikely(INT_MAX - lines < scrollback_delta))
> > +             scrollback_delta =3D INT_MAX;
> > +     else if (lines < 0 && unlikely(INT_MIN - lines > scrollback_delta=
))
> > +             scrollback_delta =3D INT_MIN;
> > +     else
> > +             scrollback_delta +=3D lines;
>
> NACK, this is horrid.

Agreed.

Does an implementation like this look any better?

static inline void scrolldelta(int lines)
{
        ...
        /* saturate scrollback_delta so that it never wraps around */
        if (lines > 0)
                scrollback_delta =3D min(scrollback_delta, INT_MAX -
lines) + lines;
        else
                scrollback_delta =3D max(scrollback_delta, INT_MIN -
lines) + lines;
        schedule_console_callback();
}

Accounting for the possibility of both underflow and overflow is what
is making this code a bit bloated but if this new approach looks good
enough I can send a v2.

>
> Introduce a helper for this in overflow.h if we have none yet.

We have these but for unsigned (size_t) types. I'm open to adding
signed_saturating_add(addend1, addend2, ceiling, floor) or something
similar.

>
> thanks,
> --
> js
> suse labs
>

[1]: https://github.com/llvm/llvm-project/pull/82432
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=
=3Ddev/v6.8-rc2/signed-overflow-sanitizer

Thanks
Justin
