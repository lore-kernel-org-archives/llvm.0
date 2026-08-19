Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A225367B90
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 01:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787101596; cv=pass; b=SQK16ZFTHftmr4dC+iCvxvtpCQAcnoPzEvXPrsJqefCNDY3B5jJ+1Zx8ho8k2JTyBvKToLj+KFkcEh5eCkrGGElnDlmeb7BFUC+hfmVKtOTFtxmypBNIGovwum09BVyk3K0fghH1CeUA+PA2unQXkRLgq83wm2Tju1PH5r/b1Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787101596; c=relaxed/simple;
	bh=TbvLGp9aD+2RDPniO6Wahe9IFHIFUfO6pxWOXLfdioM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3Kn3+8ygZbDYZSlImJWFaRQpfB3Z06QbWRt6RNusg/fuGOU5UsYLuAKwe0Gw2NDWOkJQcW0r7H3+5O+KtYBWCls43Y1vTRAtDUF4yftzlcwMy2RDPAe3MCN9UGDSIpnNcXi6CugMFo1zckn5dlcwtWK3vS3okjT5rSspYnxu44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXntpRb3; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXntpRb3"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b00d083818so1596836e87.1
        for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 18:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787101593; cv=none;
        d=google.com; s=arc-20260327;
        b=S2uXDAwzGKXsA76PMMjcbfT12/05NNpPOWOsWUwxCvezAqY4f7gxFFDOQEsVPQaGEV
         zV6v64yUZAe7T6whlxd7Hf52468a3H/xUJap4Y/1IoJqDLsJINy0VPZv8Sc5g/DjPAJl
         HQPRTEdEGARE6swhcN7fyU6E+Ql2Y8q6Gq7fRH8iABufJ8xi+cqTYb/26uE0WnpqWcZl
         xwBPfnOBAvyKTxUbO1ZK1v8Zrk8JTJQFqhUnZ0nXFxkXLld1bLgHHHQOzoJ2x0R6iV1/
         fQGlixzfjD+mz87EKJTyjbFO2Lp6ObAG3ucIwZekLT78dIYg8vnciB22RP2JU4y8B1Ng
         TX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        fh=rQhoWmEworqAEfxRf2Kjj3hb/UbUyoKYOau645rpn+o=;
        b=sfjljf3GX0gZVHo8FAQZOhrmE0dxB2WVY4DZTgA6wae52cfxNidcklqfq+aOY2YWpC
         j3aiQrJyKOYQ8AZ29cDSBO9rrDnr1Xt5mPQP7w/hIxlZ/3podzVN+oYEOtXrYCzTknn5
         CA0iomE9OXSBj+nodNFnfUGvGflHKh8m8+vJCv3ZLkjErUQXKzn+aoSJ6LGqEk54qbZ3
         MXxO1UOpAnAzYxSiBGWDeOg5CQKzdXeRU13yrbWvB/6HP7KdnpdJlHiJ6ZWloyjajOyW
         LNcarbeQi+Odiq0quS5EVuCJo0hjqf+1Bc/xOOIdFk9hC7oEbbINYRxK6n/XxhbzZYLP
         hzNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787101593; x=1787706393; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        b=SXntpRb3zZ1acng8co7RZYpsBBVHHTnrGRYezf+rtFfMVQ6dplTzz+3yGcfHXcaDsh
         vLmK4tJA3QBMLViyC72a7Ct/rhbKTon7x0p2V+ZObf7wcgedFjkyLt6N3Ad4WD/7TYu+
         FT6o0ToB6bqyiLSaxxfSXbw6CtuxrjxRBGj3oOFbk9mhv41DAppatzUQdDl5g3khcISi
         GlHViHqkL50SNhMT3ZpN+T7vz2aexT3LRR7oDOYZHHfZ/uW9kmiL8JywTZltWB9wWlL6
         ZalstbmPuWu0LsBG8rAlF0aEsqQZLvJk7sryEZhILEsdOy/rzo9mZJS9GECChNjFi0Rc
         6gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787101593; x=1787706393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Psv+vV5FJBws3mLEc3qiU+1KxE4djPJwTtEs0koRMRA=;
        b=VsOMOOVDOWhbTHNK4gdTadOKBzH2srB4SGKo6EVROHgFEZ8F3cZFU1OWjY02tSrXnN
         MCXpTw9sahd6S5fMecQVkOCiyHgc6T4d6G91phOgOVaLOj0B1bv+HLxnG4xN11rmXD9f
         JD+Y1dIHjhheO2nCcE4bKMTWJ6jMijuYUyOxFii/U6Dm2SKMwxmLtLZTHi63ZDeiHcUy
         +APpt7A2uVhyDYsc53OCukVy0/7v4FY1fqP34OmHCWItf7rivjbSanmuazPffgtKmG+A
         Csie4AREmR17+Kl3AO+QngKtDfDCQputS/rz6XVvuG9SahviBMMn9YCi14a7X7IWdlWe
         jk5g==
