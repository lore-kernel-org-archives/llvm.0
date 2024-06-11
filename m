Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EBC28E37
	for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718119935; cv=none; b=rcGwi32CWd5meh31CtTuTE3nBHq7m3todiMIB+6kbqTggkwwRHGLlAFJC1NRktcxF2nP8nOEuBXbEvHEx5VrSlOkl0oOD6xPxRyKzqW9/N34IhCpdEttAtL88iZtAaI2tn577UOhZYu12uxn7i08wl0I0crf3L18COZSftMSvS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718119935; c=relaxed/simple;
	bh=Vn7Kc4x7zOZjOguyNFwvnJrV+uFfVWZrPr9+iUiJQvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2U4ril7hztSze2ORufEVVnmQavh0C24C78z3YDqr2+t/zec0ZVWCUJ+EpD95sen4KAGBUNlWWDHY7Z+FuLQPUo9OeXnHX3hMPuX1q9G6ByWiyyTMiiE7h/v/DapGPAqoQ2p/aj2FYcIHgEsU75RVt+rdVzQv/ZQgEXxBmHj63I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=guiaPH6c; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="guiaPH6c"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7023b6d810bso4568613b3a.3
        for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718119933; x=1718724733; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vn7Kc4x7zOZjOguyNFwvnJrV+uFfVWZrPr9+iUiJQvs=;
        b=guiaPH6coCXcRgt0XirqFHxp1L+biepfmthgkE2vp+FowE6xIaLxYkjHzkoEy4xGYQ
         DfUXQrZJiRRBd7HCt8WpSHYeKQwf6Ire0fSyorhPSageq4vf0HtGZ86x7lDv/iKEKGTJ
         ptuB3MT0O3oQlbavbP6JCYOTehO6OGgs7A8geYpzCjCmH9msYhuV1QmLij8Njv5hjk1F
         t5mGxRCSSVV2WjPiu5VhcwMqKQLioNfKgQ7X7s+VDuYKvqf5H5Mwaz/+05I+0cwDV06T
         t3K34N63u7izNXL0As84J9iBeD4f37b01sVUEsDt1x+yVr9Ug83We3XJpejK/1HrD7qC
         E6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119933; x=1718724733;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn7Kc4x7zOZjOguyNFwvnJrV+uFfVWZrPr9+iUiJQvs=;
        b=E3riHrEQJHUTgdYvTyjOmWxnNWLRseEomUgILE2ZochoD5aRFFg/f1thuYsIJwMymI
         VQAhnBZ6phq62/NDk09d14jWuEQHgYxuA+rmCxt/hL+jNXIfb/29binCAYzpyy+SZ1v1
         sRdXRAEXOxzKK4GS4RrXDmuq+35NXuM+x2uy+XQjMk+eBsXh/Zh1ODTkcvHSANEIc6t0
         w1qZEGaaJs+PG/SLTg3zHKDrS951DDk/2OipuXAu7plzWiCFFiA4LA4DzVPJjumQ8A3j
         svpi1Q2nsWvUFzvnZh9in5FEJPgLfXXuxOVbkrhN561nZR4f+iZ4S1Yn6CMtx+Jg/8Yh
         fVCA==
X-Forwarded-Encrypted: i=1; AJvYcCXUHSpzhKFuqHviEvq1z2Pa8HJ6daFTcm5eXosq+bqJOf3WyK9+mZnhhIrP5V4zZqOCOp5TicJdTi+5JZC0QD50qz/kyw==
X-Gm-Message-State: AOJu0YyerZ9qLqRIPxUBLDrrzBJdED/W5dQ/wr0XSI1GRE5MhY015j4i
	CD83MO1NTV68vuWccs3rScXt0DwUudaRZ9JnaqhVsgcqiYXQhbl6D2ViOIKd9Us=
X-Google-Smtp-Source: AGHT+IF8rG5/mjujMehriFq+KOF4rVuXuWFdDgw6V0TBjJ1ZIkoAFk5Q1ybFIIs3W8YsWs7KBpcR4g==
X-Received: by 2002:a05:6a20:9190:b0:1b7:d72e:9e5e with SMTP id adf61e73a8af0-1b7d72ea074mr4679110637.37.1718119932775;
        Tue, 11 Jun 2024 08:32:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e668a494c4sm4998087a12.22.2024.06.11.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:32:12 -0700 (PDT)
