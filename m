Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF440242D
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499980; cv=none; b=pYL/y0RnPpTd6N7D3+mKSpsIJBAGH3Ki8TdgHT11c/qL5Qh3ZDJsDTHXNlC7KhL9MfXLXyl1/6IbhykRzi86mqE/KHxzlZRsUhynZBzSt8ePf5mzwU/CLUuxaiAlKKN+XXEh8Oup3lfW5HOZSZLLJEYgv+t9q5LT/NKB430UrLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499980; c=relaxed/simple;
	bh=SZIS/yXl1GQlPFJhlTJP5+7QNE+11CSpjcgz6o8qXzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2/VXlTB8WKNFvPHMMWMiaj+qDGZD5j2/Qt9e2NBP4bG0erTP07PtSr1gClSfjAv7jSYfbkZEPSzjNPJNCZCR0tDyyjomU1UClFK9wW4IMweZyNbZ4Qxc3nvnL8xvcGExlR6wRgJTZ1erFAYVH6pGRr6WwMtVD3PxALhUydo8SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 955D3F40CC8; Wed, 08 Jul 2026 10:39:30 +0200 (CEST)
Date: Wed, 8 Jul 2026 10:39:30 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org,
	daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	fujita.tomonori@gmail.com, joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, nsc@kernel.org,
	japo@linux.ibm.com, lina+kernel@asahilina.net, j@jannau.net,
	airlied@gmail.com, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH V17 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ak4MwnDwIgdUhK3K@luna>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <20260708082454.1254320-5-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708082454.1254320-5-mkchauras@gmail.com>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Wed, Jul 08, 2026 at 01:54:51PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> Minimum `rustc` version required for powerpc is 1.95 as some critical
> features required for compiling rust code for kernel are not there.
> 
> For example Stable inline asm support which got merged in 1.95.

Didn’t we decide on 1.85.0 with the asm_experimental_arch feature
instead?  And possibly on 64-bit 1.87.0 if it isn’t possible to disable
altivec correctly there?

> 
> Link: https://github.com/rust-lang/rust/pull/147996
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
>  scripts/min-tool-version.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> index 031f2192b390..99bfdcaa3396 100755
> --- a/scripts/min-tool-version.sh
> +++ b/scripts/min-tool-version.sh
> @@ -33,6 +33,8 @@ llvm)
>  rustc)
>  	if [ "$SRCARCH" = "s390" ]; then
>  		echo 1.96.0
> +	elif [ "$ARCH" = powerpc ]; then
> +		echo 1.95.0
>  	else
>  		echo 1.85.0
>  	fi
> -- 
> 2.55.0
> 
> 

-- 
Link Mauve
