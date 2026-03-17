Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC9E346FD0
	for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734552; cv=pass; b=J36s5oyPL3rlRN0sg6bn6hA64Lox7WxL9v6AuMNCCjEfz55DI+b1hWjRziwfbkSXr7IiQUmyC8mbECCDkFleSaPhGiNgdVqHZdCitEnl2gn/sfovQVEhOcsRvV7FuLfvdzumzlkzSNBnV2is1Zc78zOX/Xxm5EvmPiKc32xb2fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734552; c=relaxed/simple;
	bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzPYUGSiXh42E7odGG43NFNrD6SxbkSUKhf5Gm6cKsQmXfif2ep66Mm/d41Dz7dby2oCn0+OdV3wUK4OMh5D2pfWW18/PwkGCWW2vwjLk1LxQL9lsyPEkOATfEGFGHSc/YEVw6WBDfDL2Fx32NGn5R/bBzj9n+LqZz4kMrP2DAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzRbAk1C; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzRbAk1C"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124a7216c9cso223076c88.0
        for <llvm@lists.linux.dev>; Tue, 17 Mar 2026 01:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773734551; cv=none;
        d=google.com; s=arc-20240605;
        b=DTRqOFZRNcxDbSKpEGU8Ak840d8TWzWLX9G3u9YxZU9TaA0hCHmllCa4XMRRZoZVD+
         nH3iJ7muJ9nML04M1L4mtlqKxXJoGbHQa6BMnBFnEEJbhbVxkWR+N5ifKfNZEg8P+6g1
         sEMDDPwp4KGwgvSWOeqO6RYHGu4iS64IXOiIhAXPgOanfOnqUOLEgQgonGRGW8vK+BhW
         0OLOapImCCcSWGIhYBQvxmF9Lp6nx2kcxZs4cCWy5P2YU0dB/94/vFk98Z4SNvZLsPFy
         wjlaRCwt6InSKNQird9tNapjrag20DYk4JJX3CNcilwWKY+SIaxJKkU8jird5qn9Gpxs
         5Nag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        fh=VwC9oQxXJmcqNK4Z1MOND2KJSM98QerfprsHsTL+SNM=;
        b=EHv4mV1LjAz8s2gdJWC3WsGYsBZhFrRMXV9t4F6PfMaZvnZAXbCOPzsR7k7oDjDL4x
         VCswNYNy3nLUscrWxcdWLnAAtbWl9FOAma/T4IAjkTzmmdCK6KQhDvrYzpD9HCWxG2nv
         iQG24xRk/anLNfwXGb39oEjgX/ddmw6orC1MekMecpQfZT3z7vSU4DVhueiRBvKYrCXj
         BvC2BjVJ6g+S0HlxDrvdBcoChWh7X79rli5WA6H8wnI6sOSEr5OIhRi6hvbw20M/XAw4
         d+RAeVZZ0KUWp0MsrLwEH8zhBYOclARM10qQ1cX6I9DrizHqpakzd40MHNzQl++9/j7k
         IGPA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773734551; x=1774339351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        b=JzRbAk1CSGCDPKxTUIyefcGI8QNIoI8F+kjcDuIOB+jD0ADDuQj9354mVZPH+pqTtH
         /hVfOxZGTyIlUAuG7Vrn+uwHyqjzWnjZPXxpGP7QyZaUFTDeF4WrsrN1oQtbDBX6ZgkR
         5gOBFhLxLwseHh6gYdQiQb9lAcbd/oid3XvK55yH1ooszfUWQNFFykDJVWNPH82hK29S
         UUzZHjzbxHqgZKLd64GwuRogaOiP+B6OHoU/N2V0rDIvq02nL6bWhg+zfpPmyB1JbUws
         1ev8yRsMPIfduLas9CRk7+Y9SU0/hBycttg7Rhvkt+ZYyEhV10anQzQa11TbKjswvkOY
         rTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773734551; x=1774339351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mj1pDxNsNLLXDG2kvG2mZkNhGrg65432VMCNzxXhtRs=;
        b=F9q4MEZFm15CM10Dh5BPRhs+/OLC63wFAWd42/ZT5Omg2DNdhcu1cXgfTuajHErAR/
         QefbVVl0hL77ErcW0Ozoz1tAeDU9TgXkpXE2ttNQEHPnZKRl17LrjVy1eUhwn0bqUGFv
         6d4KH3RsYI36sib3iyEvirG1Mr81mOt6++Fwvx5ZmDA8q0/q2pwBe2hCT9wWgkq/TH3t
         PXLH25uVOr+sS64PCYHTtlFFZBrxBkG+RaPH4pB7N7039YGQuPOCJ6NcD5fvqv2UFxKz
         ZPG0mpYUVmwxHXba/MFbHJaTvNKqDQeEPAsyBF+g2H9SdoEqz3F4rVY35sViaNIdLoy+
         mf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcd2+K+FVEvLE0DEPqZjeurCl/bHrmVhk3PFGX5udbAzWmAuZal3SuYGDSDgQHo51E5Phv@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx1glbXOE15GvJbQ6is890bRBZqO3PwcU8KlfmBqZO3vDH/led
	W4Oweevs/XkIa4uI5uLe2iqHLkRPcRHddc9pojwUMBnOVp13Po+zYr6gynz/TOj9R6P/FsrMh8F
	OljWism+fk2SgixsbdzkUZekAqw5AX8c=
