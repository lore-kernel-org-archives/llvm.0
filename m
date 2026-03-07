Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567B43859D0;
	Sat,  7 Mar 2026 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772871147; cv=none; b=TozJTIUoL7+MvJsCDtyzPYDzKTmW7jSg1XA2VoUMaDWsMxDq7B29b3CVO6fYMUM/9BPBZQu1NHFRcL/vRSU2nbmdSSJxPIgVrv1OFD74RD98Hq/1I1147fTgvpZNM8jlH5DnTGNIDFD9QNTquwh+IZpquCWGeAJrwaxcf8azhps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772871147; c=relaxed/simple;
	bh=pbzFoDuvMn3JPkaovhYfMFaj6gWOQL7cm+VcI8S47tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MG5+tZKlNfqnfOSGEiPfoFZ+18RaW6hlMgtIAkcBw6m8iTKNNXCp6g4z0jpGMyYyy7MVkZ988W0/Tirh0a1cio/iV/wy43XUSdzH+ZYj3p5hNgoFEbQwedfwxiBh8ObEHaBp/LFeU33cfZz2uSut6EwyBXT9OAWO8wrolBoVVcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtP21oxO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtP21oxO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A79C19422;
	Sat,  7 Mar 2026 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772871146;
	bh=pbzFoDuvMn3JPkaovhYfMFaj6gWOQL7cm+VcI8S47tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtP21oxOAW5Cgf4Jk3AmX1HmRhDvJOtzr5D1Jphvb7RhIpWZHOSnKV4puwoBPgZyc
	 s1fEMY3IKS/tUt9tj7PgRA2MUL1SBWtHHRFSyxPHhqO8pycuLD3Bggv0IWYSGssEsv
	 YbZAvIo9wkFMk9p3pd66OCtpZtvKBB/9/BaRzWGb3wXHL7AMqIbt15ih163DoZP8fP
	 YuSGahVBsoa68hPOHa8W4bJPRhw0bqZVXZc/YnY4SsbHCDzxus66mz8DkhGgWBmo/t
	 pyuczhiMiWRpOWHbBDRMLmE4+65w0RpHyOmqylV4gicnb8V6x2AQ4xuiCSw1SccV4t
	 iIw66Ud6x92KQ==
Date: Sat, 7 Mar 2026 10:12:18 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Xie Yuanbin <qq570070308@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mm: optimize once judgment with clang
Message-ID: <aavd4hoAO1DFLuJP@kernel.org>
References: <20260307065405.37473-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307065405.37473-1-qq570070308@gmail.com>

On Sat, Mar 07, 2026 at 02:54:04PM +0800, Xie Yuanbin wrote:
> commit 242b872239f6a7deacbc ("include/linux/once_lite.h: fix judgment in
> WARN_ONCE with clang") helps optimize performance and size under the
> clang compiler, but the modification is not complete.

How much does it actually optimize for size?
Note that performance is really not critical here because we are already
dealing with slow path of debug code.
 
> Port the modification to WARN_ON_ONCE_GFP(), VM_WARN_ON_ONCE_PAGE(),
> VM_WARN_ON_ONCE_FOLIO(), VM_WARN_ON_ONCE_MM() and VM_WARN_ON_ONCE_VMA().
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
> ---
>  include/linux/mmdebug.h | 8 ++++----
>  mm/internal.h           | 3 ++-
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> index ab60ffba08f5..a167c5aa525e 100644
> --- a/include/linux/mmdebug.h
> +++ b/include/linux/mmdebug.h
> @@ -60,7 +60,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	static bool __section(".data..once") __warned;			\
>  	int __ret_warn_once = !!(cond);					\
>  									\
> -	if (unlikely(__ret_warn_once && !__warned)) {			\
> +	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
>  		dump_page(page, "VM_WARN_ON_ONCE_PAGE(" __stringify(cond)")");\
>  		__warned = true;					\
>  		WARN_ON(1);						\
> @@ -80,7 +80,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	static bool __section(".data..once") __warned;			\
>  	int __ret_warn_once = !!(cond);					\
>  									\
> -	if (unlikely(__ret_warn_once && !__warned)) {			\
> +	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
>  		dump_page(&folio->page, "VM_WARN_ON_ONCE_FOLIO(" __stringify(cond)")");\
>  		__warned = true;					\
>  		WARN_ON(1);						\
> @@ -91,7 +91,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	static bool __section(".data..once") __warned;			\
>  	int __ret_warn_once = !!(cond);					\
>  									\
> -	if (unlikely(__ret_warn_once && !__warned)) {			\
> +	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
>  		dump_mm(mm);						\
>  		__warned = true;					\
>  		WARN_ON(1);						\
> @@ -102,7 +102,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	static bool __section(".data..once") __warned;			\
>  	int __ret_warn_once = !!(cond);					\
>  									\
> -	if (unlikely(__ret_warn_once && !__warned)) {			\
> +	if (unlikely(__ret_warn_once) && unlikely(!__warned)) {		\
>  		dump_vma(vma);						\
>  		__warned = true;					\
>  		WARN_ON(1);						\
> diff --git a/mm/internal.h b/mm/internal.h
> index 6e1162e13289..52367f52d623 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -93,7 +93,8 @@ struct pagetable_move_control {
>  	static bool __section(".data..once") __warned;			\
>  	int __ret_warn_once = !!(cond);					\
>  									\
> -	if (unlikely(!(gfp & __GFP_NOWARN) && __ret_warn_once && !__warned)) { \
> +	if (unlikely(__ret_warn_once) && !(gfp & __GFP_NOWARN) &&	\
> +	    unlikely(!__warned)) {					\
>  		__warned = true;					\
>  		WARN_ON(1);						\
>  	}								\
> -- 
> 2.51.0
> 

-- 
Sincerely yours,
Mike.
