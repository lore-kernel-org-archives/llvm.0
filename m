Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86E51E133D
	for <llvm@lists.linux.dev>; Wed,  9 Oct 2024 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728492267; cv=none; b=hELV98S38b3cPFxv57SPitHeQBgRjR8NWFb7yADxCu+PPRDXFlD+n1vf4x34OXrzWgH+iQSvsQO3X36yJThU0zh7HNN2izPLVyfeP7F72712SY2ltzT/+6mYtYJP2DDhJNLVmALt7amzYGJEy9PLh2rJ7LJ1mk6ogEukqZ/oHPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728492267; c=relaxed/simple;
	bh=f0RFDXhULnyY2BY/Mw9GxD0uAf1hjmfoqcOSDpu3B3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jiS+Rdy9fmMJtBCHRWljDm5uuafXVgGJDDzyP4s31bUHhProtvsyYBZW9p6mw0ubxghu1EGchYo22JweKqHlic3hv2YE5MGOvJ/Z/xj+LtXSFiYOVCfbHjYQFb9tOU5vGkvXf5BOvIM80cNYFFV9dHhyO1HrFL79UfstS2ER+uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K9dtUMj2; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K9dtUMj2"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4603d3e0547so5801cf.0
        for <llvm@lists.linux.dev>; Wed, 09 Oct 2024 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728492263; x=1729097063; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0RFDXhULnyY2BY/Mw9GxD0uAf1hjmfoqcOSDpu3B3I=;
        b=K9dtUMj2VLzaziTDi7RUmQXt/fuGurKyRPM6Eh5bvPV5LelTSjrQKHoEFIBm9r+PPj
         /BFwfgIFkExqYrf86tZEZ2eBXG6IM20cYESEpXrtA7PG1sXsIfeSPithf9EqG7TQ5K/F
         Ema0R2hNzttqbSdPlSVNn27KqFgdGznJAy8ucRl8PswJmFQSjNDdKqZm7h19u7DCF0+h
         SCs04vfnO8IpgAttfVZvWso/2XTLxqEPkSG+3h+XZZvhZa7yN+5WiwADDNgbWV0qb5Hr
         FTQTLK05DN3X0vpYOCMQb0dNnEhqZkj8xAY5ZDfUQIr+MNxIYTGSFK6iMEHrETMVOk5h
         Ml0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492263; x=1729097063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0RFDXhULnyY2BY/Mw9GxD0uAf1hjmfoqcOSDpu3B3I=;
        b=lmO2dQ3PAR1omGWK6zj64CPrskWnbrQ1VP76ZERzmPcyfKqLRaQROuGwxi6RDBzovd
         lLOTXbEFep92cr2R5VDS2fywauy7nPf5pxedJhSsJy6S0hordEQSxdWSmF6rj2zlzlt6
         9gMUajmKXXmiIP7VQcxxJTcvm2JhM1jdtgCbAGGe0oXejNNu9TFvoto8IqD+Nz3sZ/dF
         f/wPLMFvJnwq+OWMxZ307aJOVu0v8ztWxHh0kRHQznce5M4SaVDvAwCsg1vIhNqDZY+K
         H/2Jh8YYELzE+74jAOUROhQkdphKUNVu9E3T+eA2SkbNbvXOY7NP5aFlTFdGkuMABZPg
         8s2A==
X-Forwarded-Encrypted: i=1; AJvYcCVLMxnNqiIDMl24ktSXzYrePRYE9U1b0GfhtDT3UtyIhYWPFQBxRzbsFpfN9MFl6WjC6Zwf@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8mkOEpzvcmEhQ6D2QsjivLF+vzEQI19s7pKD8axdzbRZdfTJc
	ex+xHFIQ6DfqYVU8zZvXkI13+ga+byZkZ2n1a/JuWanS/Fj0trfg5Lerjj8F1jUBw7EW7XX6VHg
	oDP45x5nSSk23QyGctktYMJnFUw7ejvPbwbgD
X-Google-Smtp-Source: AGHT+IGXi7403SDIdlxuIn/gfNtdZd69ttkza9TvN53TAGxffeRgQIzror4uI050ZcHFWqWlwYkRoIIev0/cUOq0cdo=
X-Received: by 2002:ac8:6312:0:b0:45f:6a4:4262 with SMTP id
 d75a77b69052e-45f0a153812mr4783561cf.22.1728492263209; Wed, 09 Oct 2024
 09:44:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008-cfi-fix-llvm-gate-v1-1-32d47459eee4@google.com> <CAGSQo03ZOppScZT_1DuWYsnveKvYHdc-K_djHi=AB4CKjAbgyQ@mail.gmail.com>
In-Reply-To: <CAGSQo03ZOppScZT_1DuWYsnveKvYHdc-K_djHi=AB4CKjAbgyQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 9 Oct 2024 09:43:45 -0700
Message-ID: <CABCJKuddiLtjG1TJ_CN+F8Z_7+oOOfZNAFd0=qy_HW4wMMJ3fA@mail.gmail.com>
Subject: Re: [PATCH] cfi: fix conditions in HAVE_CFI_ICALL_NORMALIZE_INTEGERS
To: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alice,

On Tue, Oct 8, 2024 at 10:46=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> This makes sense, as some folks have a Rust compiler they know has the
> fix, but build system detection for it isn't there yet. This lets them
> override availability if needed.
>
> That said, we should definitely be sure to get this back to a
> non-configurable toggle once the LLVM version detection is in.
>
> Reviewed-By: Matthew Maurer <mmaurer@google.com>
>
> On Tue, Oct 8, 2024 at 10:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > The CFI_ICALL_NORMALIZE_INTEGERS option is incompatible with KASAN
> > because LLVM will emit some constructors when using KASAN that are
> > assigned incorrect CFI tags. These constructors are emitted due to use
> > of -fsanitize=3Dkernel-address or -fsanitize=3Dkernel-hwaddress that ar=
e
> > respectively passed when KASAN_GENERIC or KASAN_SW_TAGS are enabled.
> > However, the KASAN_HW_TAGS option relies on hardware support for MTE
> > instead and does not pass either flag. (Note also that KASAN_HW_TAGS
> > does not `select CONSTRUCTORS`.)
> >
> > Additionally, the option is configured to have a prompt and gated behin=
d
> > EXPERT. The previous method for a user override of the option did not
> > actually work. This is expected to be temporary, as I intend to add a
> > precise detection check for 6.13 - I did not included that here to avoi=
d
> > adding a RUSTC_LLVM_VERSION config in a fix.

This sounds reasonable to me.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
