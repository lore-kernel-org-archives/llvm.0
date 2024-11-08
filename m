Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A800233D96;
	Fri,  8 Nov 2024 18:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731092077; cv=none; b=Eg0BYRBtEWlHOut6OFFzXHsy2jLS91l0qLeY4MPS4CgNfBXtghh5taOhJBuYr1E0g4pLl/2ZjATWPqXr52sc3HlkyMwt6DouLDR6Aklh6KTk155qqnJh2NVNun+p/EDtCtTyft71L+B45q7GnfyMWuPFqToLJQdzqkHkIrgVNt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731092077; c=relaxed/simple;
	bh=i+b6iI6rTQzFtWDzZdJZq3XzYiI3fmg6UAFsyE+A1e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHfjYKuJ905uHa0Xz2TdSGHeOI0adeQyY2dTt51Rg7ri+VwHTh4NFzEpvmPA5gg3D/5TQqr5S/sWdgUhvTUFbdyo6nwStt+1id+tgn6C2Ld1txtPvwrMNQdwGUkCVAF9SVMyptpwr1NuDig3cECre6T4zjIkBqeBQ0OTBoqHxSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4T6X1Va; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4T6X1Va"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D49DC4CECD;
	Fri,  8 Nov 2024 18:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731092074;
	bh=i+b6iI6rTQzFtWDzZdJZq3XzYiI3fmg6UAFsyE+A1e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4T6X1VaU4CUSlM6gsQqWZMP4HwlShyBLyv5Rru+dzpB3n227w7X84S3APRC+VR+f
	 abLPqnQEF1JlWeOEIXc4OX0rhIeDUjPAOvsaRvu8lJgI+d/E28knzLKedaeKtQC/69
	 nDSOZpX79EHoXrC//NBIXHaw3HXq2hcSxvMoF6QaGNaPx8NYvvu9s9vL9iQpygUSb+
	 ERCKlbSNN6u4H7U3KzckCQmdqSQ41hKrtony6guJwnSBRHKG0e0XDdvoeeOeO8lekh
	 yzHbkoxc10VZd95YgjHD265H1F7hEQZs7HQux8Lvv/Wln+NagZ6YsLj5aiLVvHTQkL
	 yiTP4Jkwx7Lcw==
Date: Fri, 8 Nov 2024 08:54:33 -1000
From: Tejun Heo <tj@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrea Righi <arighi@nvidia.com>, David Vernet <void@manifault.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 sched_ext/for-6.13] sched_ext: Do not enable LLC/NUMA
 optimizations when domains overlap
Message-ID: <Zy5eadwAuQSzqp-1@slm.duckdns.org>
References: <20241108000136.184909-1-arighi@nvidia.com>
 <20241108181753.GA2681424@thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108181753.GA2681424@thelio-3990X>

On Fri, Nov 08, 2024 at 11:17:53AM -0700, Nathan Chancellor wrote:
> Hi Andrea,
> 
> On Fri, Nov 08, 2024 at 01:01:36AM +0100, Andrea Righi wrote:
> ...
> > +	/*
> > +	 * Enable NUMA optimization only when there are multiple NUMA domains
> > +	 * among the online CPUs and the NUMA domains don't perfectly overlaps
> > +	 * with the LLC domains.
> > +	 *
> > +	 * If all CPUs belong to the same NUMA node and the same LLC domain,
> > +	 * enabling both NUMA and LLC optimizations is unnecessary, as checking
> > +	 * for an idle CPU in the same domain twice is redundant.
> > +	 */
> > +	cpus = cpumask_of_node(cpu_to_node(cpu));
> > +	if ((cpumask_weight(cpus) < num_online_cpus()) & llc_numa_mismatch())
> > +		enable_numa = true;
> 
> With this hunk in next-20241108, I am seeing a clang warning (or error
> since CONFIG_WERROR=y):
> 
>   In file included from kernel/sched/build_policy.c:63:
>   kernel/sched/ext.c:3252:6: error: use of bitwise '&' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
>    3252 |         if ((cpumask_weight(cpus) < num_online_cpus()) & llc_numa_mismatch())
>         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         |                                                        &&
>   kernel/sched/ext.c:3252:6: note: cast one or both operands to int to silence this warning
>   1 error generated.
> 
> Was use of a bitwise AND here intentional (i.e., should
> llc_num_mismatch() always be called regardless of the outcome of the
> first condition) or can it be switched to a logical AND to silence the
> warning? I do not mind sending a patch but I did not want to be wrong
> off bat. If there is some other better solution that I am not seeing,
> please feel free to send a patch with this as just a report.

Oops, that looks like a mistake. I don't see why it can't be &&.

Thanks.

-- 
tejun
