Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F1D5810E;
	Wed, 31 Jan 2024 08:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689239; cv=none; b=Q4aZbGR/sUYZdD308GhRU8d5R4oUrLAfsytNuJLir6Nli+FMeA29Dt+pAMt3HZOGQ/NZgvjWnIKNzvH4qd7b50Mw5mNbcmKesLDhefgs3ix4fHDINVnbp3wnrXiw5ty1hPzG6NVIrVSt69z+/53p2h5MyHiU14rmm0rZmCzr9Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689239; c=relaxed/simple;
	bh=SGzk9JA5A4WdBx6j64XS/jDdmN0WOY6psDzBiqQDpNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rz9Uo6Ft93nUQyhVuGiNFARssK90/dzKcRSe3mIVb5LWXT1Z0Su0q6Y0vIqsBzinzX/+xrC+kmLbtdiTlR+HJEO+ERpVE7INgaF68E6JqRKB1NE1tY0fWfyb6aflJHGpS/6dHF2QCck9yXWVQtG9YPpY/e10SlmhJ21jyti2Z1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRxQFIrn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRxQFIrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706689238; x=1738225238;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SGzk9JA5A4WdBx6j64XS/jDdmN0WOY6psDzBiqQDpNc=;
  b=iRxQFIrnH4IFoaWsM9BdI1qOQ2RvYKorE0hGBsYDw97EnJe9tTJuDoDF
   yldgXjW08t7JXK/trzvnWqfy9dyOm984wHmVKRZ95jVuSdGH+bPgjSJ43
   2d7CEWzIgHOQiNDzQwVxbco/NlyXhy2pf7Agf4QMfgxrtqHIGJw+Gf6+U
   QtPlflGrTeWOVoB82azGDykvqBKBQdI9p0HS3uIdhLwwuBTNnzglmne7w
   TzOpkxOs8HvYQZNP07TN4EGvc9A4xMPnAukPIOao/ojQ/6gCxpgp02cxq
   a163HC+WsbMq7rO09i2+Zpmtaz9XQ2AIq79rbGLhMYuWSg3sSyMQvMfAA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="22041368"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="22041368"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 00:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="738021278"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="738021278"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2024 00:20:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 146D22D5; Wed, 31 Jan 2024 10:20:29 +0200 (EET)
Date: Wed, 31 Jan 2024 10:20:28 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Kevin Loughlin <kevinloughlin@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Pankaj Gupta <pankaj.gupta@amd.com>, 
	Hou Wenlong <houwenlong.hwl@antgroup.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Michael Roth <michael.roth@amd.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-coco@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>, 
	Andi Kleen <ak@linux.intel.com>, Adam Dunlap <acdunlap@google.com>, 
	Peter Gonda <pgonda@google.com>, Jacob Xu <jacobhxu@google.com>, 
	Sidharth Telang <sidtelang@google.com>
Subject: Re: [PATCH v3 1/2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
Message-ID: <4ljfvg7c23g2wx4hcqz6x6tx7uvp6fffayqvu4ptsmfqajlujr@zngokbd2awma>
References: <20240121182040.GBZa1geI5NxWSslvt0@fat_crate.local>
 <20240130220845.1978329-2-kevinloughlin@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240130220845.1978329-2-kevinloughlin@google.com>

On Tue, Jan 30, 2024 at 10:08:44PM +0000, Kevin Loughlin wrote:
> diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
> index 359ada486fa9..b65e66ee79c4 100644
> --- a/arch/x86/include/asm/mem_encrypt.h
> +++ b/arch/x86/include/asm/mem_encrypt.h
> @@ -17,6 +17,20 @@
>  
>  #include <asm/bootparam.h>
>  
> +/*
> + * Like the address operator "&", evaluates to the address of a LHS variable
> + * "var", but also enforces the use of RIP-relative logic. This macro can be
> + * used to safely access global data variables prior to kernel relocation.
> + */
> +#define RIP_RELATIVE_ADDR(var)		\
> +({					\
> +	void *rip_rel_ptr;		\
> +	asm ("lea "#var"(%%rip), %0"	\
> +		: "=r" (rip_rel_ptr)	\
> +		: "p" (&var));		\
> +	rip_rel_ptr;			\
> +})
> +

I don't think it is the right place for the macro. The next patch uses for
things unrelated to memory encryption.

> @@ -239,14 +244,14 @@ unsigned long __head __startup_64(unsigned long physaddr,
>  	 */
>  
>  	next_pgt_ptr = fixup_pointer(&next_early_pgt, physaddr);
> -	pud = fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++], physaddr);
> -	pmd = fixup_pointer(early_dynamic_pgts[(*next_pgt_ptr)++], physaddr);
> +	early_dynamic_pgts_ptr = fixup_pointer(early_dynamic_pgts, physaddr);
> +	pud = (pudval_t *) early_dynamic_pgts_ptr[(*next_pgt_ptr)++];
> +	pmd = (pmdval_t *) early_dynamic_pgts_ptr[(*next_pgt_ptr)++];
>  

This change doesn't belong to this patch. Maybe move it into the next
patch and combine with removing fixup_pointer().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
