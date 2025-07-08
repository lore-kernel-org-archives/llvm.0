Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3122126C;
	Tue,  8 Jul 2025 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751957538; cv=none; b=hir5sFZZeKbBv9IrJPH8dHZALf2Bh7a0uR3i43hU4Lc6qfu0RjsoKePCiljZYeskFDbOW106v8MZIrr1FKFSogaKhWOHrlSTqIjc4nzROrwEB98Tq5M6UyAkiaGojP5AVCs1wC8o62x0NhAwRTY8+q3x2dYyNtj+yPVaOFHG5pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751957538; c=relaxed/simple;
	bh=lBouEhyY4AYTaOHEkyVgq++1q0ex7e59XgWoSNa6o10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxWJAk0aFOeSVJ229roZm3bK6DNboo8g+ZkRQRJYKpBFvrmdPFoeC6CwVm9I/1r9H3R5h5bqllue5IE66IApDjkjTDFiKXXLfTXS7vVJK6rIEN9jQqjxx8P+Wjow1ZZoF3xYl2C6hGZhP1VDCuAsJvnmiRHxQatrUTJ5hEiTpXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BBUC696w; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ozOZNhpD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BBUC696w";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ozOZNhpD"
Date: Tue, 8 Jul 2025 08:52:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751957532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTFJEMX+i1VMWfM3oEOevD645WEcGHYINCyovuoDlV8=;
	b=BBUC696wbkWYTUUHi8dK1nhIE3Fbu1u/P1DuDtzSdTl0QXPtvuk0XszpyrSClLyCNeT3UK
	rUkRzaKhDPOWwmlA4PBd+X0cxU1oVc2E2xlKdL21f+zkUlRNFenc+DtVBueDBajSjz4Al7
	VvZ+NSY+WD0d0c+2tuNVMc2zS9aAMPg4u5GbFjoyBCEgJle25nOyxis0MAxeFNRQyebSe2
	8Rt+nbL+jNKS6TZ+Ltz1yXM9+E0QrUxFYhKZL4LL+oiFpVvR1FR6nuaAw8cFjJMMyrOetl
	Dp9XPvY6uTRKL9jz3b3la1cupFAT48gFU5Q5FZ5Arj7BWOPsHAH/oI1TnnM4jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751957532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTFJEMX+i1VMWfM3oEOevD645WEcGHYINCyovuoDlV8=;
	b=ozOZNhpD6ibZz6y031pememu1m7IXcwFmA0J9LA9ewtokhZACMGdmf6WY1zdphEkwKGcNc
	ol7HZM+Ag+2ejcCg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [bigeasy-staging:futex_percpu_ref 2/3] kernel/fork.c:1063:2:
 error: statement requires expression of scalar type ('void' invalid)
Message-ID: <20250708065211.ymEQXmIi@linutronix.de>
References: <202507080405.TViOt083-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202507080405.TViOt083-lkp@intel.com>

On 2025-07-08 04:14:22 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_percpu_ref
> head:   68087bce4b1dfad7de82a55bcc27fec3a19df65e
> commit: ebfd80a39c4e2258942c2949863b316607d4700a [2/3] futex: Use RCU-based per-CPU reference counting instead of rcuref_t
> config: x86_64-buildonly-randconfig-003-20250708 (https://download.01.org/0day-ci/archive/20250708/202507080405.TViOt083-lkp@intel.com/config)
> compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080405.TViOt083-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507080405.TViOt083-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/fork.c:1063:2: error: statement requires expression of scalar type ('void' invalid)
>     1063 |         if (futex_mm_init(mm))
>          |         ^   ~~~~~~~~~~~~~~~~~
>    1 error generated.

Thank you, folded
	https://lore.kernel.org/all/20250708065124.DtoAH-O1@linutronix.de/

Sebastian
