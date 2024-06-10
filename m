Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448422EFB
	for <llvm@lists.linux.dev>; Mon, 10 Jun 2024 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011007; cv=none; b=RB2l2ZZPU8EB5NHAIb3WfBo4Da4XW6bNWM26zPmVigYQzD17TfALgz5Z6ifdbyV7JXcDxITV+KXahQwwCWctv3qwWcWnIHEXVfOdJufqFBCSzyqYev1z6qiXT0cD8jDqs36+O0UqUhFS9sS/VE6Lako867smONtMOE0+iz6zwPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011007; c=relaxed/simple;
	bh=5ZritVEKpTmb37N4onm9Q3hT939Xub573VOpcr7ZyWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtDeacz7EfxKftpB/s7T01Yb5j9sivG9KylSRMjrwZn7ufx+NONp08m9EWhHFRhn6Knf3re/CWplRO/uqVR4RRIeTT9yhW5lK3x3p2tq+MSiryEgC5dUVTZy+kb4A8hmrGN/MX+OjLosWUPYTxqNMFiOYU6AivPJ0nUR82lXW+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PLA/Rqtd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PLA/Rqtd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217fd95c78so1447935e9.3
        for <llvm@lists.linux.dev>; Mon, 10 Jun 2024 02:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718011004; x=1718615804; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lrielQGYIMguUfiUX6UfwLtR5TJhNk4+xdvkzMalag=;
        b=PLA/RqtdCk10Xbdb6MX29u4XT+kyIE/bDl2BK/SY/UXwFo51YCOzwO4A9he+L+yogZ
         /i2Ie9RACjWrQYx3NWK1+JcqTs82ttSRp9j/0oB1bRfRCLo+OGXuMgGpLUMKlQP8cgF/
         MqMtCSj7vLffj0dVPJRRiOvRav3piMJ85dbHiiAOiJNFwhASzIdv2xyqhEm8O/pek7QY
         YutWET72DceTjg29JeDmX6HvkQUXiPa7YBgVj3rkZdIeKhaFzMJWqDWM7xGC70dGBwra
         V3XNSC0G22Xr0n/6HQsuZNsHWxezBT/6XF+0nLn9+gdWpfrruGn4I+szxAgufOcOBKjD
         FIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011004; x=1718615804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lrielQGYIMguUfiUX6UfwLtR5TJhNk4+xdvkzMalag=;
        b=G6DNbcofvH66C+2OGqle8nAmNoCQN0Z8epx+okXzE5+PPU8DSYqg5o9k9hLJRBYqGm
         BsO2bdgr1IFxfOf7OT/GmiLWKbyppYKtbLPVdmKT5U5QK7Ofr7FB8tp/dKGZumZDCqYe
         JJhus0ZtNDXsGsgU/wynj/bUdobEK2hdToRk+1b0rK+HIs3mNmp/CPCYLSlST9QJCCz+
         onRicRENHzFYNuRiS+Kjy4nTQE9vEJ7Mx1O+XMYzN990rxU3KfqChA30DublZbex9Js7
         VtFoLIrKRVeInmPXwofwSQxppqUPtOLXpDiKNDKrXBMOh+Mf7EWBXbDMZKVk2Qovhj0l
         GgCA==
X-Forwarded-Encrypted: i=1; AJvYcCV0YS4AzkuMjYt2BB8zV4EZZcuEX/Ds0k+E7HF181CKgGdAwhk7xwDldIzlCEBdLNW4U1UoRyx8uSk/V9v7xuZ3tcfieQ==
X-Gm-Message-State: AOJu0YyYBvVcLZMgzNotfVdQrSEHz/XV7ZCJRsvagMTh9EQWXYs5OtCk
	bvk8Hwh7bH46lMT0Ti6pc8PVjThmTujpnyegoI8+Tgx92XnCXA9hakSl5TKrL2Q=