X-Forwarded-Encrypted: i=1; AHgh+Rr2c7Iw7l2N3DTn3qgymhFgo2od07uGIBDFjqsFtHzoFghxoVj/YdYjHJi2uBNGS8vP7vB6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Gt8U8fXb3tx+XNh00Zambz+GH30FvSdVOooPj2wlQ5NDePbu
	eCliNUN8kDFHouY3tpMMxYv4yhBiB2M1Q2XJr43iivQRkJazvuQMZ75qHMLxznFVKKiPo1Tji4w
	KOdNxlPIrXclUtnhXnPAX7/6mxHHUAAo=
X-Gm-Gg: AR+sD104WD2QKTX+ybwb91Dbl/94nrwZ05uCg8Z8u9dXJ6+zH4mB7Kx9BuNLHJag+ho
	HfXT/Mgc78uuZdDyZF8PZObJdqcnQYO2B7nMHsIgil7IG1aDmrsIUDxFMSysluE9sht38qdXqXq
	7HYzhDP5irTGYHGCzAzjhozG96sQjPgBFUelBdGLn3x6aNW3DqnAp26BwSK50PxELKEYCAOBxlR
	RBHy/4yhqR4XPs6h12q2kHcVs+wiNxIxm3x9WXSGGQe7Yl+veulQkSn5cM5NEj7UdEFYUJsLg5w
	fEqRFwogHzPl8St1qkm/0Gu/S7zk+kJvqK64q4eoS2/XWiqBBT/fwk6YcGp8EEF/q497nXTLF3M
	3biQ=
X-Received: by 2002:a05:6512:224d:b0:5ae:b5d7:4b99 with SMTP id
 2adb3069b0e04-5b4785e6216mr238239e87.0.1787101593147; Tue, 18 Aug 2026
 18:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803195135.GA1083357@ax162> <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
 <CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com> <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
In-Reply-To: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 18 Aug 2026 21:06:20 -0400
X-Gm-Features: AcwNN1WcKtw5ENjFpgp0JrUF6Cd7Zxk1ebk8fb_me2vOSumdHXZLIX0XvC6ScbE
Message-ID: <CAEdQ38GFCDQF84ZOvGBeRvsc1TLHsJ6eJ8wMxMpeJGHKUWGXvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 12:24=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Aug 17, 2026 at 8:28=E2=80=AFPM Matt Turner <mattst88@gmail.com> =
wrote:
> >
> > On Mon, Aug 17, 2026 at 7:16=E2=80=AFPM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > >
> > > > On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > > > > Two small patches to let the alpha kernel build with clang.
> > > >
> > > I'm curious, since we've yet to have such a case of an out of tree
> > > llvm backend, what's your plan, if any, to upstream your backend in
> > > llvm-project proper? Perhaps as an experimental backend?  We have bug=
s
> > > filed in our issue track for m68k which is experimental (but upstream=
)
> > > in LLVM.
> >
> > It builds a kernel that boots in qemu and on real hardware.
>
> Wild.  Where did you even get real hardware? I know very little about Alp=
ha.

Mostly eBay :)

... along with most of my other pet computers (https://mattst88.com/compute=
rs/)

> >
> > As of two days ago, it's capable of building itself and the 373
> > packages of a Gentoo stage3 + a few other things. These include glibc
> > and other core components (in a qemu-backend container on a fast
> > multicore amd64 system).
>
> I haven't kept up with Adhemerval's work on building glibc with clang,
> but pretty wild to hear about glibc building with clang period, for
> alpha no less.

What a time to be alive!

> >
> > I would very much prefer to have the backend upstream, and I plan to
> > start a discussion on discourse.llvm.org this week. I think an
> > experimental backend is probably the limit of what makes sense for
> > Alpha?
>
> I agree. An RFC on discourse is the way to go. I'd use m68k as an example=
.

Thank you. I'll find the m68k discussion and model mine on that
(assuming they were successful).

> >
> > If you have advice on going about this, I would welcome it (privately
> > or in reply to this thread).
> >
> > Current diffstat is
> >
> > 461 files changed, 29735 insertions(+), 88 deletions(-)
>
> Only advice is that if any of that was AI generated, please do take
> the time to review LLVM's AI policy.  Reviewers have been getting
> crunched by low quality AI commits recently, and are a bit salty all
> around.
>
> https://llvm.org/docs/AIToolPolicy.html

Indeed, I have been, but my goal is to do enough self-review such that
no one would be able to tell that an LLM was involved. I will of
course disclose that LLMs were used.
