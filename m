Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132F1F6690
	for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 17:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729013438; cv=none; b=lmAnc25e4WqtD2A00cgERIFHvxCJQRgPMAiI9SDIL0xMHqaLbR+RAxY+wJUhGjj23p94cf8VWuoSpuvqKDZJNYMIuQ6LcRL2NPcebkbZnytke5ckrK4sQ2RK5c26GgyJMEKpuTXyzFIGqoz4Aim/GBPVhAPcBgp4qJAkZQY9Szg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729013438; c=relaxed/simple;
	bh=fPoINJewr4rZ2fD0i2SvcxTzuhA/UFayJmMdvI3vclc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhitP50QzXtPbyVPu7SA9ir0N+Ip4kY6ArkJdc/rIYUIXYwQyXInmcA+E/uQm6MKXvtpSXLdXwG5tRqJ0tt4LhyKRWzGJtvjUj2YuuOmXdUGR0JinD7sA2VQkGIOgA5pzk8M+mDO9nZa4KBr0pAgXCreC7rqtAayPuanHfGVXTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XlItF3/5; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XlItF3/5"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4603ee602a0so45376911cf.2
        for <llvm@lists.linux.dev>; Tue, 15 Oct 2024 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1729013436; x=1729618236; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=32F43aWFFhVGx2UIPkft94nsDcd5w72khuVk+0067EI=;
        b=XlItF3/5/zC9D+aWGv8CoL6drAG5cL5wkqeC2qSCTy0mafnjy2xXH1tgfnT3usncij
         vveSLkXuB/mC2tcnidS+sPBrfdr1hpNmz7AIFhYnPqJA5uIQpPry7dp4bZ1GuSF6l67j
         Tws9Ly4IeVEX481kHUqRsQvsEjTXPNhKok/Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729013436; x=1729618236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32F43aWFFhVGx2UIPkft94nsDcd5w72khuVk+0067EI=;
        b=tXgBKy8TYfgRcabq1Yn4127djpL/KriZdrZ4VKn27hzmLOV3kvwkcNIVNhe/76XoGy
         icm1+JMlDF0TEaJTrB/dfmVrmLpjmnldb364zlOCPPNAPZFU2ri0biJe5tPT/hYRa/zO
         UTSKAmlEEvOZSsdf8jbSkaZCBeSbaWUDIkB6IopMhZguLSE1SVnGLpM/zB/wKvyW/Cw+
         HMqIRPdHujKb0H6rYFjT4Po/xoX2goziMlCArqpSeJLbcOYCbrv5jZBrb+Q8CwjHy7Fr
         /E/gi8svKIBrXETg6Ric831foXMOFOboyjfEJmipaw+zJWGn6DtPMQXC2xdQHlTCisCi
         b9og==
X-Forwarded-Encrypted: i=1; AJvYcCUJppzqns32hMAfZ+MbOc0qStBqypccc1UjCMFi4guplrCTMo37GYZKtrR58jITMsZCl3o0@lists.linux.dev
X-Gm-Message-State: AOJu0YytdNoSdo8QnBi4iHgLAIr1iK8pt2+W9Mh57mUC3bTO/82gkvq5
	4pyFGDLNr4GjkXE/xKavVLk2msUhk9g5+8Xs2GBIAc8LaCypEdM1dVxKSph5FQ==
X-Google-Smtp-Source: AGHT+IHELpbG7H9Sua7HCjciXrVYE/ELUIdGP3K1aU0Bv5OvRhFzrOOMBo7qamKP9usHie3DBAUdbw==
X-Received: by 2002:a05:622a:17c4:b0:45d:a196:b321 with SMTP id d75a77b69052e-4604bbcccf0mr237508761cf.32.1729013435935;
        Tue, 15 Oct 2024 10:30:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b37ba97sm8677491cf.63.2024.10.15.10.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 10:30:35 -0700 (PDT)
Message-ID: <e3a61540-714a-4f57-a3c4-c0f333e16a07@broadcom.com>
Date: Tue, 15 Oct 2024 10:30:32 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net: systemport: Remove unused txchk accessors
To: netdev@vger.kernel.org
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:" <llvm@lists.linux.dev>
References: <20241015172458.673241-1-florian.fainelli@broadcom.com>
 <20241015172458.673241-2-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20241015172458.673241-2-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/24 10:24, Florian Fainelli wrote:
> Vladimir reported the following warning with clang-16 and W=1:
> 
> warning: unused function 'txchk_readl' [-Wunused-function]
> BCM_SYSPORT_IO_MACRO(txchk, SYS_PORT_TXCHK_OFFSET);
> note: expanded from macro 'BCM_SYSPORT_IO_MACRO'
> 
> warning: unused function 'txchk_writel' [-Wunused-function]
> note: expanded from macro 'BCM_SYSPORT_IO_MACRO'
> 
> warning: unused function 'tbuf_readl' [-Wunused-function]
> BCM_SYSPORT_IO_MACRO(tbuf, SYS_PORT_TBUF_OFFSET);
> note: expanded from macro 'BCM_SYSPORT_IO_MACRO'
> 
> warning: unused function 'tbuf_writel' [-Wunused-function]
> note: expanded from macro 'BCM_SYSPORT_IO_MACRO'
> 
> The TXCHK block is not being accessed, remove the IO macros used to
> access this block. No functional impact.
> 
> Reported-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Forgot to remove the tbuf accessor here as well, will post again in 24hrs.
-- 
Florian
