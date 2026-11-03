Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700900;
	b=OcTWRyKzwi7hxDQvL3p2HppACE4rH8NSrXjZ0X/sh5wZNwokOum+f3THrFTxd5re3Wd8
	 mJqrYloFQ58ZLH6aDqV14OmCCFJrVrWKDj487c5MHuKz/IG2nFLX6q4VQLQvxi2apXDo2
	 MlDhUpOMMvnsHg+Deu4NVyEl6psUNaTTlEOLwe4RPqDfuthnVpEE+TzS8yfkXlT/YMrZB
	 gdCYSBxb4na34QlKus0e+LY1JCSBSsp32YvGVDCPziL03S8mu/bZkR7v6SQdfS1TwuO+P
	 RL8bY3ba5FRyJLV0YKmTxN5Rk8MiNNMTRPlLI3uUUlmE890gQ4ATe3SZwtTQ3a6ZPWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700900;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=U90YHHqYabJCzGCISBw16c6Orv5qCzpj8HcVqDO2HtM=;
	b=sNx2TTyI5EPw6SZ0eU7k6tIvhmhR+20Cz8hYDPzGTwocFr1+5jen6PfIsUl6CEXcvcyr
	 NVoUMXKRFbTRkRCTlI0ADEa7MRxO0dYd+DNK+lUcXHbV5d2SiWl+bhhbLw4yYsT07kSvy
	 fusKp2dWQBm70Kd8ZP5kP/mjqQ9f/LtPCqrGExKaurlTprertQD5aJXfjCnPOxpt9gQIw
	 16SsCg5Xus06pipQhtvZZqokK9jz4+maCHHVcAXVADlj53FJgwAFktKo6SBhrgRhJY3lx
	 WvYbopbHTK/EXNywsnfxy7qdZC8oQC7+dl2yFB5wdDOqvtvtsWmnAQ7G4DymiDWuY7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UU0i2ECF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A837F606BFB6;
	Tue,  3 Nov 2026 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UU0i2ECF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32DB1F00919;
	Tue,  3 Nov 2026 10:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700899;
	bh=U90YHHqYabJCzGCISBw16c6Orv5qCzpj8HcVqDO2HtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UU0i2ECFurVjJyBCS6ZF6AH2Xktl7pInMJd7bazTQddWePDIEA5puQTogv9IC4gmj
	 vDXtNCxrzh7MDJ3y8rdI/oSSkl60s21Po9fm5r9bLuW6alBau2Jag4PshJqMPPNyXv
	 vbVWT40/nrXKwReI3HHsqnziuE7kypXnARDHkipEtL71XPpOzXK8B0PI/SHFk7Zuxi
	 8UnJMwBR0AXholRlH1Ulo9W1W0gkzlSzG/FngOBMmh3bYiTP4poFqmEban/zXNJXR/
	 ZqovUxW/zY9QWyRYIKWlJC3ZxoqmwoyCPoDjpLmBdOngc8Mj0IiybdzgtAYP84YlhL
	 u/1XA/JjrQJtg==
Date: Tue, 3 Nov 2026 12:14:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, Yao Zi <me@ziyao.cc>,
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kexec@lists.infradead.org
Subject: Re: [PATCH 3/5] kexec_file: Honor the segment alignment for CMA
 allocations
Message-ID: <aum0GlBKTfZ6rvgL@kernel.org>
References: <20261023-riscv-kexec-cma-fixes-v1-0-825b90ea23c4@iscas.ac.cn>
 <20261023-riscv-kexec-cma-fixes-v1-3-825b90ea23c4@iscas.ac.cn>
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
In-Reply-To: <20261023-riscv-kexec-cma-fixes-v1-3-825b90ea23c4@iscas.ac.cn>

On Fri, Oct 23, 2026 at 03:33:16PM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> dma_alloc_from_contiguous() limits the requested alignment to
> CONFIG_CMA_ALIGNMENT without reporting it. kexec_alloc_contig() can
> therefore place a segment at a less aligned address than buf_align. On
> RISC-V with 4 KiB pages, the default 1 MiB limit is below the 2 MiB
> kernel alignment, and the new kernel stops at the setup_vm() BUG_ON for
> a misaligned physical address.
> 
> Release such a block and fall back to the regular memory hole search,
> which honors the alignment.
> 
> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  kernel/kexec_file.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 59fb9d71e9d8..6ce10e01414e 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -690,6 +690,13 @@ static int kexec_alloc_contig(struct kexec_buf *kbuf)
>  
>  	mem = page_to_boot_pfn(p) << PAGE_SHIFT;
>  
> +	/* dma_alloc_from_contiguous() caps the alignment at CONFIG_CMA_ALIGNMENT. */
> +	if (!IS_ALIGNED(mem, kbuf->buf_align)) {
> +		pr_debug("CMA block 0x%lx is not aligned to 0x%lx\n", mem, kbuf->buf_align);
> +		dma_release_from_contiguous(NULL, p, nr_pages);
> +		return -EINVAL;
> +	}
> +
>  	if (kimage_is_destination_range(kbuf->image, mem, mem + kbuf->memsz)) {
>  		/* Our region is already in use by a statically defined one. Bail out. */
>  		pr_debug("CMA overlaps existing mem: 0x%lx+0x%lx\n", mem, kbuf->memsz);
> 
> -- 
> 2.55.0
> 
> 

-- 
Sincerely yours,
Mike.
