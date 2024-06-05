Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368A1BF90F
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717588621; cv=none; b=FdguOrJ+ft53P3pezxXtCUnxS2bqkXoFOeamNKaMcrYm103JdEBWkf27d84QUYXkwutrd2aLVK43nFgXpwB6b4K2KxJDrVDB/g56ItfC2Qq6tg16OhLFJtYTXYjagOcghOdKPjlnzvcLYaByOREEGP1/KKJ13GEbUiFsCCOC5uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717588621; c=relaxed/simple;
	bh=UbH1/7grnRdpXvuxHfEUVkrSJnWawHkx/2SBGGKAPgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGWYHKEQLhlC/rSjaYZ0YmTIUyoZl20W/yHzmsmqIAcvB54txrpCnnsq/zmE37AI4ApVXprsy2Tv64wKi3zXa6o4o4DVZI5YxStJ+hEYGGwpiNXkYYypr81mmrtsMZHm6B5r+ITzta0NprHw+fUnJZjJvrm81aIamfVRnxWvXsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jkCsUNtc; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jkCsUNtc"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-79509b390a4so63615185a.0
        for <llvm@lists.linux.dev>; Wed, 05 Jun 2024 04:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1717588617; x=1718193417; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17rQdjGRIN2CSga/YFCaGswU6lwvjB6GqByaiI2V+ko=;
        b=jkCsUNtc0lSC+CSggrWLwrXzbp3M64kRKsvm2W7kz1A+kygio/bJ+/mpasogF06w4f
         oCibZh/7w/jN+IS+YNXlrywB9jlzCJN+Ct8a6hEqvYnznEiepUi57vuIsG5HZ5ABsTjB
         UnW+fwMKlowI9BZ3BUR7/yk+KSIFUhREfPa23hsORC0MrvZtT5l0OvsEMPI3hEDk5k0u
         smg70VcSABSXzGqIo/Y1afnLyoL7lI6Db8TgAuYE3DngaF+t64FvUzY+XqsYkWg9Yao7
         T/5N9XyWguVXnvVZIiTom1Y/IpidEuj/ThZNa3as5B2w5Z5dMNhs0i9Ca8iVSvaHxO9z
         4Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717588617; x=1718193417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17rQdjGRIN2CSga/YFCaGswU6lwvjB6GqByaiI2V+ko=;
        b=LF3R7eOxb3HirqlNwAy21a8gppxEO5VL9KgpdShdjlV4aF8RptJnYK5KTRGTAO8zcX
         GDCkRTfkxHt03dr1VIWH6behD2dR/kbdILClurZaESiMOSnQ6EemjfQHflC5pP78V8KP
         AZ3xUzaSXS+TzcJ9YYzGssF/MZ6dm83qv1t6Z7Hz6Ox17uG3fnK/+U9ZHCw/7+qba6+P
         XCANLQROQ4V/U3w04SPEf/p94/tAaVF4N8OT+kLK1wiW4CyEeletIaXWevUc8zq8sTTf
         WgohDG7OCzdmTcVlPGldyQk49Z93HRjfsrk3RnGuXLWJqsUP0sufbz69bpHSUnwZbqKT
         m1ww==
X-Forwarded-Encrypted: i=1; AJvYcCVfXNsRb3wQCHCeadY/+ArCzrvIbKH3++V3AILab/NvuKs2rAt5MVTpiL4+7+mboLDEtq3Le6/3mfHKmSi7Nh0S9Ojurg==
X-Gm-Message-State: AOJu0YzUQDZie7T0+mWy+f0O9i0qc96kLW+nWpoGv4hdXbf41I1g5HgE
	sU8pl5DBMDNkpujqiTcZPKdnu1CQpaOAHsH4NrapxpCXr5Fv9aiUV7vCD7KVrb0=
X-Google-Smtp-Source: AGHT+IH87Vgxi0u/6B6nOPz3Js4whNZ+PxPB9EPNZ3t7mrmfAT1RKqbTJL+X2xFL1FK3wwFqMewlsQ==
X-Received: by 2002:a05:620a:1362:b0:790:efef:af55 with SMTP id af79cd13be357-79522fa4bbbmr417688985a.3.1717588617261;
        Wed, 05 Jun 2024 04:56:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7952b8e99d4sm12315185a.72.2024.06.05.04.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 04:56:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sEpGC-006ZOM-6l;
	Wed, 05 Jun 2024 08:56:56 -0300
Date: Wed, 5 Jun 2024 08:56:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Baoquan He <bhe@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] [v3] arm64/io: add constant-argument check
Message-ID: <20240605115656.GC791043@ziepe.ca>
References: <20240604210006.668912-1-arnd@kernel.org>
 <ZmAsutGzL5_Kx8Pn@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmAsutGzL5_Kx8Pn@J2N7QTR9R3>

On Wed, Jun 05, 2024 at 10:15:38AM +0100, Mark Rutland wrote:
> On Tue, Jun 04, 2024 at 10:59:57PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > In some configurations __const_iowrite32_copy() does not get inlined
> > and gcc runs into the BUILD_BUG():
> > 
> > In file included from <command-line>:
> > In function '__const_memcpy_toio_aligned32',
> >     inlined from '__const_iowrite32_copy' at arch/arm64/include/asm/io.h:203:3,
> >     inlined from '__const_iowrite32_copy' at arch/arm64/include/asm/io.h:199:20:
> > include/linux/compiler_types.h:487:45: error: call to '__compiletime_assert_538' declared with attribute error: BUILD_BUG failed
> >   487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >       |                                             ^
> > include/linux/compiler_types.h:468:25: note: in definition of macro '__compiletime_assert'
> >   468 |                         prefix ## suffix();                             \
> >       |                         ^~~~~~
> > include/linux/compiler_types.h:487:9: note: in expansion of macro '_compiletime_assert'
> >   487 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
> >    39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> >       |                                     ^~~~~~~~~~~~~~~~~~
> > include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
> >    59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
> >       |                     ^~~~~~~~~~~~~~~~
> > arch/arm64/include/asm/io.h:193:17: note: in expansion of macro 'BUILD_BUG'
> >   193 |                 BUILD_BUG();
> >       |                 ^~~~~~~~~
> > 
> > Move the check for constant arguments into the inline function to ensure
> > it is still constant if the compiler decides against inlining it, and
> > mark them as __always_inline to override the logic that sometimes leads
> > to the compiler not producing the simplified output.
> > 
> > Note that either the __always_inline annotation or the check for a
> > constant value are sufficient here, but combining the two looks cleaner
> > as it also avoids the macro. With clang-8 and older, the macro was still
> > needed, but all versions of gcc and clang can reliably perform constant
> > folding here.
> > 
> > Fixes: ead79118dae6 ("arm64/io: Provide a WC friendly __iowriteXX_copy()")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I have a trivial nit below, but either way this looks good to me, so
> regardless of that:
> 
> Reviewed-by: Mark Rutland <mark.rutland@arm.com>

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Still codegens what I expect on clang-17 at least, agree with Mark's
note

Thanks,
Jason
