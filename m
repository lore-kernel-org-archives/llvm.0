Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC44A0F12
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294991; cv=pass; b=BJRaP96eKwwHRH5X6Q+/dVxdTCzAobFdrFdSkAm8tSoN2J66iUat9hBhuJX8Obf991faxO9dyitMTb4EIHGHwq6ecvC2VF5SeHaCFjCTfn7OvG0mDxVJPH/Dcx8K+Ag5SZ0YjZ9dpm5oCiudjTI9Bdx8tjlVnjLSR4PLRLZsohs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294991; c=relaxed/simple;
	bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyXsc9JV5v1nFTA08Sgv6JATxaDypSmbWtL2SSXP3I4qJJ/ExPd5XdKNTs04ra13OoeO2ZZIe6+EHdQbeYkAv1grXLuW5z193Z8G8gV2HRdKzfbOP6oEHZt4XsbEr4at1oDSmHgzU1PaSZwDVpgop7GyJx+IBVDa0LHEEpLL9Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GILpRr4Q; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GILpRr4Q"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e2fdf6ebso348657f8f.1
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 13:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788294988; cv=none;
        d=google.com; s=arc-20260327;
        b=gp+boEbI4b4iGx7qfXxfhoTNvmlk6rJ91Xg0zavjO4bv2gy3pL7d8xaWtcnyde5Ece
         GvrED3YCkJk9OEGBE4P+vzhM3CPvFQEC64QoV/tdyxe0ffI5fPt7rT1f32WpO61754ry
         jKhsU4KJf203x+eqMQiqDKrtxt6j/IBt7AUZNA3lo5KtXRtDAfc4Nwa2DFVdUIBIngxT
         IeH2aMmGHIVYIm83cN7e4fjx4eIBBzzraJIQL97ENOkbDF2yU5pscYiiaQXhJnOnwewe
         oEvLOpafdyzXBDp9C4hfV9h4CNxlNnVJZzHdTP5iBGrjcjMB1tczFqG4PAp9MMkSHS/v
         JQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        fh=tQHjWTfA9oxQSriu5JOd67Nk0Foa0TVP78GEYvq3sBk=;
        b=K6EY5a2WY6CABWRgbKN8a+ey3IrYydjkMFxGrw6Kibe54Bs4gdCnORFMXAoIHQ9fan
         RTB+VblvSKJ/w3S9VRtEZX0kQ7s1/RrFRza4wOCjMruNE9jY9Sm6BN6nEXOe7+nLmtf+
         axpD/RndTXdkAMBYoggsvAHExaJsYN3orfdyC3aQyoa/b4c2suajsweAM0/GQo6q0g2H
         lqzpdPH4kvVOcsWKpRqM+BHCAmreYVAMjjMjJkVDhnEVi3zGf1T4oY4xVO63Mp4L3u0z
         2xQMqGOasQDF4kzYbSfrgdVM8zAMfDFn3KRU74efA+/4y3qhGJu7HzoAeUXY/pnHKgAu
         df+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788294988; x=1788899788; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        b=GILpRr4QGCIrkoMs582rfPCKAIRbW25kAmaMl8oDgHvVMjoP5Mcgbrj8MRO3oqLIDd
         MvCHXlxwKHfD+bXNuOe8OIw9cFzfD7yRX7omH6qvuH9qIHHsPvvpmodc2FRhKSXk0Nbf
         P0shzhVS0jrM0hxJAeG0C5R90Sk/9OIIdmqmtCYHkum12efVrLWQkeqr8pAq3ZzOhYQS
         kD2pcH507OyT09UI3GJhPU280dr7+IcPKYOKsWx489a/DTHf8Zj0YtEPw/ZBUGtzCxil
         xtUG5V4W7POHCpZcg7tQYBPihZkoUrPoUYasim2i/V9PkE1LLWcUqNJSTNX27LExdysT
         jr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294988; x=1788899788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdDGW1g39cCl6eGOp/7kmX7YZgzSXGwniWQDRTw+uXI=;
        b=apPe7iRrNrfOpuuUrTXfJRGhOKJHfNUzvsiM7m6q3QBAd8Lo+Zr+2gh6qdxHt+hW9+
         hO8R9yXtnuGSfyS8q9Rz7dcWiYDAr+uta0FbPoa5ciHqqBUYc5ywGYg+t2Ytb2CG8EJS
         DIkar2nZcRDW5txCMIlKFuIAW6YjUse0RZhxA+BEMlCYepzoVPldD6NxbnaUFcjBEqf8
         7Au+TsIwG4BZXqI5TcwPGCqTLO2F6hdkfYkq04jZXw1cO7Nd6DXgZgwFzp1Nlyk5cz+N
         ZfHRH2BkApej6EPvmNioG0X0eOZGcqin4mtsAQW0on2QrCGF270RXcjiyl2fxLx3eupR
         dOfw==