Date: Tue, 11 Jun 2024 08:32:10 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <Zmht+h75GgxP3ocz@debug.ba.rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
 <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
 <20240610-qualm-chalice-72d0cc743658@wendy>
 <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
 <Zmdq6kszPBxAvLdD@debug.ba.rivosinc.com>
 <20240610-earplugs-anybody-ebd04a5fa777@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610-earplugs-anybody-ebd04a5fa777@spud>

On Mon, Jun 10, 2024 at 10:56:35PM +0100, Conor Dooley wrote:
>On Mon, Jun 10, 2024 at 02:06:50PM -0700, Deepak Gupta wrote:
>> On Mon, Jun 10, 2024 at 11:16:42AM +0200, Clément Léger wrote:
>> > On 10/06/2024 11:02, Conor Dooley wrote:
>> > > On Mon, Jun 10, 2024 at 10:33:34AM +0200, Clément Léger wrote:
>> > > > On 07/06/2024 20:51, Deepak Gupta wrote:
>> > > > > On Mon, Jun 03, 2024 at 01:47:40PM +0100, Conor Dooley wrote:
>> > > > > > On Mon, Jun 03, 2024 at 11:14:49AM +0200, Alexandre Ghiti wrote:
>> > > > > I don't know all the details but on first glance it seems like instead
>> > > > > of ACPI,
>> > > > > may be FWFT is a better place for discovery ?
>> > > > > https://lists.riscv.org/g/tech-prs/topic/patch_v12_add_firmware/106479571
>> > > >
>> > > > IMHO, doing discovery in FWFT is not the goal of this extension. I think
>> > > > the "real" solution would be to wait for the unified discovery task
>> > > > group to come up with something for that (which is their goal I think) [1]
>>
>> Yeah I understand the conundrum here.
>>
>> > >
>> > > I'm curious to see how that works out. The proposal documents an m-mode
>> > > csr, so we'd have to smuggle the information to s-mode somehow...
>> >
>> > Ahem, yeah, I spoke a bit too fast. Looked at the proposal and the
>> > mconfigptr CSR will be accessible by M-mode only so I guess we will have
>> > to find another way...
>>
>> That's not the only problem. Even if you get mconfigptr access, parsing the format
>> is another thing that has to be done. This is early in boot. Although its strictly (pun
>> intended) not a firmware feature extension, I think it's much easier to ask underlying
>> firmware if platform is `Sstrict`. or may be expose something like below
>>
>> `ENABLE_SSTRICT`.
>> Platforms which support `Sstrict` can return success for this while platforms which don't
>> have `Sstrict` can return error code (not supported or not implemented).
>> This way its not feature discovery.
>
>I mean, it's feature discovery in all but name. You're calling it
>enable, but the behaviour you describe is feature discovery - not that I
>am against this being feature discovery since it gets us out of an
>annoying bind.

Yes I know it's cheating but at least for this case, it seems like easy solution which
doesn't break anything. Neither I see it creating any future problems (except FWFT becoming
to look like discovery mechanism :-) and Clement/Atish hating me for that)

Another solution to this could be introducing a riscv config `CONFIG_RISCV_SSTRICT`.
By default always select `CONFIG_RISCV_SSTRICT` and any platform owner who are not
sstrict, they can build their own.
I expect distro (ubuntu, red hat, etc) would want by default `CONFIG_RISCV_SSTRICT`.

>
>I forget which extension Alex and I discussed previously, but there's
>some mm-related things that you're gonna have to probe super early and
>we need to figure out if we can get that info from ACPI or not. I know
>we discussed it w.r.t. one of the T-Head vendor extensions, but I think
>another standard one got mentioned too.
>
>> It seems like arm64 parses fdt and it reads certain CSRs too
>> (`arch/arm64/kernel/pi/kaslr_early.c`). Although it doesn't look like it has to do any
>> discovery for them.
>
>A decree from the Palmer that we don't support things that do not conform
>in this manner would allow us to do what arm64 does. I brought this up
>originally because it's been discussed before that we cannot rely on
>conformance because we want to support people's platforms, whether they
>comply or not. I'd be wary of making this an exception now, and then
>later on someone makes a platform we want to support that doesn't
>conform and hey presto, we regress KASLR support - even if I think it is
>pretty unlikely that someone is going to repurpose the Zkr CSRs.
>
>One of the problems with only supporting conforming platforms is that
>the definition of conforming changes over time! This has happened with
>the Andes PMU for example, which I believe uses an interrupt number that
>was later co-opted by AIA spec. That conformed at the time, but doesn't
>anymore - do they get to mark themselves as Sstrict?
>
>Maybe we can do this on a case-by-case basis, but it's up to Palmer
>whether or not we can do that.
