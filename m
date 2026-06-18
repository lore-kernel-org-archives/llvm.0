Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D924E4A1
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810453; cv=none; b=fAc6GzGTTPkNKTYvKc8qkyeXt+rypdHhQzw22Z9yNKaOkFEvU08bw9zZ2ggZGhBC8MmsHbEv3n8f34guDtjCxyH/ZX3Gku1lUOQjFnQXPq3CYSZycu1TT/qVPL90YFWjOjZNkwy6iOTVfzYoj1vbNr0HKLZYJwSyzacPDpOg10k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810453; c=relaxed/simple;
	bh=3GW4m4A1y4UZ9hMA3qZGpq4IqiAwTyHhdSGihzC+lxE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CYU1xxixCA1toubDAtZpo5Mc9D1kqkgv1XVgmO8PD4/McrmC8drxGAic3d0vROis6DbQibZD+FAQe7TGL8SJwcGcpFGM/RxUuMmaZ04TjAI2oZggsaT8EmFwA9C6Vy8jm9wzcEKIEGZhAvNjSydnj/KEcg0KiRNhtpST3VXawj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5BNoYMB; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5BNoYMB"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1370417c01cso1914396c88.1
        for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 12:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781810451; x=1782415251; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TngHd0EQTxZ2m3X+bc8uALQ8IHiZcB00GTxJVDwvEVk=;
        b=G5BNoYMBrr2e9Y364FY18t7KJZhgpklifrCTEGpMgEzXQTnRbyA4Yj3NoBgem+czBF
         6zZhzSzKhTGzgRyP6BR7i8hpuAUdTBqCEQIunJyvS67IS4vo83GD3idgNJURm7EPafFq
         Xn6vCkcwtraF+rPZH+fsILvJGNNLt7vJI5RzfzLV1M592Riprpsc3DzifxT3Ung45BRQ
         SP/ERBHqiunvzo+4MfMcdHIsMM42rpFdHL0TV7wSvfVw9a/ewUTnAYUHYr4npgXvGp+B
         exKRRFNLjUOMHuJC396f8ChGBZqtyeKbPMrnLg7bFg3kjRT1WyQjgL8rB8hWa5H2SHV/
         v+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781810451; x=1782415251;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TngHd0EQTxZ2m3X+bc8uALQ8IHiZcB00GTxJVDwvEVk=;
        b=gYlzA7KRkkm5pN27qNsrlbGO7ADUx5yhVgi3lJOC9Oi7o5Dtj+gAXCNPCCzQvv3f/m
         CktsrChS0+3cC+ZhfJ31LF+Yb6HSY+XDnfm2RXwqLJBnDIc8o+HcT2blnwb8Z6WP1iSL
         cSfqDSVxr78x5KE0POUrBZxCg9uPxF5PS0LuB5E1xNilZddGUWjLs2g0DEhNkrgC+3v3
         Nvt3BCM5nEFP9YsJDY9z0yvG02p75BciLXEktx6nQoGkjnqdhnYuOJc8B0fKa/QhOWlq
         RBCCt311Hca5apRurVduAQilFkE0YGp3OmcvBoolz3QUhdTOEycyDAxN6/UBEMU+Lr/d
         E+oQ==
X-Forwarded-Encrypted: i=1; AFNElJ/O65Di+8e2sqQEodwiuJBzYnjS8xoVb3UmKYj2jouoRCyeJkR71oufOdsyc7ZFiiGtqG6E@lists.linux.dev
X-Gm-Message-State: AOJu0YzcRyVxcaVu4bONohy48JciyOh88vF5Wm3rBMqZJAYUCdGAULTU
	6LhOPTqkxif8YXem2PsS6WMvWncAfeDzmwK3VKWyP+e31MNpzmZVqkHB
X-Gm-Gg: AfdE7ckCjSYuDR0kI211LaM01UTxp+ebUuNvH1y4uoeUwd0N/bm7R50PAcOZ/znaeAz
	ADa5KWqCai/W9Yul5W/G+OSweivGsTuhkFBGXL4qytSaiUKLyrGvEm3DuwPIfryjjbRSFr7urUn
	iRnNWUyKWn/yZctAD43Q6guNaGgipPk1VLxtd/ruWne9kClhXVPuDIXocxb5tLCiR8oC/ouFiI1
	SEWI1mc/aJelHYW35G+L5ToL4PTEIQYHpHectWClxcMIeC+7Rd3fgYadOFETCgpyQBvAimiEn/Y
	kYibinuO1uXFt7HASe17uwFTBiCyi4tu0a3dEOHqtT54iS3y2OIK25fgHKKvTkzY4ubWyUUkTYq
	38mF5dTibp6tXYmoS5zEsp7IxxcA1ao8aoNgtBvURQOYKj39cfKC4PQPv6EqnBDz/sh2FCq9tyJ
	7KeAr55VDdDFkQ140hqWleoRSRunMrdKjbENSwZucH80l/zT7CDH8vSAh2BNk3gGvOt4uy5IH4X
	Icc0bwuo4IR2BG21dBdlGQ3XjxzFA==
X-Received: by 2002:a05:7022:98c:b0:137:9399:fc59 with SMTP id a92af1059eb24-139a365c5cdmr97025c88.21.1781810450871;
        Thu, 18 Jun 2026 12:20:50 -0700 (PDT)
Received: from localhost ([2601:644:8000:5b5d:b427:6f9f:eb5f:94ef])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c066cc0bdsm391157eec.5.2026.06.18.12.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 12:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jun 2026 12:20:48 -0700
Message-Id: <DJCF38062Q69.1WQ853JSRMFQ9@gmail.com>
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "open list"
 <linux-kernel@vger.kernel.org>, "open list:CLANG/LLVM BUILD
 SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH ath-next] ath9k: eeprom: alias vpdTableI onto vpdTableL
 to shrink stack frame
From: "Rosen Penev" <rosenp@gmail.com>
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, "Rosen
 Penev" <rosenp@gmail.com>, <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260617234105.284358-1-rosenp@gmail.com>
 <87pl1ofa6t.fsf@toke.dk>
In-Reply-To: <87pl1ofa6t.fsf@toke.dk>

On Thu Jun 18, 2026 at 2:51 AM PDT, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> Rosen Penev <rosenp@gmail.com> writes:
>
>> vpdTableL, vpdTableR, and vpdTableI are never live simultaneously.
>> vpdTableL and vpdTableR are consumed during the frequency-interpolation
>> step that writes vpdTableI; after the if/else they are never read
>> again.  Reuse vpdTableL for the interpolated result (what was
>> vpdTableI), reducing the stack frame by one 256-byte array.
>>
>> The read-via-write in the else branch is safe: ath9k_hw_interpolate()
>> receives vpdTableL[i][j] by value as a function argument before the
>> return value is written back to vpdTableL[i][j].
>>
>> Stack frame size change (x86_64, clang):
>>   before: 0x440 (1088 B)
>>   after:  0x330 (816 B)
>
> Huh? These are static variables, how is this affecting stack usage?
> I assume this is against your previous (broken) patch?
It's only broken on ARM + GCC. GCC + anything else and Clang + anything
else is fine.
>
> Anyway, adding this kind of aliasing to fix a problem that you
> introduced by changing working code with no real benefit is not an
> improvement. I'm OK with fixing actual bugs, but this is just mindless
> churn...
Fixing actual bugs is the goal yes. It makes sense to split up into
multiple parts IMO.
>
> -Toke

