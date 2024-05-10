Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1681B171E4F
	for <llvm@lists.linux.dev>; Fri, 10 May 2024 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715357630; cv=none; b=l13r9JzzdttuyaQEyKeNb+U77EMkZHdRslfWMN7/rCwVOx2RyIhsLEtwvcVE4/LPxyW1G2JLonHQU3YIP28JUHpyQlx/9/7nhtqUbzWVHwDQ63/xMqkvVkfVEIZNsgweNep75aODQW8V12v556u5Xm5yvunhYCboaW0o8c2G+B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715357630; c=relaxed/simple;
	bh=b2Vtp/c0wZElNrbeWZjvkBtkRs6Hnk/JEEfb33UNJTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZahnmpGpaUAec17bLmyY9SjuNN+G4oRhomlQyA70uMtS+JrteqeUn3gpsDOchvPAYC4/9yZycA0hVjXMGI5s457aL+ZtZDYw0qay/qfoEk/07MaVc0UBvG2ZnpRIjKDlc5CcFb0JlKNV9sz0bbVZMdNqD5hwlms+OM4qRURatY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rQK1RAEf; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rQK1RAEf"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-47ef107b07fso1097728137.0
        for <llvm@lists.linux.dev>; Fri, 10 May 2024 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715357628; x=1715962428; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2Vtp/c0wZElNrbeWZjvkBtkRs6Hnk/JEEfb33UNJTE=;
        b=rQK1RAEfyrHKFBKqOBhOz7iI7zd6uGmAsT33tLcyXM96j1pxoOjl2/NB8WUkPuvBvz
         cX/rtONCscBVNiF0xLg4lqAmqbSl9pOMY9rmUFOM5dHKQiCCxt4kdvN7QQAsdymaP+b0
         KVORg1BmX2GwT1HHQm7sfzsreeS2mT+WVayFgUq/Dusb1oDkfJgLHpxN6vfZRp63aA4j
         fMNResfUYvc5nFZSLFa+EQb7oUjj6V+yyRhopu+8sDRQWeeezO+/Adb78i6a2aZr3UJu
         W7NvFgwe9NLMn1eXcnrfkV4Z7i30XQ2xQ4u4EkPQNisDK3nQaIgYVFtEgGAp3451ptFc
         f6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715357628; x=1715962428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2Vtp/c0wZElNrbeWZjvkBtkRs6Hnk/JEEfb33UNJTE=;
        b=Sy+mN+QxMST+vn++VfhpInF2CgjZ2Jdx8vAV3CxlPGYuwBwvb5VyhbtBlCNZXONWZc
         iutw2yH8GoA4jZy4WJj9pWU3kSPUcfgqiwUT/BywZeEr2x1LLLYxPd7EgxPjb6lu4I4Q
         cXVLqqIKa0426SYjCHQp0RSpCYjAjRduVNJqhxcNd7GpfnA2PbyaDT9/+D7VFfx87nFD
         ktGN5dP1VvZ7fSTW5/+H8Yct/P2CH9+l3MNVvaRqPQgnGQWnoz7Cz58o17b/0P3Uw1hA
         k2ki1bgNdPNbD22OeiiXgIa2Jt4u616g8zTyuHWh3Ac/ZKitBX06XzpdITzgM6o3RE7x
         YU2A==
X-Forwarded-Encrypted: i=1; AJvYcCUnX4DMVFV9SX1QeAvYWEoUcQ01OkfoN2FbD3mq7vfT6rpyIf1GJUmHTzhNWyTBMIJBSvxCdVGpIS0DpSjfO38eaM9Pog==
X-Gm-Message-State: AOJu0YxDkjRJ0rogV+FIDLvZwl+Glsa8UGaPrerX2j1P5ge/0bpMzdlF
	CmdjYTgeKU0DAypslTM0u/lzru3m+WojRQ3oRXezFNGA2KOwXlJokOIVKFQT6sP3syccbm5wucU
	VDPy3z3xr3PSXt/43KeI/u2BGKruGJMOKiQVT
X-Google-Smtp-Source: AGHT+IG41/Va6A/PicQEwVzYdPo29oFPCeD2uQQ0q6aGV6VfwkSy/QFh16mwRnTYc1WroFao7pdgMaWgVuqXaACix2Q=
X-Received: by 2002:a67:ec0a:0:b0:47b:ab0d:b3f2 with SMTP id
 ada2fe7eead31-47fabb4fafcmr5674759137.9.1715357626878; Fri, 10 May 2024
 09:13:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-b4-sio-scrollback-delta-v1-1-4164d162a2b8@google.com> <2024051039-bankable-liking-e836@gregkh>
In-Reply-To: <2024051039-bankable-liking-e836@gregkh>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 10 May 2024 09:13:34 -0700
Message-ID: <CAFhGd8oo-th9bw-VQQAPva6_zNBHQjmOp+oEcaZOM4uk+xi-oQ@mail.gmail.com>
Subject: Re: [PATCH] tty: vt: saturate scrollback_delta to avoid overflow
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 3:40=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 06, 2024 at 06:55:19PM +0000, Justin Stitt wrote:
> > Using the signed overflow sanitizer with syzkaller produces this UBSAN
> > report:
>
> <snip>
>
> I think you might want to hold off on these until the discussion on the
> hardening list about overflows all settles down to a solid resolution.
> Right now these all seem to be a mess and perhaps you will have a better
> set of primitives to work with once that thread is finished.

Agreed.

I came to the same conclusion once I reached fs/*.

Let's see how folks want to go forward with handling wraparound :thumbs_up:

>
> thanks,
>
> greg k-h

Thanks
Justin
