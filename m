Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595FB3EA942
	for <llvm@lists.linux.dev>; Tue, 19 May 2026 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779218999; cv=none; b=EU7/yNC2aTAI3/qeEss14ikz1na3JGFkoWeNTcX61omYQsHi15pPNskNcv6xuDiANq1UvlXX6xSMar45jSJoVUGflX1mf7Bwip74I4AiqL1xf8zs7EfYoOoSRYYu5hHc39lG96fNk2CnKgPlQxfDqmm8apIlTmp8qyZzzthJGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779218999; c=relaxed/simple;
	bh=YPcRiw4Tsr2KvMmATm06qRml6/4p3sbblnDe0qTV42Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FzZnzEHy6GiwEy81a6KvnAHpxREmbGtwRUkMUSRc15At8Czws5zGZJ3DmtUxe6EJdFzW0bAML+Z6mhi8iFVi/UpObxdsMTVe/yYAVMC1Lc8w/R26f9J3ZSvpLGyjKJLKhpS394I5swUCbHtYFxNwBIBU05dX6gitSnrfZKHwfVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Q9E03S5H; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Q9E03S5H"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-65dbe04fc1bso4239281d50.1
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 12:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218995; x=1779823795;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOwWa+Njguq/yZzIYzDdMRRevQFxklUNPfoFyUumtAI=;
        b=azkpOAqbf2QWpc2NwnQjOHgcFol9TW62mP2B08lCjKu7+5TerFhp3AaK9ppNLruba3
         bO+2PhXXWEMPVt4//Pit4+0sj+vTBXBE3WQh0dNhCZQks867nKWEw1I1ifbC5OnNYntC
         m471Xsvjv1Dp6Wxi5PlVDcYIs7ClA3HXdxAnafx0woxeBDqGbx4PGOFXJOHMSQK1AH0B
         WkS8leK+YlAWVRp/zEg98UWaP9wXNhiZelaBLjAA228n985tlHF/NTGzsTXnEGJaAZuA
         Qep2UFIv0xuxVdSJbpKSb6bmibcfn0QBCy5ZKLG7i0fPldM9dD458ivjfqtaE/pnRn6K
         OVyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WZrXAr1FnCJqfPX0MwWis2v4Cq/OcEwtCcoc2tO+SNR12AqlB+q0PfcpNcfcas+BdGI9F@lists.linux.dev
X-Gm-Message-State: AOJu0YyYPpTS76Z1zbIm4rKYj0oknRA/NBAJS/PEyEz9t7+HuaWCxJRF
	Cp+tCUnhJBlFCPgt5vqS4d3HvdujShTQtVh2mTWrFswdABwD/z8o5ZAnqSJUOum33RfGtq39dIG
	9BlsgiG5V3DM3tVoDn7AjRu2CIwuGWAPekhjj4nBWtMzNkcq+yAaK+y1UvO+YhfusEnwEAigK4x
	Z+ID2d2CV0nbkAh2Pd14pFAiOcrPsNnhTpdfKGm4kwwFAWS9VTGgFADTbqwNKbn9l6jTUUgTjxy
	Qb3zzjKpf4maQ==
X-Gm-Gg: Acq92OG+B2oFQXoo/QD9kOGdYzgIQdYfwirYu2gTyM2QMekUu4sMFdO5PvxClB7Rky/
	L8FbTo0n5HIZMKg9U4DHURdKULBhiWhv5I4C5v0J1637iiyStJfOoSjkhkbhqFNzyIy0pwxPdIo
	GU+688srI3QqxTvtgPtKWlg/88map9mVWqOMsqdrPGN4xSePobGYv9iS28Qz63oV0TX709ZY2SF
	AL8kL46LrR4TCUsfM3w+wD3JTZrnxn6+Z0zubRXiE7UWZATYGA8A4orV/hpmbcCPkvjTN1xhCfc
	MwysIbMRB8iFXhvq6iEQpx3dSFyMvx0sFB9BXH0zi21a24tMNADVzch3J537MKTklyWIq5ldiV8
	H6w8kCum9zGo2fIYrB4OoHpSThoSqviix6z29qisaOz5Gd2EAlW3G3dOmD/PlmGq8Eb1VXIx3P2
	2CxeT5d/ebaw==
