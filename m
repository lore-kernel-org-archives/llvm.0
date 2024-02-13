Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B9F60DC2
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707854993; cv=none; b=LlKVVxZUX8EDHOyWFZBWCiDJOdICZf/44njO4AoFWx3fE6PBpWBqeHRG0iN0jl4mb6Tne8nz8ODZcn5WvaJIOzF/wwvjoSCJ8uhmq0lQnUFwQs8bLC5UDnDE2Gs4L6ykCBq/Sr51XbcnOrNF6upcytyOg+wEz6A/NLNSePRTXdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707854993; c=relaxed/simple;
	bh=mrszqc2bupU+EBqHPBjyleYP7nZ04WmF+Acwr+mRjOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZfMi6kSibakSwEaswmgbNKAnQuAhYT9LqlMimq2O8kVVr84iixtV7GKa2iuoMBKCNROHbFOxmFTG5FH4bHuy2RM24tLL6lNPlkVYcnnhj0tIZSbiVaFXiT/wkC2P8SUIDT9dNnetQBk44dSwF7D8V10AZ9Ta85P39jOMas5dehQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rzgcd/k3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rzgcd/k3"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a38271c0bd5so602517066b.0
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 12:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707854990; x=1708459790; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mrszqc2bupU+EBqHPBjyleYP7nZ04WmF+Acwr+mRjOg=;
        b=Rzgcd/k3QZxyD13B48ngN82HoPxovv2FTEkTIX7LRAAMcYXja41MLfqh5CW/IuaH9C
         XNGFvyCGv0+zvIs0ZYqc3oqr3wd22s+fc90GxLLEd7GUKPWhI58mBSfpxbWA6741TEee
         pS2AABE3BNmflXZWyGeSN11YArEja1k+WG8II6PYivGbECYXKPRvbwM1McvBq5Kh+/XD
         BQKSULgVwjUanYrjv5DfM1M3JSj/ghsDYeXysUA87CgWzJkpiRNYrxr8AwwTvq2qGZAW
         h9M0xHP8E5+C+GKR107zKWXBc2LZsK5Yfo8QbME48A7uzJy8xgn0YCLad7ea/8oxwnU6
         RcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707854990; x=1708459790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrszqc2bupU+EBqHPBjyleYP7nZ04WmF+Acwr+mRjOg=;
        b=mZkF/44dy/QtW4pFYkC3edx0t11GwIHGSNYJI7cFNxabbHk4xpq8XyQDS3hvI3X39N
         lDAHKZ9qtrRFkWxSuW1tr+JuZjHNIwz0AsZjWSSkYWHCDDBfO25L4H+iBX/TO74vhIxE
         szj4qMoOCJ21GnWt85IajfZo2OrQLBwpJ0Dwa9IE9gU0+7kYcn9D8IBY3+nNv9v8tYOM
         Tgmku1ubKttxKksKB38CqYXr7dlGVl9Tq8LwVouXiR1WDJa7EKGUu/Y3HI4NA7BTST0P
         aWFVxB3j7dWS7YoryqlaptzOuS/XkKKJdrYES8GtH8hQPcX6YmVt970kqkS7ol3XE9aQ
         Psdg==
X-Forwarded-Encrypted: i=1; AJvYcCVxr4I6tVyGiKZ4hG5hjsdJuKDAI2sTuv4MDyviu4CYVgAkoD09rbrcQ9Of7SxTH1eat7jY3sU49XZcVIgns0xiadJBuw==
X-Gm-Message-State: AOJu0YyWu8Q4hdf9HcJI0MLuFY3a2UrjeQht54+MiHi259h6JK5zH+oC
	7HYdcE7g/DcS2qmzjFrQXe98sEqbGH6pZ9jEHxCLqJA0TqZ2g/+Y54U0AF/eiomf5k1QG8G4zin
	kaoJoiryEpe8zhO48UUYeLJYg6Ikg3BTeD7vy
X-Google-Smtp-Source: AGHT+IE3mwMUqJ6DN5geO/x5V71y1Lpt/nQ2yo0uSXGvjLFjxROjLwld/5P5gl5jWXzv7R3BaPdR8dxplGGxRT2ITjo=
X-Received: by 2002:a17:906:b34c:b0:a3d:3781:6eeb with SMTP id
 cd12-20020a170906b34c00b00a3d37816eebmr70496ejb.34.1707854989739; Tue, 13 Feb
 2024 12:09:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZORDaHHH3jTL3GO7OsDubhhyQE0Uy2uAjJpiRzrKBgqaOw@mail.gmail.com>
 <CANiq72=VBFvB9O9c84YxpBBftpfNnnXx-+Xes0h8h6rN3EN5pA@mail.gmail.com>
 <20240212-demotion-blitz-1c9ab85dbc73@spud> <20240212-outdoors-french-a40d57e38c71@spud>
In-Reply-To: <20240212-outdoors-french-a40d57e38c71@spud>
From: Ramon de C Valle <rcvalle@google.com>
Date: Tue, 13 Feb 2024 12:09:38 -0800
Message-ID: <CAOcBZOTLBaik5kwHhvCoJ4Q4PQMDjBk3TJsaa5u-vxR72A8jFA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

> I realise I was not clear either. What I meant was that this talks about
> rustc and not kbuild, so what is meant by "the new target" is not clear.
> Do arm64 and x86_64 have functional support, so adding RISC-V in rustc
> is needed, or did you mean for the new target in the kernel?

Sorry, I was referring to the targets at:
https://github.com/rust-lang/rust/tree/master/compiler/rustc_target/src/spec/targets
