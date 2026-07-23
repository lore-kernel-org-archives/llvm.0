Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB793C108B
	for <llvm@lists.linux.dev>; Thu, 23 Jul 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834553; cv=pass; b=PlEGUZMLEljlN5KgyvnkvBJqkXhgF10wziarD5DmoNa3PU+NMxewu1feaH6RDG8DSfMADdVU1JKUDomuDFTVAVQqs0zQMKqGBDCOVfTw4HwmEqJj4ryz8CDaRbDvSgIJMHwwDwu4M9dcMJgoCLGqHVSs97SGxoaGHAO4vxqjqL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834553; c=relaxed/simple;
	bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWCKYIrAh0/8KIZs5ZNbXQPaczc2FRQcIDwQDOgTZx8uac20fX8oGEIo0Zj2LILvveeZKkKEpNaIX3dEP5GSuLfVlRs44sqeikJb3ca7u1n2H4EAErUBR4rljeWDgoK/yHS9uOhqSnLivc3KXPdsxsSOUEKFEQ8kodGZbPh1L7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ljOWnw7S; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ljOWnw7S"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c01c79467so52421cf.0
        for <llvm@lists.linux.dev>; Thu, 23 Jul 2026 12:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784834550; cv=none;
        d=google.com; s=arc-20260327;
        b=HIGLPw1G8tTpOZAmy2R7dBoExDxNdZrcgbKngug5qgVTQ7UaTDVFM480KIvtksUngs
         ECIqu3EGfOuS79l7rEBwpfYp4+SFZ8qp0v38vNPiZWqGCudYRjzzjgNr1QRyvMQyvI1y
         ynfzVsvqp8bHHaqRHy4nBXySTMjCcydwWzE/eVykmoSRuqWjziMkzhqSf4+c4zSacdyG
         p1Y5dTzbQ2wi6QqRi7IiJuA443aUQ205isbFJUVfsKXASw3/vT64EM04A2C+AKql0euH
         DEnvx99tI6YIIZ5I9ufDdr8GCxmSo/5f+/aHRpy3oF8sYzAK4HhsiHOJxEyQQ3AZLnqV
         vkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        fh=PiTK+jsdqCHyarDIKqi7TE9phXu31Tk5cp/S8Hc3MI4=;
        b=G0EYeg6KW7c3IM/bMghEK4xxSbyhdiKQ3vPJ/LiNGDkwdEIW8CMnBZrMhW4SscXgqe
         gnR6yehsQGOTcB/SYwD1HWSaqNdf46dg1ijbQdGl+gTcPo0TrZ12ytclxVMOYGF3GSGH
         lCSQswyAgmyGapHlSQEgGPQRC7/i5J1btO3r4ZEXQgDbsWyisHM3yXQR9pWRKHPZFQmy
         KEzqm/uZGKk5dXxnTqdxZPoZCLURvWnU5VtgH5ywAQ8wCb+Im6IL8rNMt+AmGAvgAwBZ
         S2Crwe+XWgO4A9mcFH8GcX1m/PyBbaLl5EUGPzXTGpiSmbMGllJlY8Q9jE3Wl5xUV9nd
         PKSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784834550; x=1785439350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        b=ljOWnw7SM0HyJsxzf9duhW3Ip7sOzv3smVZjvb1VDkBeKKlmg23MWzJKs7F9/BUUAm
         pr9c1tmENVGD/QKVMs5UL1zzsT0glF3Z6WaPBV5iMw3jR4edD0bmMpZYRIU2Pz5efG9x
         Giiwm2X0UD65VNL8R7kc0FLeWJVgTwOMoc9FhH5zMoZFB/uMjY3eXuV0/m78WmaARB0k
         L896J8XcDmXZdI8wVDmClatPRQso4uflS1Z76NfZAbYW3SCNjaxmu5DCG0AsIJ1kHnfI
         1bWKH9a7QHZwbFlXCqX1nfXv6G6TEjqfNusxjUoTuihJuG2DHQAzKoIUPJhiAAXOZwqc
         qQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834550; x=1785439350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        b=k1Fty31flNHv6p6GGb4nIgYHtCliXuusOAbCtE0bsdOedpdXTNJ0U+g8besGFqXJEh
         tRSSfR8T9OMi0iA+S10Z3992fgfmyJc5VE62TX0pdDSj+NzFlQyRTIyPBTyVIlmPvWzp
         8y5OeGRZwwhpaHS9b2o3KSBNPuGfizjoQ8wKljpgNpdWVj4DGXIdB6pTLL+CzIVMt8H6
         ZmNIky3UEibCIMW+6crKIIDudYPq09q/7OgxYeJY+Z5EVrO9I2zS0HydwlLU7stqBzRZ
         cSrnj+TzESeV6wrcrZYpBaKsTya5aNco5lpxxTvm2NwkqrojdXRnWtGV+cekhq7l5hwq
         y4Hw==
