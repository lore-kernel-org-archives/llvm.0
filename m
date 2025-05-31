Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC36238D56
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705990; cv=none; b=BFhlAWvGci0nYzHI5ZN4g3kko8/QDWEQed72c9wd29qubduaI1W/4s0ll35QDUclcc8+qCjH2KkMCCx2YWwifsJeeyIevNaSMh8zHl5U92wRa3kt4i/mlRElFbPUz7mOb8SnoxfMvn9gKnBdbABEyb5186HGd+7hMHckx4jhG2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705990; c=relaxed/simple;
	bh=gU9laCodEqgFk7Nl1GeUd8LpwRSNdhguSR7gzLHmTs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ek092yNYZPcOXIqvCzomo9oW5qkPmLn/pbQZ5aU76muIiSr66gDVPfAi74WdAMyMZvtl1w1DhF7O1TJ6Gy0XEdVVjvTLNAwZRWMDXGnCTpNO3fqTcS+51mrpCwV1lcSHOeZ3Ipd5Zv90p9aYyO3uvvBThmiKwC1JTOJJHi42VLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+72Tsds; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+72Tsds"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-311f6be42f1so559932a91.0
        for <llvm@lists.linux.dev>; Sat, 31 May 2025 08:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748705988; x=1749310788; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gU9laCodEqgFk7Nl1GeUd8LpwRSNdhguSR7gzLHmTs0=;
        b=A+72TsdsPsqcwOxHBf3QT9cihAyuPhn2JjyDVdlWcIWWcQwEqNFy84fxmhDQt4iGU0
         /oyJy6hYuXeVRbJxrP7NBsNNiryMF8Xl3nmubKnsDBZ0LG0MgzpXAyATKQYbnHy2WuMb
         dm7wpPxccrKp/VVYB2+xFm9C8wEkTf5cW4jAPWrxs3BvIXc1Ty5/zJuY6J/gB1SuMbnL
         9Ov+pcnEHoT44Z5ehQAPFjfvVDToHHDWumJdkp10ogJYubErwEr16TK6H6k/c4EJJ6Z5
         JRNUtf8mqUAignMFMTqvIQdk3/NcY8AWst5x7p1DkvipWNpeERAzQfSfaUZeSbjXKbfd
         Lb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748705988; x=1749310788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gU9laCodEqgFk7Nl1GeUd8LpwRSNdhguSR7gzLHmTs0=;
        b=qliIKCFKFZkSvNo9Y/7U6NLwT3ABv48HwHArwynT9FE3GFu83rDAW4FTfuehoo1N0Q
         tNDex31dXFPlJ8gXG5q2KI5J4GsPnzT2yptHdfLDw8QbIXkvUKja/II3VWgUuuwujt86
         4B8/E/ZnCfkJ/UMV5mFQfqfPwAQyuRhXa1BxhIEATJgbMgIjJ1T8ZsR6k7jE1qGIyS3x
         1YHgbipradsV77bwsbLD/TAUAa3XtZ6eBJ836ILFR8hJJhkRZFz91o/kZAm9TmrE8jvo
         i9ZtMJWeLynvqt5xZHJUB3xaebO3TPCSkJFndsCKzUIF62nIBKSrzpr+/cgRhRPEb2Vv
         Lpng==
X-Gm-Message-State: AOJu0Yz2omBLXT1JV3pCRfXF6dxZHZwgjMWRUZK/WqTstuDsYIgmOxJo
	FHqxeoVfg1mKDEPe5fGdO+7uuQnuUQPd+C4HiL6XSwTAzTimBabd0ZQF0x6HA1+OF+TXLgrGQ+k
	p/Q5UI3OSAk+GgEp9VSiAoXkRO2WuLwQ=
X-Gm-Gg: ASbGncvGnVWlS5gee+pw7y5l8uF2FNdNz3H0AoneRIPlQg+M08DnvZAxM+KimtoNTIr
	r7/R8YnRlqWte60edCPVQS64abJKZVI4aWRBWtgX4bsPxVy1pGvuhHHscN5oKghvwChvLQ7F9qP
	oYcIw8nISBGx8Obw+Kcd8XQYaL72pfkcXcuTHXKJrVWeY=
X-Google-Smtp-Source: AGHT+IHl6zouE4LWARtWKof5FoX2/BnOqPpqC+poFZfUJPlE46SCdWhcUwZ/kirEdrkRwdjAkYmAGKCIoWWAMRBa2wc=
X-Received: by 2002:a17:90b:4f4d:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31241849819mr4211406a91.4.1748705987877; Sat, 31 May 2025
 08:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250529002509.GA161456@ax162>
In-Reply-To: <20250529002509.GA161456@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 17:39:35 +0200
X-Gm-Features: AX0GCFvKLgSzAfNJ19aRo-_vAJqqHWKC-i3DNuV70pOA1O5Q3qSVFZf8BAgbIoM
Message-ID: <CANiq72mbAvxhT37xQFAPur_vfpDN7ufbtPeyF+UnU3f7i5sRkg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.6 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 2:25=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.6 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

As usual, thanks! The combined package works for a x86_64 Rust enabled buil=
d:

Tested-by: Miguel Ojeda <ojeda@kenel.org>

Cheers,
Miguel
