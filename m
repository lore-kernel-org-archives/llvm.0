Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E36C21CC4F
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 01:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769650400; cv=pass; b=rIy55f6XBhp2EJWBobvSpALaaj8dOl5BCW6MEH4sq22oItU3hBkn6QWZpzPMqOoTnWoI5AR/p+6UAkCqi8QU3KSje5s4ftPPnlm2eMbTjE/M+H7FCAIHfkIR1vc1q9SSxSV4tGbX39hWLajcz5LTu88Clf2ohNTv4Q2lNB+JK6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769650400; c=relaxed/simple;
	bh=KPxkUftLifgbex2Sk5+vVvXj4pg8pH+i1zJNrKTkaXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TifupFZFZeg7c/AdPT4YrM23AXlKJzoj6vZkAHGGBbQ0ZrcbyL0W/EunB1OC7h/Y+yq1wfwjQyiNy8MI1b7C6Rz4W79Aeznpmqk6Vl9TOogY86XDKhvlcInsd8/nqEiZz02UJ0AdZne8xAMUMKMKZDZQ+Horn/aNE7gWEzNbC7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wB330W9W; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wB330W9W"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-124a95e592fso290859c88.0
        for <llvm@lists.linux.dev>; Wed, 28 Jan 2026 17:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769650398; cv=none;
        d=google.com; s=arc-20240605;
        b=kWbBr6gM1S38ZVeCfWQ1wz/TKwsN2a3vXvY4oT1UzBDT6Xo2xBovXIbg/kP2sijsXS
         vk/6xnXdombVQLGx/BrnUhfKjwEqqTJQ5bFUeNJh9LjDCRDtpACGg1bJ8b0/6DMPKSmQ
         BSIiQJNkYPinbs4AQVWDMoKLRl7mB3eT/rWzNkTSKhFbMXiOLiT5mw0yyV4bRCipPzEm
         PY+Jdi102DpcT5inIPIlppfgCunKC6m7DgdS5Kd03c4QcpzFjVf4PGbaN0ip/j2nMbT1
         MnSMVVdPbRw/OasjTTJAj1v1DBxYWsZwADBXcRVCOLDxXTKiiOP/DA4sxJdSgt1xWBwj
         Stiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KPxkUftLifgbex2Sk5+vVvXj4pg8pH+i1zJNrKTkaXI=;
        fh=xAYPOQlM5tp55fYC4bay1vV58hcxAbSTvaENKEntAMU=;
        b=NPvXd3wxJqplgE+nUM/srSO+7+iSfpjJ+8eJQElYcRMHA2TW/JrRSJumc9ploSmzvh
         RlN53m6e1SKnIdv4weWtn31d4J6M4A8TrscCWi9/BKspYBJQmLrULZVAYvFMcfWc/vui
         Lncs5tsTUsbJDZCk8GWdWTUDrR7v+H6mleEFiHZZNRvavvyk/zYYsmbHOybeInKBIbHt
         JXUCKilo7WDPc8b12c/Fws+LdcY6HgCZP27NpwWoRjEJQuusLfUWmX6SWJB//kuWRTnE
         kk1quczdbkC5TyHMu8Y/quanYH9TxSwq7drIVC3+a83g8kp7lUNVsUQPqlm5OBFh4dCt
         Yxpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769650398; x=1770255198; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KPxkUftLifgbex2Sk5+vVvXj4pg8pH+i1zJNrKTkaXI=;
        b=wB330W9WfeHZe95Snp6zSnlIo4snW9yN/Ta/lRP8m4gWgZHtEWspf1XC2Y7Fma9Q8G
         SVzupraNtfpxIrRupfovejHxr6AjEphBRWyOlFDHXMRmQsphRGgvbUTsGB7FyHGTuhGn
         vVG9GsAAUQR4Tnr2S7KSOh7hokJR6X7ToGwNmIXDVlSL1n+j6NgKnht9aaQl6v6uIDFg
         BHS8+Dq13IbhPbJgGI41L9PREVCGkhUyMtX6UBlpzhWVW/qXb9hid3H4I6GhyjKZWiSZ
         5SwjpvRT/xjwCraa5aLcdAseoViuGOSfMB6aw+vNcr8A7Peq4BBs8kegtDLIE3moGD+X
         tExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769650398; x=1770255198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPxkUftLifgbex2Sk5+vVvXj4pg8pH+i1zJNrKTkaXI=;
        b=M6Kk2ZKYuiwZsO8Vz0yxQa7r6brLl0reKQceIzwg22Ol2ziRuC0TrL9NvIP4dD0Si/
         7hKpT3q0Se68dyPY1yA3VOXnZBewADVg+rj94Y9Hgc21a4Fa31+4k57NmZyC8+vHiwwB
         1jooisTq4iIE/iFDiHZIzVJ9JPGZCSIGga8MdLZ6LERHvFhNYD/KO9xjLuVIAZm81rL4
         F+r+xs9NamMr3Ri64y5RjX+I+F+pTvfaFen3up/CJHVrDUcmSwQrKXz9SquWNckBcQo1
         gwD4U/jSqoPOL33YSCjXA60GRD3oL6agJDnMLNRL6csYkkALnOLARo6yuJd9vdiz/aFV
         agJw==
