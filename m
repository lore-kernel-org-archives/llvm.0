Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1CA19DF6A
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628118; cv=none; b=iK3ClVjExKpOMJ52mKCTVtC8TJLn+Cs3WWL5f5hkgiKoIR9qIkaK1f8vMGTjfoxR/qDDhd69CdVg5lxsEOuXqtAWFaIjVLPdMd64N4Wt9fSTJf9ooSpv1i4KsErNFuVk0ygPN5qJLh+RGBgn2hdZ27PWzJZBHvg3uZod6qC92C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628118; c=relaxed/simple;
	bh=F+7dGP8vTLAPwakA/+BaZnuqyVBJdaIXxDi9OXgh5C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYNLffqC7sbi2AvpWTNeZv3he4ojLZJqM9uqVbfID4twQ2Y9zp42Bnc+2LZd/OmsIP0cT4ILu2Y6jD1JTxUI7xQIB0Lj6z5pSvu//ZRe8UV4BgrryXEFQsRzUvT/fL7AIFJRjttkFccX3i0EhmG5Mr/cAhS7EOyEMpc88E8HQpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABlNKwfq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABlNKwfq"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1052526e87.3
        for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 09:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734628115; x=1735232915; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pOS/eMcaCDd8OiASZ9fXqKTBnFb+hPXU2FvmhB2krtI=;
        b=ABlNKwfqVunxobgSAKSShvLAqtLitBM4JCWJ+DncdcXGarYFUvfwMRaYNRqgFoQ88P
         e5ucSA/bIKm3mclrjC3NcMWCMgQz6gqHLq+w685YS24k+SC4p/M2LrvvK1TvD5BgdI2Y
         sO+VImz7FqNeAPBsRuWVqFFYb2CUevPfLEqnIavSFgUSkNnr+fZeHyTtobUx2oCXvLxh
         7gQxpGSnEC2Oqwl2oEZDHam31fDM1jz7kxfBFrPRvFOgCD+k8Z9bdMd3pEDjy+2Esl9t
         kzUinguOXzPzAF12YIDUqbDHYPOhsmrYSKH+Ga36Yv1cNKXs8NavxL8Z09yU1u+SNW71
         09zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734628115; x=1735232915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pOS/eMcaCDd8OiASZ9fXqKTBnFb+hPXU2FvmhB2krtI=;
        b=ToRZA02xszyaR/zKvxwDNmzC2ciiHhgOPXoTFm/+aYxJ8y9Tmg9cb1TUDTKZJSjARK
         w6hnIinB+sLuKWfg2TysPz5HTPn8heJrOrxTJLb39aEfBPZ14O0YtJF+jhtWRPYkEF3i
         9WycdTy6/AHgkjT7qSGvwbp0jdJHK/EtMqIF292RMgZYXvnFBvIR/ZyNQxELJj2nSQJA
         kHrJGCLTXeoCDhR6PZ/0BNk3LgWhjpRxFoOX/I+pSYv9+kqyLtZptBvmy0+sdIUEx3z5
         xgHIBC7gBqydh4NVIiGfYBqpR27L9713acqKj/DWZ8rs3Txf/JMPTFc1e9W+ao1CVLgC
         2nIA==
X-Forwarded-Encrypted: i=1; AJvYcCV130smGkkXcjfqyfQ863Yl8uXJsgrDZVLhrH2RRUjCTlWvE8+vVb3b4ivpnI+DUVVoTkGW@lists.linux.dev
X-Gm-Message-State: AOJu0YyWUZ/LB1kNA2G1qVYe9eDfLOM7yXmhQMfAxYDphZlS/bfEQUBd
	GX/SlLaTiLiJw+cZLCIhGoH68wmHrhCvdz1O3Hs2qSRlYGldLjSNgrZA3qL0vgoHi/Zwz+Y9MIc
	SuKq8xDTkiZOs5R1llP4p15/tDRQ=
X-Gm-Gg: ASbGncuNeLE8dmGMx/HhRJNIKRzwpwCtFTfikJzAmev7N1hsohlaZQZUsCzELI8TC0u
	YVv7CnOXFqRgqONMOdUJMtYoEEtMTbHgv+lfEuXd0GM5+9E5p9GjTrrOH+CNOFFGoCvD/
X-Google-Smtp-Source: AGHT+IH1fPAWE9ZihXoqOyUcZLJ5ZMr0yMGqbJib9Q3iCHXC0iX4S0AxY1HTtW0ibC2C7611VDCclmJQ6jkesDK9qzM=
X-Received: by 2002:a05:6512:1592:b0:53e:38fd:7518 with SMTP id
 2adb3069b0e04-54220fd169fmr1693168e87.3.1734628114469; Thu, 19 Dec 2024
 09:08:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com>
In-Reply-To: <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 19 Dec 2024 18:07:58 +0100
Message-ID: <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 5:44=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 19/12/2024 4:14 pm, Sedat Dilek wrote:
> > Hi,
> >
> > Linux v6.12.6 will include XEN CVE fixes from mainline.
> >
> > Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19.1.x
> > from kernel.org.
> >
> > What does it mean in ISSUE DESCRIPTION...
> >
> > Furthermore, the hypercall page has no provision for Control-flow
> > Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
> > malfunction in such configurations.
> >
> > ...when someone uses Clang-kCFI?
>
> The hypercall page has functions of the form:
>
>     MOV $x, %eax
>     VMCALL / VMMCALL / SYSCALL
>     RET
>
> There are no ENDBR instructions, and no prologue/epilogue for hash-based
> CFI schemes.
>
> This is because it's code provided by Xen, not code provided by Linux.
>
> The absence of ENDBR instructions will yield #CP when CET-IBT is active,
> and the absence of hash prologue/epilogue lets the function be used in a
> type-confused manor that CFI should have caught.
>
> ~Andrew

Thanks for the technical explanation, Andrew.

Hope that helps the folks of "CLANG CONTROL FLOW INTEGRITY SUPPORT".

I am not an active user of XEN in the Linux-kernel but I am willing to
test when Linux v6.12.6 is officially released and give feedback.

Best regards,
-Sedat-
