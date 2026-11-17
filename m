Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794953026;
	b=297GL20/ryulBW0C0YG4dyHzjNOXDa+6ElMGlSYDrbxhEoUdsrYDSRWCGqwt98lwQMtT
	 117Gon9VuxLe8lspladT9FtbZ5fEpW8McniV3nOzf3sGcxnQRxcS6JVOX2M8fzVsROsnz
	 hqr37tqRuHzbdaaFxEMZP5ci0f0EU+sfYcMZ1WSv9Ux0QPC+cVP+ZRikq0s6qXbJYlALM
	 OCn+yivXApi8c456m+sdWPb5bxQWV3SNFyopr97eGEs8hvuG6tVLlSHptLz3hK21sCYsE
	 YZTXv2qT/ou4Nwabgdhs1Armh907Ci1J5nMxJkq/4mEm55uxpENNF6IL72lQnm7Pb6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
	b=dxyt9qBupmcfMFm1q2Q24wtY7U1KX3iuQX49VBstc7NvzksIOsoOs2ACTDR03231Lqk9
	 ns1XaQzR+puc2KcUoA3zOiBzfq1fD6V0fBt+wa4G7p4DTlDg01Z2SOu8C0T/h1ujHrGd7
	 y/3uQpS7GSyUHXkKNvVMnX8tpKEN+yPUIa24nW5/GAmx3lijUIWW9OsJaACJ57/PaF6cx
	 4YEJsOpFBIHMSbTDUUS7u2nkpBVplcaMrJ7e7dY1KlERI5z7o7lPWtRk7/S9XxPFfRSFt
	 JcImw4aoHvWHFhssWAsUVnduLj58gNLSVVkeg0CpjzBg73w2aEqvNRXpsa/OoAj6Uig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ffvabOib;
	arc=fail smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA67606A31C
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 22:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ffvabOib
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so6015e9.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 14:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953024; cv=none;
        d=google.com; s=arc-20260327;
        b=YsFWfjs17zW7+vKJgA/bcHleP3lvuoFpNA6TFFGcQvwt0Xx4H4yw9uvfRX6Fr0cKEO
         5D1PU63e7tr4fZnXflq+v8joofpZ0FRHcqII+ajoyRTweJi5xxZl+dY3lLPgSwamzKlB
         c9gF36qKcF29/4kcoWH9uMdoNt2TUMrLK9o2YIFSolEGhqR9o33UL387ur4oE84abdQ7
         sIsKaVFgL0E7z9Oatb+U9F7ZTDyYh4uaIhEIYrUV6/gbResMy0QmKSI250x3A41NSuB/
         cDiP0FguBdonC5iSr1JvLNVuQ3KpdiEM6HkB/aykEaLTf+OKy0/JR/vmMrhO6FnoZdMz
         iL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        fh=oX4zibg2Us8t3d+IiiYnLGs1ZbKCCmqXtwx66s0LVRw=;
        b=RVwgpWqzmjmMD48MWgQM1Cyz1YQgpKrvmIoKQTnFaDGb2EbmacpCBhNjUdDURC2FA4
         HmWE/l9aGY2RnuyO81+gYGUksBhbSd2V7e3XQqYN/2Nk/quEXdYzyJofvDRIo6DSy8Eh
         0Kw5bHJidXNONyDSCljvIP+N8KjpVGW62Ci6McA2H9Xl+EopJlhZtLYsKJkSYdmiilqD
         IHjogX2Dt6hAFaESORDMfv7hEzGh1wGpKXsiGmmmLtxdQNg6lnJxbHZEFzrxJhtM8av5
         5CQzi/WLIgIR+arfVe34OZpUA4pGXYJ9G6uqS1zR4ZwQq9jveNfkOMc5HuUV7zby559s
         JdbA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953024; x=1795557824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        b=ffvabOibxepp6gBozoQh9P13vbSE8yx93qgmndtejcny7a99KXEFMcqoV6h4bDxfUe
         /u0ncAoejJYN7Pd+7vDs2nj4S8wqNNN4SbqMCc8jVWUvS+A1+WG0P1er0N62G3GE/Eiu
         HwG4D4u2s59/UuyWREzEQOO/b1gs+as2GVcQdN39i4IM6NaBM53jzS6AR25aLbjIi7t8
         p1sSZvUAPt6x8XkIO8Bwp3cQRtBNrTX8Bu/J1l2IuvDw+MxZ8IVEj0cGsEEoUQwJBCib
         8Aty+VhdKSZY6+Rj7lBjkqWsVqAk9Njt5w9wNwS7iSKzm21V289DcqGp0CwJa92n1hhO
         Xnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953024; x=1795557824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        b=OAcsQtgFxpjwmZ+W/Y4OyUXqlAkb80psGAfWsv9yOmtFsur5j1mzCUeoh5Kp++9ReC
         LcIs/BIy9YXdKtYnuWZDbL6ZTVT6be8Kv+MXJY0ZvcnVRvwtsjIb4gqbXR37J6wMgdec
         60WN0cBeGavlIwtmqhcNhsuM856D3vjr7bAT2hYMmznYUrVVAglY4UF1LkrSi+u919pt
         Ez8yHV1BvhfyB+CG1C92LhsBI58G4z21NzsRauDbghMCH0hVy4be4Bl6/J8bXAnn+xXm
         nwbmi+FT6WspCWR5b49pgRDlreYmghR5eDH+YZZXdlfPbJc1DS0Jt5hLphDNBCeE6j3o
         piSw==