X-Google-Smtp-Source: AGHT+IHOEGwCc48/FhlHvQJiZSBZyz2Sx26g7eIgkgXL5GnyBIbBYEgnIb2Y1H9ad2f8qgYy/NlUTw==
X-Received: by 2002:a05:600c:4705:b0:421:2c02:9779 with SMTP id 5b1f17b1804b1-42164a51ef1mr68372565e9.4.1718011003803;
        Mon, 10 Jun 2024 02:16:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:deb:d879:7179:d010? ([2a01:e0a:999:a3a0:deb:d879:7179:d010])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1e92dde6sm3857924f8f.41.2024.06.10.02.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 02:16:42 -0700 (PDT)
Message-ID: <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
Date: Mon, 10 Jun 2024 11:16:42 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atishp@rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
 <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
 <20240610-qualm-chalice-72d0cc743658@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240610-qualm-chalice-72d0cc743658@wendy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/06/2024 11:02, Conor Dooley wrote:
> On Mon, Jun 10, 2024 at 10:33:34AM +0200, Clément Léger wrote:
>>
>>
>> On 07/06/2024 20:51, Deepak Gupta wrote:
>>> On Mon, Jun 03, 2024 at 01:47:40PM +0100, Conor Dooley wrote:
>>>> On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrote:
>>>>> Hi Conor,
>>>>>
>>>>> On 31/05/2024 19:31, Conor Dooley wrote:
>>>>>> On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
>>>>>>> Dectect the Zkr extension and use it to seed the kernel base
>>>>> address.
>>>>>>>
>>>>>>> Detection of the extension can not be done in the typical
>>>>> fashion, as
>>>>>>> this is very early in the boot process. Instead, add a trap handler
>>>>>>> and run it to see if the extension is present.
>>>>>> You can't rely on the lack of a trap meaning that Zkr is present
>>>>> unless
>>>>>> you know that the platform implements Ssstrict. The CSR with that
>>>>> number
>>>>>> could do anything if not Ssstrict compliant, so this approach gets a
>>>>>> nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
>>>>>> it, so you're stuck with getting that information from firmware.
>>>>>
>>>>>
>>>>> FYI, this patch is my idea, so I'm the one to blame here :)
>>>>>
>>>>>
>>>>>>
>>>>>> For DT systems, you can actually parse the DT in the pi, we do it
>>>>> to get
>>>>>> the kaslr seed if present, so you can actually check for Zkr. With
>>>>> ACPI
>>>>>> I have no idea how you can get that information, I amn't an ACPI-ist.
>>>>>
>>>>>
>>>>> I took a look at how to access ACPI tables this early when
>>>>> implementing the
>>>>> Zabha/Zacas patches, but it seems not possible.
>>>>>
>>>>> But I'll look into this more, this is not the first time we need the
>>>>> extensions list very early and since we have no way to detect the
>>>>> presence
>>>>> of an extension at runtime, something needs to be done.
>>>>
>>>> Aye, having remembered that reading CSR_SEED could have side-effects on a
>>>> system with non-conforming extensions, it'd be good to see if we can
>>>> actually do this via detection on ACPI - especially for some other
>>>> extensions that we may need to turn on very early (I forget which ones we
>>>> talked about this before for). I didn't arm64 do anything with ACPI in
>>>> the
>>>> pi code, is the code arch/x86/boot/compressed run at an equivilent-ish
>>>> point
>>>> in boot?
>>>
>>> cc: +Clement and Atish
>>>
>>> I don't know all the details but on first glance it seems like instead
>>> of ACPI,
>>> may be FWFT is a better place for discovery ?
>>> https://lists.riscv.org/g/tech-prs/topic/patch_v12_add_firmware/106479571
>>
>> IMHO, doing discovery in FWFT is not the goal of this extension. I think
>> the "real" solution would be to wait for the unified discovery task
>> group to come up with something for that (which is their goal I think) [1]
> 
> I'm curious to see how that works out. The proposal documents an m-mode
> csr, so we'd have to smuggle the information to s-mode somehow...

Ahem, yeah, I spoke a bit too fast. Looked at the proposal and the
mconfigptr CSR will be accessible by M-mode only so I guess we will have
to find another way...

> 
>> Link: https://github.com/riscv/configuration-structure [1]
> 
