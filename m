Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4970C33B6D0
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205456; cv=pass; b=SdggFVtLoXUQYpAB6uhRUbky7DqxNvWzrgOckgLhhFA35HjeGYYjghGBe+PmN+Bg4RGXnitIUgJOl25x4jBVdskeqABHK47fEIzth9VE9va+uKdgYBfifCnAYoBxXEeByBZhWG8w+JbF9zoW9bfLt6/Cit9JHnfVZsGh9U8LjZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205456; c=relaxed/simple;
	bh=CmrKFPLr0eGJTu81QMhZhSc1WzVS+zxr+Q65JHsu/e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hxHVoMJvw6sc1jleJEqIwBn/o0ixeR5k4S5QmEMhHqmu4UX0lyuEkJ7LJqXd5ZeC9qLEPzdoa6cefpHkgYsn3zmYsqNrModE7Yz48EPaK3Lm/O8KbWw24BYAttEmnWr/MqqiFiLC5i1VJJI/eZO0iMB1bsaXtpt5d17u6CH+NQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u76dRrCI; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u76dRrCI"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so214a12.0
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 08:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779205452; cv=none;
        d=google.com; s=arc-20240605;
        b=EkA1uRL3Lve/zEUnctgeNus1xbsefvp6me4Nmp2u/jt8IUd7KpmFvdPUKAKEkuNcej
         e8H57wpXNs6UY/4ZOfFgBrHYJ/1n5aEW+S9GQVdB5lmjd8eNZOiLD+jajnv4i8Q9920m
         QMqCyO6e95EHVFu1P6Osgg+uYG9673HtEswvP6By0bf1tMcJVaOApr90vOYVUm4NA1nl
         BuwZ5IGrAJu04Dy4sxtwfqfjFNyZSI/rBFb3mbphKS7c3MtZzc+H7UdQHFF770HyKi+8
         HfZBB9v5pUCjiuvOeN4Qi8dJHyjg1bqH/bmqe4pu8fIbhiVRn05elbz+srZU/o4pO6Wf
         Pv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CmrKFPLr0eGJTu81QMhZhSc1WzVS+zxr+Q65JHsu/e0=;
        fh=BvjBw5MejsubP1kRkoFj4AWiuqWX5gW4KtspyiSmoOk=;
        b=fuRLdT/iOYDUfTFkno2eBsLjGJNmeZsRXPMORjEEIccfnPJGUoOvAQn7T0P/EN8Fwx
         z7uOLbWVnSzwLwv6UEuymxEt0drYur/R6PPoSlyfD08MUEmki8+XiAb+G2zpD0QhlNHp
         jfnoDFRukmh76CT3mcl7jYPQEi0kUAyTDv9UFp9emIBDm3Epitx/5iY8MQhBaWyu7ArM
         KdauScLKwcWIHTOQOPjl8kh1EzOs3aKzm/9uYrJB9tjg4ASz3QyESIxcgOvmvrxQtGb4
         d5U7cV0jRTN7MnW4uXstvjHRFjA2DnCcbKcKUUJ8xRO32ouSlw0Y7ukqQ4gaho5KO8oF
         ojEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779205452; x=1779810252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmrKFPLr0eGJTu81QMhZhSc1WzVS+zxr+Q65JHsu/e0=;
        b=u76dRrCIRyPVjbNrhoj7+llH8nEaC2W4z3YxHhkzSH5eYGe9dysL238iryeaXAuarJ
         rsOggFXT1Gg4DXpXF1TrxXJrTaj3r81eAkl3I1n6jv2HL+Yz7Ac3tHO6ehIbVZHL2uP2
         9rKZtvtqaIhIbg5HzGeL7AY6ZlGSrk11j8BAscDkLhkkCBoYJptzOyOVTr9569K+OSVN
         AvIFaIia7XiqjSkkFkQ4L5rZUldy4xaS2Hy1hv7rymY6UmpAMlu8wEX3h0Ev0ZcEOt5v
         bk6agca1vsSDx1afrTjXi9FBkNkICNPOL4dztdnL7FNqUVJxmw2PTaCfLi2hZ3t0Bf1o
         7n7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205452; x=1779810252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CmrKFPLr0eGJTu81QMhZhSc1WzVS+zxr+Q65JHsu/e0=;
        b=fwIR1+jMgfyMgnXnCcMzoYy9cf1mxKGqDRfav6/WIga19MlxTvWHe4SbexmtcsgCYc
         vrEHbVzchwh0avVaXnMiilPJiUcKSsGDEFhNT3QzDqbjKtYc8JeS6NFJbflEWiI2j5QQ
         yszs/e7IMPDktvWwSVnMRgcNVkqQS27ae2O2XvXNKhwKXCoOhcB8GRccLRuEi1NGK8VT
         /7diIBR1ZDw8+ibN6+lSJ5ucDLFCFphcOXLkJ5sJKzlZLOPVBKspMwCiZqCl/hqwglVd
         H2j+jl8JKl1SWEniPv3Go/O6LuwOwVCy2q9sXUjlOYPnW/0g4EWZQFBm2Vso5bT7Siju
         CUqg==
