Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6794363C74
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 16:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294909; cv=none; b=hyiKmhOJ0ZdVMZc+J9pLj/ezcWnCUT6/b/KysWnmKsK9P3zgDYLcb8jGRX4YyvMOzMoaY5Xa0s7TLyoQ6VxKtisIn+74oDsCjn/XsGb2zv80OQRkpTfSFs8Pm9Kmad/dllFmKIsRaBBPv7K0eBEoKbAiL2JCdWJ1V2lqeIB7qxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294909; c=relaxed/simple;
	bh=3lGRAEnQMtX4zERAKSIZdMRkPZ+RvRXWmkS38F/ap7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KyhDv0ws1aYdL2OSP1t6K5KBZDCkhLlJkQeOesutreRJ/S9SYIKqfHqpCyckUUt9EfHg7Ci1Gc00EF2cPxwborGRl7Se7opkl6xEFhE3bMGzR8JHK/gPpQ61L0kE9HuYPFlfEvAG7K9qGO3XGsUIwPlGJ56s1fOOhetSDDRvnEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aSONhXct; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aSONhXct"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-654672a6d68so5140023d50.0
        for <llvm@lists.linux.dev>; Wed, 20 May 2026 09:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294906; x=1779899706;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k1YJJ1YFmprPS6ntzC8PQrKknM/3MWPFYqmao9X/xvo=;
        b=oNLhSaLUCQIhurF0qhOwxWeX3nemd0EvifKrD629b7nmXL/95srWm0YAMXnphI3dtE
         ndj+ocCyWKpWKh2tl4Qyoho2HY30IeXq3uEjzPYyOsu0xPTTZNmdXZ/eo00NqKvr7LSI
         kvtfgAjA3u2mkQmJMmLnxPGwZOkkNRrX7No2OE++/Cbc9xRqAL26EZwhaFbFVGOuddv5
         HzzaCKtNO0ySzRw3dSbZ7fCGI5uLgbIi0yeKFfvak7AtWDsGwN/K6i2lp4dl0iotrItW
         URR53V5NBs2fadYO38lZAXFh3j4+58fWpghb1whm9plRwvXCaWq6BWbB3ss8hBgy9Xfv
         Q0+w==
X-Forwarded-Encrypted: i=1; AFNElJ/IOp041dSPlsmaz7fwwvLU61k1QYASFtSqBz1NiI7EamPpz9PwNW8GR0eZde1HAqw2sLQI@lists.linux.dev
X-Gm-Message-State: AOJu0YzJDTZzxPgzg0tpXbvCj7khnX70xPeEohkWyJOaZXgx+IlbLe4W
	X+juo6TuP9hA7vAabMC3pSMaA3V8LatCeSHns4vVLcbOrnw2iP/RKU/xQdxcTXxuGGNH9m0nwKQ
	X7ZxxT7O+HZkKHjyjxQ6MYKeDn1eSJaHOiTvWJ8w51lSuiBWoAlxIK1c1cNIsDZjOQmz77zR+3P
	NzfzFF8VMH6d3ajGxJn1HutA0P0sXovj2wUgt/mm2BonVwjMWFhQ+WyYIBTG1f141/OYOPrxkM6
	qHV2xfomeqFyw==
X-Gm-Gg: Acq92OE20LWsbh0Hhro3L/ba8CpLV+AoWEBLdwCCrJPv/oVIUpxTtF+acIjnJBWgMA0
	CqBxljAY0CtveGxpgo1lfUycau0scE726+1npMS2YVG4VKU65qHy1AjPxX9bHzqX44458Yt54wO
	gaBoWUOOiAxO7lHVxXrMZfV3vU4bnqkJH9lWBg0y/NYCzcZzilS5gtvP7MiOD7sLpmAunVrmYCo
	oqKqfg0USLqpmHhCyP5aEO69Nzh/l/sjnpwIDUIrc/nr0u9yf1Ygaf3DTLucYCU7bxqCpv+sGV/
	jyFJQnP6mbgFl9JxIMgMt3zRShcRu1ZeheeeZC4RBAYLs+sPGdqWepHm7DSBF5nDoH4CTM0fccj
	Gs/aWtmioQ74bVY/ufmGwPajyWiW3XLE2e4ZJ7b9gU+jH6z3TZJxOxDm+mHhn1XHdpE7mp49F1u
	KsHEtefJey0pkYLFukijDsV1Y1byVJL4lrk85kT1W4bigfDLS7hzGmeKIwUjGbvw==