X-Forwarded-Encrypted: i=1; AJvYcCUGcV0iI90dBBcEhJlZ1Cwxkqf7437SRGrGP3BkaqBc3nV01LXek+OYts64OgYw6y3eFGul@lists.linux.dev
X-Gm-Message-State: AOJu0YwcOa2kp7eVNsJ2EJoxWJKb0Wr1+5Jas6T6p8k4IIE21YOaEjo3
	qjX1hmpH7KpvRm+DOvjwkCyVmcjS60X0eSzW52h2ZcKLscfGQvVDlmwCIduZ1jlvrLhDCYgO1R5
	K4k2dtZUIBNzT8mR9yun6p4WwETsxQxWQKR3Czm6h
X-Gm-Gg: AZuq6aIaGhz7uOFTuJzFXBOSfu0WDyvxFNwPhVbadIFuLI17cSOxgrfHxDIsjmmKTee
	z58cdcY+bXZ6xMeaf8ocYaNIm9qmpu/HsD0cMFP0qSZUumrgo4VvV8Sw6l/5LhwSjjlozYPNcrJ
	6znga/gzJEukVRgkXa3GTyADqBOJjZCltCoBpljGh4JXpfpo31/naQpEVlvlliE+/GOdqmAigZZ
	i0ki23f7bysueWCuSIHMH0tCEzPWXir0gctCaa/NFZoGR6zBE2UEXNXbxNoelQlBl7CrRY5F+LF
	sydTmXgwGCIgmb0zKku1t0kAFic=
X-Received: by 2002:a05:7022:fa2:b0:119:e569:fbb2 with SMTP id
 a92af1059eb24-124a00ce3damr4826575c88.33.1769650397896; Wed, 28 Jan 2026
 17:33:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129005645.747680-1-elver@google.com> <20260129005645.747680-2-elver@google.com>
 <aXq2FOa1va0P_zu8@tardis.local>
In-Reply-To: <aXq2FOa1va0P_zu8@tardis.local>
From: Marco Elver <elver@google.com>
Date: Thu, 29 Jan 2026 02:32:41 +0100
X-Gm-Features: AZwV_QgWRiXog_Bj0YjuS6XVuAh9IM2upzY_YIdNl-vROYedm134WVZPU-1IYFc
Message-ID: <CANpmjNOBD5EX2vkVQoGq2v3xoTd+edcoz2g6n6u4fvahA3AXdA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
To: Boqun Feng <boqun@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Jan 2026 at 02:21, Boqun Feng <boqun@kernel.org> wrote:
>
> On Thu, Jan 29, 2026 at 01:52:32AM +0100, Marco Elver wrote:
> > The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
> > qualified the fallback "once" access for types larger than 8 bytes,
> > which are not atomic but should still happen "once" and suppress common
> > compiler optimizations.
> >
> > The cast `volatile typeof(__x)` applied the volatile qualifier to the
> > pointer type itself rather than the pointee. This created a volatile
> > pointer to a non-volatile type, which violated __READ_ONCE() semantics.
> >
> > Fix this by casting to `volatile typeof(*__x) *`.
>
> I guess a `volatile typeof(x) *` also works. Either way, good catch!

x might expand to some big expression, so better to refer to it only
once, and then use the same-typed *__x as a proxy. Semantically the
same, but compile-times ought to be better this way.

> Reviewed-by: Boqun Feng <boqun@kernel.org>

Thanks!
