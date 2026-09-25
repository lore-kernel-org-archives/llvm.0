Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0CD4E3EF7
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790371565; cv=pass; b=rquvw3yGCUgRnlNUuKSH7PBSXfs9GGONKYsso4Mrvk8nnAfqL20xVdzVXSipwTkSu7sscjyLG/8NA1ZXbrWesPQxe2iJG9wFeCTF3MNyr02VZ2maZfztDjWpse6ayyDdcrLanDZsEWtst2tXvGkfmw+jhDvZwkUf25ZOHyujyz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790371565; c=relaxed/simple;
	bh=vVnqE9ewICJyUy6ZNzAvR3l5JpDQPpcbhDYQ9tAgpNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rijxGCSSrLBxR1wGI7X7XUI1nNoCjtDmn5t+C3Vi5IGuLD9IbuY0FTGoCqOUjgd6HO72sqPuA33nvfvc69RXVrLUYq5CnA1nOW5CvVWTHpeQFT8LSWh1jM9E2yuwZsH5AfTxDNPSJsdGYCX8B+NIpBx5kb318/umsVh+9bT9Af4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eZgUsezt; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eZgUsezt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso59335e9.2
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 14:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790371560; cv=none;
        d=google.com; s=arc-20260327;
        b=n1q5QInJScgpwjIujFQTowgu9hLJIOLq6KP7J2SDyQxAXjrKyCMKfQEWoBRaFOBveX
         J1QqWBboz9w6FdM4wk5XDdHeWJdE0qGlkCW3ET2dVaFnb/p1Xh9MZQ6msE/KG4txZsTD
         oDRPdJhRWQtSxPsVhIl0MhB27PJuKO70bUDj1UIGGyNDWXVpNHBR2BaZV8CsmILbqbqF
         AnNUcD1f3xezOlN85WhVUyUqkabPP+AOfxcT2HlPfFwDfXWhQPy9JHGjWRX2/DUkOftA
         chEfF3vmxj6zC1mhrbICmPcXYJ+CEYY9Uwtksh6Re8vFB2bplkNMZXmbEiB92vB70YRd
         VnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LZBkr4Ro3niOwydI3OdaV1WcaDVvXJ8dIflx3msX2no=;
        fh=OqTb5/JrwmMsmyAeczJA38fVD9dgzgcOzIbF7+mQGoU=;
        b=flvqjp6Ys4HphmTxzQZPal9PlH/wDI6Y86cIPhNeaO5Fdx084U8zIa7HQa77cczkek
         Tq0o2UI+x2Xf1+2DWHV2AybP++GIrWBiL4FehgmtrvfhC+LfPJ5aXT1uFqd9f1v2dxVm
         MflolBNrT/EUM1f9gQu0XSY0Nq/+6LJ4Uju0h76bjxw0bwb95zGNMkBfRM31PehCaICY
         LKrT0HpOBqU26GwOy82AE3ZQRNhQnNKradSoWu/sspKfcCEZHCoApydGen77yD+RDfOc
         yM6HCBq1SQtlmY8KlYdTQHCEXkSaVv9/poBJS8IM9qnIi2+F4lQ6Yb5M5KDs+8zSgjtr
         8jiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790371560; x=1790976360; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZBkr4Ro3niOwydI3OdaV1WcaDVvXJ8dIflx3msX2no=;
        b=eZgUseztPYekgqF23/k2bpRpq8ct14SWLYDuIRug/HBKRCZszo0BbJRQWvG6MxC+RR
         SIJVM55KwQBCSCX7wZAFgYir/33D62k1ieGOhsR+PorlMcewmF14L97P6TUCfiLD3GJL
         tukTK6Efjl7grpohSS4H0FdE2fWwjFT0oS78gawmCbTZ/3ESoGFa/dtgXTokVy7j4nt6
         HWydZOB8d2khyCcLlwX9/VlZSD/cRhrSGuzkXCRWWJjP8Cemxbb2RyVt6Ew5bzlsY6td
         5CdTPFN/ZJ0xK0dnxwz06Glgk2bWwnpI/sTrHv2YCnh0XS3Y3mothSbpmQwQr3UQHSEQ
         KTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790371560; x=1790976360;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZBkr4Ro3niOwydI3OdaV1WcaDVvXJ8dIflx3msX2no=;
        b=f3h4rc3aCROGjeAFKzs4aaUDcdKS91WVQxvS4uEstBAjJN0ezk6f69LHEguLiicP/X
         tLcNun5UtIXimUhDW9YxrivDrV+GmvCUjXf4QclpAVJ6Rs8UFqSGZ51OGXIlRtrX9kiF
         HIXH/EQ88A9a7R/+3ysdiCGaNikKnX4hSYD0qaEjuP+SF0yM2JZbqXS3kCvfqJ+u8+Bd
         hsz4LhRihgMKGkNKm9PqVlUCL0A88Ldgg3zSFnQBkbuHIyzbkb4oE2ooRew/xFzI1Lze
         EjRdXqtd7sVKuADj6kE1ZZjVMBEIeSGdxBmT2yeXBIUJz599+MyAX8/6FyK1Y0xDcH/F
         Rvvw==
