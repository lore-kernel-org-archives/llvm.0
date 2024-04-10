Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1B1779B4;
	Wed, 10 Apr 2024 17:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712770117; cv=none; b=PN9dTUoqbP377uYjcXU8hXKmrODjeDJi4jK1cgFBmlfICL3HhCxMkXQMerjgXze78RXKk+gCxdM8HNMoUkD6ubI6UpIjC3OR5wjIIKxV3rKkdpNlX/9BoKZSwbWHysfLu0x0Ihcur3J+z3guBh5GeCugKP4icIJbmeGKSVpZ9hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712770117; c=relaxed/simple;
	bh=f3Xt/dZfBXBIQcYbl1nJPSnlAT4JgWHq8FYToJaQzHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuJE48+lehAu8XxLjUSwNPTEpaVG3gPP7r1F11oBoU1AQpP93/Gz6dmyKIJBQJXpsI+m76AJXjH/GkWXZkSOJAQNPrWZ1KV8RqruSljutMBitW2AIExUh5uaqGhv0fjQ1sQlnv/9KD8XkCIScOq82Tab+qCJFuvm5xrpKnm0LL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgLN9dn+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgLN9dn+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6ed112c64beso3495927b3a.1;
        Wed, 10 Apr 2024 10:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712770115; x=1713374915; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq4d+AiOVD5bmBrgseTVTs7156g17/GtSiUjyHq5BcM=;
        b=CgLN9dn+wwpPVmW6vNiBsEiehBvl1JvRB826uhksCzDoFfsdNOIhWX8H8fJxrX9HC+
         NyyFWT0HGVcF1iJU4jNyHGjPPW77AvWhfnMJIXTdTT0unhEg//beEwpzIMRciEreWS6k
         Cfa+qoL+YghpJWhxu7U6L4q8mw+5Hh4Fr0/LpHRPYHjsUsyzv5CLRd36loRInkK30Xfo
         a6FA8otCTnRqLANuSGzV2B6ZwznAPYmyAqRQvWbrFf/xqn83VSaDw6KYUYKR1uEZRh4k
         3U8zikj4XoeKJ4O09/2jiXuy7uTE+ZTETA4oO6UTliihP3QgFy5mRVStZ1fAf8JfnJiT
         SFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712770115; x=1713374915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zq4d+AiOVD5bmBrgseTVTs7156g17/GtSiUjyHq5BcM=;
        b=gT3S9C2nJB49nA/YooEwu1iSZPVztMOA/sm1O+/HAb7S2fk56iRpxUwhKiZC4ch+A0
         uEC9uK7LIj9UGDA64+N8blHWSmeTKXJ1jNc8NrX7FdwspQRteA4NTSAnm0oaJ1ZwdCdT
         AoFYn6Wj/TfvyF6LCyd0oPGtMtRAiuPkfVDjBmfC8JowvpHdwl7Ujz6BUhRxRsW8iOOv
         ewNc67bvCBx9XyXPNYN9Nr99dCsEE9B1xgeK8fj94pQ4I6pz/BDr+v+ZnCgxDFImpurC
         RHklZ0rqQ/hTcR4gKjpqXUIqWZgQW1mLOJhSQNVAUtsT73QCTwz7uQigT1k54C2Lvy+q
         mW0g==
X-Forwarded-Encrypted: i=1; AJvYcCW3CMz3noyonw2dRW6LrWwl0lyp1QTD6hrL+8X1TUIrqPlcPxbyQlKldN+qp8kz143aj3bMwjgg3apVoOasmM3OJzXloWSB5Qxd2jwtqMSVYkml4p+5amznYO0luKaMEHhl0bo=
X-Gm-Message-State: AOJu0Yzdz7bhiYcNbBBHEcc7gZKYgjINK1+jpB+1us4GdpmMcFbLi8Ex
	UCjG7oQ9UyCXDGapBuW9oD9qaWZmgBHK9g935bfWhiF59cKQeZd6
X-Google-Smtp-Source: AGHT+IGIHil3mApRP9h1oyA+lEyfdCYJsOMLxEB1v3XLb5vQtFzdv6rWoHVqJv60PpJI2f5a5ZjGEg==
X-Received: by 2002:a05:6a00:803:b0:6eb:40:6bff with SMTP id m3-20020a056a00080300b006eb00406bffmr3877766pfk.14.1712770114852;
        Wed, 10 Apr 2024 10:28:34 -0700 (PDT)
