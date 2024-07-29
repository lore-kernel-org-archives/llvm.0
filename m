Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAD8189F37
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 22:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722292984; cv=none; b=GegYp5YQz9yQRxo1ZMN6OSgqiAcelRZax2ebE5Aozo2HgQExx6EgL8tQ/wEBPiTKQHnLOsHVhWigDXXf0hv/vM0nNIS/vH9+2V3QAfqvQOnnRQyTtPBqmQ46yPtTZ+VRoo0Z4X1eVxO4IrpfKEddqo52Z8h/HEkvxc/WLImnjEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722292984; c=relaxed/simple;
	bh=Aj2AIVesAG+d2/9e7x2hRMbNkueEHWxEaKjXXzGcwbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g8d6cIpr8KH94rTZmkP30BdqlnW+gRthXrvZN4PkcU/322GSsTorA8ZUleX5I6rhQfSnJh4Y+07BFKPeaySUgSj6g/I6sVpzXNUuzAPf20ROfAYSsw8OPUO1JwyG4ybXu3l01JE934248B6CiKEQFfv5Gc2X2PgPSCCachezSS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW1z+Cnv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW1z+Cnv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa7bso3718511a12.1
        for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722292982; x=1722897782; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fGU2swIqhkzmFxwf58v8I5LDvCPe9Gak0+C/hrp2AA=;
        b=iW1z+Cnvh90WgQMYQAUhXpd8M43KDhY9i/QwWWdSHc/V0odgKlBBW7bBeE5xSVNUwm
         21kJZ6E6skbSsD+8jb1oq0IoVQQeFPnuI4WCyRnAZJZ0+cxFR+ax+dVo/pqx5BI5nZ54
         V24iTVPmr4ua0ButO5B00p+knMvMaLFo3V3R9ZzoSAtrIvBky4mkP7U+aMl2WJkNh1mr
         mujf5sAiYr502Badhuv9Ao5G9IlpbqzYTv7j1BLal6Z2Mm+WpFFlTKWo+/I0bE/dBnhA
         MYzMsn3Oiw7XyO24xPa7EyL5kG+ZU2dQnRqRbXGozsb/EvIiGGxBK1+8lt7A+RukY2Fd
         UvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722292982; x=1722897782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fGU2swIqhkzmFxwf58v8I5LDvCPe9Gak0+C/hrp2AA=;
        b=ZRGmxdrGM4nGa2j8FcbuHRWVfH94WTpysB+icL61Oapt6buGUBg+rVTA2DxaVBCXum
         mOrLFy7lXuRgoeDNgpCfQLB07qCDJHJkmVjK+pQkiZmSthn2Y99weRwn4BOrcLbOosq8
         nuKqNhQbVBubG4hJtERjl7XO2iuHsNhJZLXPBy6g6xlSNDXtdDBA9P7d2NIkvWsyTNOI
         2rBzLrQz5I5SHPDNJtz0gmcQwtsJIGcuHez9678JXz2iRy/XRH6q5w/gzPA6YY8fDy2g
         lymxAWm/tXMVnPsTjRN48bihmvh7BrWI5U3mGvfSdL1UPl2aE3JnPPIIWExR1uE+/ikM
         IKTw==
X-Forwarded-Encrypted: i=1; AJvYcCXv1wA8jRJ2ey2S4mwW7rgWj4wJDog47FfRbITwXdw0mjNvsnKXFAm55SK+lNVIgQ+rwy8tUb26ZGCtmmviOz48GiEFGQ==
X-Gm-Message-State: AOJu0Yy8+4wmQTxKgXOurOLoxZZj3huueZ4AcU3qBgb58AdR7Ob1NOwY
	jhC1mYVvw+GnyZ1BoY7GqpVLvALg+xOyRC/GAaeC0oiYl+oTjCw1
X-Google-Smtp-Source: AGHT+IGLX2TWK5psswgDXB60T97s/05VR8H5qJKBNon3tRM4nB6q0AYBnPBjzubWjdyyucSDgkJYhw==
X-Received: by 2002:a05:6402:5207:b0:5a3:64dc:33a5 with SMTP id 4fb4d7f45d1cf-5b020ba5706mr6479546a12.17.1722292981301;
        Mon, 29 Jul 2024 15:43:01 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac631b0395sm6384148a12.20.2024.07.29.15.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 15:43:00 -0700 (PDT)
Message-ID: <65faaf53-ad53-4b1c-9ccf-2ed9886d4f7a@gmail.com>
Date: Tue, 30 Jul 2024 00:42:59 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clang-format: Update with v6.11-rc1's `for_each` macro
 list
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240729-clang-format-for-each-macro-update-v1-1-9c554ecfec3e@gmail.com>
 <CANiq72kFpS5BE7Ea8=Z6SUi_Y2RAt5wsssHyqL3ocgR1UOHJMg@mail.gmail.com>
 <17e81b06-7778-44f4-94cd-6a2b1fe5c7e0@gmail.com>
 <CANiq72mByZfV62bXkd366GNX1ReF92=rUf9Dyh165Ce+Wc3F2Q@mail.gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <CANiq72mByZfV62bXkd366GNX1ReF92=rUf9Dyh165Ce+Wc3F2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/07/2024 23:55, Miguel Ojeda wrote:
> On Mon, Jul 29, 2024 at 11:39 PM Javier Carrasco
> <javier.carrasco.cruz@gmail.com> wrote:
>>
>> A quick test threw 326 extra macros that are defined in internal headers
>> under drivers/ and arch/. Including internal headers would remove the
>> need to update the list if a macro is moved from inlcude/ to an internal
>> header, but the list will need to be updated much more often.
> 
> There would be more changes in each iteration (which is why we avoided
> scanning everything in the beginning), but currently it is
> best-effort. If nowadays there are subsystems that want to start
> considering soft-enforcing `clang-format` and that is why they need
> them updated as soon as possible, then we should discuss other
> alternatives (please let me know if that is the case!).
> 
> For instance, we could try to somehow divide the list into individual
> subsystems, so that they control it and can perform the updates at the
> same time in their commits as needed.
> 
> Anyway, for the time being, we should avoid editing the list "manually".
> 
> Cheers,
> Miguel

That is not my particular case, I just wanted to add some macros that
reside under include/ (in particular, the _scoped macros).

Given that no one came with a need for macros defined in internal
headers, I will just drop `displayid_iter_for_each` for v2.

Best regards,
Javier Carrasco