X-Gm-Gg: ATEYQzxMg9evWbxeQMLHtfN9MWaDOcLYlTMBap0Y5oL4ZdNAR+7aacZH3p+OAzD7SeK
	Vv8ZH8rOyY7VEvk6Dm9Ned2LwPxXfmt2I/uXv3smKGt8Fhb1O/YBPft1AdoSE0VLtJJeTCjLCh6
	4u15kpWxUHQHKUy9jsT6bilqHzzKSiGQlcZNE9YeN9j6PED7kmQUA15yTah0YiLlTsOX+dfm8CQ
	W4/RuwmDaUQZ70JbSPVyeriX5uq1AoOiyPi4lkbc+HvqpsQOB13uIffn/Xows2aWxNzwnEHIYv9
	CchXqxzxsq81S5T0XAyIg1hmElmNwU4FcTeHIT8dl0hDCfDNPfoEVN2SZOtFZ1Z/C0Fav7gGt3z
	L8dfR/SOI5nkZZOeBGLiON7Q=
X-Received: by 2002:a05:7300:e887:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2bea5590bcemr3462168eec.5.1773734550615; Tue, 17 Mar 2026
 01:02:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-3-beb8547a03c9@google.com> <aasPsbMEsX6iGUl8@google.com>
 <20260314004012.GD534169@ax162> <abVE6VWCzZfyMEsu@google.com> <20260316213440.GB1329928@ax162>
In-Reply-To: <20260316213440.GB1329928@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 09:02:18 +0100
X-Gm-Features: AaiRm50RfwFM9fMmqm7H6QEiWpid4KdXpZyBrHWN7l2K7PyOj7AradadNJ2iMyA
Message-ID: <CANiq72nEFH8onFqA-8qXxeT1izR+xJdHT3AWrAqAzjPsEMJrsw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] build: rust: provide an option to inline C helpers
 into Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:34=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Hmmm, yeah, I suppose so. Actually, adding those would allow you to drop
> the manual inclusion of -DMODULE in cmd_rust_helper because it will be
> included via modkern_cflags.

Yeah, a week ago I asked Alice about simplifying to `is-kernel-object`
as well (mostly because I used it elsewhere in our `Makefile` in the
past), but similarly I ended up thinking that if we are OK using
directly `part-of-*`, then it would be better anyway.

Cheers,
Miguel
