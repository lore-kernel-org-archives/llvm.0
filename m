Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648EA548563
	for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703868; cv=none; b=IRGZq675Apni3U7fusFKa8zLLK3cFBIBAFD4RoFMT34m4Fzj3lbLNhkOB/4VU6+c69DaYlBYqnEAMNV8QjUkItbXUSSD4oJtaPVaURtYuJRHcUaFoi4yGaV4XqZpr7LmcgGcOJn5luv1ktzlVL0W4ARxtdMofb5M+xZH7kErFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703868; c=relaxed/simple;
	bh=0xBkcPblbpjG4vkQkMpJRewja3D/3gtloFXrU9YBVy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dfryeynxYwxpX1503w4K4Pcq5+JzZ72G2yHpHBuPX0JDNY51KQR9FxOULi/Qrfs64B6JaoGBw+Ky1A/wMf2JnSlGYJJc5bsoqf0MR1S5Ay7hH8QgombJ5a37xFTkQNnQAJkGcSfSUZEaWWhtNIsHHmPENIFb/7eupwosw27mRTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2M/WdWh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2M/WdWh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso24600925e9.0
        for <llvm@lists.linux.dev>; Tue, 29 Sep 2026 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703864; x=1791308664; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=f2M/WdWhjvYeUw4INxVoYvctqz2nqxBhbvt4rliPkoI8tQYNLD/EUwOUH1R/81UNas
         IXn3G6i4sY2c/36jspUK8WwOlOqlfe2kdNCnoZ3i2qv8Dy1GFcr9jOVPHLLanhhDKeQX
         +wY+Nzj3gjtv8tBLCwQTOUSEPzkPjL9UDwAt90e/D4g+HmqDc9X1AsK2mspa7YGg0Kev
         OcF2tcYWRrCHcUOizkq2imyuyDydiXzZqEAYunLOWjGPGGSn5LpQzQgxgOsdTOLQd+y1
         BoMYNyztcj8cRTJ1MPUemqKq/NmBrGURzU+mI78waS21ZtecTrZJvSjPudnrVJCHxQuZ
         rwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703864; x=1791308664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=uy/RDtROyMfaijl4T76o38C7o8UVa8BCDQ5D74tPhSl77WENHB3qV5FNjE3ZIqbuUt
         wrkWhypdMZ72Cw9jkaG2EWloMPq6YuBbPqhVquVqDrzPsAFJtEY6Z/nS4F0LagF14DEx
         aDNfejYg6YEPyPVvj/gigCWFpHjhjqpmcNaO2pQEqsFcn5rHtw9+s1v/AlBnv+z5GJhG
         8te8jnaIT5Wk7vb9KC6b+MRq5WZhxMlulfSkFT5Vqt+wL41Hf4A5LQW8TxH5sBJ3KVcZ
         WuqZ3haAHrTEntagpC47Tx6faK1+IQ8esF/VEhGEWKPTJbvAQ73dNw+zQCw4eLMHT/sV
         Gnww==
X-Forwarded-Encrypted: i=1; AKwUvByo/GvEgqlxQq/pacD4znt8P32damL/G2miMmEmxY7pTCecm8DeZeyFNpXG81D6CDq04uGU@lists.linux.dev
X-Gm-Message-State: AFuF++nGGTRx/aE4d+QvkuCVWyS1+Y2y2/w68ShnTn9prwwgtgx502ji
	X+EJ6PQery78OBArIZ2P4F3l1knbZwLR7VIhEM7nk6gLKXCcpP1ZFRBj
X-Gm-Gg: AYBFou0wTzK/5R4wFFd3THb/fSerQtleL56HnatXjkJ6AMUyO0CyB7d27fKTFVNqyN2
	poItd+ZJui6vtG1fNCB1PIfiRUdqVxS2NxWxE1jYzE0PA5QwmiNPj7vjyH5V5VjG78lUwOLrLG8
	aot9weyqL+OXcmp+Dk61W/VX+ENjTVUuVtXTI+seWtxV/NGGhuXXRKaTnDu/smHuF8EmaBUNHqp
	3PPUOUJMOtjeDNs/t/6Vvoy6/AVekO1dw3SdX8kQwevhwOP028ummgRGTrZJBo3hwEW2JamdTr0
	qWcjFleXbn+QTPYmdB7fmLZN5HocmKw+ghb7Z34Y8wVarZ9St/PTkFZcIn4o2A3kvPXgZARoGHr
	lZjWK+s1xVhXR8R5SsJOCQxVN1bQZXG8XGKdNu6HspuNHr0uflYzS91tnHbh4E0BNoeIsBtkt4S
	WQJ5+qLSdGXHQuEXhz7ycn44nDz7Ckzh1OtAfZLuflVAol4UkXnsKIDQOW9AjenK3DekzTbVWEG
	iHpkfb4mi9V28WkjEjTJR3NWD7OC1MoMUs=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr305056015e9.14.1790703863276;
        Tue, 29 Sep 2026 10:44:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm103285395e9.13.2026.09.29.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:44:22 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:44:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260929184415.1920fe91@pumpkin>
In-Reply-To: <20260929165939.GA1890629@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
	<87zex4ic68.fsf@linux-m68k.org>
	<20260926121927.GA1486962@ax162>
	<are7cfMIHZZn6jLz@zx2c4.com>
	<20260927080225.37534e7c@pumpkin>
	<20260929165939.GA1890629@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 18:59:39 +0200
Nathan Chancellor <nathan@kernel.org> wrote:

> On Sun, Sep 27, 2026 at 08:02:25AM +0100, David Laight wrote:
> > On Sat, 26 Sep 2026 14:32:49 +0200
> > "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:  
> > > Do we even need to return a value at all? Might as well just make the
> > > function two lines:
> > > 
> > > +       for (char *d = dst; size--;)
> > > +               *d++ = value;  
> > 
> > Wouldn't it be better to add a barrier() or similar in there to
> > stop the compiler playing unwanted games>  
> 
> Wouldn't that just result in the same code generation issue that Jason
> pointed out on my v1?
> 
>   https://lore.kernel.org/aquyVkdYceiWdckX@zx2c4.com/

I missed that one going past....
You only get 'rep stosq' because the compiler first converts it to memset(). 

> Maybe that doesn't matter because modern compilers have better options?

A lot of cpu will run the 'rep stosq' very slowly (it has a big fixed cost).

At a guess the loop is 3 clocks (possibly 2; but that usually needs
you to use negative offsets from the end - and gcc doesn't like that).
That is comparable to a mispredicted branch (and you might get two of them).
It still might actually be faster than the 'rep stosq' version!

I suspect the fastest code is to unroll the loop.
	xor %eax, %eax
	movl %eax, 12(%rbx)
	movq %rax, 16(%rbx)
	movq %rax, 24(%rbx)
	movq %rax, 32(%rbx)
	movq %rax, 40(%rbx)
	movq %rax, 48(%rbx)
	movq %rax, 56(%rbx)
8 clocks on old cpu, 4 on newer ones.
But more likely to be limited be I-cache reads.

If you are going to use 'rep stos' then you might as well write
13 32bit words.

David

