Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E70C2232D
	for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 14:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708699525; cv=none; b=cmp/T8vPe80StHlzQQyuIf7lNuEM9OB1JVSZLBoWH+GkilP2pTCEDGnU4qPMLZj8ZsoYU7WyorcvZBkED1+Yh/4q5ReQqRrvYdb7Tsdj7u1kwHuQ3PMU+mzocxSG+QDx69gkd68/cRCdwBReOo3F2gm7+AuFdum46oz+/lRYm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708699525; c=relaxed/simple;
	bh=FYS368qujw0WANetUJ0YWVVEYUneG/dCxdwk6stMB3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljzmNRBwhWR9NY8L3h3ZqJvH7hkp4Bg1ArpdOf7CNY4ojcEHaJRMgPXG2PZ8LaoqBkai/WqaPp8A3FZOXDO8Jz6vJBvEPC1fulFsGiIZlM8mi1A3zbHG4VeCtf3NV/vzoRbpmDIDQbwOuX8X6XlKhUXDwpB1ZH9E50hl3ex0xTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boAq6vMY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boAq6vMY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dc49b00bdbso7444245ad.3
        for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 06:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708699524; x=1709304324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYS368qujw0WANetUJ0YWVVEYUneG/dCxdwk6stMB3o=;
        b=boAq6vMYSU6fCOSepRkrJIanOxjO4WLrhQnQxPth9c7boO+HNF5LiwF44xLZJYQW+g
         UrLLWpBBupozXj1TskMkdjKiNIhylrGvJ3nTL9B/gqUOFeWTWL1+binXza6wS14Lp18B
         dbPg0LKiO1zA25/A8EAp0LXilZpmEs/Y9FPvKhMNQva4Y5G074Dgtog+olnKziqKUNrF
         wLlrd43+l4ua979x+OdtUlFpx7cnJBS3kAxXfoGOhdORr+tLiwzunEIqnPJpeE92/tRW
         w7SrGxpg9k8Y+Gd/NOQqWP4nIa7BqWNRUnSf6d66wGU5Tlafl0CPAsMQULiUwQZd03m8
         c+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708699524; x=1709304324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYS368qujw0WANetUJ0YWVVEYUneG/dCxdwk6stMB3o=;
        b=PzUMWl8tBRKdjMJ2f6YQZTYMiFTwsuKFWuYmAwFGVOOISzF/c70NRO+qXKw0Msubah
         9+JaglJEt67V9SJLVWIyPJ4ta+JKbNRyKQLe7FaWEHW2ETJln1cHJ5meuy0flCTN7SZH
         iiFgi0Il0yxS4qjzA+IXKVTOih51+gdgVLijoWE1fuxm+i3wfCfpBkDTkbXg0BLaGjZO
         wE2loO2iiRfPAKEK9rD5SVEIof4ffXKqFMB3uNtoNZiXh6UkvQggl4CvJ3lSKfwwNiyb
         800IAUk6IRv0NX8AqzGNglnn6XoXDyZOXrrquvvD9hN1fzNfMbIqP8kdgjbLgKhTzsvT
         xeEw==
X-Forwarded-Encrypted: i=1; AJvYcCUPUMsV7/a6t6/Dmms8GJZgz/mZm8WZkmmN92ENMn+VonVFNvWCWPEvBtiJiHL9XqNHX43giSUOlHD+BN14i90u1fwnmA==
X-Gm-Message-State: AOJu0YxPiqTlDqgP4WP+n5DrLlJIv+g+gSWlT5Yg4dtLIXtJMtOyyGoP
	lj7pv5lJyuVyDgOSiBSxbcpUDDDnEtZebBDj8YvkLofYrFE4/PrA/f+l4zbc8auYsOnlfhj7j2t
	I99qZ8BrUWXAhKHBNKXcLaBjb4/A=
X-Google-Smtp-Source: AGHT+IGQh4Gasx98EwmKbpWjx7oNjPOHi30hzceQIltFlR3Zv8xEu09Tzkr96XjYz57W4Vc5AnxGSufwQh5QIluHSa4=
X-Received: by 2002:a17:902:f811:b0:1d9:7095:7e3c with SMTP id
 ix17-20020a170902f81100b001d970957e3cmr1600961plb.57.1708699522325; Fri, 23
 Feb 2024 06:45:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-perjury-preshow-fc2cf73d552e@spud>
In-Reply-To: <20240223-perjury-preshow-fc2cf73d552e@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Feb 2024 15:45:10 +0100
Message-ID: <CANiq72=mCnm0mKOw5K44PmZ+jF=67jxEEkcXP-E0O8CaUrps=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: make mutually exclusive with CFI_CLANG
To: Conor Dooley <conor@kernel.org>, Matthew Maurer <mmaurer@google.com>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 2:38=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> configuring a kernel without symmetrical support for kfi.

Nit: typo.

> This probably needs to go to stable. The correct fixes tag for that I am
> not sure of however, but since CFI_CLANG predates RUST, I blamed the
> commit adding rust support.

Cc'ing Matthew et al. in case this is a problem for them, but I guess
we can relax it later as needed.

Cheers,
Miguel
