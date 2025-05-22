Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02928FFE6;
	Thu, 22 May 2025 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926892; cv=none; b=rOHdpjltPw0YZZXDrpK8X+QPkm6lqLk0MjJ3kpoXpMxSIAzWG0e02VT39cWHjjxpwTrvrGUMQkb/V+HI7TqtiPtKwmW1s8GMz3Q+dUsi0QimCHEUiMT4O0NW4ObpJuWN+ZVMKFF6iaPnTrrjWD3x+5YifJZMQ8/JuqvkbRu+8QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926892; c=relaxed/simple;
	bh=WsxG8OORjCH2ppomC5jfk23UfoRK9sGqeuLdPN9mfNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeAdtYAFi5SXgjQ9oo8OcdnpxlCqgdDc/lTp1JLTdCglAMs6UT7zyMrc2NxEc+MLQsHoJKJxIjpYonhB3OCfZZaJP5tEG3mq/NJYRSxIBuuf46441DxSjy4Ej6371sYwBD+zZtJE8hu3HZhbA0J2eXzAdr1RJ2Byc/bUZ6S3Mmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GO+MjqHx; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GO+MjqHx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-231ecd4f2a5so53469725ad.0;
        Thu, 22 May 2025 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747926890; x=1748531690; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsxG8OORjCH2ppomC5jfk23UfoRK9sGqeuLdPN9mfNg=;
        b=GO+MjqHxq1k8zYnFuQ9Ji9r64+AbBU5sGQuPHWaKEaemvPp515pvlWAuEb/Ksdmdcs
         hyfUe3eFCCtXS0J9GXFh6YwlN7qX33+B2G4r1egMhAbrhPpYeNqT72azM3/wOmhbE2a/
         biCtGL8BXP1T+1qNUDteDN4Lr+JH1aBJIE7yJuhldaKE04dfz3u2Lj6nS0E0UNAPZP/3
         /t4P+gJc88TG65BcPGgG7+2ol5uufgvVoMyA4oOsohnHuK58MRehsD9c5F/kb6C1Xkcu
         iXfTJEgZ2GK5nRwQbgpHKISHg2xiyBq514RpLZQWfgekM/UE7flf6KDKpfuGeOe3pTls
         DtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926890; x=1748531690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsxG8OORjCH2ppomC5jfk23UfoRK9sGqeuLdPN9mfNg=;
        b=arjHtGSktAv3xNa6p2nH9Wqx0RpfrJSpA3hz2dUIiHpTyw6YK4NLOJHVEkU4xiAa1B
         UmzCyrdR3xh0q6ofit8KoWQg3vAmcuu2ZrwGbDd1FwphbQrPfmP2rOqTitWZ18OsSFnk
         e8PaGpXxNnu5QPKYNtDnLdfoNpJDG8nWKGj/2mRBe1mpW8Br4PS/KtPxrQ5WbdSNkLJf
         gR716cdx9j1GSw9qWUeZn2E+0OBPz4FNsfEQaNkBRnVOPvd5ql/gaYxr59bHsUgZQVIx
         k9ZhD1RXLEQAsL1SNitRhqG5R31MQ0kIGYMg+BD5OYcaNvhOdt7HnE8Dr5M7iNWlsSgo
         zJrg==
X-Forwarded-Encrypted: i=1; AJvYcCUchtun+pHIedCW9vWGwFT8FF6kFdoub7QyNo4pmesAnlQ4ZMUX0Tgq6KEcE9KICLUcMobb@lists.linux.dev, AJvYcCW5kTGyhdgutvwC6FT+UfQ1xBRzU/GYUiYoEf0B+jvJonMUL+46QkKmkqZf0/24tCh6A+NRQcEOGhc+FfM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLFN3JyjDSodSCCPe+FWEUvSRlE8NQsKpGrdARbiu+TEO/TEXW
	2oW4tVGw+O1B0E3RuX80p10TWK8Xr+8xnRZLQV9pLj/r6XRAtwyGIOVf
X-Gm-Gg: ASbGncvEBi5Fsb00FpxZtCKMsw4/NEFQGB6Kob6Mejo03a+eYBrWjS9oaxi2eowyyKA
	Pzor1YNdtfOMk4vTUjWYwKrEONiOjqkmPY2HcKe6A3Z3W6XTWjtUg0luSi95fWXgBp23H2pLQUH
	qbsW4poUZKk8cTbx+unYVVGLsQSPTNluLoThCFLCw4xlYFspRId5UkXfPVWhA1IjMHBAuRovkeq
	S5/m+f8ZeYTiueAVswc3F6jKgSEmhRA5QtZCZaZhy3hglAtcC+sEAyue7bc34OKi4iB9EjzCKFg
	ShDQ6SC5EM10wOioyxRGnS4jnjXToZNnvb2rRck8F4PHFnh30vKu07ADVLeTk7i71Z84BUqw3JC
	6XtSR0oVnr2YAJeDlzuEcaw==
X-Google-Smtp-Source: AGHT+IFFHdCg2bYOMTipIdA9PaTTIsK/FEQRHO9l1ug8WETlJWK+AYJ1xQFp0K0ePyvYyX5dR5SrDw==
X-Received: by 2002:a17:903:1a68:b0:22f:c568:e691 with SMTP id d9443c01a7336-231de3149ddmr360264745ad.21.1747926889909;
        Thu, 22 May 2025 08:14:49 -0700 (PDT)
Received: from ?IPV6:2601:644:8500:5dd0:864b:f5ff:fe5c:59a5? ([2601:644:8500:5dd0:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac93besm109295605ad.12.2025.05.22.08.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:14:49 -0700 (PDT)
Message-ID: <95d28adf-1eae-4d33-9421-c0864933c242@gmail.com>
Date: Thu, 22 May 2025 08:14:46 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, torvalds@linux-foundation.org,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Christian Schrrefl <chrisi.schrefl@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
 laura.nao@collabora.com, lkft-triage@lists.linaro.org,
 regressions@lists.linux.dev, Nick Clifton <nickc@redhat.com>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
 <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com>
 <db93019f-0a57-4b1d-95a6-ed5a6ab9a989@gmail.com>
 <CANiq72n3UzgG4BTcZXd9aJK_9+BwodRkbzewPtipi4-iCqdeqA@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72n3UzgG4BTcZXd9aJK_9+BwodRkbzewPtipi4-iCqdeqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> No worries, I will apply this one :)
>
> I will remove the tag, unless you want it there for some reason (e.g.
> because you want to point out some extra testing that goes beyond what
> would normally be done).
>
> Thanks!

Removing the tag is fine by me :)


Rudraksha

>
> Cheers,
> Miguel
