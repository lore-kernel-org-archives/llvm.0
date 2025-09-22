Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A155F313298
	for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 17:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758561107; cv=none; b=hO+587OTf+2SS1gb4lKmennNZZI2UnnmztyaXABtgt1YFfA/sQB3pmc61obHuvTKJ2v0vmrayuEeH69atuh12iXPINoEdPi9OxBzJsYuaJkR8hfT26I1E4zJ/4KvsL+HgLb5IctoxCxlwpKVpD2m9W6EoopsuE1vpGxiMAAr+Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758561107; c=relaxed/simple;
	bh=Bj75Vx85XbPqZ/5PV/l+4NF+GOXzs9jU1MZVBigLThQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1BvlmHoDyzVYqtgN19TpmOZ8M7xrYSGbDWhTCeQrzdkUePRUZ0u+6x3LVsiY6vzL9/lNuqKSm4d1mlF43yVRdTzMbY3vwBz5LZ+sgb6Y5czGFVKCAQIEoVMLtYOODRIZb5GdjvFxdgpcSyj1Ox+JqmMUhnOayR7ih8sWyrfp1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 11211227AAF; Mon, 22 Sep 2025 19:11:37 +0200 (CEST)
Date: Mon, 22 Sep 2025 19:11:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marco Elver <elver@google.com>
Cc: Christoph Hellwig <hch@lst.de>, Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, llvm@lists.linux.dev,
	rcu@vger.kernel.org
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and
 Locking-Analysis
Message-ID: <20250922171136.GA12668@lst.de>
References: <20250918140451.1289454-1-elver@google.com> <20250918141511.GA30263@lst.de> <20250918174555.GA3366400@ax162> <20250919140803.GA23745@lst.de> <20250919140954.GA24160@lst.de> <aNEX46WJh2IWhVUc@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNEX46WJh2IWhVUc@elver.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Sep 22, 2025 at 11:33:23AM +0200, Marco Elver wrote:
> I gave this a try, and with the below patch and the Clang fix [1],
> fs/xfs compiles cleanly. I think the fundamental limitation are the
> conditional locking wrappers. I suspect it's possible to do better than
> disabling the analysis here, by overapproximating the lock set taken
> (like you did elsewhere), so that at least the callers are checked, but
> when I tried it showed lots of callers need annotating as well, so I
> gave up at that point. Still, it might be better than no checking at
> all.

I guess this at least allows us to work with the analysis, even if it 
drops coverage for one of the most important locks.  I guess you also
have CONFIG_XFS_QUOTA disabled as that would lead to similar warnings,
and also currently has the lock the object on return if it's not a
NULL return case?  I now have a local series to remove that instance,
but I've seen that pattern elsewhere in the kernel code.

Besides the conditional locking these two also do another thing that
is nasty to the analysis, the locked state can be attached to a
transaction and unlocked at transaction commit.  Not sure how to best
model that.

> [1] https://github.com/llvm/llvm-project/pull/159921

Thanks for all the work!

