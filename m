Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D12FB0BC
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 12:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235114; cv=none; b=Xop9rIYt8YnE88AIdgt4aEGOkjD8PbZpss045hdbRD06Tla/XFIQOd9E5jNpLKK2vN9+apXDq/jJhV/6ptcrn8Cw9hVU8a25EeQxzW1tjifiTO0AfGny197OJizpf+uB55pAaScEoauGhTFfmMzTwOm/Mvm7sbR6E2p9JD1fxlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235114; c=relaxed/simple;
	bh=QKDUayNXOzOOMtKL90Ar8gIilWI2F1XfDcDNm6l/qas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSskGqFgem7dI4b4hPeRAGVkqZfocwvEQgd8YK1I/gVlhaQdgcoK6Q3OILnYak9S69aNtXoHMNpWZ+Vc1qhSIfVxJX4ll0kWgro4ihdameiCw7C7C1CbPwJEgIYTj68OwSNjGjyS0BNH1YfXwm8fQWuShjP0km+gO11NdBn40KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=SkY8bY/6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="SkY8bY/6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42420c7de22so629394f8f.1
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 05:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1759235110; x=1759839910; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p+Vv7moa0Oy84aRbbzj5eC4jA/JL5ZO57KP416IAkbw=;
        b=SkY8bY/6s977pEa3t+b7DsAZi+kkC18iNA+yK53fx3oofQr9zznPZZQFMQ+1gvL1u+
         015K+P5ZbwZbMrVOxo4fjpvL5979hrzLWK8LXCqkLTAVSjL/xh9T9ufdhu+BK6pHXHsa
         MVO275UGCKX31Pxwot6f0A88IBPcYNEz2mNgbwPScSoLiIgKTVs/N/yCXKAAaOGpNv06
         ffer/DKS3Zz1M5GtZ6u4Un212xPEdW3QW84kuCuTNt8/HzYQ5Ge3V30H7i50+dCqK3Vd
         z3dapmseuDLvXO8jyUNVGNLCv1zBHBGOTks0DX4y1FwUV+VADCAtJ1PBWw9JSIdBPpuD
         O67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235110; x=1759839910;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+Vv7moa0Oy84aRbbzj5eC4jA/JL5ZO57KP416IAkbw=;
        b=nRoA3QsdnkRqAqoM92DBHVgFJ4iAT3DItY1EPcp3ghW0wgdjJsjMPCegcoiT2OnO8F
         ITELp1taUeH+AQFLRVn/GJH/uvfd8z5tBWuYs7xxBcaoDVpYO3H6ud/CeWJIPS497tN6
         BKvu0g26vodtY0iWAju954YMIRvD5UPPcghbGo++5BOQn/efmLrY2mjXkNe+UjZU4WI6
         PrVB5qHDK/+ZHa3M6+cfLInnVKJuvH+Ta3q5S9qEAYnCjIYzDVCkEfZNMysdkjPSqvFi
         p3fEsdJAp9AncU9p+PBlpuifzinMYCpAGat5ZqbmGCjeI8kB/KBgPgHKjiyDeAvkQtMA
         vtJg==
X-Forwarded-Encrypted: i=1; AJvYcCXVVWf68ZIhqkAb3AyzRu5Cn/sYbSRwvC6j6AS+Xz/lOjc8mYvj0ZncDfX8MbXp88dp8VS1@lists.linux.dev
X-Gm-Message-State: AOJu0YwA31ThZ7qIMePHOuFopPZYQIkzkzfsixGe+1DvfjT3APOsEO9S
	r2RtU35xf54QeEIWnDRp0m1AL+dGkE0+IZltNd3w6ZQsvXyDMH+t3l/Ti1h4rgt/wcefEVzClwY
	uy9c/4Di19hqTryoh6+GVr/ZpUiqQ5Jwra1pdp9ty1z2SZh2O
