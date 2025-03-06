Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FBA26FDBA
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741291491; cv=none; b=J889fNAfgrrv/FnMygyVl7y6NS204tZ7QbQkva6wZY1h7UzGluMVOqoTl9t5qyk7Nc4qQ5eBY6oUkTowfLSV77bV7H9tB2JtEoOXglkg8WbzT0R2dVBkeaQ92Fu4QRG39SVrCcB4ASoXFsgTLBvgupkPpeT7atIgkZMPpgDIJ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741291491; c=relaxed/simple;
	bh=TBHXsGfzaVM/pvIHyZWKzbsZkI7hzWhKdonZYskDupA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOrXMr/q6Eij46OhCPJhshySLnpoCowtLPnqBBLT/V56RZBkU5ozYE2+bkgmcU6npu8XEMYc9kF2O55GXmMaM80VmQvb44Xut/wXElcttpi0q8e1Oq5C25wTjO2NOzABDLsmYpv9ZM06JHyX89Xt7rDtjqidY5ISCfLEBVkg4ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+xp/yrj; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+xp/yrj"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fd02536660so275110a91.2
        for <llvm@lists.linux.dev>; Thu, 06 Mar 2025 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741291489; x=1741896289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bu3YQqwp0FwvvZaitDollb8qneh4u4bIaip66gfC4Q=;
        b=O+xp/yrjdcLIkmUSmB1R7KbVDG6Jejz1GlD76lA8/XekYCuesppV79NTca9XaVSD9C
         l/CQj4sNam08+DOoeG8+pYtm9GyB7B8ltN1OZWFtd2m1Dt0cJcRXKX6BazVrS/LvWomA
         ZnSFclGsihFxoJaGEQaF+gFRJYNdbqm4dV2TukG4o6sqwixx3cGvGLcGus3i/Lz9uZ7H
         GfJsnjoCOitb2hQAqoomXoLTu0Bs3Hw40mYax0Brpz/zuyxkXGxvuW8EHcl0Ou270CCF
         8punGPj6hJr2QBWITI4bOVTS7lwlyDeXqs0Gl6618BFAL3A+KFwGzYNB6Av7bZy89lEI
         xbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741291489; x=1741896289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bu3YQqwp0FwvvZaitDollb8qneh4u4bIaip66gfC4Q=;
        b=tsy0SuIL/ARyESq2wX+jHjP6Ys9pFLY5cibwC3hwmD0/EN/7OVKkKdeAnNKofrHtDx
         1OT+4b5igGdAHVQncK/c+v/4vrOwgItjBTNK2YtbjpMcPiekw9zXkgkLikG3++1t5rur
         vCFO1dZEjyUrxUVTBlJIlm/sIMVTpG/2IaDC69sT+UjzTt5esMsAi+Sj4bjSjRH+P/Mn
         yK9+V+K+b5YrCWOtYGNqUkz4LmupswoUSUILZH2w0lC8OvBS8Kto+nn28W/0ClG5blwP
         jkG2vGXWYvX8H/ykE7HqQvf1MdwKfVlj6Qp5PJ210cLBTM9TfghQYa5rw8d3EudLLemR
         HUWw==
X-Forwarded-Encrypted: i=1; AJvYcCW8j2LTlr0C29yHhDb2KddUv7rnZZcSLH2T6026PODfakzFTXGSP6AdQj18XYhvdb5m8Z9t@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp4lEfmpN82gJ0LOwTo18RZGV43skQM42OHR5jXk1RcEwc2iUw
	lpeoyeqiiVbRM7aS2QLcWvVEsjdpyrOGYAaFdnwg412pC4GiVrBYNiDqimHjf14StT5zwwhZxPB
	MnU0yIfEQz/sgONoPklxJqwfRxe8=
X-Gm-Gg: ASbGncujjnwqb71fiWCCd1/ixsgbC7/yP5QRec0V2AcIEqcpWlwnEad8aBgzgEJQ37T
	acOmkcj9wj+y9HCn9BJZ0hSsj8X/dZG1ZlTKlc34atYmQR+qCU2rxeY1ZPqsqbYGaJ/8mMQ0ViK
	Vs7FYdqYfQYJ4NDAhs6t1Ai+gUuw==
X-Google-Smtp-Source: AGHT+IF1s6DFQLB45J15QVgIV2umabKjxodQ83+gtwaFwUEts1s5rDMMODNhuFPnA853pOKsIUUwxNn+JOnYHxIttPg=
X-Received: by 2002:a17:90b:3146:b0:2ff:7c5a:216d with SMTP id
 98e67ed59e1d1-2ff7cf40ed1mr340370a91.5.1741291489260; Thu, 06 Mar 2025
 12:04:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250105194054.545201-1-gary@garyguo.net>
In-Reply-To: <20250105194054.545201-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Mar 2025 21:04:36 +0100
X-Gm-Features: AQ5f1JpjN9U3NNao473LvxymqMlTE8uIwdiBGWD33pmLNW4_gGkjQ1jRfhGXN4I
Message-ID: <CANiq72kr1WWFwyJqxtc8kmpj3=BbEQV+Haj0CoLdDKW8j=Ty4w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 9:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
>   rust: alloc: make `ReallocFunc::call` inline

Applied (only the last one) to `rust-next` -- thanks everyone!

Cheers,
Miguel
