Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0333612DF
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707859406; cv=none; b=rMMSwa/yQ6DmUcobYnT8HOSc0768VprvtZ1Fmj6CR4MdLjo9KXuWJaTqrFvKQ+vJwBWPzZg9l/WMSKP9gWFQpzlz/QdP06VR6Ct1uzh7VZPrLP23bLkkziDwqRb7ofqg+KBxFdHHRpdz3qWE/HEzJl9wJjS67UXUEzlWayXWsLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707859406; c=relaxed/simple;
	bh=zNdS4IWShzPCUtyQvVJ2Xx9JgtTnB6R56d3FqU5q/zY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1EZIWqM43zb+N67zOtLLF9M2vXECYIjv/exrAZMvXzsgyP2BPslZZSwUcZDK9wvwoQrA4ggxayxWGT6Ui9HCOxEieGKmzKnyR/jytHqFJanoUGbsMWi1BR2wWryiqdc4Rt5enNBgGYhWTpS8lTK7gFcgxjvfQTR0la9bNPdTA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6e2d83d2568so1852357a34.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 13:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707859404; x=1708464204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNdS4IWShzPCUtyQvVJ2Xx9JgtTnB6R56d3FqU5q/zY=;
        b=uCl6tx/tiH8/AMzPCghiE6Epc4yahUKwqY4PKPjhZzVQtDVrWb+suYeJMNmUCB3RNV
         57+SDIDI2vlLKkE7TwxZoGjyweayofl7+qLVETl9xmo6r5I4XaaY34SPLINdidI4cSSS
         U+y1lIDHHlyQgztUvisOxBdZzQw77hd8zFBAMVwR02isH51SodrVypWf8XLEOO+dAsSI
         GvcFphBaVguNZKTpAATIqMsAbofLTa/4xljXi9okzrQ0kHecvjjg+ML8N93GCj98JE3j
         7Lws2MOIBKqj+ow2s0rjnk1rfV18i0IehOr2nZcIgHDVuFs5Xl472jQg0/avnCQtfDtc
         rELg==
X-Forwarded-Encrypted: i=1; AJvYcCXZHZ21QiKPlOgWcDgoQMSr3BdG4WbscmF5VYGPJ36gcEH4XMRESFndkjmmUtBJPGaG2xn+16782sL0cJVCaOme9Y74zw==
X-Gm-Message-State: AOJu0YxRDCq0nrlxel6RjpnzskilCmE8F45vvaTjNTd+LHCjCuqnGSE/
	uLCSaXxM5NHE3FKS/J5W9ab/EvmGz0Hw8F2gzaOEaMqjQmClju/m
X-Google-Smtp-Source: AGHT+IHSDIYCiEJpbXHnj72htnQIqjs5Lx58sxhFgYYn/5FXG4QscL6nnfHbAv96HqavqpSaRjzCJA==
X-Received: by 2002:a05:6358:7e04:b0:175:fc1a:c7df with SMTP id o4-20020a0563587e0400b00175fc1ac7dfmr640257rwm.15.1707859403771;
        Tue, 13 Feb 2024 13:23:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV61jh8io2cFzHOQgPagQZn/vyQ6eElRDhB+kdJW6BQZDslFrF/G7qFWxOGH2UzodF4/8ggMaC1eIMspdGi9g0+IBKm2h1e7ulOUxa8rrn/SZhL7Ayht/Cwqcs+odOmGhD6QrC4RRFAFTk90qjQ8c8aIT/zuTnfsYYqcYba9inyTQrQjyK0Xiqri7/DBu6XYIuT9075Fr/mOgs7g6P2wFa15VKhsL0zGf6CYvdKHgcgBWOpq5oxQOGYBU+iJtoRvYsAnoYIlemAfbtCiW7duJoBMi/E9V+GJ174g9NrJnbIlg62cte7ddi36lKInbKyoykWB82faiS/ekfmBawnaGj3enVt0uf6oe3BBEshpEBaI461GeW9o7s3wU5+BNAlfxB/SYw2nvoIEuvQxDWXAfT4bS+CHQirAR7gxv18EmFIG+rOvLQBOwWV
Received: from ?IPV6:2620:0:1000:8411:85a5:575d:be51:8037? ([2620:0:1000:8411:85a5:575d:be51:8037])
        by smtp.gmail.com with ESMTPSA id r16-20020aa78b90000000b006e0dd50b0d0sm4421634pfd.8.2024.02.13.13.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 13:23:23 -0800 (PST)
Message-ID: <3945a1c1-16b8-4c72-9ff9-3a3f67a6c4b9@acm.org>
Date: Tue, 13 Feb 2024 13:23:21 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RDMA/srpt: fix function pointer cast warnings
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Nicholas A. Bellinger" <nab@risingtidesystems.com>,
 linux-rdma@vger.kernel.org, target-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240213100728.458348-1-arnd@kernel.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240213100728.458348-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/24 02:07, Arnd Bergmann wrote:
> Change srpt_qp_event() to use the correct prototype and adjust the
> argument inside of it.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
