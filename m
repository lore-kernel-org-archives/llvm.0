Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A53101A2
	for <llvm@lists.linux.dev>; Fri, 20 Mar 2026 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774033478; cv=none; b=ffGSnsVqz9xwmfuioIhHWNdQykLF5/wO0dzV8HnQVGyzsDglqYTxssPmmgW5UONyGtrZufJDey8Yyb9kIGhQsX/L0Yxe0xecFw3xn54M5P/EESrIYkpsoy6rUivjCeanjH+I8RCMPDO0Zv9Onc/A47a/qV+wV4ezOkR7XvwOVIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774033478; c=relaxed/simple;
	bh=y4xjiVBHeQF5JqZbrncshkWLcltuy9g0ZxsUn3RToTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dSNKnM4fWTmHsr481yG3i/2BFBJ8F5AP7rhei2hwut5FCFBgQzU70Vhiqn3RxdD/zFJaXQm+EmcI6dsbqf5QzXX8W16ItlE+LCTlK9AJCtRnXxfcpiRaCLHS1ibxeQVz34GpWu3I2h+oA/2Mxp1ab865Lr1/nnS/BgJk6kuRBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EszzBtWR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EszzBtWR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so1905764f8f.3
        for <llvm@lists.linux.dev>; Fri, 20 Mar 2026 12:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774033476; x=1774638276; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rU8hROsash8pjNenSuRQmTzxfx2+/q618jsTqv5sedE=;
        b=EszzBtWRbDP2uQ62QeV4NMioSoPYrBpHFL5j7HO0kTaMWiXH4PaD0bsCCcxMNrWp/C
         0Y9bPsxs6vKC3DYb3b+1bUY3deDPGMuvXON3ACwnDHhNbxvD95JGCp3nHhWppdkhrKL6
         WUwmNuSfpSd6EnIYT2Ty4/JHnqMfQrVH8o4VKQpWrr2qYpEgZPkcf/pWzpp2ib76HPtr
         RJ3IZfm1Xf1mfbrfzQeHcJonvQ3JRiuo7EaN+a4BucVur2fompFZIuamlrjitdog7qiV
         KOqzKN7MXf+6XkWRQfJjYY5OkgmbW9AWFIpPRAqOKB5Ar7//h6yDoNc6IW4Vt5I/SP2x
         EtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774033476; x=1774638276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rU8hROsash8pjNenSuRQmTzxfx2+/q618jsTqv5sedE=;
        b=beOFiUFWogD6pF0+UjCiNAN95p5nBjHIyQflvdLXQWcxfF9avb0H+l617YIHea0iVg
         BnfTmCmJBq6HjnU6pFXpO7wGvn7nCIpQfCcBrlOQkvoL/IhTr2BSKH7toCYW3kZIPSdP
         yQ9sHcPHNXlwGXqQ9yTr/nQlzRGD0oAJ1brZJ9HXhV4wJvg3L7mI/IQHoFB4bcKK63Xp
         t+kWhyLBwtLOfWiwFAlgYkY0SA7+zDn7ns/t0qgf5EPXMfD8n+5W/EgBAhxJnbdLDe0o
         W5looA+skv4gxRXAFO/XCsHoUtU3SaQn85f7/pXlDmYvYXQB1xv7xE0smYX/fng+LQMQ
         yUSA==
X-Forwarded-Encrypted: i=1; AJvYcCX7vBNxIi+I1BSawTMcSPSV6KeV2pxo/BdrW6XDOVLXUNX8OzeVisg8XbrVD8/1Uw4ZQzE2@lists.linux.dev
X-Gm-Message-State: AOJu0YywmMVHlXAlYvi62bwV1/0Iu56RBa9k2pGXRCag1L3mA60T6eyI
	MVWj69zai429LnE2NUlqnRbY78+8dVFeTwqmEdqYz2En40+z7IQg1rSi
