Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E935229B18
	for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576250; cv=none; b=T+i1eOs0eqDnJDLWMxrpFjd4AO++vRkrkxRXKRPtzMtOAqBo0b9cctBD4ToLxTOC3MCmAB4okJirnOblIlnvQDLClwhE1vd9mr/1ItTs3COsaDlt0OqFy7Te1A4waEGyEGa/yQ6qiXN8pWE+3t5ABleMsAqfvZMr3LAvjtYSpOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576250; c=relaxed/simple;
	bh=EOPXwHGQ9Ef9GBRTY7+qmCmgh2eO5CjaySvJXnBaUwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZHWpyTq7Se5Oyv6evq5W03hviMn1TbCUivki9o0f2G8ULuujAmy3tnt9v0W7/ccG+VBODOUVoAmZRsWIEP49WNfWLHhMfXmCkv2JIrjd424KAC4b3AaHde+pr+QytFe7OjsLHA++3CpK4/OYrWFLbFgCtfynSfbxmK0waT+Jv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 85887227AAE; Fri, 16 Jan 2026 16:10:43 +0100 (CET)
Date: Fri, 16 Jan 2026 16:10:43 +0100
From: Christoph Hellwig <hch@lst.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <20260116151043.GA18805@lst.de>
References: <20260115005231.1211866-1-elver@google.com> <20260115213311.GG830755@noisy.programming.kicks-ass.net> <aWmRlXZaOOUvU_Nv@elver.google.com> <20260116150750.GG831050@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116150750.GG831050@noisy.programming.kicks-ass.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jan 16, 2026 at 04:07:50PM +0100, Peter Zijlstra wrote:
> LGTM; Steve, Christoph, does this work for you guys? Init and then lock
> would look something like:

Please do something that works without all these messy guards that just
obfuscate the code.

