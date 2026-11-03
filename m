Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745902;
	b=lKQAly6LiCPY6fPf09qknF/cszynb6a0k6dN9hZOA3kgaU2JyzxSbIyaMSSN11oiwap9
	 zHw1+HsZ/BqBOSkz/pIoJAN/kFyY/cXRj9e9S8It0xE1kpvuY3/MaYY6TCW1miluZ80lR
	 JtlHtuMT2ambWVNbLgFhnezOpt8/lW96Mm1HW7TqnFnO+c+7SeLkp12cTJIDaPpDgHbb5
	 q3mxhYsJ4nYeDASDoCLO+OsulJSP62SwMcmPayf71jqUIX8sVumiVA4bC1D1OdBeJ53nX
	 s8R/tuasQ6QeEl83dUkqDCHpRfmW+EWbrv925txja6xxg+YOW6SS1luyuHKk1C7F4DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FFnjdFLKsVUe6dbM9bQKa87XJ3A2c+AO9ICto/QiQcI=;
	b=HSuzS3QZKqDvQKUSELo/EKuncUDGpFljpZbZNvkCn2ZZuZ/ojQ6+94KQqkMrM1JbNAqr
	 EuqITB63yFO+pXNa3rUPmwEF4yw138oso8Opdw26TlgxTxNM/bgh/2prD32mUUMdsAHVo
	 x20UQ7iLOTrckYbH3ynFREZ9CjCXgSGE+SAubgbcbg91eRC0o9jh+fxckhPiTcdPrPzHo
	 GcTepOivoPWmFEpWjnQMd9xrlPQWQuS94AdatjEhCxyqt0Qf/VKxOOTYIR486QoBDTWPC
	 J4KcVU9PIQVxpdv4Hh2K8bhr+pNZR9sWTvpZVOClztPTU27z8o6xNvj4Jn4sGZT1yJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arFxBZOx;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB6606A329
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 22:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CCB6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=arFxBZOx
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so713245e9.3
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 14:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745900; x=1794350700; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFnjdFLKsVUe6dbM9bQKa87XJ3A2c+AO9ICto/QiQcI=;
        b=arFxBZOxZ0vkTqCu1F+hhezB9UcAzGQAotHe8fmJ6VK44ioWyDIY5shMUSqXqsJgNE
         kHi7s156DhnmmSFmEqqosmQAfilviOfw1uMc0b5nxfK2lWU5rB6/9El6V7kmJ+fttguh
         vP1qO1fHnaEpsk5UGSWFJu/lDhfnBFmiyXbiy2nK3ErLtvKHsNPmdOPL0TYuiH/9znqD
         lwG6hUBQZbwe4a9rTa/FZ49aZA1CGFYpRS2fdWOFhXAZgTG3CK5UMDaBMmiunFWBV6kn
         OGKo0bkxEibNkAY8Fn8EBx/rliCKoEbw3/a92tPMJsHcZrzTzX9ch/ufRRERp0KVPtn/
         ZTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745900; x=1794350700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFnjdFLKsVUe6dbM9bQKa87XJ3A2c+AO9ICto/QiQcI=;
        b=r1+ZE/gTnRB8+LqH9po5ZA2HSwFsbW6O3pKskQMbIprVmDy44coWB3YRsr1ZWqmS//
         5jvk2oS2WuDJ6In6S3fAvo9DwB6vrDfE+BMlUtZY09IHlvW2fJf3EIfknSPuusje06Zr
         3mvcdp/hJXcAlPvWtbyQuSp9RXJx2+C5/EFqXaLdmU3f4whZTpMNv1VP365HkK8If9Ja
         3L5P17kCbdCLgKI73I61H7Sls3zVRC1ddpdaCqdq0KoCfZ6jwC0qN/Yqn6hAz3qhJ6hY
         NzR8Rzem0VQgkjoF4J2NKr1uGVyVN9z3ur2wHaIcLwvsfjT/7/+ji+DjOlJB0mK3bSv7
         Lbsw==
X-Forwarded-Encrypted: i=1; AKwUvBz+B0uC6V/36NstlBtE2sT7um9AU4KWSlR0nh7Y4dkQpacr9Bn6fIfMInPyYfsv//Hl/22/@lists.linux.dev
X-Gm-Message-State: APuU4Z/84MEelzIdmQ1vwoCZwNg3FAbS/2dChGAKSSNi9ePgvcF4qVho
	aVpWhYhAFrR/5SG+kT95Mogy4x/rpJooQcibF1PLAXV6Ma7GKJNl/0lA
