Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366011EF0A6;
	Wed, 23 Jul 2025 22:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753308848; cv=none; b=FundIB++CYwNnqQn4aM6yZ0Pl1Cp4+zZAMjaG/pOtOcz1BAf1xCzjspEkrp11BbXvPUxnrqQcPOVRNixdKSz4Idct99HjVFap8KJEoCOGgpcoBSdgzjSk7HR/APkQ6UbxKqhH/VpUhxxHz9u3WWMOMk3txOmF4Q68CGukss5o9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753308848; c=relaxed/simple;
	bh=1n2X3dSDnt+iiB9SB7H1HStj19tGyqnSrPupfMGdvpE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ct8hKbaAG6t0uW+sTa9IaObbblRyN8SgxWo299DL3xpYBMG1JA4pa0PtWKEBQv1rRosGQxnPTVeKLcdz6CPPbG8l/olhWrB9SY+AWWGuNZEPRTzpOvyALiiefTRyokZMyGgbAQ6iL5a1wUqIi8rhg2OFp003oZ9/7dKsvzyXX2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYhUAkjL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYhUAkjL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45555e3317aso1642375e9.3;
        Wed, 23 Jul 2025 15:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753308845; x=1753913645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dcxr9WChsXfgQ3Y6J1Tmdhs3S3jUnpYIY2ntdf391WI=;
        b=IYhUAkjLP6LR8z1YdUuhlT69AqZUCiarWun1DspvwOa7SLcMWQfaPMHQysihH1YMH8
         nrk1GDE41ZSsMWoNYMQDFylS3KWNp0blv3XIF5fYP1n/9XSdUEzDb6HiBK9QLUpXIRTj
         3F/vO9QNFeLlJy+mNwPEvcKLHSRvfMPqZ4GiBhKJSO9CGumy579Ci/7ObDF75YTLqJqI
         bgga/tShVn2VeGo9skgMVq/nIvy2mM1rx8BoSgQubymRynSx1TjzhooTaJjYQe8jHJjw
         pvhziLuA5DbhkTZdiMY1UFSuOKD2n08+ijco2rtEO3UcpxYHarf+h8Jv0wYPpbGO0PV0
         aeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753308845; x=1753913645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dcxr9WChsXfgQ3Y6J1Tmdhs3S3jUnpYIY2ntdf391WI=;
        b=D8c8V4j/Mfa/fIyoh/Z1r4bBqbzNyxQKPz8vPWeZieuhmB36elsjoxYnReTnptBwfm
         Q65kGEDU1Ns+IkR2xVE2t9Dfv6o8vO/VYM7m/DuUPQc+W2l3a/NEqYCrNIPe2gO0Vuvc
         c84+xkYFVVEe+dMjJC3htvZsMGUzUjyqjW5nme2L8r0qjw9jDYKHL1hTjSSuoUYu/kbp
         aZF6NQ6/Y7fEWxYyuyS79XefIubqvIP+/x9w+ZlxJgJ4a6d2RMTtq2oG3C/uBghBRqeV
         ORBYFJCglZ1tZXTHuZbzpHG3X4R/ziw3ckqI6CWoc2XvBBS5UeFy2tHx3eGfREEckuZS
         TRpw==
X-Forwarded-Encrypted: i=1; AJvYcCV5m6TkIYCjDjVtjnAkl66PUeP4rsBVq0X2ZndtnztsUMFwhZK/+h00QF8w7Jy9Xf6/+8Oo@lists.linux.dev, AJvYcCXIK20L0GEHO01/hNkxPGwVCpjlDNesTqu1zqGoqAfRVh6lvISQop/zoLgwU1Hmsq//n3Oh2qHUzZFSmbiOBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzS7D5iGTUcIkcgkAlRewOnLMsvlb7ZBY4qOpZyGTgEzCRjvgA4
	GhjgKKR+7oIXMBqKKcAGEi66pMpobERZqoL4u9JjXY1rdnKwGgeReu/M
X-Gm-Gg: ASbGncv4pONB7JG3ZWmi/gbSFqNsCppvVIhmqbIWSHJdFu9NgG1GXd12IDQ0FWHOtrt
	Jf8oaFX7sB50EYORB8HbHkHM20/dp7yIfLaGfTEcmJLSDvocq7RQMQfmpb3qegsNztF+0EDWnsD
	lQ7v8NBrng7I3fnXBPQ/2EBVVjn1qJepOtMlHtNKsYfogA64Bb4JKxi0FaKymiFcpL8wDKtJdkJ
	n6Io3Fo9Jtkn0z9+Na/366i4BIM9CnhLoPv+LIWrbxNfxOAzcJYZONHi24GnY/pp6jExeIFP8qm
	zt/Ktb3cIDlmPA0SXU7+qTC7vbJ8Gbrb4sbH71wFXh/xcFVVPJ0sTX6Nwpw0G3lKkDBTd9S65VR
	VfFPNP7F8EDpW31UCbdpv26zmlRdtrZrbmFft7xLk3vuA27Hg5OURMkVZFzsX
X-Google-Smtp-Source: AGHT+IEHu4yEUwkN54fD2xw9nPvwgj8fXax3ltxH3jc2G3S4Abiw8N8eyK0gVyU28RXmmWI5cYhJwA==
X-Received: by 2002:a05:600c:3b1a:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-45868c8d67amr44059195e9.9.1753308845293;
        Wed, 23 Jul 2025 15:14:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586f433c0asm1824735e9.30.2025.07.23.15.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:14:05 -0700 (PDT)
Date: Wed, 23 Jul 2025 23:14:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>,
 Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, Andy
 Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Al
 Viro <viro@zeniv.linux.org.uk>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/3] vdso: Switch get/put unaligned from packed
 struct to memcpy
Message-ID: <20250723231403.6ef5c162@pumpkin>
In-Reply-To: <CAP-5=fWeK4RnL8=BQm3o3u0KoONYEptwEYFBC5_DkJTbgpbx9g@mail.gmail.com>
References: <20250626054826.433453-2-irogers@google.com>
	<202507050736.b4hX0Xks-lkp@intel.com>
	<87o6tcrzh2.ffs@tglx>
	<CAP-5=fWbmo3ejmeWbweSk5waPtS2VTc1obtaWiibZC3cVmvVvg@mail.gmail.com>
	<CAP-5=fWeK4RnL8=BQm3o3u0KoONYEptwEYFBC5_DkJTbgpbx9g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Jul 2025 10:00:51 -0700
Ian Rogers <irogers@google.com> wrote:

...
> Oh, the actual warning is "leaves the object uninitialized". It is
> possible to silence this by changing:
> 
>   const U16 __get_unaligned_ctrl_type __always_unused;
> 
> to something like:
> 
>   const U16 __get_unaligned_ctrl_type __always_unused = 0;
> 
> You then get complained at that the code is using 0 instead of NULL
> when instead of U16 the type of the __get_unaligned_t is a pointer.
> Basically I've entered into an analysis tool wac-a-mole and I don't
> have a combination to make them all happy.

Can you embed the variable inside a struct and then initialise with {} ?

Does this code actually work all the time?
There have always been 'problems' because gcc remembers the alignment
of pointers through (void *) casts.
So if your misaligned pointer has a type that should be aligned
them memcpy(&dest, (void *)misaligned_int_ptr, 4) will still do an
aligned read.

You also really need the compiler to optimise the memcpy into two
memory reads, some shifts, masks and ors, and a single write to a
register.
I'm not at all sure that is going to happen.
(Especially since I've never seen it optimised to only two reads
even when reading 'packed' variables.

	David

> 
> Thanks,
> Ian
> 

