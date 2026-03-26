Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD8426D1F
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546300; cv=pass; b=ePK8i6TIfBybQLI6kqq5BC7D7YGkSjdJ4tD98ixfjja+adudRhJgYqx73bFTWFG23VJA2NJ80NtmbMREqnPToC/N/NY5gvc3MHPbG/yiDFu+pe1GUFN16/cpF2S+qgZZuYtx1AcqAhMKC+Jgu7IdWP8s84WdVk7em2JBKJYBz6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546300; c=relaxed/simple;
	bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQEzl+R+vBTLsTj3o0D3g2CVpTE4mB30XczjrauMJf9ROPGX+rOtVBZCGh2JykBwR+8DnA8joYTbdw7fiPFZSih2R5aA3sxBug22e2EWcr6bUEo8FuqTQtoxznn+Z0t8Fex5TkWJuEdDmF8kI8U+Pmj737EyPAvgz7Fp5GtyePM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgyc2SG0; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgyc2SG0"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-127337e3870so89380c88.2
        for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 10:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546292; cv=none;
        d=google.com; s=arc-20240605;
        b=eL7QnCWCwEGj1K0VkuPsXmmQh87QY3ZnD4fY/JISOS9z/hAWg1ccC7/Z5TyE+PVgqI
         6hQK56s4oOLUzxVTK7nCS/+cL1xl43QPdWp/cxrI+CNmODL8YIs/WwcKS9B8opnCszmq
         Zn2PXeC24dFruhyuoCBS8k0E5Z706c61FA4ON5U4gedsoFyv7pywgfkygzigM25zVIqW
         /l7UQ2fjZHWDi2lJ0UtKVewcTCYpxAhdEtpCif4K2drCuILib4/jwI22KLx/KYMrrvtU
         2kOmg9CprHgcM2Hsk+1RppBmybACww1GbnnSUpVAnmYkS948gYbZOa4MnkN0sH8XHS4f
         hkKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        fh=9RvBJt+2EBubU8cQ+KhldkSgL827q6Kmrc4EXE7VC9o=;
        b=D7zV0U6oMIr0N7ZJ8mliFXND6eCyBAZeOdM93a/RZbztS3TjHXfzdP39e0nku2Hy9l
         IBZaU6GxDpVJf8Iz/mb1CSaHhdpBWnIBDDxuuorXlCWiA+1rFdzmkgRX4izmYKm2k0Oh
         8TojdI5HXAFkhrh0/bRmrmhuVQ+F9C3SkEK3hrXCJLxKBDvOKpo9c1btyz5RdpdfB0Kt
         r31x04JSmv2rqiWzn5tArTp5Ww9yJhbi9BnnhmOw1S8vNLNDRwzooQxJKi1XJZJFYN9G
         rNX4ZokmQm+VB1aj+Q+JwsWWnerIa8rudJAYWJaXoe52D3WCzt9avMZxTxQkONuV3f4e
         DB5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546292; x=1775151092; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        b=jgyc2SG0lgyeg1n/biAD4tH8r4S8zxy3TlTlHdl7bNnGGJY8oCS/lgdoESIjL3gMNy
         YiUjEouEDHVWTdqFIPAVPUc7tlTMQQ03iEqMj93SdyR9wQTv6+4U+cNQCwliyOfV/Lgp
         H2CGGCM/WopepKL7JP8bLJ5t+HI4yyPR7cCTYpv+wNja0hlT+apnqH2TCL2KndaZWKAW
         LbW1VYuoUrTV/L8OgyB5yTz3X1OE7lCEetqefPRS+OgCCFZZ7MNF28NtfoSbBuD6mRMO
         ZXf5zwJNn3zAzUBsKLNrX87RyQLlyH+Kc2DL4Dl4gHXEsVEBMl9ZT9e1Y+GrTRPtsBfG
         U3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546292; x=1775151092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ht1ydNu1umiMsWIVEKZmUkwLuvps5HNVkVlm/tB0atg=;
        b=E20LCRpo7q1LZZ6hSLX70+61YkXJXqC5RjiQvVIrEfGf4wOPQAsPHAQ9UpvasYg4tj
         uWIF+g5I7zL4o9mPG7IEq4SHeN76IGpHL8NNI98QxL0WSaSDzv+M1kS3oCmnWh8AiYTh
         QpHATcaUDGJS6CEH8egjRBv6t80rge9Lo7TzkoBdDbUzGspfEMCcimFy4V+uaKXRNyLe
         nvQkdQRVKZDS1JGY/eIMmSHqE+TMr6Lh0/qZkfMcVQU0u6qlciHGs+g6jArHEncWRVBF
         +T/L/Uo+euP/gZXfU88LfOZgN6yy3+9O/sfHzRDS0G0RWaF/doB04NKlJepPtjpQ3/RW
         py8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWJ5Oj4aEQO06kLTTHax5wXUOkej4kbVbbiZWk0jgzQyRu/77l1PfCUhtKiZjOm38ICUHd@lists.linux.dev
X-Gm-Message-State: AOJu0Yy30YuWaKHAX44NxI+/luzbFOXoiCdltIhs9pH79xnVWhHVnHGZ
	dINlWZyV8NbsI99+kpf7ZXnn6kDnH+U8tzVKymaXiL02m8N3bKITfooy/iIFTMI0GmIvdOFIKaN
	JdJP62XDGgzyk4jz+0tUmhnilmIT3lfE=
X-Gm-Gg: ATEYQzykpHGt1czRLFYqpnMgu9nYWCxxmmhFn0q87PgxXSbab9sVvEEv7P0Kuf2Ao0z
	ecefTMSz5aDgDY9lvKNxbjU6K0nxP0Wo0syghesWodXX9Y7GBklnLM/DbkdLAAcHvPk5ORhfZdG
	pNMAo+GQXdvDPvCsCFMGFf0lInSmjEwgAJTQaE5cnTT74JgvSijGZJW0PvVH9OfgKRx3KYV3Hoo
	xfIVt+yMSyUDkQ6Zvx/NmcZl7AXYdAGe5/sZ2a19w4ZT7AKf+AV+jJtO03I5YJM8PUk2+Qo5NK8
	o4he13NCbRS5Aa9tSXa4Ui70zKZdaE18b9V6irwRosu4nHEWLyylk2gB5wEviPsKxrFpw+pxJfg
	lW4kgI/HdA/Ggz8K0kPIqgzM=
X-Received: by 2002:a05:7300:cd8a:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c15d3eebdemr2110432eec.5.1774546291859; Thu, 26 Mar 2026
 10:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com> <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
In-Reply-To: <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:31:18 +0100
X-Gm-Features: AQROBzAY2TUlph37K4tdyrXW3PnWDmlLF1E76Ca3evvsqWc92x8ByVyN4OKTlu0
Message-ID: <CANiq72=fm7FnfM2iqOLvsgxxx7X4LBkr7XU8=LWYqSzQ7zjJ2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net, 
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:31=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> It should probably be fine to use armv7a-none-eabi. I've mostly used
> arm-unknown-linux-gnueabi since I though it needed to match the
> bindgen-target (which is -linux-gnu for all architectures) and
> because from what I understand clang also uses arm-linux-gnueabi [1].
> Also when I selected the target I thought that we would also support
> armv6, but since I had no v6 hardware to test on I disabled it.

I see, thanks for the quick reply!

My current thinking is to enable this only for x86_64 and arm64, so if
you/arm decide to switch the target (and/or enable this experimental
feature), then that can be done without a rush, independently.

(Please take a look at Russell's reply as well about the short enums thing.=
)

Cheers,
Miguel