Received: from [10.230.29.214] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f21-20020a63dc55000000b005ce472f2d0fsm10064336pgj.66.2024.04.10.10.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:28:34 -0700 (PDT)
Message-ID: <db4d4a48-b581-4060-b611-996543336cd2@gmail.com>
Date: Wed, 10 Apr 2024 10:28:31 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next:main 26/50] net/ipv4/tcp.c:4673:2: error: call to
 '__compiletime_assert_1030' declared with 'error' attribute: BUILD_BUG_ON
 failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_txrx)
 - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_...
To: Eric Dumazet <edumazet@google.com>, Vladimir Oltean <olteanv@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
References: <202404082207.HCEdQhUO-lkp@intel.com>
 <20240408230632.5ml3amaztr5soyfs@skbuf>
 <CANn89iJ8EcqiF8YCPhDxcp5t79J1RLzTh6GHHgAxbTXbC+etRA@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 xsDiBEjPuBIRBACW9MxSJU9fvEOCTnRNqG/13rAGsj+vJqontvoDSNxRgmafP8d3nesnqPyR
 xGlkaOSDuu09rxuW+69Y2f1TzjFuGpBk4ysWOR85O2Nx8AJ6fYGCoeTbovrNlGT1M9obSFGQ
 X3IzRnWoqlfudjTO5TKoqkbOgpYqIo5n1QbEjCCwCwCg3DOH/4ug2AUUlcIT9/l3pGvoRJ0E
 AICDzi3l7pmC5IWn2n1mvP5247urtHFs/uusE827DDj3K8Upn2vYiOFMBhGsxAk6YKV6IP0d
 ZdWX6fqkJJlu9cSDvWtO1hXeHIfQIE/xcqvlRH783KrihLcsmnBqOiS6rJDO2x1eAgC8meAX
 SAgsrBhcgGl2Rl5gh/jkeA5ykwbxA/9u1eEuL70Qzt5APJmqVXR+kWvrqdBVPoUNy/tQ8mYc
 nzJJ63ng3tHhnwHXZOu8hL4nqwlYHRa9eeglXYhBqja4ZvIvCEqSmEukfivk+DlIgVoOAJbh
 qIWgvr3SIEuR6ayY3f5j0f2ejUMYlYYnKdiHXFlF9uXm1ELrb0YX4GMHz80nRmxvcmlhbiBG
 YWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+wmYEExECACYCGyMGCwkIBwMCBBUCCAME
 FgIDAQIeAQIXgAUCVF/S8QUJHlwd3wAKCRBhV5kVtWN2DvCVAJ4u4/bPF4P3jxb4qEY8I2gS
 6hG0gACffNWlqJ2T4wSSn+3o7CCZNd7SLSDOw00ESM+4EhAQAL/o09boR9D3Vk1Tt7+gpYr3
 WQ6hgYVON905q2ndEoA2J0dQxJNRw3snabHDDzQBAcqOvdi7YidfBVdKi0wxHhSuRBfuOppu
 pdXkb7zxuPQuSveCLqqZWRQ+Cc2QgF7SBqgznbe6Ngout5qXY5Dcagk9LqFNGhJQzUGHAsIs
 hap1f0B1PoUyUNeEInV98D8Xd/edM3mhO9nRpUXRK9Bvt4iEZUXGuVtZLT52nK6Wv2EZ1TiT
 OiqZlf1P+vxYLBx9eKmabPdm3yjalhY8yr1S1vL0gSA/C6W1o/TowdieF1rWN/MYHlkpyj9c
 Rpc281gAO0AP3V1G00YzBEdYyi0gaJbCEQnq8Vz1vDXFxHzyhgGz7umBsVKmYwZgA8DrrB0M
 oaP35wuGR3RJcaG30AnJpEDkBYHznI2apxdcuTPOHZyEilIRrBGzDwGtAhldzlBoBwE3Z3MY
 31TOpACu1ZpNOMysZ6xiE35pWkwc0KYm4hJA5GFfmWSN6DniimW3pmdDIiw4Ifcx8b3mFrRO
 BbDIW13E51j9RjbO/nAaK9ndZ5LRO1B/8Fwat7bLzmsCiEXOJY7NNpIEpkoNoEUfCcZwmLrU
 +eOTPzaF6drw6ayewEi5yzPg3TAT6FV3oBsNg3xlwU0gPK3v6gYPX5w9+ovPZ1/qqNfOrbsE
 FRuiSVsZQ5s3AAMFD/9XjlnnVDh9GX/r/6hjmr4U9tEsM+VQXaVXqZuHKaSmojOLUCP/YVQo
 7IiYaNssCS4FCPe4yrL4FJJfJAsbeyDykMN7wAnBcOkbZ9BPJPNCbqU6dowLOiy8AuTYQ48m
 vIyQ4Ijnb6GTrtxIUDQeOBNuQC/gyyx3nbL/lVlHbxr4tb6YkhkO6shjXhQh7nQb33FjGO4P
 WU11Nr9i/qoV8QCo12MQEo244RRA6VMud06y/E449rWZFSTwGqb0FS0seTcYNvxt8PB2izX+
 HZA8SL54j479ubxhfuoTu5nXdtFYFj5Lj5x34LKPx7MpgAmj0H7SDhpFWF2FzcC1bjiW9mjW
 HaKaX23Awt97AqQZXegbfkJwX2Y53ufq8Np3e1542lh3/mpiGSilCsaTahEGrHK+lIusl6mz
 Joil+u3k01ofvJMK0ZdzGUZ/aPMZ16LofjFA+MNxWrZFrkYmiGdv+LG45zSlZyIvzSiG2lKy
 kuVag+IijCIom78P9jRtB1q1Q5lwZp2TLAJlz92DmFwBg1hyFzwDADjZ2nrDxKUiybXIgZp9
 aU2d++ptEGCVJOfEW4qpWCCLPbOT7XBr+g/4H3qWbs3j/cDDq7LuVYIe+wchy/iXEJaQVeTC
 y5arMQorqTFWlEOgRA8OP47L9knl9i4xuR0euV6DChDrguup2aJVU8JPBBgRAgAPAhsMBQJU
 X9LxBQkeXB3fAAoJEGFXmRW1Y3YOj4UAn3nrFLPZekMeqX5aD/aq/dsbXSfyAKC45Go0YyxV
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <CANn89iJ8EcqiF8YCPhDxcp5t79J1RLzTh6GHHgAxbTXbC+etRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/8/2024 10:08 PM, Eric Dumazet wrote:
> On Tue, Apr 9, 2024 at 1:06 AM Vladimir Oltean <olteanv@gmail.com> wrote:
>>
>> Hi Eric,
>>
>> On Mon, Apr 08, 2024 at 10:49:35PM +0800, kernel test robot wrote:
>>>>> net/ipv4/tcp.c:4673:2: error: call to '__compiletime_assert_1030' declared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_txrx) - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_write_txrx) > 92
>>>> 4673                CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_sock_write_txrx, 92);
>>
>> I can confirm the same compile time assertion with an armv7 gcc 7.3.1 compiler.
>> If I revert commit 86dad9aebd0d ("Revert "tcp: more struct tcp_sock adjustments")
>> it goes away.
>>
>> Before the change (actually with it reverted), I can see that the
>> tcp_sock_write_txrx cacheline group begins at offset 1821 with a 3 byte
>> hole, and ends at offset 1897 (it has 76 bytes).
> 
> 
> ...
> 
>> It gained 20 bytes in the change. Most notably, it gained a 4 byte hole
>> between pred_flags and tcp_clock_cache.
>>
>> I haven't followed the development of these optimizations, and I tried a
>> few trivial things, some of which didn't work, and some of which did.
>> Of those that worked, the most notable one was letting the 2 u64 fields,
>> tcp_clock_cache and tcp_mstamp, be the first members of the group, and
>> moving the __be32 pred_flags right below them.
>>
>> Obviously my level of confidence in the fix is quite low, so it would be
>> great if you could cast an expert eye onto this.
> 
> I am on it, do not worry, thanks !

Also just got hit by this on an ARMv7 build configuration as well.

Jakub, I do not see a 32-bit build in the various checks being run for a 
patch, could you add one, if nothing else a i386 build and a 
multi_v7_defconfig build would get us a good build coverage.

Thanks!
-- 
Florian