X-Gm-Gg: AYBFou27bsQTlXqhop0+DvViHAFjRfN5CMti418vCNOiGoyWL6qmU5GWK5XtdmiB9BX
	EvlqHNhwvxyu3Ry8WDUovPXO+ayo1qJCcv88rxNLZ4ivAIlJuQA0Nb/DOMOiG9Rb8iDG17Z/zm5
	j6Ji36F2m2eN3kpxURVd8qYJCikyxLSEAc4RqAOn8zVWAPT0W+URR5Rj45gzGoG882rWIWrAsYr
	GhmWJlFAcmD6YLc6nKB7EKkjPULebQYLI956LWHxoutjE5WqGpXRQFJ+QDiJKhFlyZ0d4f9Stea
	neAO0DAZjdScZWEO9miijVJxjqSysY7zkXTrayU8H5KnEdc95c/nx6H1eXL5kx04oqY53UmMkIR
	ZJ5iSn+VZJKA179/nfMKmftCJzPMwUpIJI3HQ3cyig/Mbpq3NAl/V1uw82pUHHXVmW8//Kt4DDX
	uzNHSfdPDR8ZDWHvCWb64rQvy5BI9PyqRQrDV1zPz7Neg4BTqaAaoJ6zVUJhLkx0SKdn02dNSKJ
	GshEseBPwTgWWdOH0FD/FScyoCNwEul1bk4hkFEjH97Q98Xr2GtDAL/yeFubG8V8c+bR1oujwTR
	biHTCZc8kKeBpP/3DHKousmAknjWh93djoNunmbgGTr4dxV1X8NdNoYvgTC37NDX3g==
X-Received: by 2002:a05:600c:1d16:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4ac151a8fd2mr337030225e9.2.1793745899679;
        Tue, 03 Nov 2026 14:44:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm10357445e9.5.2026.11.03.14.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:44:59 -0800 (PST)
Date: Tue, 3 Nov 2026 22:44:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rosalie Fang <rosaliefang@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Guan-Chun Wu <409411716@gms.tku.edu.tw>, Nathan
 Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Greg Thelen <gthelen@google.com>, Yi Zhu
 <chuyee@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/base64: fix -Wconstant-conversion warning in
 INIT_1()
Message-ID: <20261103224458.7fdaecd0@pumpkin>
In-Reply-To: <20261103163404.159582-1-rosaliefang@google.com>
References: <20261103163404.159582-1-rosaliefang@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 16:34:04 +0000
Rosalie Fang <rosaliefang@google.com> wrote:

> When expanding BASE64_REV_INIT() for v in 0x7c..0x7f (124..127), the
> unselected ternary branch (v) - '0' + 52 evaluates to 128..131, which
> exceeds SCHAR_MAX (127). Recent Clang versions diagnose implicit integer
> constant conversions in unevaluated ternary arms when initializing the
> s8 lookup tables:

Has that been reported as a compiler bug?

> 
>   lib/base64.c:58:18: error: implicit conversion from 'int' to 's8'
>   (aka 'signed char') changes value from 131 to -125
>   [-Werror,-Wconstant-conversion]
>      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
>         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
>      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
>         |                                              ~~~~~~~~~~^~~~
> 
> Explicitly cast the digit-branch expression to s8 to silence the
> warning.
> 
> Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
> Assisted-by: LLM
> Signed-off-by: Rosalie Fang <rosaliefang@google.com>
> ---
>  lib/base64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/base64.c b/lib/base64.c
> index 325c7332b049..1489c048b1fd 100644
> --- a/lib/base64.c
> +++ b/lib/base64.c
> @@ -31,7 +31,7 @@ static const char base64_tables[][65] = {
>  #define INIT_1(v, ch_62, ch_63) \
>  	[v] = (v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
>  		: (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
> -		: (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> +		: (v) >= '0' && (v) <= '9' ? (s8)((v) - '0' + 52) \
>  		: (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1

It might save further trouble to put the (s8) cast on the entire RHS
expression.

David

>  
>  /*

