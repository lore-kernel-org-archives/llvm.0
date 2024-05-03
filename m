Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BAF8495
	for <llvm@lists.linux.dev>; Fri,  3 May 2024 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714741274; cv=none; b=A01JGVOgsUAhp4XHEnAeuAV0yvaHTgEjVpQRqluOhFUxQAqOq3JDqzOv5uyw0AG5s9Qui61qtpRvTdXq+CC/i+9cf3w/geFTeWt5+jnHRbkxuATAlHqZa6W20TgpbgAR4dfeSrdcuLkP3UogAnjSFikZoltLoXDXr11BkC07zLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714741274; c=relaxed/simple;
	bh=Do5NaWPJRdTJS4p6Fav8hWLBi76YtLLBb0d9D3r76fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ivy5/3Q0AvbXlN4uuI61zQeXl315+G9gU7c3/bjNqVWgHVOosnzOUG/6H7kgcZP7abf5p2BS4SGEz8X9O0fFYfL7+URMOPaY2o+dKCPrIJIExTNDva7FHZmFjqbpusRC/IpBk3GJVJKJQCAvbT935dWvFNbzJfGYwjuIr+Z6oB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9xrm0N2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9xrm0N2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2abae23d682so2318421a91.3
        for <llvm@lists.linux.dev>; Fri, 03 May 2024 06:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714741272; x=1715346072; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGe9iHk592FnREABAAmLC2RGIJEqDWrEFBPZ0kIuDqc=;
        b=H9xrm0N2PZIsc93qCTJNRVEu3zt5SBVyheBKHcbN1nt1OSRrurLmKpDHAW07WM1UZg
         xbaNqgAAef1RIxktF26fBdz5SASCpK6me2inizj6Qmoj+XJrW1m5Tfz86lNYoWQSp6Nm
         fkiT5r7Uy3n9Hp8jOa3kgqCaDcBkWJFKWj8dJFboDFvqwzAQ55fGgQmxurYEWF5bk47k
         ZiS3zis8H01vYNfZJzXE0r8gt2nNpohLVzXCR+V+NPpHU1k1NAZ7ePU9OrQgYj4Ypf+j
         4+gKlut0gS7h+ur3PdBOHsdCRyG+FEy4shSp+PDK65OdCRSb0KHzEMV67/YcHLJromwY
         yHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714741272; x=1715346072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGe9iHk592FnREABAAmLC2RGIJEqDWrEFBPZ0kIuDqc=;
        b=E6/cTCxK7Fmehsa8dYMBlPRTGJj2xStLbEkw8W7a2qtoVf6EqKCLkCVPuHYLx6qmA8
         apnEEOOOA4Dup3OK32WKYz5Lx0tDSq1rXf51K9J3KL6jSC5elr5OAEaPM8b98f5kyWfl
         /dl90d2xZflsHeDPAWSL72PGt9JLbZc0fY5dkcnzDxssyVGHpJUK8ygPogKs6DrwBTog
         lLmT/+1CX9PcmlCzHvC3NwgDXZz/hYKFEYOYjw/W6ksHb/W/EZKnrFJOp+0FehNzc6gi
         UJuRNU9FmYrmn8arxI1PYsMkV8fP3WtrVzMWQuvSM3rjbVVvGOQXXW+oH4ea2WvIBOXT
         V1XA==
X-Forwarded-Encrypted: i=1; AJvYcCUAf+Z+XhCPtPKMWXMIp2oPO4itVUcDK5pUCplMUEFFHvih3All26Tqv/OC+kr8IHkRnuW9b49eF1c0aovR1LGMJE/E7A==
X-Gm-Message-State: AOJu0Yyj+oJAE7gxbEhc0+WTAZjIegISjy538Y41C1xzleMXClgM7bkE
	Yb+vAMhngr907xv7G+vHhSmvszl6NZUzinOdbfsKB9y1n7kKKVST
X-Google-Smtp-Source: AGHT+IEsBnMnJhN3w5igllmtU7fDy8IT8a3k2wVDA9oBp97xEamhRB7O7IF2D1f5oPfQ/z9AT2ta7Q==
X-Received: by 2002:a17:90a:9b09:b0:2b2:b080:dd35 with SMTP id f9-20020a17090a9b0900b002b2b080dd35mr2533129pjp.0.1714741270628;
        Fri, 03 May 2024 06:01:10 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id sz15-20020a17090b2d4f00b002aff85b97dfsm4977761pjb.27.2024.05.03.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:01:10 -0700 (PDT)
Date: Fri, 3 May 2024 21:01:06 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
	linux-mm@kvack.org, llvm@lists.linux.dev, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] maple_tree: Fix build failure with W=1 and LLVM=1
Message-ID: <ZjTgEsuxYF29AVFJ@visitorckw-System-Product-Name>
References: <20240503095027.747838-1-visitorckw@gmail.com>
 <ZjTWkM9hTnoIhzqV@casper.infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjTWkM9hTnoIhzqV@casper.infradead.org>

On Fri, May 03, 2024 at 01:20:32PM +0100, Matthew Wilcox wrote:
> On Fri, May 03, 2024 at 05:50:27PM +0800, Kuan-Wei Chiu wrote:
> > When compiling library code using "make W=1 LLVM=1 lib/", clang
> > generated the following compilation errors:
> > 
> > lib/maple_tree.c:351:21: error: unused function 'mte_set_full' [-Werror,-Wunused-function]
> > static inline void *mte_set_full(const struct maple_enode *node)
> 
> Uh, clang is wrong to flag these as an error.  They're just not used
> yet.

I think it's because the kernel defaults to treating all compilation
warnings as errors. If you turn off the option to treat compilation
warnings as errors, they will be treated as warnings instead. Should I
update my commit message to change compilation errors to compilation
warnings?

Regards,
Kuan-Wei
