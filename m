Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33F6230BE9
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 20:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769546374; cv=none; b=Js3yoaYnH0/YpC7D/W2C7ckkBnh1C7+DWDEA4IuRYUWX1Dj/6re3WFJKSplp7QdtWU4ohxidWyIQ0dpnWDrUUnr3Jl0NNate+DRn96fMeHmHsiOw57XyJXN1BzUMT/YBEtTlBplRy1XBI7CvnVOoX9/FV5AVzigh2zYJa6ABI1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769546374; c=relaxed/simple;
	bh=Q1O/+GBbXOYfYaXTxbxbqmTGWTj/y+mjKsnvqcLbKTo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6E11jfQRdk0l+ozJ6z7MvH8wEdnPXWQRODPtzlN1P3wYdqYz+etVXTmWhOlMmsW8al5CDEvWsBbK44vWCmfvWMsGPkxtXW8CPMnWqBF6QurBOGOJ0Ilh/xaw/ifp0de3NyGk6IpyOmXIZdoU49KKJNIp9vliYEBAsbk6HEjLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcGOVrXL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcGOVrXL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc305552so5498494f8f.0
        for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 12:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769546371; x=1770151171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y76INJz49l6c3foMm04ZUQu2Dm0oObzGN1DVFxd18LA=;
        b=WcGOVrXLPwgpT0wWZBTI+Qu5jENtZUiUEUJ7IEbQ/JA8lZ/wnCd5F1272E7EwOEqBb
         LO6jGkzkimzlEg+rpG47SN8CKhIRzn8Rz8sIajjbJewovBMyOzF5OQaTgpq61bQPVqlM
         UdZybTTsmhIUb4Hle73QcI9TEB23SXBwIJCmLjg6cWqZTcQgQHkVkEF/b+CRYp72JbOG
         1Yr2SU1YScjdil2LKQiByNszx4TcmJYMvcSrW4MIAu7MfMumYLDaOSNi+MOjSmQtdPEA
         GYfxZpqIHfOy+1DC9YM/le3Tz9ii3zTyuqQNBaUIFUKGzLxvIofoGdiesJqrhks0pKqe
         nNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769546371; x=1770151171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y76INJz49l6c3foMm04ZUQu2Dm0oObzGN1DVFxd18LA=;
        b=b36eqz900SRbKt1E+B1izmQeleKKukdi4+LeH62kEF1+xeQSF4EwJX7J8jAceJ2+Bp
         u+uGFy34yUr/qQCAY+8JPd7za+3l/6L7Ylf1Yz8TXQQgsEW3/a7vsEcqEra4zvwBpwVz
         rXCjKGGuV7OTc20CIqJMhZ9gs8OQv1nCo3H7+xGBBqkjx7WHvN3AvkAutMIujGmbFXEi
         3TN6XR43jtwOnV8wSe9q4bt/w/f9AwWQKMUJVgWy6Ua+BBCcrvvPmJw1+UyC7zpuFnKK
         YCSUGhAXwnTWGwRYDpCDwdvdFva6F9mebrzxtIOLSLHXmXDgQGAgn1zj/KZ7Rjco4DHr
         mXrg==
X-Forwarded-Encrypted: i=1; AJvYcCUKXyv+UC0W5azPqclvJPjaapZvSzznIWC5vZl0zKK5lY9sYRJjODbkp3jP3o2x2NLXHt5c@lists.linux.dev
X-Gm-Message-State: AOJu0YwUgklkKLQgrjBFY3TrXcgVy+rQXwW/kEgxDzaM6BMd6MgWDitV
	1cGPW0jIRbKVPTXvqi+02sUesWvDJzngtGo28wnEMTy7ibktkckyrD6U3c8fbQ==
X-Gm-Gg: AZuq6aIAY0oaQbfaqnOvTZ9b+Id4jfWwF7uGYKouD6DL8lYi5wAoyMMVwHBQPoWYrGM
	JuFeeUoKlCoDU7UkRU+ccHAXziIh538OPggRjm7ItnEBp123vNjv0p4/LHMXewTlBYVFXJAmNGA
	lwlYXZtIiNMIXgDeUAuhITdJThmhYIxUhH+3jcs4syRZW3mtwVrxhK63myvFebPVPa5s3+uQ5up
	Xlm4paORE82svitQDlaB64z+ysixPBsviHGvTW+1BmmICO1ilu4S1rlvMuTkYhZisR3wEc3TMck
	HXfo2r+LE7Ltav3aEKreXpBkPgcsNMaUVCfjWLje/vNviMXrxrY9I1G+iq9xzInkpZkiiMGIbqU
	tsFh/yORYnx3blxN3g/k5ArBDUvaEaZDZLYmngI7k9GzAV0YQ5gPmwiUld7OxmdHvCPxBMTnTwK
	1alqyJYgCGTNh5jLyv4JPMGaOvFez6Xk/EoI9+NBDpbU64ENeZf7uw
X-Received: by 2002:a05:600c:c16b:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-48069c1a85bmr30848435e9.13.1769540070008;
        Tue, 27 Jan 2026 10:54:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bee687sm126914635e9.5.2026.01.27.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:54:29 -0800 (PST)
Date: Tue, 27 Jan 2026 18:54:24 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260127185424.39d801ea@pumpkin>
In-Reply-To: <CANpmjNP6qRm0M9Za-=Lm8N87o-GukO5nQeAVpW=bbXRnip4Fvg@mail.gmail.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
	<d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
	<aXfGcIpeXQNRUI-A@elver.google.com>
	<7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
	<CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
	<20260127143026.32429f32@pumpkin>
	<CANpmjNP6qRm0M9Za-=Lm8N87o-GukO5nQeAVpW=bbXRnip4Fvg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Jan 2026 16:04:45 +0100
Marco Elver <elver@google.com> wrote:

...
> I think the bigger issue was 'volatile': "Passing a volatile-qualified
> pointer to READ_ONCE() is an absolute
> trainwreck for code generation [...]" per dee081bf8f82.
> 
> While the above with the temporary is gone for the asm-generic
> version, the arm64 LTO still has the temporary and we need some
> qualifier-stripping helper.

I've done some real experiments, see https://www.godbolt.org/z/n9f91dGe3

If you don't strip the volatile you get a 'trainwreck'.
Visible on godbolt for the short sub-structure function f_v_s().
Fixable using __unqual_typeof__().

But the code for anything over 8 bytes is also a trainwreck.
eg: for an int[4] in a sub-structure:
	return __READ_ONCE(s->s_i).i[2];
f_s_i:
        sub     sp, sp, #16
        ldr     x8, [x0, #56]
        str     x8, [sp, #8]
        ldr     w8, [x0, #64]
        str     w8, [sp, #4]
        ldr     w9, [x0, #68]
        mov     w0, w8
        str     w9, [sp], #16
        ret
(The same code for a char[4] is fine...)

For integral types you can get a variable of the unqualified
type with:
	auto v = (typeof(x))0;
but that doesn't help here because the code needs to read short structures.

For long structures member by member access will give better code.
I'm not sure they should be allowed.
(and there may not be any.)

	David
