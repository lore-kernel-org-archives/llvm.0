Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C69348866;
	Fri, 24 Apr 2026 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024428; cv=none; b=m3jjdM/YpimdxPfFrP1E/h0mDxb6WgTbhYF1WGrA+WIcq6DRjrrabJhOYnN31k0KW7Q5jh0M64iFC5DG2BE8YcCfaLMm4dgbEAHgMR6pAPq2lf+sXRqu6CmOaiNugUQSAzMfa6cbXMg2ey9WIYYivH29yAPtf4Tmkxce6dZlULA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024428; c=relaxed/simple;
	bh=9sefGydMzBxMf4zomL2ZzvzNo1W76tOr4KQJFDVtdrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iA5EnXcy/RlV0fW+NUBYDBDppsOCB7VDy1jXk5JjUldGF/S55ouFOt3X1wKg6KyEZ6ka9DsyrrosXljX1YQmKWHOpSZ3zZU/7EVZVIVGMAVUTpIdrU4zTQhaDDIZGLXc+EQkRdOvgTwhPnM7grk0DCCx1Q4js1QNV0go6oOiseQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A4oIV8Nc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A4oIV8Nc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rBNCUXggC4hfZ7EaYXAb67pPj1s6v9pEjVxpK8kB7ms=; b=A4oIV8NcA4m5+HaMXsKV1x6kGC
	N43lVh/o4nRYx/1olW62YhfSdXdZ6KWkZxgRr0+OGTa/DdFdPwZyCCBXfT5mZ0wxqVeUgruFL/7Kw
	ekYaLLW6pU1eI3uLqZlPbQ/FMJaPRgsXhfFz3qkXLwQBVVDLvyaDTJrc3rRkAPdL/19b5C37zQ7MT
	POJMYRwL2VXD8Zok6oBq98eEkbzifxIBqlcPJtDrzYeUGN5a1SvHOgw2L8+xLyOD+b42U6KDMR4wc
	4bqHY1/eWZWifITXwSP4nTbdRvbgWsgAJK8tyBNC6sSYJUs9LtOAjrB/mwydvegU1CqQct8Nib+fw
	02Ad9ifA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDE9-0000000EvnH-1XOj;
	Fri, 24 Apr 2026 09:53:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B977530301B; Fri, 24 Apr 2026 11:53:35 +0200 (CEST)
Date: Fri, 24 Apr 2026 11:53:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: kernel/futex/core.c:604:23: error: cannot jump from this asm
 goto statement to one of its possible targets
Message-ID: <20260424095335.GU3102624@noisy.programming.kicks-ass.net>
References: <202604160412.f6SIMtr9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202604160412.f6SIMtr9-lkp@intel.com>

On Thu, Apr 16, 2026 at 04:15:04AM +0800, kernel test robot wrote:
> Hi Thomas,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   1f5ffc672165ff851063a5fd044b727ab2517ae3
> commit: e4e28fd6986e8cf963ec4137e6c0b95403f636ab futex: Convert to get/put_user_inline()
> date:   5 months ago
> config: powerpc64-randconfig-001-20260416 (https://download.01.org/0day-ci/archive/20260416/202604160412.f6SIMtr9-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

IIRC we put the minimal clang on 17 due to this issue.
