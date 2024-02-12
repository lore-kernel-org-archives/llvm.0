Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB871DFF4
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707770216; cv=none; b=narBefeK9DZyn91VAM3IGdL+O/SxlIH2yEncHOI0ALNCugHTfSu2ymy0ltUd+h/WmKS2E/741AWrz/zt18582KKOOejKkoSP6QeiHAI2w9+dQZ0kBxylCEj8dnteKuhEsELmZD6oUvrzfXv/SgIpO6ptlI7P5IoGGsMYmw5biEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707770216; c=relaxed/simple;
	bh=/Qq/MTNXhRSFGfhT1MpQL4wU8zE0C84XuaSbfhwx1Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdSQ84DftKvLcdeumj5d3Vj29pDzijTpNNflRD/cGUDmsvGd+istDMOiIKO2NNwTTtQPxd9VNHefeHZ90EeYVQtEzebP46orbMhm+YumjVOxoe+X5As6EF7VLk1dQwfLLspAP1L8rYSdXjR/y4nGdVj9fR4x6DW111owJ4GVa9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TXfaPhOK; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TXfaPhOK"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-46d2635b15eso2789994137.1
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 12:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707770214; x=1708375014; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qq/MTNXhRSFGfhT1MpQL4wU8zE0C84XuaSbfhwx1Oc=;
        b=TXfaPhOKr29/v6EbdqbYtqymu8ondFo9xfuJ2/unk1v1Z3zXJHdSMISoEYiTDnwss4
         XWC/3IWeyFi12WNLgbintgLulMlKEd1XnzF94zSGqpIjaM3s8uDbjsvfYWqh4sI7dtlv
         liJ7lyvZnxpCNdpi5V3sGCKZcp1Szhf877Hk9a4Jbsa4epF2HvEippWczWhc/7d9R/r3
         r50BbUIguSt/1Z/cRjiv4X1K0uUk6Q3xgEEsPPd8baRLpEnft6FWiGB4WZ9btzKKIn/X
         KfooDFSBVyV5uPP3kYgEBhVniHAg9z2KQ0RF2GvErLh9U/JzPpSgMWxX11Y752/J4qZ6
         59CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707770214; x=1708375014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Qq/MTNXhRSFGfhT1MpQL4wU8zE0C84XuaSbfhwx1Oc=;
        b=UHgrZJ0KhjWvhZiNMBuSIHcYrlt6t3RPm8AzOjLsf7g1E1cdjbeoks03dlMx1Mb0fU
         9Y9IzbYquHOmUu9Q5Qawwtk8vZ4c3Stq28X2boJXD3B/oJj292ZALfvLg8tboqJn/5Y4
         ccZCojuppqXun0Gfyldhz4rOSaxf9aOFyWojc9F1SZkpweLqo6UGqVXpTuBXyTN/yK7a
         C5/Wh2y1FyDidIxRrmvSiytWfA6eE/R/M12nOBxPxEdl20N/urbXJ2Hfd5zRLMCMsVX4
         oBStJLaImZhTBOpT8Ef+i72my3gyJXYc3wCrSiXEEYnF9E4S6Yvy2jCSXf2gohRv6b6O
         9u+g==
X-Forwarded-Encrypted: i=1; AJvYcCUMxjSENrd1DP078R5PBZGLcWVsqKZn1pwioP816Z1ZhO7ouifnXpkiogaBZ9791y43UUqIPGAKVNUI23be7SaFVWmZ/g==
X-Gm-Message-State: AOJu0YyVwrwQ08aCrEzmqrdt0Wl9wXhsRmS5I4HDchVVf23N3U4Db9Uz
	tKHlH8yVLBjlAdBQPHYWJtUBU9ZSUmxRo3qfQB7aqwX03Vhw1rkH0kytEODAuapOUDC+oJN0r7q
	CCMXDSKsL2auLzT9A/wZSIyAKTm9mjxLlYL8R
X-Google-Smtp-Source: AGHT+IFWndKWzDTOT0x0/4s8Etpblas7Df8C2xR5KB9thOTs6aRnFjIThpiH1ujxZsNIy/J6F6pXaMbg0Ae3jkIJHZ8=
X-Received: by 2002:a67:e947:0:b0:46e:cadc:f340 with SMTP id
 p7-20020a67e947000000b0046ecadcf340mr645454vso.7.1707770213832; Mon, 12 Feb
 2024 12:36:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
In-Reply-To: <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 12 Feb 2024 12:36:15 -0800
Message-ID: <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Ramon de C Valle <rcvalle@google.com>
Cc: Trevor Gross <tmgross@umich.edu>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 11:04=E2=80=AFAM Ramon de C Valle <rcvalle@google.c=
om> wrote:
>
> Sorry for the late reply. Sami might be the best person to answer
> this, but KCFI (not CFI) tests are lowered by passes that are
> architecture specific (see https://reviews.llvm.org/D119296), so we'd
> need to add support for RISC-V. There is no additional work required
> in the Rust compiler besides enabling it for the new target.

LLVM 17 added KCFI support for RISC-V. Sounds like it's just a
question of whether rustc uses a new enough version of LLVM then?

Sami
