Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4B28AAEE
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 15:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914561; cv=none; b=jfaV8xTizBlX8+9D16S2Zx6oesusLU17YkVnbMWXHBxbOFTMTykHXu/YQB8R1AeG4qIJaShLHft+VXVcIc6XwSI4SUibCE48tWwhuXzORiDwtBWr45kIs/vdUxZpbgbfRzZvHD1DxILnHkcHrikUVOrl7feg5AeqmZaRCiVXdIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914561; c=relaxed/simple;
	bh=Vs+2TVX6P+MA0FIJTI8WR59Uh1EZN6KJg5/PMwt7YoQ=;
	h=From:To:Cc:Subject:Date:References:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=G4ZVBxfDWm/e+VUkQKnh3bT+KCXxhvFzmqnUb4E+xxvp0MoWlv2m9DyuqlpEvTY38WnoerZy+uIv015PpbBferAA2WH8+KpqchxUyGWpyf5/WK8r2X40vh4GXmMSVnzs90UqYjwMalu9g4hvjyKyzZY5hf4g3QC8EIMfpM0ucsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee/ZM5Vy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee/ZM5Vy"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-772843b6057so27129b3a.3
        for <llvm@lists.linux.dev>; Wed, 03 Sep 2025 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756914559; x=1757519359; darn=lists.linux.dev;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vs+2TVX6P+MA0FIJTI8WR59Uh1EZN6KJg5/PMwt7YoQ=;
        b=Ee/ZM5VygLXRmpXlqQqTFx4B/flm5kXnZ2payZvW2qfPjWuHRTFy8ydIjfxRmxme9n
         xHgFQ4Kf7tt0vjOCKw3+BoF6u3wWomUSc+Hk110kL/7XHKo+QtV5sncnn6XXDDqVl05z
         ATUGNWWfraT2oYqfeA756KzWcp50HDtXBphkwMhTjQhmSs1yp/mwq7yRlWAYb0z+wr5Q
         7rbTyaWTbn+2HwMY+rmXlLupr3IFg8qckn4fdvZzl10NfsCGKV3zfN9ZnZrCFkv/T/wP
         3hDxCES/j+s+pU5zCkuQSlj2z3Oi5+gRRAyOOwRpPMalpf4sH1Z9o7I9BfO5rZ7UoQwS
         ZY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756914559; x=1757519359;
        h=mime-version:message-id:in-reply-to:user-agent:references:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vs+2TVX6P+MA0FIJTI8WR59Uh1EZN6KJg5/PMwt7YoQ=;
        b=g0j7xXCxZMTUTf7gGJMArUUFdSzxl03nK/12LzIXZ9qfqhCq9dRq8kNxCy/XBOZr5T
         aNkl/8/OhDuFZq2UOLmerA7IU4olmFt794QfYdcNxPb6bk98qTeVCjNlKbFJ6x6TPRnn
         W/muPL2m3K6BFrfrw/t2qGntiTOvNoZnsJ89TVrpdZTSEXqcGPYWo3R0ufEwnu0iGtXf
         CQgU9/hpvrnqK60vQh/A3W1kU6VxI3mdXXtIXR2ChOExtCAVzc2fJftpVham3dD9FVFN
         JGjqz78QTqu03xi47rsqQS6s921p0HfUH4rR7ZHZjWzkK/bWpddb9qMXNZw15w9YR+Hx
         0DdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmARZ9HVFy7d6Mvkd6ZU4FZhmme/0drDG5Vj9l1nCgiIOxQf1SK0yGFJDMVh1EV9iylCHC@lists.linux.dev
X-Gm-Message-State: AOJu0YzDI1g6UBOM4+SOVm1G/OV/wB5wtm8Ia6llwDLq91kRoab2MF83
	coRJ1SgLHq2ekgCy0O4vxvgPzMTW41bo3yP7gxFTEQXJgc//C8eGUGk3
X-Gm-Gg: ASbGnctTkyP8/i85YbjC6tqquekjSOTM4Q3hsRMHMkNxXuDbpzBqAk7pdB1LvvBri3A
	zRK+8fvi2fjGcFkefIJlkTFb3bEYjTuC67LkU9TVuCuyb7PUFDtPq0P8hMYgC8ZJRw4oF2g0L4I
	FWUDxWHUI0a9nq+Q4+SAp8YGsSGRRsD6Z20JWQAH9w0uRY1ABmxr9rQ3mwRrXoBkXlfYUQjeksw
	9bsdYGhySju0pRLQp/k/FwER7nbmlCw1SbWBscD+LYxpmUZDRQUyr+cq/11Kx+uPxPKwhnLCjK6
	Qg73QsIzp7RhAKSI1QSHISeDKv4lzZax9+XYwogTmxARwlC544Q2aOKxu2/tzKTXHXSVjFO7LyJ
	foFqbkNsCwOOk
X-Google-Smtp-Source: AGHT+IHEPuzcLvALXYq4AVPl2zYVTMkj6o7Fq/hq4L7YwMdmGzEqIh26wAxzw4dE7sdM5dK2Az4LBw==
X-Received: by 2002:a17:902:f691:b0:248:b542:d803 with SMTP id d9443c01a7336-249448f317dmr198535415ad.24.1756914559123;
        Wed, 03 Sep 2025 08:49:19 -0700 (PDT)
Received: from 1337 ([136.159.213.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24a92f897d8sm125285175ad.24.2025.09.03.08.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:49:18 -0700 (PDT)
From: Abhinav Saxena <xandfury@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Paul Moore
 <paul@paul-moore.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4] selftests/tty: add TIOCSTI test suite
Date: Wed, 03 Sep 2025 09:08:06 -0600
References: <20250902-toicsti-bug-v4-1-e5c960e0b3d6@gmail.com>
 <2025090312-pebbly-groggy-3df7@gregkh>
User-agent: mu4e 1.10.8; emacs 30.2
In-reply-to: <2025090312-pebbly-groggy-3df7@gregkh>
Message-ID: <87jz2fk03m.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Greg KH <gregkh@linuxfoundation.org> writes:

> On Tue, Sep 02, 2025 at 06:17:56PM -0600, Abhinav Saxena wrote:
>> TIOCSTI is a TTY ioctl command that allows inserting characters into
>> the terminal input queue, making it appear as if the user typed those
>> characters. This functionality has behavior that varies based on system
>> configuration and process credentials.
>
> <snip>
>
> Any specific reason you didn=E2=80=99t cc: the tty/serial maintainers and=
 the
> linux-serial list for this?
>
> thanks,
>
> greg k-h

My apologies for the oversight. I used b4 to collect to/cc addresses,
and didn=E2=80=99t confirm them before sending the patch. I guess since thi=
s is
just a selftest, it did not include tty/serial maintainers.

I=E2=80=99ll resend the series.

-Abhinav=20

--=-=-=--
