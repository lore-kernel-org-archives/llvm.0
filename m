Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657252F7A
	for <llvm@lists.linux.dev>; Mon, 10 Jun 2024 21:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718053621; cv=none; b=RuZpqT4XCEwn6uQxfyuwMM0LZgSBbg3H1Hrtr2xYirR4l9ZZKaYUehX6clg01KiVOcZ7WWdd2QquqE56CC2eZwoiry2j6MdL/KmKXTQdfBKnbLJ1doPGz0c5A5UFskjLG7oNTXWdiPMMj4C/CKUGMa7GX/aKLFBPQEhvpCelYiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718053621; c=relaxed/simple;
	bh=8kNEcLqnjSBSzmYInfsSoqzXQrLkZOIpu19v13Wpwyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klInP4nRVmlQXjBjc9JTQQQmrvq+ymPgp7LP0GV7+7+2aRRl+NYAa2nMMZPvX63e38NyDQ3xbXGAQY4CHp+bDNa1vx+UKWKpfLXb+Wb5B3EvsTRW8F4OGeqOHO+gJn31H3blh9n5NAOeFfhwaJUW4Ce0vPpxp6SF1uRW6q/a9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=GR6AMxr8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GR6AMxr8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c2fe7f07c4so1507625a91.2
        for <llvm@lists.linux.dev>; Mon, 10 Jun 2024 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718053617; x=1718658417; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kNEcLqnjSBSzmYInfsSoqzXQrLkZOIpu19v13Wpwyw=;
        b=GR6AMxr8wjtuQQdAqd/Cc2sR3d3nqj075j6sQyerLeSO7wyNxG+Wm0dbWRRYdoeWpJ
         5EvSvwrY6nbCRyErZq5aGzt2r6j93VLpkhPpY5rpjADcZqs6sHWNbIgfWWw6AzA9rJUE
         8PBqweaFWDEv7tQmsVuFv3tlntIkFlBTwCdO4n26Jmcxab1tSvWDCtJmKb8e6o0erckX
         WYJnLGeSI4CkXtFJhAzekd6uo4lfUPKvyCD3MJdt7tZXkoH7PCI4gepBxsdz4FuKz/vj
         4VlJeXKiHpEpCKB99j3cJ86hvFkW+20uPnY1nMbuLxo3fO0b6Nv8hK+f1VG47j9zqOhw
         s6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718053617; x=1718658417;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kNEcLqnjSBSzmYInfsSoqzXQrLkZOIpu19v13Wpwyw=;
        b=J+415mW95VPt8X4yVhfwMACHcNN2IigCzzOpScqXRgtQaZqf4FPkanFjNFpmYXvuT6
         kOWWFXpUVBX55thx3pu7yk0FAyC1a8i2nyjN01CT8ho/fHz5HF1AFgcb63fEVhDu5MZf
         rLrNylPMFlXg0tsws4JQdWgHToUH1wVtHe0kK8QlxgwsMdR1OS0nQLonMNdgj+LdGObM
         otICJzJ52N2u2YKZTX84ng3R28NyChXadCmAMTa0OmwJ0K389Pwm5m35augk9c6r5z3G
         TKYvJ8L5dYDnR+jHYT04rz+54sFtlYKhsDNAdXTXcSWACm2O8MyIWbdPzcK6OnJWPX8r
         DCmA==
X-Forwarded-Encrypted: i=1; AJvYcCW+EPFakkKz/yugeP/N+X83QSqYArn1h8IDgJSx5ylQlmCsdtQVHyM4xaHR2cTeU+13kPfuPwfMvrSGk0BXpol0oW/BuA==
X-Gm-Message-State: AOJu0YzKOTGZhvjo5YGB5MhBaK3weboAbgdvDiWmZaHU9TOtMbon3Lpn
	fZjYYsimet5sVUABFcTqJMIrtdbloY75VZRDZLD7zyHJDGdEPuBZ5vLCbZhJAKU=
X-Google-Smtp-Source: AGHT+IG9/ui2Pdbq/gGpEHhO3Ddv6VFSpBlRz6d5Y0Sa0RbJWoDbM2M3qtgVqvq/pgFE/wY0HE4mJA==
X-Received: by 2002:a17:90a:d397:b0:2bd:ef6b:c33b with SMTP id 98e67ed59e1d1-2c2bc7b4c69mr11530609a91.0.1718053617512;
        Mon, 10 Jun 2024 14:06:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2d7814f45sm5746125a91.5.2024.06.10.14.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:06:57 -0700 (PDT)
