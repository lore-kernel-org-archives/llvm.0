Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB135E930;
	Wed, 11 Mar 2026 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773269848; cv=none; b=NzFrbgqctDA5qYrMCEsRig7nHB+PNYAdTXOyAMfCD4SDfyseWmh04UTLV9QR3BYi5pZsMxB3kWBcje4O74a2E+F28VUMtkQYUsVgAzTJkiUFJa3YCuF0EE79FgunGUJM5tKVt+58S5gux5K33QbMpOdVEU2nRQq0uUeUUPUHL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773269848; c=relaxed/simple;
	bh=xi0AbXfQmrLwVfnhq6kkJmstaWpN6l8PVzrhpkwa73I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9UfyaspPYX8IpBNh+2OOo2oExPeZElEcpzRb0VNCBJzleYX39s4jM9bPcrFYyYQLfKWnx2XGOVOtSOI7BzowOR+8QOlgDprqUh7677Yn7LC1fymoK9raPlnl3MEx/871nJazUkkllKNAGpbzvv20Z+w9b+zoh6+qy1OeImLJg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=u/o0XCNt; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="u/o0XCNt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I4DJD2x5EZNAH8ZiryIU8tR51Bg3iZew9jLVM41Ptkk=; b=u/o0XCNt4la6bkZT+uAavI7ZtN
	yBb8xUVAWjG4hvSX1+OakbjcCJWeO5wIQa5cFb7j0KTGn+eI+hoyFKS6ZdsRZZ17CbM1laONGNAvy
	1zLT0oUJzy10TkM/47nkrasvVdOJ0nZG/EldskDTMSO+mkeJ1d76DKuCnAOD3F2J7yju1ExCSh9/E
	VfAksZy8rsLE+TipeM3ToPGf7/xl0gfroymxcUI0b+HEXU8KTudGUHu9EobcedyIKbKxiN4FsMozU
	dcYsUR19ou/WhRSKhVmkmG+iaJQ/KuGVFQX0VlSS/v0ONSHXandxMBjPHmi6ehuXD1tjfjXRwn3aC
	2Cf2CtZw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SUR-0000000AQjA-3gwx;
	Wed, 11 Mar 2026 22:57:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D7478302EC2; Wed, 11 Mar 2026 23:57:17 +0100 (CET)
Date: Wed, 11 Mar 2026 23:57:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jann Horn <jannh@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH 0/3] KCOV function entry/exit records
Message-ID: <20260311225717.GY606826@noisy.programming.kicks-ass.net>
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>

On Wed, Mar 11, 2026 at 10:06:13PM +0100, Jann Horn wrote:
> This series adds a KCOV feature that userspace can use to keep track of
> the current call stack. When userspace enables the new mode
> KCOV_TRACE_PC_EXT, collected instruction addresses are tagged with one
> of three types:
> 
>  - function entry
>  - non-entry basic block
>  - function exit
> 
> This requires corresponding LLVM support; an LLVM patch implementing
> this feature has been uploaded for review at
> <https://github.com/llvm/llvm-project/pull/185972>, but hasn't landed yet.

And I don't suppose KCOV will finally honour noinstr ?
