Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB2F274FEB
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746037002; cv=none; b=gAmw8/oqe9kWQ7n8M7I6FZCuBB5Y1dBrgLf0EUbeEZ9zjXZdXEjU14PLM/dsmDctQHm8cj4QkI1/xAgpmy6vSjQb0dHbs1LoEdMRsjmQurgPipTgjwU/aO9FOSipvcxMFkvTUN4Sy34S7DDUdydpKzncwYubQHYqxLkcuU09wXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746037002; c=relaxed/simple;
	bh=S2zZkE8kYk7DeYMqbaUF/R2UUdCZOiBVgolXvwU4Qzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZrQHap70CyEqEUxDRAt0k79DzFBQkoaMiTsJjJbliT5nBLkK6K4d9f2BVZsTjG0zsuzEaJear5tJ8neeYv4IYX/gTmZ+r+PgTS1/xB+9kBl4o0e2ndJdQ4z6a7wkUOvB45mqh3jed0tajqfGhKvHJFKzQVoGEbjZ2Df8j2hM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfvHMzQF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfvHMzQF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd44daf8so212005ad.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036999; x=1746641799; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2zZkE8kYk7DeYMqbaUF/R2UUdCZOiBVgolXvwU4Qzk=;
        b=hfvHMzQFFXR5Rh/x0biFMvYmMGw+ZQHi7QRfstfHakqTkAt0GoYyHqH1HEuvmINFiW
         zi06Jc6Kkb7A5zoishnEDL+3WOEtacQJoHskhJnLHPl5KF//LzxynKfGkSK4eiD3P5T1
         0O3E4eqiCFlyIG+X/cxYi6HDAEHjhUkyRRzbitO3AHpEc8jjjSzIz6rmpbdmQLHyw4nv
         9U6OXoOASmDdTBAWiqTS/IRN2rPaBj1UqQRqohkuj0DnB38RkpE2FO48jS8cErNmIF+i
         aWtded1kxgJg6prhzydRkQPsLtWeV9BZ3q6sHDP8XAFAtNv2qq/w8Me5/SwkI4NwhB9E
         dfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036999; x=1746641799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2zZkE8kYk7DeYMqbaUF/R2UUdCZOiBVgolXvwU4Qzk=;
        b=C9NSdsOShnpOYSimmuPDvhLDCV3MH8piqbKMMpIgEFjwBAb2M6OEcKqVw/WW+1UwgO
         Zc9mL2qDe+A/8iucT3mOiUVrqfqylZT7gS0NQKsOR5FX130Ikj99G2Ig102EE6RjIUF/
         hlbjlCcDjgyMCPi4m36ms/D/0dihlqGVj8uRtcx0rX1F6gJ+kTPGIS2O0GRounMyWjby
         dXM9Tt5PTjGvbDr5bX7Zqrxmy9FMh0xG3XbCIb7dDhUi/Ojpb5qSzSVFHkLegG2PytXR
         Z28Qq87+qT4g+EVWEG7ax3VI5FeE5piu21eW671hNYbjGGfqZK2b21YWIORAim3TUbLT
         ElKw==
X-Gm-Message-State: AOJu0Yx5Nj5+XMHadLV8mQrlFvkqzedLlei8h53diNXgn+AREgbfJuf2
	axbzZcwShlfOuL4aHXCCEsKUHy7h4VYv78RaW5QcO0g5iENB0saAHtfnouXy7CZgL78OOLUts9U
	a8hold8CTdNclaNKuJEgu+QbKFmQ=
X-Gm-Gg: ASbGnctVE+uPhl/d5PbTdMNVGHuTXXeC8R9CRJO7my8yx6LxhzE7qb7WuWmsmR0vGpa
	rRJtxcAbVgyE74UjrFauKI+CHhVJXawONVf4rg+kesCWmdIHkY4WQEdSAia96DO3SxPOvyk8lIo
	imazPBIvvEYzhV+3OTBTby
X-Google-Smtp-Source: AGHT+IF1N28ck+ncNtfwPcI+Xrl/j3rXmoy8i7dANTP5Fh1Weylgg5D+MGt+ZyUiTckDw4nsn/uqlyoK2BhO9nWWPw4=
X-Received: by 2002:a17:903:1b2f:b0:221:751f:dab9 with SMTP id
 d9443c01a7336-22df5835e22mr21391885ad.14.1746036998735; Wed, 30 Apr 2025
 11:16:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430165343.GA1436080@ax162>
In-Reply-To: <20250430165343.GA1436080@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 20:16:25 +0200
X-Gm-Features: ATxdqUF9QKjnhgdhbv81XkThLwmEAwlHnaUZr3nyNeFy-Sx2UyqWacT6ckzKa1I
Message-ID: <CANiq72n+0kxXfbnDsjNMH8wUXAPySfnPKx5OCoppotiNye9CVg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.4 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 6:53=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.4 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Tested the x86_64 binaries for Rust x86_64 and arm64:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