X-Forwarded-Encrypted: i=1; AL+hErFgI2DdtoKPjjZDvRdwrT3llpWbjuE0JEo8ELnwAFUsHKvvwth13WCJbRO2gtE5OUMmKGq0@lists.linux.dev
X-Gm-Message-State: APuU4Z+9j3ltno4kE6yHiAeqPuSvT5UFFLW7DNOWhnwBnbGziw+RMtKL
	dTC78C+fCDmc7zPc/lYUNZiY3vkwbLAXBBavvCuzAp7b0qE1Z5ocL8QKW+o5alqUe1O32TlGpz5
	Fqqm3IKQd3lxEiCClJI8M++cTx+zOGWvtUA0TSf8U
X-Gm-Gg: AYBFou0sJHY5VQUgNMEa346XuhNlrRhvwU0hdPXMx9m/6DbwcFFzFSiOWekyWfEeffX
	VaoB9peqZ4EQTHvpm6N1atQmeMvwJ0bgKE9qJo3DIoMLM2W5umYbopi30nNihX9HmkLKOiUIx/s
	j8Rm2PjVXnc+r9sK3okTsZetYuK5wXSQCBgTliGzP0CCyrgVcBTqPhrK3XWNjfbxGgu643DB8d6
	nDKJRiJ9G/JH48tCnerVJDiX5y91SGFlcsU+a5jYIP2S6Y37nQuS24Twy184aEjBE87KexITV7e
	DBGXQCGfEQRiDW7FMEjbu6Pe9RwxwHaAfvJe77QvsFaGaiSDPXzE/tP3nwZ1ORSqDN/wuhojDT3
	e1Hk+KRhtFQoKD9Ft0WtJPOu/fWzzYh5efA==
X-Received: by 2002:a05:600c:8586:b0:4a1:d225:6d7 with SMTP id
 5b1f17b1804b1-4bb7d58b5f2mr160695e9.3.1794953023558; Tue, 17 Nov 2026
 14:03:43 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com> <avy_9SPRaPSKD8b4@google.com>
In-Reply-To: <avy_9SPRaPSKD8b4@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 17 Nov 2026 14:03:06 -0800
X-Gm-Features: Aa3M54obldq6YruWajcrqkfkI0bnKtN_pPopxVMwZ7IRPXUGwGNOW9PukA8ODCo
Message-ID: <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Function merging should also be disabled with gendwarfksyms. It causes
> faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> incorrectly causes the former to get the CRC of the latter.

Sounds reasonable to me. Although, I assume this is only really a
problem if the functions stop being merged later on, e.g. because
they're no longer ABI compatible?

Sami
