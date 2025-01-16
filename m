Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7508E26AF6;
	Thu, 16 Jan 2025 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737019724; cv=none; b=kkE++VMoN0KtQb2ncp79qYDijuKsY4w7ps0dldtJ/xQu8W0fvV0bkbJ64bf1Le6rE/8+gdnyDkdYL5DRxWq8wqlyaYrASrMdDZV61XtB7CqLZ7Ux379iz4mmN1KYtup2w+GUTFV4NbyTUS3RO5kgSpDoAZq3dN5OIbeOHAFiEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737019724; c=relaxed/simple;
	bh=q1N6dpwteaKfjhjdOUK7lSYTQDvOvNtkg5KU59vugBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8OgHe6tqRPf6go/C8SBODW13Va0VC5I+sONMByF5Fx4iZ8AYjmTGX/RMX0Bcsq1Wu4Wm2EruDQKCbHI+R/TZWK0L0o8YDD57+1+lGwFXaDxk6w8kPg2HDCO8K27Vn2jQuASvxQPiPCgT1axgQQvWYi0zqcWzXDfjx/UeolBXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TPh4Nsho; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TPh4Nsho"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z0Iy6G1ZUP0wTa1IVULCyE4DXrqOGuwbr9pw93Rn8q8=; b=TPh4NshoGx/paZseZCheS8u4fL
	V7N1zZ0cHmuC6v28KFSe6EQpQZZmb0QUDFbCxzlhM2Q6MQwdVEPv6lxdcH4+OXobM/U6Ffc7hp+2I
	6drY/2I7fJ7jLfojHbnG1FlE+3j82ULfvJ48CYk4g7UPsMYLDjmXZE+sL4BZOw8Ryv2WGpiBxFJai
	4YXfk7Oaq4D4W8qiBw3wdgGPPdqUCUbIjaIuq8Dl3ju0K/lQweDe2k62o6obSxyewZgOUhqcY4meT
	NY4d2sJkSiZM1DNtBkpxL6tu5Pk3xs26qoUhhjpmTRzGhcjpPCgXWuaSOhz3CT0ebUsQP5jXRciZv
	64DU8LcQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMAy-0000000B1dK-2sxh;
	Thu, 16 Jan 2025 09:28:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 19922300777; Thu, 16 Jan 2025 10:28:32 +0100 (CET)
Date: Thu, 16 Jan 2025 10:28:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Julien Thierry <jthierry@redhat.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Raphael Gault <raphael.gault@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 12/15] objtool: Add support for more complex UACCESS
 control
Message-ID: <20250116092832.GG8362@noisy.programming.kicks-ass.net>
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
 <64a6921ec7bc78c4b25561cf13e8147f26e884a6.1736955567.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64a6921ec7bc78c4b25561cf13e8147f26e884a6.1736955567.git.christophe.leroy@csgroup.eu>

On Wed, Jan 15, 2025 at 11:42:52PM +0100, Christophe Leroy wrote:

> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 91436f4b3622..54625f09d831 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -2422,6 +2422,14 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
>  		insn->dead_end = false;
>  		break;
>  
> +	case ANNOTYPE_UACCESS_BEGIN:
> +		insn->type = INSN_STAC;
> +		break;
> +
> +	case ANNOTYPE_UACCESS_END:
> +		insn->type = INSN_CLAC;
> +		break;

I would feel better if this had something like:

	if (insn->type != INSN_OTHER)
		WARN_INSN(insn, "over-riding instruction type: %d", insn->type);

Adding these annotations to control flow instruction would be bad etc.