X-Received: by 2002:a05:690e:1699:b0:650:88fa:f5e5 with SMTP id 956f58d0204a3-65e2289490bmr25399303d50.59.1779294906517;
        Wed, 20 May 2026 09:35:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65e0d867f76sm1576911d50.2.2026.05.20.09.35.06
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2026 09:35:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1353bfdbf99so8167175c88.0
        for <llvm@lists.linux.dev>; Wed, 20 May 2026 09:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779294905; x=1779899705; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k1YJJ1YFmprPS6ntzC8PQrKknM/3MWPFYqmao9X/xvo=;
        b=aSONhXctSCQ88l8Hi/bqB5I9bZSawLfPQc8A2iDpw8hxTohM9TSN75ZHzrPjnNQVwJ
         xKo1I9A7SGdxLWMSOIFrzGLtqgAbNYpEjuJnJllWioKtNqfGls+gjvX/4+j2GwVVCgVO
         l7PaPd+s0EjFoG/OVEmPPPbyZTgduBxsdue38=
X-Forwarded-Encrypted: i=1; AFNElJ8Gd2175qk7ARlKSrOhfb/AMTaE61ZZnOv77dixtT7xz1bd32JVMw25XxBYBzXaZatTyikJ@lists.linux.dev
X-Received: by 2002:a05:7022:607:b0:133:3c47:932e with SMTP id a92af1059eb24-1350494e402mr11987637c88.28.1779294905258;
        Wed, 20 May 2026 09:35:05 -0700 (PDT)
X-Received: by 2002:a05:7022:607:b0:133:3c47:932e with SMTP id a92af1059eb24-1350494e402mr11987597c88.28.1779294904668;
        Wed, 20 May 2026 09:35:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ed3sm27311954c88.1.2026.05.20.09.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 09:35:04 -0700 (PDT)
Message-ID: <6541a5f4-a150-44b9-af27-8712cdafc1ae@broadcom.com>
Date: Wed, 20 May 2026 09:35:02 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable 6.1 v2 5/5] perf build: Remove
 -Wno-unused-but-set-variable from the flex flags when building with clang <
 13.0.0
To: stable@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-kernel@vger.kernel.org>,
 "open list:BPF [MISC]" <bpf@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>,
 bcm-kernel-feedback-list@broadcom.com
References: <20260520163320.3073037-1-florian.fainelli@broadcom.com>
 <20260520163320.3073037-6-florian.fainelli@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20260520163320.3073037-6-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 5/20/26 09:33, Florian Fainelli wrote:
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> clang < 13.0.0 doesn't grok -Wno-unused-but-set-variable, so just remove
> it to avoid:
> 
>    error: unknown warning option '-Wno-unused-but-set-variable'; did you mean '-Wno-unused-const-variable'? [-Werror,-Wunknown-warning-option]
>    make[4]: *** [/git/perf-6.5.0-rc4/tools/build/Makefile.build:128: /tmp/build/perf/util/pmu-flex.o] Error 1
>    make[4]: *** Waiting for unfinished jobs....
> 
> Fixes: ddc8e4c966923ad1 ("perf build: Disable fewer bison warnings")
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Link: https://lore.kernel.org/lkml/ZNUSWr52jUnVaaa%2F@kernel.org/
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Change-Id: I8db8a372d1e83d26fbe8beda2bcf4d1a871a2b80

Argh, sorry the Change-Id snuck in there, let me know if you need me to 
resubmit.
-- 
Florian
