Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB82773DE
	for <llvm@lists.linux.dev>; Wed, 25 Mar 2026 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403903; cv=pass; b=hJnytGSfnxi68L2YT+VDN7EA2wyvbd0Nysn2BCQfPt4CDGzMpMJsbTFuaNMSj/mdjGe023ghHWqycZVqSyR+AKqFo9dtFqzE0VbEc87sQa+DL9VbYm+LDgleZqj2W34BYe+vV5DWNMypAnFOThv3dXltjDss4ABGEjkLENIBSyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403903; c=relaxed/simple;
	bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rp219wbbfM75yZGJ5SUKH+HycZqwb+2eeWhf8hg8g0ldomxITMEgcLS8VBvSBeiBjAUrFX4eWnp0vQzY1+v2oi/7Z0VQtbc3lrjVQUZiAkfwi6OotLApuNRaBMDnBWp88Q4CCmfh++knNZRZ2+8a6RsSIvMKRLsjRkIvPEWqkEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF8tK2KY; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF8tK2KY"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c0c4194b2bso226056eec.2
        for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 18:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774403901; cv=none;
        d=google.com; s=arc-20240605;
        b=d9bcVkcCsHbdlH1po49OMvgG0JW0dvHY/lUeHrbW+/izcnGb04AlA/PmpNH2AVRzN+
         HtSUdXUsYLY2bEIIaWaOLPMB4n8JhF0gxZIMsNr/lsJ8BZKfvvERpFVtNhsymO87MIGf
         1aQQHLXgH1csR4zqIBUa4sN3klPReDoRqVZ+bf0cH4zHPn40+sjTcl3qPxs5iixu7jhy
         8aADRf4euhvwkvG0g1t4++qCWWFDYjzdZ4BB5SdIvJXMEZ1lhMC5IOpLBXj9wHTZhpiZ
         j+oq+4gRcFT5iwpWejbZDC1DKkKJ2P7OqtLkuTNppq0mrqDeNPBHaSJOnuXBMF3fI+G1
         JANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        fh=NE2zet0F/HzF9/QFwbXLPLw9E46eGEeev63QH8aSi5Q=;
        b=CouP/4diyMykXNoKLijJvqEJhSeRyEYG0RlXUMP2j8Mq21SmaHVNYjWK2w0WoKZLnP
         bZVM/N4BGk41LqXtATKfu+O4dWiXCGcsZ+NTYN/1w06qhsAqyUSpGIq4zEsMog736sD5
         e8bmLx3J7PfHZcQH69G9juHeslgmqRBXgwtFR7fsN+mmjxCn/CRQiT8LVq6nGizPrnHQ
         mrvtlJhBuLMw9NKV9x5hH0tuNufYMWw6PwgdcuIhukOUtz9ndGMwqTv3Bo4b7qfQMUxM
         6rIDzZkpp8v4X34/FrUhmEPjy+1NL/QocPTyHnkt3GSESscMeQRCiTJ5O+qjmA61tERW
         xeUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774403901; x=1775008701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=fF8tK2KYGacWiRa+AOAUFchvbJIoDiewC5Xtqr75uGO/Jpx5GUuPo9R2nE0PeJYKWg
         xDpwuLB0nq1aUKgRCOe7D0/1P3XA4NOWsqDkq9jFV896BTYd1y9FYilv4veHwKt9ICKd
         VI+LkXFlPDnm1dpxm9Y/sah4DcDcI7R0itqIwBetgtHeLInZEB2joxfe6TF21foB0hUa
         iNJqe0Rw887y4mx/hdaywPvFhXEappGPHD55eXVv99yAZgbpVNPs6xs1z/1OwJceZuC/
         dqSnZxJx9/Z7QEjyojUzzvgeP6lC0gFbrEg4m40mePbGOk7hL108oZIKlyTxuQ4TX3Qp
         H/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403901; x=1775008701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=BwqOxEPGnBahvxqBCaCCNJlSux81FtRcYqynEbp7h+/yvx2MXrwGFIclJSK19wNnQT
         2+mb1MFdsKP0WW4uFsV6xclyBdbU/ZB6LvlsX6hu8cIWmvX1zbcrT6qIUZinRlIF+cdk
         a7cv7Ostl5r0nRTW6JONJJZJC/iSEkQ8XIQ5x3h6oKVKlL5RzyUbMxaKQwVjW9qdh5gb
         B+DtBUycJIM+X5j3D+N5E5oRsFhCC14ZHpPvYaXgWeQD3/oPSOpbrVQAGG9VK7sxkepn
         JSS200wTe2cuFqbUpdXK5jQlmb8BEZ+A2MFrtr6zuodS4p/u3ZmnpVFBWvKcY8hw1sGa
         HFWg==
X-Forwarded-Encrypted: i=1; AJvYcCVq07V9aJjJUNkqJ4LxFQvIRyQ7LwV/ZiAaDE6S1GMeWORkb2ztInqf4ohR+ERvPjvPb63V@lists.linux.dev
X-Gm-Message-State: AOJu0YzH6OKS2XOvdfkXgtGkzNMipflgJpcl//j2wNSbbd7GgURqCiLX
	rf75G+hBGUdVaWfQF7jUBAL6qlb8dLfT4k7qxzdKDWLsFzibVAA7efTbtbXTopFtT2N/Xpp9ow7
	rGKOb3ZAkApL/R41tlkMZkRl3lXPCmZ8=
X-Gm-Gg: ATEYQzxKoLqev+LbQLnWHeoJJmhiFIgqi6ue/mYmnFgQXRvHXS/7f8lTPM01U2xneIL
	bjomGq3g1ALlPdpTMuLMFsHEPPLOW5of7OADz6B9bMeubLlI9HhWd/dG6FLASbp4SZ12zT4OC78
	4A/Fa4AZN5zWnlrq0DGzpYmjVUJixzdu03gC59m99d0/aFRroO+FTdegnQ8hA1kHXImmNy1i5Tm
	BsUhGAfYFojAhVaaarXmDiG2TR9pZyW/PVILBa1IMMU068ErWc+1aCvcWJzbGar7mWjHdp9/Nj0
	au16V61VQx0rfZAlqb0QQbErGsxQPUtkcFw15g+PifPDcW0jUIgI0lycuRakuh7Ae12oiwkbaYj
	Ag6Ho5erdcz0I8hK9hRJHjc8=
X-Received: by 2002:a05:7300:dc10:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c15d3a8a70mr394983eec.3.1774403900918; Tue, 24 Mar 2026
 18:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <CGME20260322194701eucas1p1f72625f53e50806fa4f430550f291e76@eucas1p1.samsung.com>
 <20260322194616.89847-1-ojeda@kernel.org> <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
In-Reply-To: <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 02:58:08 +0100
X-Gm-Features: AQROBzAYV4sPQIbCVLLNfW-UqAw-p0H5kvr5leqfcWwqgBKVIhpQi6sU039YVRU
Message-ID: <CANiq72=UPiXc7JLracLeC6k45ToByJWZedp3B3j5=5mAnyKZmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Yes please, this looks like an oversight.

https://lore.kernel.org/rust-for-linux/20260325015548.70912-1-ojeda@kernel.=
org/

I hope that helps!

Cheers,
Miguel
