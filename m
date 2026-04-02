Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C3D371CED
	for <llvm@lists.linux.dev>; Thu,  2 Apr 2026 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775121236; cv=none; b=ps9afPZXGSZ39Y38+wRG2RUhT1zAax1PcOW5BGZrnc4Dpprz1fOxaSPJwVZf8o5sVRaFnNHkAQNigyG2KmyUHcAGt3CkKwhK9dv+hz6sAJaW10vRryYfQcVqjMDqPeonCg3c671u14zu2sxGPK3m107q7+sGAo1s3rPs58EKuUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775121236; c=relaxed/simple;
	bh=Ue86H1KysRcjf2OINDQFXuIhBR4ESQnxLFwGpvhWUfw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEQmJTvER2iIi7Hivyh+1Xb0u1Mdc0b5ZBSrEobH7COlcTze2YobW2WypehOdV6PgWfYcUBAp+YATMY44tsxjgHpEiOBMslG8kXf0FPSZjEkXWZb4at5v1vYs2MGCKRKKWdnefcJc9gZ7xt6N8zWEOiRtxKeNHHsMAiCvDpfmEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiehFvdL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiehFvdL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so6958695e9.3
        for <llvm@lists.linux.dev>; Thu, 02 Apr 2026 02:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775121231; x=1775726031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qr0tec9oGf/SBDgbf+2rD33HNBftwB6KGbVP3Dhy5ew=;
        b=YiehFvdLRRStmG2oVeqFu9WXKIDX2xJXv8BMKJf88tET3M0wWetucQCZ4PrZo75Bl1
         i/4R/u3f1yupw9Jl5DPB4vfownXI9JyHM/wx9zYSenllbDxrFVwWz3HaiJMb05oqK4Ke
         kfUzAzU+AbB3dLBVtPNzP8WQsnoCCwLaxW2QDdQeeRelDCvnMs93ttkC8uYlUQoeqjMx
         b0eCNKeOLeCnUA4zwXU3NjI8BlVWBFPHZTWgIakq+0hP5st28g3LA2gMSgn5Iede8vQ7
         MRkuEcui6NPgU8fE5e+RGq86kDCjymiRnHoaRr4odCNioPSyCRsTzX8nZHSRZPt+vdbU
         XzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775121231; x=1775726031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qr0tec9oGf/SBDgbf+2rD33HNBftwB6KGbVP3Dhy5ew=;
        b=iXRiDZwhB5gjLZdQRYuIw7smjAz/eOtiTCbFmcUjqaDr4Y1mczMh7qGBnlNdWKmM93
         zw/9Dy4PO3Kmrcih8uPfGvbDCE85eQBfeheldy22FE//eUFKycRjEvRiGJhqYIvcRznt
         4JRltkCcchYxMMFAxnAEChs9mQUN39CDotbPgfNQjZSbzCCqEOVWxzFmDCU3KPZeMkCj
         UIfOpm74YR5NRN7MvaunZuvVxgCw+7ZWsBC56+GmUjnWSylRyt8KzQbDMFmFBDopJ9s/
         3YCVAr8Jb8+CwplgHkeLCy7oilioXcBwqK5DL9gapb+Z8/QX9PbOjc7XJVF1rIFu2fI8
         rHEw==
X-Forwarded-Encrypted: i=1; AJvYcCUx4D0g+kqPKOFKVfHaEODtJ0lVZgl5a8BrJ56Xr7nkmDAyV+gLYW4eZ9DxngTmGxsv+i4O@lists.linux.dev
X-Gm-Message-State: AOJu0YwBWpjJwnGaf4pRFSewdPNr2tXa3qRcyTYVyxPcyTntEAN4I91A
	1mvpcYBSbdCKEPxMy4dkih8TwdP/g8jlO3pDykvC2N81twPdavjNUrgK
