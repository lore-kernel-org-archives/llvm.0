Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B6B3BBC5
	for <llvm@lists.linux.dev>; Mon, 10 Jun 2024 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718008420; cv=none; b=exn9qcHDDVerH7MGSgVJqUOl6XZm3dHPR41HeC4mHaRcoK2StYfCRM7M/dUpNwMnwPfJMq9+fwu2HdLjZyudx53RLbaLSBksUJbQGTK0NWDiZzr64hu8IeKqIrPCk7m1ywubHEBx3Qm03hYAMZtQ/Cv3jv+4jlVMApOgiXcc3JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718008420; c=relaxed/simple;
	bh=ZHwsUlCcj4iOpOQwr3HSU7ofvi8oleP/d1WHNbJiINw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvsNXFQPbEXgufnGX+O6CD/7zRHYC5E8L6g0OJmfTp23OUoHXl/QdzO2fcmtVV1c7p2MB+f8+risfSSDa+cW7vay8qaMsACmiyZJVtwoN+OOWZ8WMaKKZU4JbqrgVYP2W3q6A8If63d9g59qQlVlwDL/GT+uqcBAb5tE/fBQHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=v6zSGAcU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="v6zSGAcU"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52b7ecafe05so758073e87.3
        for <llvm@lists.linux.dev>; Mon, 10 Jun 2024 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718008416; x=1718613216; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VONwh53+sI/q+7igjZXIEzywb8W5GjMK/wuw98MkWNU=;
        b=v6zSGAcUuz/hO8SXi7KsBA4KkY38fB6mIrQ1MBZqQPMiebEC+8gZX5lhPztdKLqd1M
         NYrRc85ltnUD451GkYpBO9/cDmpefNd8eNE0F3YKJ+ajnV5DQLZhl5GJ0O+SdFmVBvO9
         d7f0+lu6pEI8EsCvpiAqvtavo9NU6PAq/1rT2qrco2ELQz+haiScCUpsMbEcvT4Ma01y
         Pw0iRWgPiPm6/o8FVXNt50zEMCGcsFTp3u7Ol5dZVrQSew8fuGz2vCAnOZ2ve4aEmqNN
         BoqEl/Y9d+ZNfLPoZIWTmBarnEv0wk2pT5JlAJlGMeYoL8k6YVMlGMmBa6HpasJUwJeV
         Dl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718008416; x=1718613216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VONwh53+sI/q+7igjZXIEzywb8W5GjMK/wuw98MkWNU=;
        b=nTb5jcsFpFbD0ewWkTFa9oWHdZVdUBFRJhGTKCOkNETcEZ0oMUPDV1JetwLu5A6SQ8
         wv144RSC3elOV3N8262U+ORBp6Og7OYFvFNwNcguS7I9ORPr5uwxjJAg22+kRvnahiEr
         f7EbE9QvI5mcNhrFT9eHuvGorzh+hQ+1auusgdMarN6ZYnYEHGundXe3b7RBdLXJ9Fjo
         eTcZNWayKmTzZ5fYel8YLxQj9t9eYAxbDUz0wd5JtZpmk1ealQzriCG+18A6Ol4UjpMW
         0WLFbYCNI6CX7n99wjzNewizs3KIp22M7S2R/oE/2JBt9LtVx3Ar6iVyJeCeqiSkWEL6
         ZCPg==
X-Forwarded-Encrypted: i=1; AJvYcCW6FnpohDrHJqlmiwUAkOutM4LvibIVLrJrIBQRzlIPmjGL2ec0T4OEpBNBVR0ej6Z0pFNEpRt0i3D75SpyM95sY8+c2Q==
X-Gm-Message-State: AOJu0YzfyMKPQfLt7wLiEHi5SVvGBZmaTZQdUUPK+KKFPsm/IjugsFy6
	QaPGJe6y1EU4/PuSnix45yEqKZpPirGEZroyb4vwBl37ys1F6f2bo4Me6Tdu1dk=
X-Google-Smtp-Source: AGHT+IFahvD3U+kTggZzk4bIrxGmCLQrUgdTOQl0vpqy33eDYS/aj7HavpfyJtTvywy7ZbtTTbtAcA==
X-Received: by 2002:a19:6b03:0:b0:52b:bd23:1e9 with SMTP id 2adb3069b0e04-52bbd2304e7mr4688601e87.1.1718008415424;
        Mon, 10 Jun 2024 01:33:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:deb:d879:7179:d010? ([2a01:e0a:999:a3a0:deb:d879:7179:d010])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e674sm135087885e9.6.2024.06.10.01.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 01:33:34 -0700 (PDT)
Message-ID: <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
Date: Mon, 10 Jun 2024 10:33:34 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
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
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/06/2024 20:51, Deepak Gupta wrote:
> On Mon, Jun 03, 2024 at 01:47:40PM +0100, Conor Dooley wrote:
>> On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrote:
>>> Hi Conor,
>>>
>>> On 31/05/2024 19:31, Conor Dooley wrote:
>>> > On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
>>> > > Dectect the Zkr extension and use it to seed the kernel base
>>> address.
>>> > >
>>> > > Detection of the extension can not be done in the typical
>>> fashion, as
>>> > > this is very early in the boot process. Instead, add a trap handler
>>> > > and run it to see if the extension is present.
>>> > You can't rely on the lack of a trap meaning that Zkr is present
>>> unless
>>> > you know that the platform implements Ssstrict. The CSR with that
>>> number
>>> > could do anything if not Ssstrict compliant, so this approach gets a
>>> > nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
>>> > it, so you're stuck with getting that information from firmware.
>>>
>>>
>>> FYI, this patch is my idea, so I'm the one to blame here :)
>>>
>>>
>>> >
>>> > For DT systems, you can actually parse the DT in the pi, we do it
>>> to get
>>> > the kaslr seed if present, so you can actually check for Zkr. With
>>> ACPI
>>> > I have no idea how you can get that information, I amn't an ACPI-ist.
>>>
>>>
>>> I took a look at how to access ACPI tables this early when
>>> implementing the
>>> Zabha/Zacas patches, but it seems not possible.
>>>
>>> But I'll look into this more, this is not the first time we need the
>>> extensions list very early and since we have no way to detect the
>>> presence
>>> of an extension at runtime, something needs to be done.
>>
>> Aye, having remembered that reading CSR_SEED could have side-effects on a
>> system with non-conforming extensions, it'd be good to see if we can
>> actually do this via detection on ACPI - especially for some other
>> extensions that we may need to turn on very early (I forget which ones we
>> talked about this before for). I didn't arm64 do anything with ACPI in
>> the
>> pi code, is the code arch/x86/boot/compressed run at an equivilent-ish
>> point
>> in boot?
> 
> cc: +Clement and Atish
> 
> I don't know all the details but on first glance it seems like instead
> of ACPI,
> may be FWFT is a better place for discovery ?
> https://lists.riscv.org/g/tech-prs/topic/patch_v12_add_firmware/106479571

IMHO, doing discovery in FWFT is not the goal of this extension. I think
the "real" solution would be to wait for the unified discovery task
group to come up with something for that (which is their goal I think) [1]

Clément,

Link: https://github.com/riscv/configuration-structure [1]

> 
> Supervisor could query if Sstrict is implemented and then it can check for
> lack of trap on CSR_SEED or straight-away check for presence of Zkr.
> 
> 
