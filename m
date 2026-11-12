Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464623;
	b=UnfOcleCdLwPNallK/8lw/xAq+M80SWnDAAm3meRpajjrVhPMHeoIvwS5yZv54i8hoQp
	 zBo9Ez4BG+f28exz30TOeJleCaU48+Rmb9P6kQlRXwGVUnl1HJBk1MwY80dT5E8//Okqt
	 4g4GQMMc2i+EcqxVJsMjF3+HjXWXDzvnLOIFkcU0x3wM4vh/acwbs6smKcJqdFK1xAxoo
	 0a0TeHF5OYk19u1vPGy7Sa8CfVWnmWakFiH9ZsdZpdXNyspgtpTfBToSCN1X2s8ZXI2ec
	 iSMMGQDV/g5CsGcZbDe6o0FCG8PsrfVEHpiXsg4+yRefiU7IPTgsEVL7EktJr7J5xPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464623;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qbM1V3hIjZllUefSiNQIKbVFNeokjHwns1ZqHzR0yZU=;
	b=NiGDlBQJmL8AINTSbE3iB2A9vniZ0rUJ1BXVNX7yM7G0KgOIsHot5V5olR0H2yNNPrAH
	 GHfCI89vZE/+WLAapKdM5Re++N1xPMzGLmSiQlIMRHerd3s3Q4kPjvMbuRv+dSXPU5EH/
	 Hu95eGzfnK6nQU7K/twC3dmkxm1CUyB6LgSohrtaM4scBB7ZAO6GEHV8pTzHjRwcqdKHG
	 +iT+6sk79TJ7lSRLdaNnsVWcgk9yvunx9UQZaGkyL9N6T4hwn3gqToeyfIuZM9iG5hUOk
	 Lwz3JpmR78wr7zEwqZibj9EdxWtPx9vmX8lH7StITa9GIdTUJL6ISKGkqVTmVRRZsLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BQA24sbw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27D8606A31C;
	Thu, 12 Nov 2026 06:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BQA24sbw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B3C1F00A05;
	Thu, 12 Nov 2026 06:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794464623;
	bh=qbM1V3hIjZllUefSiNQIKbVFNeokjHwns1ZqHzR0yZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BQA24sbwo2Cg7It3ccqJawfQCg0afBtLw+mQ26BAuHGAtjBlVhF+5+WQiTLh01H9x
	 QdxQoIm3H9KeGUW17QIWF792GH41kSOt7r7k8DbmhdvvFTP2MxBukm5KKCVuo8lsyN
	 n7tsGdZHL/59AXGlifG4KUJ2zHhOcsTYACPD6o4z86AIZKspmQup1i22TdrrQ/Ox+n
	 F/rRXSODGpPwUqSKy2VZ08kPI6S4BqHc7qxR1eWyxoNre/8G2uK1TTN6ZGOM4WKFVI
	 019UIhaWRQv5gs3R3bYHmJc/1+tPb5mSsmHKKxMU8zCLNXAtbDPcOm4o+Yo58q7TzS
	 Kd0sYeKeEB8hg==
Date: Wed, 11 Nov 2026 22:23:41 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>, 
	Chuck Wolber <chuck@wolber.net>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	Marco Elver <elver@google.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 11/20] objtool: Detect code coverage instrumentation
 in noinstr code
Message-ID: <avVaaxKUA2ArB6RG@jpoimboe>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-12-sashal@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103015238.3780910-12-sashal@kernel.org>

On Mon, Nov 02, 2026 at 08:52:29PM -0500, Sasha Levin wrote:
> gcov and Clang's source-based code coverage update their counters
> inline, rather than by calling into a runtime like KCOV does, so
> coverage instrumentation in noinstr code goes unnoticed by the noinstr
> validation of call destinations.
> 
> Flag instructions in noinstr code, outside of instrumentation_begin()
> and instrumentation_end() sections, that reference coverage counters:
> GCC's __gcov<N>.* counters (including the MC/DC counters), Clang's gcov
> __llvm_gcov_ctr* counters, and the __llvm_prf_cnts and __llvm_prf_bits
> sections of Clang's source-based code coverage.

What exactly is the problem with noinstr code incrementing counters
inline?

-- 
Josh