X-Gm-Gg: ATEYQzyx+FC86NBhHRLvqXm4Pb1iW+Li6+bvvIWKmtRrQFWXB35GzXMA+l41eiZpgOO
	51GIcq5TiVgENNaH7LjklmyhIUbWGX2S3MykVfKNWNVhrAKIKlABewCxfgo0V4G9qNJtQ7HUKnR
	ReSNTnavW+hwuzalfiE/U05mMMrjnTHdIa1WBLYAP8BJbFWRRvj+NUuDyXRIbWxhojw0GUG0zpR
	IRjwsTeDQKMNByDIOsD7NkjkdTKlni4BR3moujthIn+QjuZM9ao9PCop1kPLuLoVzcn42RmPd6U
	Aw8fblpjg/1uGM4oCrEBtROs8tnkelauSKx2LcM/x9Y2gTgpSTCff+rApOdYEs6DdrEeuecRmnx
	w7kqlt6PjZqT1O4aZfLu+21jGtc3tBakgKbCRmnZrNSYJF9sWnZO8YZbVuq+pqfqcY4ekDiz81f
	vqZkz6zgHikAB1VrPDGrSyOp6DIT3I75OmmuO6dSYvGajDuzS/FFVpY/0vLw/cnjC3kkVSZSc=
X-Received: by 2002:a05:600c:3514:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4888358c8b3mr115476365e9.16.1775121230625;
        Thu, 02 Apr 2026 02:13:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e952b0bsm162303495e9.12.2026.04.02.02.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:13:50 -0700 (PDT)
Date: Thu, 2 Apr 2026 10:13:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt
 <justinstitt@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com,
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, Linus Torvalds
 <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
Message-ID: <20260402101348.2f758a58@pumpkin>
In-Reply-To: <202604011313.AD471BC8@keescook>
References: <20260331163716.work.696-kees@kernel.org>
	<20260331163725.2765789-3-kees@kernel.org>
	<CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
	<CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
	<202603311249.30B44C66@keescook>
	<20260401090815.GV3738786@noisy.programming.kicks-ass.net>
	<202604011313.AD471BC8@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 1 Apr 2026 13:21:17 -0700
Kees Cook <kees@kernel.org> wrote:

> On Wed, Apr 01, 2026 at 11:08:15AM +0200, Peter Zijlstra wrote:
> > On Tue, Mar 31, 2026 at 12:52:10PM -0700, Kees Cook wrote:
> >   
> > > I think for this series, __ob_trap/__ob_wrap is what should be used.
> > > 
> > > And for other folks, the background here is that we originally wanted
> > > to use macros for "__trap" and "__wrap", but the powerpc C compiler
> > > (both Clang and GCC) have a builtin macro named "__trap" already. So
> > > I switched to just using the Clang-native type qualifier. We can use
> > > the attribute style too, but there was a lot of confusion during the
> > > Clang development phases where people kept forgetting this was a type
> > > qualifier, not an attribute (i.e. the attribute is an internal alias
> > > for the qualifier, and the qualifier is a new type).  
> > 
> > Since you mention qualifiers...
> > 
> > What is the result of __typeof_unqual__(int __ob_trap) ?  
> 
> Hmm, it seems like "const" doesn't get peeled off. That can be fixed, if
> that's needed?
> 
> 'typeof_unqual(int)' (aka 'int')
> 'typeof_unqual(__ob_trap int)' (aka '__ob_trap int')
> 'typeof_unqual(const int)' (aka 'int')
> 'typeof_unqual(__ob_trap const int)' (aka '__ob_trap const int')
> 
> -Kees
> 

Adding all the required cases to the _Generic() doesn't scale.

typeof_unqual() needs to die.
Just using 'auto a = b;' should remove const and volatile - but gcc is buggy.
There are some alternatives that work in many cases.
(It has all been discussed before.)
In most cases you can use 'auto a = (b) + 0'.
That does do integer promotions - but they happen as soon as 'a' is
used; so it pretty much doesn't change the type of value, just the
type of the variable.

	David