X-Forwarded-Encrypted: i=1; AKwUvBwjsjc95WOG1qvK3gRUpmVBDobRoMAp2uw9+UKiY+VY9KCCPrbTheZOe9wy1irb4Aar36gh@lists.linux.dev
X-Gm-Message-State: AFuF++n6JC3zEWVguXVtNwidbQIjTtICbUHyrX3LmbXEdFnnowhzfb9D
	uNdNSaA/lqNgcw7LZvaY/gKAAPvQZ2KORidAWrR5EYYD0N92UNDGrtxpsr7yNEWXnlVvYbFxw9O
	qANptFF/9xgIro0tDffe70gDa/nnIsyke0+Nji3WF
X-Gm-Gg: AYBFou1iQI/HNkwR2dvxgaBS4RiiGHHWM4rit8fQ5sTl3BaL2yuDihFQj3e35iq3wZ2
	XLeNW5BGK9pHXfeo8SJsnTgfDNScgarbW1xpC8n8NxT5J/4eZ3KBc+y2iy7+i2aSbgKC6v1bIGA
	u7fOM4f6Yqdue3Mp3Orv87HrBtG++nuqKICuG1vrRB03QCN+fCDLZQTCD/niI/spf0qV6Zsd4aP
	6lCHh7U/dgZeHBICMgArbiVjxlTzxxXEysbuVELgK/Hjn3CgC5jG904Lt0ftrbn1P2ZpXvQ6GSq
	FrlEm/WJyibKXolNdc39vRM9YG2vEkYq86PbkVDfM2HO7uy3xaFSgQFhJsFQkzG2y9H+Zrqj5LZ
	0tc3id/T0eKwdYiLl08tPHe3dp5HYx4YHUyvOjoJx+Wu+1EexwmepeU8=
X-Received: by 2002:a05:6000:4910:b0:482:f61c:7cdd with SMTP id
 ffacd0b85a97d-48488df9e0dmr42483f8f.4.1788294987371; Tue, 01 Sep 2026
 13:36:27 -0700 (PDT)
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
In-Reply-To: <CABCJKudb5RegHcNPkXG5p1TcCFAe5_8+hqBP-2GyHVK19oB94g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Sep 2026 13:36:15 -0700
X-Gm-Features: AcwNN1XLVY2qNNwpmvPqR9vii35HawK0FLdCW7a8C92cPutToPYaUpHoOUGoDJI
Message-ID: <CAKwvOd=OLLO5AXiR54o0nU16e_pTDt_yiEPQ0GgnX8DRGJXYmw@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>, "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:46=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> On Sun, Aug 30, 2026 at 9:24=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com>=
 wrote:
> >
> > The sashiko-bot's comment on v5 indeed pointed out that imx5, at91 and
> > omap1 might suffer from the same bug: their suspend routines are also
> > fncpy()'d into SRAM without a type hash and called indirectly. They're
> > all ARM, so asm/linkage.h still seems like the right place for the
> > macro.
> >
> > Do you think these need to be fixed as part of this patch, or as
> > follow-ups? I only have my one imx6 device (a Kobo Clara HD), so I'm no=
t
> > sure how to test the fixes for the others.
>
> I think separate patches for the others should be fine.

Without devices in hand to test on, I'd be hesitant to claim 100%
confidence. Maybe reach out to the MAINTAINERS of those, and see if
they have cycles to help test potential patches, before
writing/sending patches that potentially don't get tested?

--=20
Thanks,
~Nick Desaulniers