X-Received: by 2002:a53:d015:0:b0:65c:391:4553 with SMTP id 956f58d0204a3-65e2264f62amr19215715d50.2.1779218995028;
        Tue, 19 May 2026 12:29:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65e85e73587sm104984d50.0.2026.05.19.12.29.54
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 May 2026 12:29:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45e73a4f1dfso2528761f8f.0
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 12:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1779218993; x=1779823793; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HOwWa+Njguq/yZzIYzDdMRRevQFxklUNPfoFyUumtAI=;
        b=Q9E03S5HHTzKx0hZ0NsbLxgCDYaSkFO/guaGBo1PvVZlGOQutjPMurnQMUgdKohnPu
         xb7o1AqFkU6VKm5Rz/l20M4c+cERNIJYBzhCPVrM/VHNpE3dv8Ff3XAnWutedGvKmfe2
         QWbzLBb3H86YGVgEJ5PXN3R7nhKKnm0K3Tz4g=
X-Forwarded-Encrypted: i=1; AFNElJ9/vsl/gThJaz7+kFKEW2t+1uOLex7cvI1ICCQO7OkrF7osqbbO99bzDdJeAFc5R989OSdr@lists.linux.dev
X-Received: by 2002:a05:6000:2c0f:b0:45e:9323:63ad with SMTP id ffacd0b85a97d-45e93236594mr661949f8f.36.1779218993469;
        Tue, 19 May 2026 12:29:53 -0700 (PDT)
X-Received: by 2002:a05:6000:2c0f:b0:45e:9323:63ad with SMTP id ffacd0b85a97d-45e93236594mr661909f8f.36.1779218993060;
        Tue, 19 May 2026 12:29:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe2464sm49304372f8f.32.2026.05.19.12.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 12:29:52 -0700 (PDT)
Message-ID: <5b6063d2-a57f-4a8a-9b1f-9cc8ab4cf175@broadcom.com>
Date: Tue, 19 May 2026 12:29:42 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable 6.1 0/3] perf build fixes
To: Ian Rogers <irogers@google.com>
Cc: stable@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-kernel@vger.kernel.org>,
 "open list:BPF [MISC]" <bpf@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT" <llvm@lists.linux.dev>,
 bcm-kernel-feedback-list@broadcom.com
References: <20260519185154.2987285-1-florian.fainelli@broadcom.com>
 <CAP-5=fUuhNRj2Dwz9FmMnWKwXjM3RCFV1oQKO4e3X20EOHstEg@mail.gmail.com>
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
In-Reply-To: <CAP-5=fUuhNRj2Dwz9FmMnWKwXjM3RCFV1oQKO4e3X20EOHstEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 5/19/26 11:55, Ian Rogers wrote:
> On Tue, May 19, 2026 at 11:51 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> This patch series contains "perf" build fixes specific to 6.1. We have
>> seen occasional build failures in our CI looking like these:
>>
>> util/parse-events-bison.c: In function 'yy_symbol_print':
>> util/parse-events-bison.c:901: error: unterminated #if
>>    901 | #if YYDEBUG
>>        |
>> util/parse-events-bison.c:1020:62: error: '_p' undeclared (first use in this function)
>>   1020 |   yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp, _parse_state, scanner);
>>        |                                                              ^~
>> util/parse-events-bison.c:1020:62: note: each undeclared identifier is reported only once for each function it appears in
>> util/parse-events-bison.c:1020:64: error: expected ')' at end of input
>>   1020 |   yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp, _parse_state, scanner);
>>        |                         ~                                      ^
>>        |                                                                )
>>   1021 |   YYFPRINTF (yyo, ")");
>>        |
>> util/parse-events-bison.c:1020:3: error: too few arguments to function 'yy_symbol_value_print'
>>   1020 |   yy_symbol_value_print (yyo, yykind, yyvaluep, yylocationp, _parse_state, scanner);
>>        |   ^~~~~~~~~~~~~~~~~~~~~
>> util/parse-events-bison.c:991:1: note: declared here
>>    991 | yy_symbol_value_print (FILE *yyo,
>>        | ^~~~~~~~~~~~~~~~~~~~~
>>
>> which are resolved by these patches.
> 
> Lgtm, but the changes should be unnecessary as perf from Linux 7.1
> should run on Linux 6.1 and with more and better features.

That's a bit harder to ship logistically for us and likely for others as 
well where we expect a single source to build the kernel and its 
companion tools.
-- 
Florian
