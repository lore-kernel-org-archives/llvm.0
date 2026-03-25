Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6392EB10
	for <llvm@lists.linux.dev>; Wed, 25 Mar 2026 00:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774398157; cv=none; b=KRcRwIUXuiP9dalohcF50AQvNeQ7Asb0ZUKk91MHI5SJPIym289mBNUKsssRYSDtogkN9ZVDB2u6SVOtjc+eqrClg4ifJKLNDLtKcTVxebVNLez/0j0RUhWdBbfxl8nW/Mqig3ytt6uISGHdHs7EkxKGYN2YeJFZZa++LpJLyeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774398157; c=relaxed/simple;
	bh=C/gC1RsuIfC8njdMKE3omVveD/LHB1wKAyLzaOf575Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbV3rv7LBxYJuIOKLxUPnt6l9yta68//2rodnqhE9whZnqwxRlMIJxE4ujtPiZhCu3MPyZ21Cs0iRqlIzL5/ZKH6t3CXljym41MQVM1FaUbKZKhK/DQ6XCX+tcbS7dXcO1sdAgTSw8LlRDAG1ZOz/yq+hyGl12nHkbHNyTBrPZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJBGNLuf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJBGNLuf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so12978625e9.0
        for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 17:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774398155; x=1775002955; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3jYf8Bnnp8/yLh5y/kKlLzKOcooQBVfzdC+8/FhSVs=;
        b=bJBGNLufcw7B8PmdYldYgPPSaEIG6ZCo+wivq8+PrTcyQ3hNBB9US32iUwacyjCghC
         4FF1fmXYNIcZj5dQYpOtgS9YqXe699TccgM/+esGHgnVgDK8pVT6twXjK0pE6LLHRW56
         ahFyW4jkdHPD+G9ERMBHNIjnSCZktqy02x2q0eD++dK8GS0dUAZ6sdEoCfbcQ443uOtp
         iHLaBLdOwvtukfOfQ4ME3tHoMK1MsDsjylBNe4xMOfY60ZvmQTmfsC1/TvoG8pxI0VMh
         2TXfLspBsK4NVRPUbMssd/7NspQ/icesdiURm2wCOQCXS7nDUfJAWYTGFIQtgpim112x
         Vrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774398155; x=1775002955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3jYf8Bnnp8/yLh5y/kKlLzKOcooQBVfzdC+8/FhSVs=;
        b=EtGidzN87Ornpv7+2IcqHnh0FDgK7qm4H20NDAPYYqUflVAtE7J+IRxI7tRRZh6sKM
         AYLSV6HdLD6R6Ba39wERNjDNCs6uGts1raaSn0u3k3KyUtecsij6bFl8KJ+D7VkkcJ6c
         D3RAP/7tta8M2JLKlGk8n9WkCs+oOl2r0SxcnL+lITLdbbtr9eBiFEdxDYnQc+ucMhhO
         68iqjArdoiYey6Un2oqLKlopyQoAGk/sl+x4ENKiNn+BNtw7RQ7IdFJQoPBcaFP1ZI2S
         5EripXhOB43UaFlXf054qxKV4hsXiRVXimjX9S9ZmtI/aj9xg8Fd7XvfC3FcwxCN1U4G
         +wSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk8lNZLcVQl+JAqtvSTjqPC56wnzm6aaklbvphj3Wa5pgcI64U41KpOkeNVEdts4SwOsX8@lists.linux.dev
X-Gm-Message-State: AOJu0YwoFDT+QQXaUX2XEYVaPtIuugmgoAgNhJyFbCxzM8zXt1vuZAZT
	rs4uKIT0DKiPN2cH2KEvK5NR9Veq+XjXZDbG/GDbXncw+fDR8OyM7ulI
X-Gm-Gg: ATEYQzyR34LZCOl9lEeaqvzs3/DormHjt9NJzwRZdyHEWTw3choZF5QbxRgmINGjDT+
	EwvzshEZKgbtkqvoOtsGSCpA0HJg3mNfjAF9SQndcEoJ00Ngb76Es7ea/ElMOkDxwvkDz+pHKmm
	cUwRGoSFGDlCH7SZn1Y4fTaovv0KyDaX8beh1e4PHwYLdXnbJneY2DRC3DcGTdGGwAz2Mpgsi99
	U+1U+QWJLzq3Bz3hvr8Pi5wfeze/+TbxNsTlB9u4Pz2HamVbErRBu+VAgRRnzkQzqMwzZqDI7Ag
	O3wZ3iWXZVyBi4vSU9/WDCR1I6IvMSw8fD5YcuxqElem2YC9Hyyd1TwC1xk2A9o0rtNZWvop9CN
	JB5PelCRGV0n4AfR0MvDVP/BUF0hTt5lu2Uij9nvDHTm/RugP0bsv54IYCsyd+hYqFYPa/jBegV
	LwDJD9jMjVncKoVY21iFoRlEwU6JdJmljSGdeuztxbmQCEe6FLvGavoXbnRIO6GVdlg7GdDhtzT
	AEdtQUI323AMQ==
X-Received: by 2002:a05:600c:3e8c:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-48716051e15mr22818325e9.20.1774398154499;
        Tue, 24 Mar 2026 17:22:34 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871736befbsm5605825e9.25.2026.03.24.17.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 17:22:33 -0700 (PDT)
Message-ID: <9763c19d-131c-45ca-8976-a6473539240a@gmail.com>
Date: Wed, 25 Mar 2026 00:22:32 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: sfc: avoid format string warning
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Jeff Garzik <jgarzik@redhat.com>,
 Ben Hutchings <bhutchings@solarflare.com>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Brett Creeley <brett.creeley@amd.com>, Breno Leitao <leitao@debian.org>,
 Kees Cook <kees@kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-net-drivers@amd.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260320151924.3474821-1-arnd@kernel.org>
 <90a03d3c-def3-4e34-89a0-6e952d3b0d7a@gmail.com>
 <61de3aea-26b3-4c00-8598-3a137ebef1bc@app.fastmail.com>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <61de3aea-26b3-4c00-8598-3a137ebef1bc@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2026 20:48, Arnd Bergmann wrote:
> Right, I took a bit of a shortcut there. How about changing it
> so the other format string is just a name that gets joined with the
> number?

That would work, but all those -1s are a bit unsightly.  Like I said,
 I'd rather have two different efx_fill_test() functions, one which
 takes a unit_id and one which doesn't.
(Also you need to change the kdoc description of unit_name.)

> There are not a lot of good options here, and splitting the line seems
> better than an overlong line to me. I don't really have a strong opinion
> on where the __printf attribute should go either, but I do see that
> after the return type is probably the least common, so I'll change
> that. How about having the specifiers on one line and
> the type in front of the name? that seems faily common.
> 
> static __printf(7, 8)
> void ef4_fill_test(unsigned int test_index, u8 *strings, u64 *data,

I'd rather just have
static void __printf(7, 8) ef4_fill_test(unsigned int test_index,

Admittedly that puts the ( further over so fewer params fit on each
 line, but I definitely feel the function name should always appear
 on the first line of the definition.

-ed
