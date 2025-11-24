Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49730288525
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 02:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763952136; cv=none; b=ais2oNLBUlYMxKjq+GeOVaLjipDkNgp2/aQtgsc80LtryFG37zkJ+gfgWxu2fkzj6WC6modT6yh6ORdRrQrHHfn7phNN1Zuzm2KIR3LQye3yH485APcQC9uJxDteJDjmwhaemuK0DPBAemslmhMQBr4qkvnrHmmVF6G0vgF77Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763952136; c=relaxed/simple;
	bh=2oubYlvBWNBRgKO7pXURZQwzgGqjYFhnanOmPBQoWHk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JS3exqTp4FbcglXcRObjid0tqM9dErkdg+MMjtJG8RmDKtdt6b4GkcoMOAWqrgAK0bjVgkgmefNYWMOfysFy5+w8aACf/3+gkiAD2Bt/nlcBFu2o9om1pvO3B4yBLcQXAdmtEZFlqfv9sEVGf5hReNpoSO3bF+Innk4gBtVg0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPmDLQs/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPmDLQs/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso2758552b3a.0
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 18:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763952134; x=1764556934; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvmpkL2pKIFur0kWWa5PPAZWhiSzKqhwPQTIwYGauJ4=;
        b=TPmDLQs/XTxoxMD8fPzwtgY0+OmTgLxIvj2mYCS46CGF5f9JGzczwioC+Ozlgomnuv
         oCMEp+nvMZr0lbwi8JSdX53MwsoM34BlJj2sftbE+DxayEw8wsunEi/z6OpjVaRTK7K1
         d+xt6O82ccDIEsTGgGvl+0/gsD9/k3Rjt4zKwF3nhMGv5PkF4ejPtbiksnKB/RQ0OOcH
         oFTQbNJFQMEnHLO504NQf6+YIEuiF704IUUHx3lnIr54qGvmpJYi2nk8S3WgSQYTkavd
         0rYqmRcCxBAgqmJXnAooCRllqfbuDDxldEB92CTf/GqiMCHGVc4/eomIaKrYa338o8Gp
         Swig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763952134; x=1764556934;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvmpkL2pKIFur0kWWa5PPAZWhiSzKqhwPQTIwYGauJ4=;
        b=v2G1cK5CxmneQ4yAOfD34A8l0U230fXvXj8rsAx+Xyl4TuCD0d1HZUu562OeedL/jD
         ARwZHzMr7ZcF9Z8R41BfxdolsAc82n9ep3bybHiUYwALnd7+GYXRwQNxN2sqy/o0zowJ
         g689fCs0SSWQa6pwu3avtJgeb1JCAohobT3aPT18SaZbLCOszLCtPjNHwCz154BMQOMQ
         0GcEj5QsupSOHTZ1bsysC5O4scKXltXcMSSAbj50Lz4PoG6Qvg/+TkPHgcyOwFh57LTp
         k1rtFF2cqNGeYFNXeKFTatytIZ0fk+pfsb+SKTp9+MVJRuxB39tcJ5HnrORvtUJZ+3xp
         dU2w==
X-Forwarded-Encrypted: i=1; AJvYcCWx0HlhBDMC5g3R6OvDi/2vzP9RIboSF66fRUb3q9wLpeCuRVJeGRmdC+AjQjWJmexqEb/D@lists.linux.dev
X-Gm-Message-State: AOJu0YymO3dPM5MiEmX3lmEJ+G3hcmt46a0w+IVdnVL9lA7NtAz8HZp2
	OWb/BiACbpVA28Yq7THdPMI0U8s4JvJ3sM+EGS4f+dbVSRTLyU2LXwzz
X-Gm-Gg: ASbGncvlrr0ENkz5num6t4elymweIHeEYhxfsREoiDdubJLZDcOGU8ZNIMBukw7noJN
	9g6HjZr4eRd1Z/cn7b4VtsCL6J5GMgaQNlOvg76VIpDUUgV9aTukzzyU2HuVSRe8o+sD0Du7LM1
	l9kFwOoYwnIlIaSwujP1h1KnTx2b/28hxTbcAnz18LufaIxLCCall/h4PTHTB8qA+UpFu7vFBDs
	GhV6A8npWHukl/AhPYiJU1qEFCFmnziLLIvG5fNqcPaXg7onOj2nDCjt3J06WqiBx+Ofzfq4C1f
	4z/6M8tfPhGx6SnXzPzNfmzZxQplQLmr89/G/ofDFe2eKErdicYXm+mhCRc9mxQcdVMErh9kXsk
	wVP+YwBO7sPSfy60wbY4+PYYfnyH8BTlWHiUD4dF3Wp6tftHLJv4zbzmyBfN80ZiUvPEba7YXsX
	/WtnIns8F/jzP+k2w88hE4XA==
X-Google-Smtp-Source: AGHT+IG1OvJ94QxB/0B5dUPh/eDPLHHoAzRcr/MIUUe+KPUWPK22zAbeB/idFdwPhcR+hgsYZWBgug==
X-Received: by 2002:a05:7022:f50e:b0:11b:38c:5370 with SMTP id a92af1059eb24-11c9d712e3dmr5385199c88.20.1763952133924;
        Sun, 23 Nov 2025 18:42:13 -0800 (PST)
Received: from [192.168.1.209] ([65.87.8.213])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm67907613c88.7.2025.11.23.18.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:42:13 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
Date: Mon, 24 Nov 2025 10:42:04 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
 <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 9:48 AM, Miguel Ojeda wrote:
> More importantly, should we just have a separate function for backend
> flags? That would be easier and would avoid having to use the
> environment variable, if I understand the commit message here
> correctly. And, anyway, it is actually the only function we need so
> far.

You are right, separated might be better.

Another reason is, in `scripts/Makefile.compiler`, there is a set of 
functions with the same name provided for use by Makefile. Since we 
currently do not need to check for bindgen options in Makefile, I didn't 
add function for bindgen there. If we add it in the future, the 
`bindgen-option` function in `Kconfig.include` will correspond to the 
`bindgen-option-yn` function in `Makefile.compiler`, and 
`bindgen-option` function in `Makefile.compiler` will return the 
selected option instead of yn.

If we don't separate them now, for consistency, in `Makefile.compiler`, 
`$(call bindgen-option,-- --some-flag-a,-- --some-flag-b)` will return 
an option prefixed with --, which makes it difficult to use.

I will separate them into two functions in the next revision, 
`bindgen-option` and `bindgen-backend-option` (or `bindgen-cc-option`? 
Which one do you prefer?).
