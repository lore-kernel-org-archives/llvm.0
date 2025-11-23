Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F66A1E531
	for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763905393; cv=none; b=Y/D04hrWyAu8PJBgQ9Qq68dmqyM1e9iodoFfnshIX0LsUC0nR7QdaxjrxCtdGJAfZLb9mG4/ZhcDkcaV2yoE+0ih0OkL+o5zAY5xKajGGLmTKKPNJqZ47pbAPam8Q9zE9KRJoLykW+AsBcIokxHKoTRUnKfo4Ska/0ufdxV7R/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763905393; c=relaxed/simple;
	bh=op7ugl5bjuG3iSSa0niAOwNJ8iwzVDQyF+3EBc29SlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPVBYUG0sixwehwgQwuGqGH+bc+qUMbfeWsr9+sr5CM1dNtpOI9VzwLM7eHhpwkCzpE8tbTTPdoQhltVWjyDruN4zIPQHSD1k4vhaksrdRSgqSv1j3bmAXHzJiuao5dxSj020S8vPffHNzUOPhclgKX/2jxgXg8Y9rmatuNzBgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc6P6ECE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc6P6ECE"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-343743fe398so295941a91.0
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 05:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763905392; x=1764510192; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=op7ugl5bjuG3iSSa0niAOwNJ8iwzVDQyF+3EBc29SlA=;
        b=kc6P6ECE1W78NgFCLUdhBIIpf6fvik6EiFQjrWkO/n07NKNw/+Mr4j3M61wRvMHJ+2
         uxl4vl2Byd5PAuJADl4YvEDlV+goSDVKMKS3n6TXMCSsKF3QjlvMmaYJ6c0Vpoq8istE
         7+HWBMxOWkE190uD61tB7CsiRRNFUbTSyg7gtOIi3Jfz5YJEzCLSqj3wedN88P8dbTEj
         2pl+tUkE9MGCuuqD+YWEopOq6Ev6uwavJi8/k0vKS3LTzQVAk4zMpxYGHhnh+PZrj2wy
         YHbYRVWPnNWxY7XLfpXhmOzULmbCnFRLjMF5bLG+USOSoar4Tf+ACshK5hV5Sii3Gmy1
         6Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763905392; x=1764510192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=op7ugl5bjuG3iSSa0niAOwNJ8iwzVDQyF+3EBc29SlA=;
        b=R+1oXM3y5QLSQIdmJ11He1LfS4AoMikrY3coQuJLDZaug79IXvXkfA8Yvp1be+Pvox
         nFPvI9qM0txow2ndfFgve691V8sMR8DQDlTkyDJDCLo+vSYQM3qulbQtPUSRHvlDHLLG
         quMi4uZSngdyr8jFB3Aovz/J0dmm3izLc3icy+fnjJrykItJeJwOFXFZOr0+5DelDTNS
         4XFB+vLx50mI4e6lA5GYTiqbP/vfI5UeaWTShZ6kZx4wjPuVJ0QQ5zCh/1i84K1cMZyG
         j4NiRwRdplqf2ZVLdqpfUIO/P9ASutXd85rKAjv4XVO51oX4WFJSVHMLnj4ZgcUcS2HE
         mdDg==
X-Gm-Message-State: AOJu0Yz/+GS+URZCITQD4u12C8/JExk29OawWDnkD5/n/ocC203A1r/L
	th0XCTcr49Qb9jW0kVChXhcsl6X9ZqFOK6sW6i/SjIw2o5uVceA9fGrwtzHklwyDGrWu5QETjoE
	tAf5bZRRKi/iK2hVlQjpVfnYhFJDyHZk=
X-Gm-Gg: ASbGncvdAZNrbd+rNIty8KCNHrkDUNwOHwGEO4o4VpkJkFSQHa2PtH7WABbCGSPlgu3
	E21mgKk7kB3Z4bZ47IUYn2hsCrAbxXFL3iR9t+NUkMrpVgMnqjr0ORs/Q9qkBWIAv6TZ3+u4CT6
	aQQ0HI+6eFST0iY0nOLlPp8HlxNd/LzsMRWC58HVvXhPnZh5TCqWG5ga1M6GYOF6vV5fA3NEUzL
	LK9/RllH9wCYgaLOB2tPg1NwqgYWUQcqK7aTAJHhP0jZ6cQ3hihkSh5vtU/h+ZYoxrzFLB7adP4
	P8e7AAgcHGaVtJG1IuDDbkusFLAnx1/YBIx4APdgK1PYSyqSc2upRrIQhPFdpXtRjUnJj0196jb
	jj9pih0+eOPJ0hQ==
X-Google-Smtp-Source: AGHT+IHjT38Xc99gtbuJaE1pBT7izO4YnEEYxwd4nxgF7+pnj+gZbycbWvhTpgVm8rxw/j4h5Lg0KFuDwl8bpy41iHI=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr4766734eec.3.1763905391596; Sun, 23 Nov 2025
 05:43:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119033949.GA2155408@ax162>
In-Reply-To: <20251119033949.GA2155408@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Nov 2025 14:42:59 +0100
X-Gm-Features: AWmQ_bmqtm0z1V0cq2erbV2JrF9eAZti53R4-zqr5llJG46SmCIu_gCIEYMdln0
Message-ID: <CANiq72mijDpAhHXsrV4r2YLE+9WCSM-7CXsVi2dGb0nEbqi6gw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 21.1.6 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 4:39=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 21.1.6 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 21.x
> series is no longer supported.

Tested in a Rust build, thanks as usual!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
