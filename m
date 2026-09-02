Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817EB49B20B
	for <llvm@lists.linux.dev>; Wed,  2 Sep 2026 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369115; cv=pass; b=XrmVCuQmseXfSCVkbnzTpxtY8jFU6KkZOpGT9vxA3dGFF+LZtg98e0q+bVJEHRFLpvoP4/r/npDMf/X2jBiR+pEbLOXx2GD7Ql7ol7IabGFECON8YednxdIgePPwdMQYAPSQe0jXiQz+xDdcYIQydvpAWXy7KdV6YeOGZNb1Mt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369115; c=relaxed/simple;
	bh=CAYWGXwkwt8+u/LxyR1chbCwCtu6a8KVTc22slh2Qj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBVcr9lDciS5RakiPMjRpXzUaa+/6+U0LBFYUVfh7KfimtOSOiIrizLpUj+v8qpJFRYyInZf2YliTo/CSf4nvgCwh7tOowUdTHBPngEUeVQIzxMVwK+v0AKQEFUqjUcn8QVx97B3UQZxt9yvt3XVJUiH75DanNXnNk0kXpy+vDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trdDu4h9; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trdDu4h9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso8607065e9.0
        for <llvm@lists.linux.dev>; Wed, 02 Sep 2026 10:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369112; cv=none;
        d=google.com; s=arc-20260327;
        b=M1KsV3eehS6dqTvzLdnxcDp8qgoVcwxm7Ma6E9f3QFc+a5U/vjPKXJmp9Sod4sA57P
         0KMBwrDTGlTYKpgDzLzzE0skOMUYcvXKWWuW5UiH4oECU+Q+JgtDMVD6V//S7iqLVcYM
         IFKRxKPSGg9QP3XJtHVVKbprItxsqbfcFNOvLVDgF21kNJkZYbC0U0mXRqZu0TiXkkro
         WpOYA4qPjQ5Lu5jsRlAYBQsU5J425GRFjNttxuFdpTPxsfrTtrJOjxK9CcRYIV/ot4As
         l49aI/LPLHAXNvVCXRRnmWn7C9EmxflCqFE9LzDP2ZEHG2N4iFUx5tunD9rUr1JlZdlz
         sXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        fh=is2xIraGogG1k2ux9qJD9ALIMGW98ep8l9a3Guanybg=;
        b=pI4clBDNuSNcskQbWQzBc81wh0Uz1SBg64Crmg3q2wjNOlGegFFUqTS/5sM0iAyDST
         7H0ELDRp6sHcQhLBH6bqDFIllCiUDtoDMP24M2AmdRQIGieblbjL/wclu6hAnEtc0Azu
         RmC8FQzdo+U7kOfObkn1sJ6FJNdCGhpQzJAxrk2d8nQgTpQWmNestTekaKyHspFr9/Qb
         A1J9wB8z+7fDPDxHuBvlCU2jBileLDy8HtraGUhBmLYsjx7l9VbZYJXVb/P54fkyL8zK
         ZZZSU9F3MWiDnian98MamdFbIEAyAbcgaBMiozdRb3Xp1OLuZXcuccscZrFVEmlK5tTw
         JBpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788369112; x=1788973912; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        b=trdDu4h9Z1djIVulLslgOkEdyGzr0s44zx1OgDuaVgSY4XlwSSwlsIY7p6CUFy/hqR
         3ZSXBAuhbubu+TBVVRVbSrnjmiuR5Ea+oqYaFxbwlOEe35twHu4TuwurHDp5vj/H8dYD
         AR69JfOHUK/0jQBuqTmAW9YNLz0v6jzA9rkp3DLc/TzSygAzMaeU20bBiaxaqipLRgg0
         SVN9Xug3MILXVoymRWGKQWOlSBHKm+mFrMRbG/umwGlppLEJknDu98+Qn6sJkwM+TmD7
         U0SaQ/7BLgH+VGB45pVKPA4FhuNc7QCNVk08KnSww63JpW33EHBxqt15ouXozT+F5l2I
         A6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369112; x=1788973912;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYAOQwQb2HfqPywVtWuRASfqN3xJx96u2yl4fq6Cc0Y=;
        b=HWsfGTnloo15ELirzdhTjL0GNUFN3kq89dGjC4VyH5ZHhU/NKlVfsaW/OgZTXindWL
         OleG8npjJxhTlPbwk5sfYWh91mRg4pxukXBS+ic6UFBsMLdjBlPfnZGqN5m99kJUbLnh
         krdrG7sf9LvOgpYGz5S2eN1LlgO5Arj54I/1Hbymny+Me0Ek3uZ3ptlBRz/NZjEr28Wr
         Q3DrUtr1bjReT9A4sTIgjchUsnp+4qlT6u+Gjb/1r5iijsmpRNYlGOGZ2DRmcaf1/bhT
         0i+QMZyBWVszPew4weiSWG+PMCZmNP4NIsMuBy1DLqS58DpFrIl5LGe9Skvva2r9lnr2
         D63w==