Date: Mon, 10 Jun 2024 14:06:50 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <Zmdq6kszPBxAvLdD@debug.ba.rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
 <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
 <20240610-qualm-chalice-72d0cc743658@wendy>
 <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>

On Mon, Jun 10, 2024 at 11:16:42AM +0200, Clément Léger wrote:
>
>
>On 10/06/2024 11:02, Conor Dooley wrote:
>> On Mon, Jun 10, 2024 at 10:33:34AM +0200, Clément Léger wrote:
>>>
>>>
>>> On 07/06/2024 20:51, Deepak Gupta wrote:
>>>> On Mon, Jun 03, 2024 at 01:47:40PM +0100, Conor Dooley wrote:
>>>>> On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrote:
>>>>>> Hi Conor,
>>>>>>
>>>>>> On 31/05/2024 19:31, Conor Dooley wrote:
>>>>>>> On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
>>>>>>>> Dectect the Zkr extension and use it to seed the kernel base
>>>>>> address.
>>>>>>>>
>>>>>>>> Detection of the extension can not be done in the typical
>>>>>> fashion, as
>>>>>>>> this is very early in the boot process. Instead, add a trap handler
>>>>>>>> and run it to see if the extension is present.
>>>>>>> You can't rely on the lack of a trap meaning that Zkr is present
>>>>>> unless
>>>>>>> you know that the platform implements Ssstrict. The CSR with that
>>>>>> number
>>>>>>> could do anything if not Ssstrict compliant, so this approach gets a
>>>>>>> nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
>>>>>>> it, so you're stuck with getting that information from firmware.
>>>>>>
>>>>>>
>>>>>> FYI, this patch is my idea, so I'm the one to blame here :)
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> For DT systems, you can actually parse the DT in the pi, we do it
>>>>>> to get
>>>>>>> the kaslr seed if present, so you can actually check for Zkr. With
>>>>>> ACPI
>>>>>>> I have no idea how you can get that information, I amn't an ACPI-ist.
>>>>>>
>>>>>>
>>>>>> I took a look at how to access ACPI tables this early when
>>>>>> implementing the
>>>>>> Zabha/Zacas patches, but it seems not possible.
>>>>>>
>>>>>> But I'll look into this more, this is not the first time we need the
>>>>>> extensions list very early and since we have no way to detect the
>>>>>> presence
>>>>>> of an extension at runtime, something needs to be done.
>>>>>
>>>>> Aye, having remembered that reading CSR_SEED could have side-effects on a
>>>>> system with non-conforming extensions, it'd be good to see if we can
>>>>> actually do this via detection on ACPI - especially for some other
>>>>> extensions that we may need to turn on very early (I forget which ones we
>>>>> talked about this before for). I didn't arm64 do anything with ACPI in
>>>>> the
>>>>> pi code, is the code arch/x86/boot/compressed run at an equivilent-ish
>>>>> point
>>>>> in boot?
>>>>
>>>> cc: +Clement and Atish
>>>>
>>>> I don't know all the details but on first glance it seems like instead
>>>> of ACPI,
>>>> may be FWFT is a better place for discovery ?
>>>> https://lists.riscv.org/g/tech-prs/topic/patch_v12_add_firmware/106479571
>>>
>>> IMHO, doing discovery in FWFT is not the goal of this extension. I think
>>> the "real" solution would be to wait for the unified discovery task
>>> group to come up with something for that (which is their goal I think) [1]

Yeah I understand the conundrum here.

>>
>> I'm curious to see how that works out. The proposal documents an m-mode
>> csr, so we'd have to smuggle the information to s-mode somehow...
>
>Ahem, yeah, I spoke a bit too fast. Looked at the proposal and the
>mconfigptr CSR will be accessible by M-mode only so I guess we will have
>to find another way...

That's not the only problem. Even if you get mconfigptr access, parsing the format
is another thing that has to be done. This is early in boot. Although its strictly (pun
intended) not a firmware feature extension, I think it's much easier to ask underlying
firmware if platform is `Sstrict`. or may be expose something like below

`ENABLE_SSTRICT`.
Platforms which support `Sstrict` can return success for this while platforms which don't
have `Sstrict` can return error code (not supported or not implemented).
This way its not feature discovery.

It seems like arm64 parses fdt and it reads certain CSRs too
(`arch/arm64/kernel/pi/kaslr_early.c`). Although it doesn't look like it has to do any
discovery for them.

>
>>
>>> Link: https://github.com/riscv/configuration-structure [1]
>>
