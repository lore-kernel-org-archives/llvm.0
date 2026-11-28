Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795875742;
	b=t7UvKNaTAgYnkxn4UsyzPIX/zHkBn4vxL9Eu3eNg4SwNmSyCqIPBcCuGqnhwS9wgXzOH
	 nRvO6irjLo91pF8KkdIVq4q7PXfl7l/XW7nZ1dtnuTFF95uYM5ghIQ4/U4VRz6fajubEP
	 YSN3S7XtI3BblCzEeZqtMo/bheZHhXLSCz0XhJjlgX+FQK4p3ZZMmKb0t10biG0KMdxFV
	 g7NdQYT5yovcDuJMAYmW7raKkc8xpikfVb/vmMCf1yNgutkgcfEafbXbVFyqulneGu6uW
	 4F0bx3ixGqgpds6rfxDdyvHp390R/v1fEkHEeJHlz5dngl3BfJX3tBdaOHJbnPbrbgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795875742;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1r1H6M37iP/8WlMADt1LPhEo4UjmwFDXYoCxwT75NPE=;
	b=Bk0+JQSFju7FatOsoLd7Uijh9zWzJH8pU5u4AWS1ADxgxN9AlzRZtW+3Pxj6dsmdmMWu
	 +6GJSJq28oEe4k73Lye6dkDp151ntSmncwC8NtAyUzKueWn+qbXhCefqHn5km6pTAx0oG
	 maaECoyLptRjMcdbMG5CLWEwHHA2djJP7uQ55CgrxpiS3RqDALTEXxqXR8JQ1+7eUPqLC
	 LqPctPnTxO7fjui/euunE+Fj7mf3wfZIEpx7rNF3kd7k5xI30IWE+v7ueWpplX3H2CPBr
	 QONsFqhTW0QEmUwE1ISePO9Z0I4v5fGYeXdUB+y7JBzekXAbdf3X4UrKdJTIlFC0KJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzDD4JzS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31EA606A326;
	Sat, 28 Nov 2026 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzDD4JzS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4601F00897;
	Sat, 28 Nov 2026 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795875742;
	bh=1r1H6M37iP/8WlMADt1LPhEo4UjmwFDXYoCxwT75NPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RzDD4JzSEK0Ldb2MiQDHl6nbu3ccf1RUHv9BbNKq6JaHzWYnaIjEdwc6Me/UXJcup
	 /wTn+GS6ImF88sJiEP7ClvsrewrFcp0IQfq+tBXAI6s+7L5+uc51TNe+3sulh7rEHd
	 gurnXZKZlFUBaGMKPbSqit3NlXAJGnWYeYJe4F+2vjxF9uPxfTMLlAeDBUKhO+I1JQ
	 PAsKMpbAASP2Rowjx+W3xos1q2WvdEH0WV+arRZr1yiJ7XCrBR57ONbrUK0uOb7Evg
	 XyS/jm5kXHzB5AC/BvbEjR+mN9OcpX2A5GjFbhzbGVmB6pjid8o9q/BB8mgiiIo2Bz
	 /taMwyF2cVung==
Date: Sat, 28 Nov 2026 14:22:17 +0000
From: Simon Horman <horms@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH iwl-net] i40e: ensure owner VSI is found before
 dereferencing in i40e_veb_release()
Message-ID: <20261128142217.GG31322@horms.kernel.org>
References: <20261119170741.1525395-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119170741.1525395-1-irogers@google.com>

On Thu, Nov 19, 2026 at 09:07:41AM -0800, Ian Rogers wrote:
> i40e_veb_release() counts all VSIs attached to veb->seid in 'n', but only
> assigns 'vsi' when I40E_VSI_FLAG_VEB_OWNER is set. If a non-floating VEB
> has a single remaining VSI without I40E_VSI_FLAG_VEB_OWNER (for example
> if the owner VSI was moved or cleared via debugfs switch operations),
> n == 1 passes the 'n != 1' check while 'vsi' remains uninitialized on the
> stack and is immediately dereferenced.
> 
> Initialize 'vsi' to NULL and refuse to release a non-floating VEB unless
> both n == 1 and vsi != NULL.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
> -Wconditional-uninitialized; not tested on Intel XL710/X722 hardware.
> 
> Fixes: 08cdde310e22 ("i40e: Fix broken support for floating VEBs")
> Signed-off-by: Ian Rogers <irogers@google.com>

Reviewed-by: Simon Horman <horms@kernel.org>

