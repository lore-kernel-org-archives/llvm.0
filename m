Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871CD335BAF;
	Fri, 23 Jan 2026 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166415; cv=none; b=MtAs0USRUoWIzJrbeukqfgDbZkW9Y8/liU4ulhz/2QajZTXulFKd4zBi1NX8SyCNjwkq49a0fEnsCn0rpRK4AfIUC8w8L9NEpvOpfYxGvMS61F0hdSXPijWiXSYoXKvLZJdJV5h8ISYMcPusHXtFDDjdSLyttl7AKKtzIL+PNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166415; c=relaxed/simple;
	bh=GE6s1299mxZoUIyY/Tajbnh3VWpVXQ2ZeueJbgvcgME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcRovupTmXCttdkEmlsabUtbIyRpd3OE6nuvmSfzatzDLuaV6On0HyWXeT8yuzSgUojCIjEZ+zzqwJNDSO5ukEqpZsZWUBgsxkVXYAgrAS7wVw2OgVRqQN/ji+7lugE1nPLs2uWM3LmojbX7RyokShvrweq0SprhN2WOgs/UVj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rAHEj2Yj; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rAHEj2Yj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XMEDuJG6OJnlgw983o9nMRX8amTEsRRpisFtThjwLGc=; b=rAHEj2YjnEXzA5xbxd6sR48yUb
	MMHdsmDEvZkVwZnqSa658GYTowtRjLsmZtam+Cnb+2iLPAoh3kwF3Y86CnFv0/LoZ7pBZeCUzycYy
	KOOqZSmVvawb00XkyIJY5lgas/ypsl2uS4GMRVLWuXn+s4mQotGo1wiyq4qetI2KFyq1OByX+zFRG
	waBQj1xidA8OmdD44iFITjAYy9S+QzuOoB7bP3vG/KjyeChWyWakZShGAj71ewCoNg3UbxQk9fFQP
	Wcom4yp26tmhwZqIzLiVPY9eFcfU3Suq/zei+sdfQDF4LA490yt220XnPwyg1Zby2QxhhTP7fzKOj
	163tgeyA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjEzv-00000001fmW-3sWj;
	Fri, 23 Jan 2026 11:06:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 74C3B3007E1; Fri, 23 Jan 2026 12:06:39 +0100 (CET)
Date: Fri, 23 Jan 2026 12:06:39 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>, elver@google.com,
	linux-kernel@vger.kernel.org, bigeasy@linutronix.de,
	mingo@kernel.org, tglx@linutronix.de, will@kernel.org,
	boqun.feng@gmail.com, longman@redhat.com, hch@lst.de,
	rostedt@goodmis.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
Message-ID: <20260123110639.GN171111@noisy.programming.kicks-ass.net>
References: <20260121110704.221498346@infradead.org>
 <20260121192349.GM166857@noisy.programming.kicks-ass.net>
 <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org>
 <20260122090402.GD171111@noisy.programming.kicks-ass.net>
 <d399e354-6d42-488e-a0b7-fe8d08b9bf34@acm.org>
 <20260122185812.GB3461196@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122185812.GB3461196@ax162>

On Thu, Jan 22, 2026 at 11:58:12AM -0700, Nathan Chancellor wrote:
> On Thu, Jan 22, 2026 at 08:28:44AM -0800, Bart Van Assche wrote:
> > The build-kernel-with-clang script is as follows (this may not be the
> > recommended way to build the kernel with clang):
> > 
> > #!/bin/bash
> > export CC=clang
> > export LD=ld.lld      # Use LLVM's linker (optional but recommended)
> > export AR=llvm-ar
> > export NM=llvm-nm
> > export OBJCOPY=llvm-objcopy
> > export OBJDUMP=llvm-objdump
> > export STRIP=llvm-strip
> > export READELF=llvm-readelf
> > make LLVM=1 CC=clang "$@"
> 
> FWIW, this could ultimately simplify to
> 
>     make LLVM=1 "$@"
> 
> as LLVM=1 is the shorthand for
> 
>     make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
>          OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>          HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> 

Right, for all of us on Debian, you can use:

  make LLVM=-22 ...