X-Gm-Gg: ASbGncv6nbzHlxrLRHzY+iS34KUUgteuTSpgkZ6s37NWnOkYpMeEaO3Sq525We5PSHv
	T6bN7a4RajiB4wBsdRaFJXk41zylyisMEA1fLMJxnTHt7+Po5pH+G3IOt9ajXY8tHbb+OhkXnBb
	jLLekxnxwSwDYJ4vIPlQWXJvm1D5azydc+zFFAQWVXiaHkoWrj7y89selskRY8FCo8YBMyNM63I
	JHOYIB0fX62RigtW/VSi1on3n5dF5UwDPXWDSzqn5srOybhbnXwbg5CTdV0IvjlR8FsCNwzi0MM
	cpMrbF7X6KkWwmyujYFtRQMTHQmnHal7tS6YiZT3e2pn/XPKJZKbb6bk9zKLVSnGFLgl8dvbjf1
	ynueJz8xOOG+GgN/ihgxT69m9D2zJMLvTfP3JWkDfax+oqpwCJ83Nci2wecsi7ij0kHiop9HAbl
	FzMUeqPL0=
X-Google-Smtp-Source: AGHT+IFoY6TKItJNzGEEwi7h0krjRzVGjyFsy0vk44BWxFxzF1vlg+Lc++e5Dw5n9ZwKS/ZZqoDXyQ==
X-Received: by 2002:a05:6000:2385:b0:405:8ef9:ee6e with SMTP id ffacd0b85a97d-40e4a8f9b38mr19809866f8f.25.1759235110064;
        Tue, 30 Sep 2025 05:25:10 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:8f94:27ec:8b3:19cd? ([2001:67c:2fbc:1:8f94:27ec:8b3:19cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72facf9sm23164461f8f.13.2025.09.30.05.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 05:25:09 -0700 (PDT)
Message-ID: <9de2bdf7-b246-40e1-ba56-37a6a1e49826@openvpn.net>
Date: Tue, 30 Sep 2025 14:25:07 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5] selftest:net: Fix uninit return values
To: Sidharth Seela <sidharthseela@gmail.com>, sd@queasysnail.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, willemdebruijn.kernel@gmail.com, kernelxing@tencent.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
 justinstitt@google.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 david.hunter.linux@gmail.com
References: <20250930120028.390405-1-sidharthseela@gmail.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 xsFNBFN3k+ABEADEvXdJZVUfqxGOKByfkExNpKzFzAwHYjhOb3MTlzSLlVKLRIHxe/Etj13I
 X6tcViNYiIiJxmeHAH7FUj/yAISW56lynAEt7OdkGpZf3HGXRQz1Xi0PWuUINa4QW+ipaKmv
 voR4b1wZQ9cZ787KLmu10VF1duHW/IewDx9GUQIzChqQVI3lSHRCo90Z/NQ75ZL/rbR3UHB+
 EWLIh8Lz1cdE47VaVyX6f0yr3Itx0ZuyIWPrctlHwV5bUdA4JnyY3QvJh4yJPYh9I69HZWsj
 qplU2WxEfM6+OlaM9iKOUhVxjpkFXheD57EGdVkuG0YhizVF4p9MKGB42D70pfS3EiYdTaKf
 WzbiFUunOHLJ4hyAi75d4ugxU02DsUjw/0t0kfHtj2V0x1169Hp/NTW1jkqgPWtIsjn+dkde
 dG9mXk5QrvbpihgpcmNbtloSdkRZ02lsxkUzpG8U64X8WK6LuRz7BZ7p5t/WzaR/hCdOiQCG
 RNup2UTNDrZpWxpwadXMnJsyJcVX4BAKaWGsm5IQyXXBUdguHVa7To/JIBlhjlKackKWoBnI
 Ojl8VQhVLcD551iJ61w4aQH6bHxdTjz65MT2OrW/mFZbtIwWSeif6axrYpVCyERIDEKrX5AV
 rOmGEaUGsCd16FueoaM2Hf96BH3SI3/q2w+g058RedLOZVZtyQARAQABzSdBbnRvbmlvIFF1
 YXJ0dWxsaSA8YW50b25pb0BvcGVudnBuLm5ldD7Cwa0EEwEIAFcCGwMFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AFCRWQ2TIWIQTKvaEoIBfCZyGYhcdI8My2j1nRTAUCYRUquBgYaGtwczov
 L2tleXMub3BlbnBncC5vcmcACgkQSPDMto9Z0UzmcxAAjzLeD47We0R4A/14oDKlZxXO0mKL
 fCzaWFsdhQCDhZkgxoHkYRektK2cEOh4Vd+CnfDcPs/iZ1i2+Zl+va79s4fcUhRReuwi7VCg
 7nHiYSNC7qZo84Wzjz3RoGYyJ6MKLRn3zqAxUtFECoS074/JX1sLG0Z3hi19MBmJ/teM84GY
 IbSvRwZu+VkJgIvZonFZjbwF7XyoSIiEJWQC+AKvwtEBNoVOMuH0tZsgqcgMqGs6lLn66RK4
 tMV1aNeX6R+dGSiu11i+9pm7sw8tAmsfu3kQpyk4SB3AJ0jtXrQRESFa1+iemJtt+RaSE5LK
 5sGLAO+oN+DlE0mRNDQowS6q/GBhPCjjbTMcMfRoWPCpHZZfKpv5iefXnZ/xVj7ugYdV2T7z
 r6VL2BRPNvvkgbLZgIlkWyfxRnGh683h4vTqRqTb1wka5pmyBNAv7vCgqrwfvaV1m7J9O4B5
 PuRjYRelmCygQBTXFeJAVJvuh2efFknMh41R01PP2ulXAQuVYEztq3t3Ycw6+HeqjbeqTF8C
 DboqYeIM18HgkOqRrn3VuwnKFNdzyBmgYh/zZx/dJ3yWQi/kfhR6TawAwz6GdbQGiu5fsx5t
 u14WBxmzNf9tXK7hnXcI24Z1z6e5jG6U2Swtmi8sGSh6fqV4dBKmhobEoS7Xl496JN2NKuaX
 jeWsF2rOOARoRsrsEgorBgEEAZdVAQUBAQdAyD3gsxqcxX256G9lLJ+NFhi7BQpchUat6mSA
 Pb+1yCQDAQgHwsF8BBgBCAAmFiEEyr2hKCAXwmchmIXHSPDMto9Z0UwFAmhGyuwCGwwFCQHh
 M4AACgkQSPDMto9Z0UwymQ//Z1tIZaaJM7CH8npDlnbzrI938cE0Ry5acrw2EWd0aGGUaW+L
 +lu6N1kTOVZiU6rnkjib+9FXwW1LhAUiLYYn2OlVpVT1kBSniR00L3oE62UpFgZbD3hr5S/i
 o4+ZB8fffAfD6llKxbRWNED9UrfiVh02EgYYS2Jmy+V4BT8+KJGyxNFv0LFSJjwb8zQZ5vVZ
 5FPYsSQ5JQdAzYNmA99cbLlNpyHbzbHr2bXr4t8b/ri04Swn+Kzpo+811W/rkq/mI1v+yM/6
 o7+0586l1MQ9m0LMj6vLXrBDN0ioGa1/97GhP8LtLE4Hlh+S8jPSDn+8BkSB4+4IpijQKtrA
 qVTaiP4v3Y6faqJArPch5FHKgu+rn7bMqoipKjVzKGUXroGoUHwjzeaOnnnwYMvkDIwHiAW6
 XgzE5ZREn2ffEsSnVPzA4QkjP+QX/5RZoH1983gb7eOXbP/KQhiH6SO1UBAmgPKSKQGRAYYt
 cJX1bHWYQHTtefBGoKrbkzksL5ZvTdNRcC44/Z5u4yhNmAsq4K6wDQu0JbADv69J56jPaCM+
 gg9NWuSR3XNVOui/0JRVx4qd3SnsnwsuF5xy+fD0ocYBLuksVmHa4FsJq9113Or2fM+10t1m
 yBIZwIDEBLu9zxGUYLenla/gHde+UnSs+mycN0sya9ahOBTG/57k7w/aQLc=
Organization: OpenVPN Inc.
In-Reply-To: <20250930120028.390405-1-sidharthseela@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/09/2025 14:00, Sidharth Seela wrote:
> Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
> ovpn module")
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>

Acked-by: Antonio Quartulli <antonio@openvpn.net>

Jakub, if it's fine with you, you can pull this one directly in your tree.

Regards,


-- 
Antonio Quartulli
OpenVPN Inc.