X-Forwarded-Encrypted: i=1; AKwUvBwlSxkY1r3wHocOxaGJpYqeaK+522ek27HTMyaZHOvBuBGvxPLr8dkVOKjvllYkLLf6h4yC@lists.linux.dev
X-Gm-Message-State: AFuF++kanxxqgML5vjyFIzu05DU5att6+A9cJZrl/DGxaqNkAWv7MFfN
	QzCkST+JzeQIAsi+4ow/M/n75tvnPaE2hd02bxc4rxeCDfuXZ0h//Ndww0flQyS3DjRO5PBlTCP
	TU+w6jKWNRk9RIWIebfpCG6wWfOPJcMOkWZmPcheNT8mc/SZZrpcAfmyo
X-Gm-Gg: AYBFou0No95jAPzf7xOd/mR78HHjgASfrhFFOFQX8rLgy3+rKWy7Z1IPXcoafXM7nOD
	e7i07NJW4W0e5KSOt2AX5E2WZWRwU8WV4+ffTjvHnKdux6sbUL7RGZAmXOmsmbo9rBnoFX+joqK
	Sb/BWyl+lXBLBq6LuvpNI8BdU2K30ZAggniZRznO4OUhncAxJJkurS4tIAjtT1PZfCeh/9d/anp
	5kh6rbT8lCzhuRDFmFNjvs+hymE8AFHOrr7Ylvf5GGkmze/1xrvzTlz0F9bkdQe971Sba0PbR0p
	D3g2318qx5kDz8SFMrSjmz3dq/mdH0lMh5V6gO9WS9ErkCapPfIK6CTER1DA/YqKdG17540KQg8
	HXDy+zvWdv4IL9UJGo8yMvBkjAnkUIo/Wetud/MuC0lRiB8UDqGZqlp8KzdUT1KURNk2ZPGMvN+
	GeaIuyrg==
X-Received: by 2002:a05:600c:a16:b0:49f:eddb:bcb1 with SMTP id
 5b1f17b1804b1-49feddbbe6dmr72387875e9.25.1790371559677; Fri, 25 Sep 2026
 14:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com> <e801211b4c71ddd919fa5d7b9c859b86addf3fb7.camel@sipsolutions.net>
In-Reply-To: <e801211b4c71ddd919fa5d7b9c859b86addf3fb7.camel@sipsolutions.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Sep 2026 14:25:47 -0700
X-Gm-Features: AclHuK-P_xUsgO3opj_R1RrEcEd0-ijVSs2NhvjFANGxEbSXnfoNvN06zC1Vukc
Message-ID: <CAKwvOdkMK9Tj=JgsPeQj6_Xtx3FgZK2SWTSJVU_BJ7G17pDC2w@mail.gmail.com>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
To: Johannes Berg <johannes@sipsolutions.net>, Oleg Nesterov <oleg@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Fri, 2026-08-21 at 15:45 -0700, Nick Desaulniers wrote:
> >
> >  arch/x86/um/asm/ptrace.h               | 4 +---
> >  arch/x86/um/ptrace_32.c                | 1 +
>
> This seems like a simple adjustment for what you need to do in x86, so
> that's OK, but I don't think we'll take this through the UML tree.

Appreciated! I agree, maybe with Oleg's review this can go via the x86 tree=
?

>
> But for UML you can have my
>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
>
> johannes



--=20
Thanks,
~Nick Desaulniers