X-Forwarded-Encrypted: i=1; AHgh+Rpl1rT73Ho5mrP+fKLlxMZ1HiMq5RWB210A3e8d17thQeeKZisqRPcl2NMFZX4ROV8vzNGY@lists.linux.dev
X-Gm-Message-State: AOJu0YwfUxJgJl4Qptrdbeud1oj/rTh9bEIae2x+CYdxTHHlwP8Mcj2z
	Ph55nNkgHCwEmazbJqrQPrSmL1EqKO+aTPBcwe6rndAhM9i1gmRflfu+VjaFL0zR27k/B/BHXwG
	wF9EMimyXu8+1soxLUUwpxZVTOPug95wFfLq+68yd
X-Gm-Gg: AR+sD11qIjiQl6uDhTHQM9hpH12I5rBFDVA40eCmqBIcYlCIoSxkWkVqAG34PEx5tvG
	tA/mIkAuykK2yQgY80xGMInzW2jU8gWUTZkMXHVb7WFBA5R0PQ9t7qY/8fToEVU+URAi+DMhJfi
	5lRP+gi+iFJyENXE0BJ5QfiwDuUKL1o9GlsiVB0yLIDAZRxc3V9UBNPiMNPcnGLp5qzEvMm06M3
	Bu05cMpTYxJUPdZILTC03nnMSTx9ZgumC/WCjo5ZCanpI9aE2ddUWRIxh1oFJ7+iRfBkg==
X-Received: by 2002:a05:622a:5790:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-5284a9ed117mr1848021cf.8.1784834549852; Thu, 23 Jul 2026
 12:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com>
In-Reply-To: <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 23 Jul 2026 12:21:52 -0700
X-Gm-Features: AUfX_mwIn057sYLi7onMumtMkCOBiIb6bjljRVwkdb130ocIXYLLv9gbv_H9dWo
Message-ID: <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 6:30=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-22 8:03 PM, Sami Tolvanen wrote:
> > As long as the C prototype for the assembly function matches the
> > function pointer type, the hashes should also match. Can you dump the
> > hash prefix from the OCRAM and compare it to the disassembly of the
> > call site?
> Here is what I saw when checking the disassembly in vmlinux:
>
> 1. Call site expected hash in pm-imx6.c: 0xA488EBFC
> 2. SYM_TYPED_FUNC_START hash prefix in suspend-imx6.S: 0xd4d4d4d4

What's the value for the __kcfi_typeid_imx6_suspend symbol in
vmlinux.o? I would expect the hash value to look a bit more random.

> It looks like because suspend-imx6.S is an assembly file, Clang emits
> the default assembly type ID (0xd4d4d4d4) for it, which doesn't match
> the C call site expectation (0xA488EBFC).

Clang doesn't actually emit type hashes for assembly functions.
SYM_TYPED_FUNC_START just adds a reference to the
__kcfi_typeid_<functionname> symbol that contains a hash calculated
for the C prototype.

Sami