X-Forwarded-Encrypted: i=1; AHgh+Rp8CH7F5KkF9I7HX9e3+OPt1RMd2eGSFgTzSlZTLsIyMxUGffV91DkNpWgLeQ8TS5fGTvoM@lists.linux.dev
X-Gm-Message-State: AFuF++k277DSJskOrgRhvAbQuHHubev+ozW0L9LV/T8jsgS6WzsyuCrw
	5dRn3kaa7rNgsDS06KuLAkENIjK71+pPzFf7DEE41B9AfzOBjYcfeEldbx6vkidOeYXmtZ9L+yc
	h1V2Fq2bDIaNJd9c0TN1797fsNF8FwW8xrxV8kakv
X-Gm-Gg: AR+sD10OpJktqG6te0IxN9X5MheGYDVvzx1ROTKLX79gEoAO0yWA7lZPNpMHBUuc4l7
	6rUjlzok5ozljvicozsP01P0dmxIjycdhn6RfwdDAO5WnPmvadlzjLSU8BdG2d1wHcNfFVC8jNl
	K4rHVDWGhiEwv8LEf7R3pw2NxzV8edHfBnURomskyfqNvLtZQRFr5VETfYtYadInETV6v0ZQkP/
	TmxRV3IZFPQSrW4+fTDQzjaMiHc6qoLIHcawux7T7UD0o9W9h4adN7YK4a6F+lKYY92Up7RfwLo
	QRepdk6fz+/Ex3R0rU6Ikd1qQZbLuqvE7FBrEzjjHTA8oRusNFxc5aC9GRurs3ea24NR4ZaZzIl
	YyUn1EpuUFy9gVuR/ZkXUor3w++4IPyQ6mGFvW0Z49LXzWYI7qoHjoTfgtCzQOEl4YA==
X-Received: by 2002:a05:600c:4e86:b0:49a:77c1:d246 with SMTP id
 5b1f17b1804b1-49ce5852589mr112274565e9.15.1788369110872; Wed, 02 Sep 2026
 10:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com>
 <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
 <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
 <CABCJKuezb0HtOcMBsObczS=HBaRvMszagkOZGHyOVbXBqtJi5g@mail.gmail.com>
 <2bd0c842-d0cb-4ad7-b3a3-fed2000dea83@yoavmoshe.com> <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
 <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
 <aphSYUS7xGJjj2gT@SMW015318> <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmG92SPOuMJka6KqODqObB0F8YJ6NhpEj7eisv-ZK+GXQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Sep 2026 10:11:39 -0700
X-Gm-Features: AcwNN1Xmy-BrINuLcPwv_tFccFrs29sUnSKtr5FfgrTjlEDRCX8NohA0W3QuOR8
Message-ID: <CAKwvOd=P+bnKm_wDaZjBJQUcYKvVHb55MtOLKWO4k99By8emNA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Frank Li <Frank.li@oss.nxp.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:10=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 2, 2026 at 9:44=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
> >
> > Nick Desaulniers:
> >
> >         Is this patch good to pickup?
>
> Yes.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> It does depend on
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-=
b27015390901@kernel.org/
> though, so you might need to coordinate your PRs to Linus with Nathan.
> Nathan, is https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-=
error-v1-1-b27015390901@kernel.org/
> going via kbuild tree or what?

And make sure to pick up v5, not v4. Was just looking at this thread
on lore, and it seems like Frank you replied on v4, not v5. My RB tag
is for v5, not v4.
https://lore.kernel.org/llvm/ca86be7a-7439-49cb-9deb-8d565ca0b1dd@yoavmoshe=
.com/T/#mc0e4f1537fba074b962de6b4338f289dbb26c81e
--=20
Thanks,
~Nick Desaulniers
