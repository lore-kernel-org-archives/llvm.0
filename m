Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700926;
	b=a9496kK5K6+lqlS4fMxDldL1q9nn7nQL5K16a1dd7qo269UWagejn+ei/Tm0i9WOlO2x
	 d8JeJXcqiLOOhQKSKR8GQyLYOEwSY7l/reh8Rn7phQpdMDy34C8uX28aWaccirRqMefPu
	 tTOeO5ku/M5bn+Qxbce9wNW2Bne6IAH46N/4MmC3akORaYS03q04O8pod2+gKOve16XSd
	 EIQInGPWs4RVSbAtmLul3kpmHstputnJr9J8F9T1+NvIvhG6x30OKHLPjazeffuJYQi/N
	 HxgnMwAAjVPLraNFi94kzjbOlOgQ8/RrKNjePWqJ7wmdHoQNUDnKHI+qYqtur0D15sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700926;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5o98qwlKEQyOrCRjq2RUqHe7Txdo2HfIj4qXGPwficc=;
	b=YiYSOEz8TUNwgmQMVxVTo7JmWAMnXGvkc3QSfsjUqFWYnVDtSnhTnYBeC78D89ElBkiX
	 SYVl57lZLCUsDMPHQ8fGrDlaevPS23ZB5kRwcwTr0xtHm404wKoGVbhaeyk/c4S0XeoPS
	 sp4+Au9Toxv1Gr60AbtO1zcnnkGN4JtEwBFFA/lOd3XLW2BD8orAgrKswUwO/gn6XR6SX
	 RxBnMErbK4WPCysGp2xwLW3udOngr/jRy0NzytMeZDYlGf7N2j3D3ZCXGnxVZuCQo76cF
	 vZ5LD2BRYQ7rzSVPGYhFUxwkDOVgXhYTQWIMpC0TCTBLa2HaLSTEzgBnRWgaG8XDYjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4M9873z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBAC606C575;
	Tue,  3 Nov 2026 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4M9873z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53311F000C1;
	Tue,  3 Nov 2026 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793700925;
	bh=5o98qwlKEQyOrCRjq2RUqHe7Txdo2HfIj4qXGPwficc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l4M9873zeOp+nuSn9vGGPWM/5zR54YN8iGYC/B8Y18HQJOpFdwDfuPsn2vNUNk+NP
	 Uhf2M+Btkoiph3PQBpwJsFhic896iAqepE0h9dLCpKlAT/9gUjbY5mhQLzGQ3/fL1f
	 ZsQ1uSDCfX8u5/3T+tY4zOt7H2ihasdNaaoxKbI2NBQYIYbtZO9nG9bwX8dcZbYdyO
	 0BQUezOpFtIVi/H+vhLMA7bUtpqmWfcSpK93Xv8oCzQ+t22pDSLZjSIfg3hXfKDps3
	 DdRnHbHugGUkSbZpCF5hrPiL7KiLQeeff3o/ayxbyjmYJq+PIMS+HKqulLooeXACS4
	 r4f891vSExf1A==
Date: Tue, 3 Nov 2026 12:15:16 +0200
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
Subject: Re: [PATCH 4/5] kexec_core: Clear the unused part of CMA segments
Message-ID: <aum0NFfSezGOiR0K@kernel.org>
References: <20261023-riscv-kexec-cma-fixes-v1-0-825b90ea23c4@iscas.ac.cn>
 <20261023-riscv-kexec-cma-fixes-v1-4-825b90ea23c4@iscas.ac.cn>
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
In-Reply-To: <20261023-riscv-kexec-cma-fixes-v1-4-825b90ea23c4@iscas.ac.cn>

On Fri, Oct 23, 2026 at 03:33:17PM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> kimage_load_cma_segment() copies the source data into pages that are not
> cleared, but zeroes nothing after it: the final memset() runs once the
> loop has consumed all of memsz. The tail of the last source page and
> every page beyond bufsz keep stale data, while the purgatory digest
> covers them as zeroes.
> 
> A kexec_file reboot then stops in purgatory on a digest mismatch, for
> instance when the DTB lands in a reused CMA page.
> 
> Zero the remainder of each page instead.
> 
> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  kernel/kexec_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index dc770b9a6d05..0d6e10bea4e4 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -780,15 +780,15 @@ static int kimage_load_cma_segment(struct kimage *image, int idx)
>  			goto out;
>  		}
>  
> +		/* CMA pages are not cleared: zero the part without source data */
> +		memset(ptr + uchunk, 0, mchunk - uchunk);
> +
>  		ptr    += mchunk;
>  		mbytes -= mchunk;
>  
>  		cond_resched();
>  	}
>  
> -	/* Clear any remainder */
> -	memset(ptr, 0, mbytes);
> -
>  out:
>  	return result;
>  }
> 
> -- 
> 2.55.0
> 
> 

-- 
Sincerely yours,
Mike.
