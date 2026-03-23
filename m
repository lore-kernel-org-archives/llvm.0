Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC2648CFC
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 03:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774236315; cv=pass; b=n/pugPsCkj9AfLOpGsI/ukqQcQ3buo2597/mzo0q9Mbh0B+WOG+yGUKzW3A3+zjPxVvnv4EXyUYPabVW5qNg0pO8G5ebheBBoJh4XukRJmyNQrM42elGhXtmXY9McdouCYeC3fs7qJz/95CIBvIbBnGvdN0CG86dgZax1wM18gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774236315; c=relaxed/simple;
	bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GwM4tigXf1p43M0y2SwflstFoBGVdalKmPiOAsj7HxAakx5kPQ2HLryi1AapscgPwiaaA6em2My4qVhQBuNmad0VTrHpGX5HvhX5wnB/wYCil8orx++YgLe7J0HXyhdXSuJGvLNDzBYTyeMOEoWOANV1RFe9rIRgpLGBn9cF2sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5WXwRBD; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5WXwRBD"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0f76bd201so224978eec.3
        for <llvm@lists.linux.dev>; Sun, 22 Mar 2026 20:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774236313; cv=none;
        d=google.com; s=arc-20240605;
        b=luO7Qj7bkipNxInH/oJXcVnjj8BWFS80R1Y6LuD82JnednADCuNSnwdOvYKhRCq2zY
         AgoiiuYcCk6mmq8FDKHGJGGfAanSxK+ggihwI7+nZvdqf7B3HyKDaOnomb8CafWwJQIA
         35fSGdQTY/X0zpbgm8pqpTtAqiao1XJ8MGbFLIBi7/m3kcDtSfg608sy/39lOtpE2HqU
         x+BAplrmpXcdh67yFm5HbyvTrv/HKnGvO0snWrF1y5rWwAEC8x9VAQB+AvMYgpWF66u2
         /9Bkeg4XC1+/gJ1GU9MkydnjQJhY5Ituab3TjQ6uDLdy1VGmPYMOfK1uMXUVeH0StQSK
         UEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        fh=H14QQ7UnOEWKWRw69Bh/8kqj8JnZ+mnKqxQL99LlKxA=;
        b=chG4wbc3crFI4Q7NhMo3jhd04k//LXH6Ua2KS3KOl4ZMburpfN/+UNG4avjVJAh9nB
         M7URpiIoKkRY7d7dU0OA75yfFlFOpKrmYccXHAkR8PBhjWb1XjrOn3SPeA6eJQyu8PNP
         DatbD3KC3u743LiAKRaCijwqsjTef5wCvPLkoZBzOh3g2vxr3MJASKxo4wJZLAOYf/Sy
         pXHyQH1d+Z3KGX77CKGCqSkO1r1MYqy/UicdQ4dxSncdeCUazfHmdDjyMyagf9ZxfYyA
         AMVcRde8macXBW7QipkFtKNqXyu6srxUAZ04s8OdKq510EhJh8P9HO8nmhEBJRhRyldl
         DARQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774236313; x=1774841113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        b=k5WXwRBDKX4Y5eBqdbKtTdce0wm7TFUyNTuM8260jh6aTbitL9WKWoD+bsjA868lYs
         Cm/4W+zAJmAn5ULPJnZolXelAjgg4tjAWwA8BEMK9K8r/eKN94V8HRH9MjiIERn0RtA8
         cXvfs1r3qzRCI6Vb5C1EnPAJeYLPLK0EEGGDaN8wHTF0sUWwBER0WX9wzrSnDu3/zeJs
         AmwIcc2e7u8tatiVuObiZ2cTcWis/25hSi/fJZKJ7/6Tn8BBySBmGOo6n59xMST4o0GK
         5iGhEOuq/yDQfAr8Z1CgBLD6q4WSXShjrLP+5TneLs0wHPwIxf9SAnPqz503KTSsSZZp
         D+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774236313; x=1774841113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6L7OuggG1xx/psBeZawamh6lKLmj+yBN2DAvG0qZTM4=;
        b=Ias7QHe1xSTlY/GVKIJMIHvmkkRns+bzmc8zP446xxUmIVNCEKxfPdTCVeST+N02Rt
         BMqhN49P9kDWiup4VyGMuYl1hAtlSzupPtF4d16ArKqGjAWkJ6XxSfm75+1UcwDu8new
         wseExKQPgCuA1+9I68lJUntLMl3/KWjnXr91gf40ryr5x+RRwSa+8tJPHUAeSeqGPYOz
         ICc6Ul7/xcREXkmUwYx8ftp/IhBIRxL/wZtUJadYFRwWg5xmqPLMGd2XrCwRA6S++IKQ
         ZudiLs+3vlbbE5li7JypcR+enmx8zC3wePTQhnj4xhdtM2tk2m8J6ziPX3+6qnfLkSvT
         e6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVaxfaYbrLPvNRlojYPfoKZvS88xgSGUl931TLWepo6vaQoBHBaGfPP+XDtMU0Cx+nwRNUJ@lists.linux.dev
X-Gm-Message-State: AOJu0YxsZpERxegiaIqrKjejWiQ+PpflY9p4BZhXNahaRLcGk8RmW0/O
	vJgpkWHMMakqor+65nWY0q/cTFuiA4OBI9Auf2/YFAe0P9RetfZhBAX59wC2oFxUAzJQyzgtjC1
	aoZx305dVwHgiPu54LGdbhm5ASt7bS2o=
X-Gm-Gg: ATEYQzxH91ahR+0QpzhsSY+ZzpzbXCbZipuW9oIZ/wEolJYO3Sc6BbERuRUlzKuqh4l
	PlNSEqOCv+1SCCzAhpFIit66C0G4+NKHE73hftAZ5ncwSUhdJgaJbXpjky2tcLxIuux2g80XJ4R
	l+IKl0fAOLeGY1WKpyTNUQEGeXIWxl8r16XOx+wBJlVi8boedys1lPiXydyytJXDKMeqJ1SC4du
	JYwBB6J+Zfp+F4dSrg2xEM/t0BUDupUfq8ptdEcixp/GQ8NvGds+OQmx/z5GHr//UAxlPjA4XEZ
	+9Lp3pkG4cIxJyl4EVYtOtJMqSx76qv3Nr3TOxy4XA9PcGx97upUoTsLn7kpsmRVfmrhVXpqib0
	HxipMYe1HvEIcUTBDCpbkkxM=
X-Received: by 2002:a05:7301:100d:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2c10970d302mr2034525eec.3.1774236312928; Sun, 22 Mar 2026
 20:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
In-Reply-To: <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 04:24:59 +0100
X-Gm-Features: AQROBzAuhFHkGwwSKh-Ea07cCRjtb6eZEQluwHGIFmDfJPfdFW0BK0DaJf2FJhk
Message-ID: <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
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

On Mon, Mar 23, 2026 at 4:04=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Rust is already fragmented, because it does not support all
> architectures. Do we really want to make it even more fragmented by
> having some bindings only work on a subset of the subset of
> architectures?

That is not the case. The `depends on` is not about putting them on
abstractions, but on this experimental build feature, which is gated
on `EXPERT` to begin with, because it uses a fairly exotic approach
involving LLVM bitcode, which carries potential pitfalls, like the
mismatches on the target string like one of the commit messages
mentions, and possibly others.

Cheers,
Miguel