X-Gm-Gg: ATEYQzwKCnxNBsed3JxCUidVOfNZ9ZLisx55qeiNs8RhVXj4ft+r2E5H21qyS/wyBHg
	OPc6c3aEkaniywVGHdSB9hsz2I5VfNcJz7AiOH/NEuFS21l0oN9ZKZWVyojGUC4bkgDVPuuJ9Kt
	32d40nQHRWYyClNp1Xg4AjXAdc/LLaGVsaI27nqKrMqyNy7T2haZuSI7pHwtCMfl4R60vQFQ+YD
	RISrTnS9W8xVuCEattlrFgIdkLYv2p7nVV3sY3NcNQcpStaXd2IesJ3lXIPgDxctqLwBgzSmqd8
	Fh6XvF26YfyvLfchqDkLnTfFn/GQrRTulwP07tVgMtb7LGXD61EKQoj6I1K6krFU3rYsE+oGZrK
	HtyOkhDehbyJ7jhfmVtYFvwqQiK7Kqimzq3oXFlwo3Zd3R5zWJ6QACO9sHpHdpQByX/FhaIDwcu
	b/UcN2bKio86fYb5J1oDARHZBM2JmOUTtdmiUxikZXeqcJoDPbYh+6YQhbFFP4V57wVLKhSQ97B
	mac3iKg8651PXQe4RiiMVS+
X-Received: by 2002:a05:6000:2407:b0:439:b3d2:3766 with SMTP id ffacd0b85a97d-43b6423fc13mr8053476f8f.19.1774033475555;
        Fri, 20 Mar 2026 12:04:35 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm9802710f8f.12.2026.03.20.12.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 12:04:35 -0700 (PDT)
Message-ID: <90a03d3c-def3-4e34-89a0-6e952d3b0d7a@gmail.com>
Date: Fri, 20 Mar 2026 19:04:33 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: sfc: avoid format string warning
To: Arnd Bergmann <arnd@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Jeff Garzik <jgarzik@redhat.com>,
 Ben Hutchings <bhutchings@solarflare.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Brett Creeley <brett.creeley@amd.com>, Breno Leitao <leitao@debian.org>,
 Kees Cook <kees@kernel.org>, netdev@vger.kernel.org,
 linux-net-drivers@amd.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260320151924.3474821-1-arnd@kernel.org>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20260320151924.3474821-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/03/2026 15:19, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Three sfc drivers contain the same *_fill_test() function that takes
> a format string argument that gets passed down to snprintf(), producing
> a warning with clang-22:
> 
> drivers/net/ethernet/sfc/falcon/ethtool.c:227:60: error: diagnostic behavior may be improved by adding
>       the 'format(printf, 7, 8)' attribute to the declaration of 'ef4_fill_test' [-Werror,-Wmissing-format-attribute]
>   210 |                 snprintf(test_str, sizeof(test_str), test_format, test_id);
>       |                                                                          ^
> drivers/net/ethernet/sfc/falcon/ethtool.c:210:13: note: 'ef4_fill_test' declared here
> 
> Rework these to take a varargs based test_format that allows better
> type checking and avoids this warning.
> 
> Fixes: 3273c2e8c66a ("[netdrvr] sfc: sfc: Add self-test support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I'm not convinced this is an improvement.  The function takes *two* printf
 format strings (unit_format and test_format), and this only annotates and
 varargs-ifies one of them (and doesn't harden the unit_format, which has
 the considerably more worrying-looking "if it has a % in, assume it takes
 precisely one int argument").
So it may make things 'look' hardened enough to satisfy the compiler
 warning, but that just hides the unsafety and might sucker future
 developers into thinking "oh, the compiler knows about the format strings
 so I don't need to check it by hand".
I'm not sure what a proper fix would look like — possibly a rewrite adding
 a separate efx_fill_test_perq() function for the cases with a nontrivial
 unit_format, baking in the knowledge that the format is always "foo%d"
 for some constant string foo and thus we don't actually need to pass in
 an arbitrary format string.

> -static void efx_fill_test(unsigned int test_index, u8 *strings, u64 *data,
> -			  int *test, const char *unit_format, int unit_id,
> -			  const char *test_format, const char *test_id)
> +static void __printf(7, 8)
> +efx_fill_test(unsigned int test_index, u8 *strings, u64 *data,

I don't like splitting the specifiers/return type from the function name
 like this.  It's not Linux style[1].
(From a quick poke around the tree, there seems to be less consensus on
 where the __printf attribute goes — some put it on its own line before
 `static`, some would put it between `static` and `void`… sigh.)

-Ed

[1]: https://lore.kernel.org/all/1054519757.161606@palladium.transmeta.com/T/#u