X-Forwarded-Encrypted: i=1; AFNElJ9DuN9wcBVgNef31kA9Zzg6xP7Ekr6/rT0IdQ6jjlXVxhmiNsPOHTaK3xlWCP2VERgpB5Wl@lists.linux.dev
X-Gm-Message-State: AOJu0YxViww5OWJn9ynlDNi8sRdbcKfCPvtp4waQ93YaWa80i5FmgVw1
	iID7m35khexBS8Fwmw4GbzVMy0rswQV+Opf3rlA/aWpXn+1g7yHojJfQyauEKXKWn4wCRgL6h4H
	FXsvRbcdfYaItOWpwM7MVuS8cIBoJ043/cS/VWBr5
X-Gm-Gg: Acq92OGrii0lA0PNAbPGk0BP63eDu9UUvu30d12GReuyAoV++53PwqqLgbMOh+5JF8t
	NDgo3txr5wLvMbYNYPoXofrbNpLQAbH0/Kx0Yzmak6ypR9SL+b7m21LbQ2A/QWPGYEcZ+fmfd3x
	dEO4jDybOSNOJBRgf2dtwXq6sbUZxthZBl6JfFZFoijOG9oCqA4rV1CPhq2aDbTrGmM2Mp31m/m
	DnXhN4yzK7I8pqSMkOx6II1G5H2eiAu4rdp4mspdlG0q0Eg62koxe6cd+NEoQ+XrTPvm4PViNbO
	Khn12Ud2RNwJwdM=
X-Received: by 2002:a05:6402:a61c:b0:67c:f3b6:5fef with SMTP id
 4fb4d7f45d1cf-6848a743865mr146633a12.6.1779205452000; Tue, 19 May 2026
 08:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-5-b3b8cda46bdd@kernel.org>
 <6e555229-ae10-4304-ac1c-3cb02278f77f@app.fastmail.com> <20260518213657.GC3979157@ax162>
In-Reply-To: <20260518213657.GC3979157@ax162>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 19 May 2026 08:43:35 -0700
X-Gm-Features: AVHnY4KFxq9Y9fyt4Zirp8pvmZcwOWCsd7vtNHL-BTOTWFFqbw875HXs0rig4XU
Message-ID: <CABCJKufEZt=PiP2StbFMatB_G8XM4=q_rF5e-ewsqDjizd2TSw@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] arch/Kconfig: Remove tautological conditions
 from HAS_LTO_CLANG
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:39=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Mon, May 18, 2026 at 09:56:20AM +0200, Arnd Bergmann wrote:
> > Semi-related to this: we discussed a few years ago that we may one
> > day no longer need both full-lto and thin-lto.
> >
> > Is there still a need to keep supporting full-lto with clang-17+,
> > or can we expect everyone to use the thin version thee days?
>
> I believe there are still folks using full LTO, as I think that there is
> still some performance to be gained from using full LTO over thin LTO,
> but I am not sure.

Yes, AFAIK the performance with full LTO is still noticeably better
than with ThinLTO.

Sami
