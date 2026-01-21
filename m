Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10FD3BFE4B;
	Wed, 21 Jan 2026 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769023439; cv=none; b=BuGl91ZdxbL9DlD2L7c8EJ2DC9YdasEh/QbXot1Fd27zE5WWVu8zYivGZgA4Okipjuh3xH3TXMfYP0aXB6Lez/CEEIsVbf2hxaTeZql0m3J12klyJo6/DIiwXWFYBNoFeofxMLV/XGG5tYaBNTlRq8wxAOJXUr7d/yn8TLcAsvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769023439; c=relaxed/simple;
	bh=hX+2WxcerQNQFDsoN82FVaBrTTC1GKZ3BhK2vdAWgGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsN2bwboYTYjkWT8LqN8qpAsD95GJ8LEExxrAwN8BNBLBGyH/HyUmE8KSD9wpjrjZGKYtn2jhfm7j1EEhVTl9Uyq9NnLRx62l7eYELx5EvxKmNUE4dmLKA99fN6XOtnModPNLa49B0ix4JB+bD42G0eCvxLqHF1hcfhrebNdbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LVEma9o5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LVEma9o5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i/17FJOZr5I4I9fpJR9XhJ1wsQsRc/kE2heNMaqVYAA=; b=LVEma9o5Kk1BReviBKwSZKAaUG
	XJk8rCxjZ+EM10XdDKOmsyQwvaUtIE+uoRZF0ay2r17klI5CfvrpNkNl6snZWBiVhDKmilt/YLwU8
	h5xc5TH6ynlrwGplG78Ho9sPpe421YjrO8eDa6HA3LqU5WqXYuJ2zidZPFWiHRFx+In9a6IiAs6+m
	Llj+sph5fD+LAYmpIrIG/eXTmPiQKCsxEOY8l7u9N8vHXVUsdBg7K/nYreV0DtpEXadz6xUNS4Gsw
	4FYKgd4/FkvYFyFcKj9/VkWk8um9hwqUgKZptAry2N42KlsMuLeStplHPXet7bwwcixjmUCzL4H+6
	E3Cp5mkw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidny-0000000GgeM-1kqX;
	Wed, 21 Jan 2026 19:23:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 683E23007E1; Wed, 21 Jan 2026 20:23:49 +0100 (CET)
Date: Wed, 21 Jan 2026 20:23:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: elver@google.com
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org,
	tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com,
	longman@redhat.com, hch@lst.de, rostedt@goodmis.org,
	bvanassche@acm.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
Message-ID: <20260121192349.GM166857@noisy.programming.kicks-ass.net>
References: <20260121110704.221498346@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121110704.221498346@infradead.org>

On Wed, Jan 21, 2026 at 12:07:04PM +0100, Peter Zijlstra wrote:
> Hai
> 
> This is on top of tip/locking/core with these patches on:
> 
>   https://lkml.kernel.org/r/20260119094029.1344361-1-elver@google.com
> 
> and converts mutex, rtmutex, ww_mutex and futex to use the new context analysis
> bits.
> 

Pushed out an updated/fixed series to:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
