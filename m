Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8236E47E;
	Tue, 10 Mar 2026 10:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139816; cv=none; b=tWt8PydVmdQPvu7L8K7lTumPQnEVdOt/auczWjSba+yT0idDFaeiOrZmnN8xfmovGTSyqRa3ilm53DyzVu6dWkbum59bJq5lDGXDMVTbNBjXL2AjtyHYEJMpfpXpUN+fnjkmamcZBOQkZ7X2zakH/zWSKyxcWJHqdqJB9i+DwMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139816; c=relaxed/simple;
	bh=lv/Ndv2cGNSU8aZpViy8aWp8+gArFm7Nl+ywKCt1J2w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iNJg3yWWB0dOa1JrPYpaY+iQtWPC+c2UdoZfPEN/JaYfaymCBq9aVT8WTd+nhYeVxMSn78wiMNfSgZGY0QjjcF2/TxLTkBparlq12bXjKeJ1wsSC+LLjne/kq5vNacsAesU3QHMsHCHS2kI6/WoR6AnPBrCmEsMrz+bJ8O1Jank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mz8OWw/n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mz8OWw/n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB5AC19423;
	Tue, 10 Mar 2026 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773139816;
	bh=lv/Ndv2cGNSU8aZpViy8aWp8+gArFm7Nl+ywKCt1J2w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Mz8OWw/nAP45YmbN1qfVWB3MpD98Hq/VK4sTreUz7bDKtUvA6dRpWW/XE73U4ugEG
	 HhK4RLYI4/BTv0PJfPT90p+fYzsFN01N89hUx7C94T9HjSoaosuONwyCThwlQtoYJQ
	 Wrg01OKBiiEMs3wpPqXT2AaQBxJNENgHYrypN/aMO+uyGPgOXNmnaUF3ijVO5wqqVb
	 89W5niv3FFHxKAfnIe8mubdmZSPDym/rdkgsKua1F4DFVyv9hwxIvfeeLSuPKZRS/8
	 9O8mqN/poUxM/G3DmidqbMQj8phGfEZ50QXVjxgHCRGO3PYM5dnyFadj/po+kEVEZs
	 I+EFrtjnwVVJg==
Message-ID: <a7d5ed43-2ab4-4338-87f0-7a50af463018@kernel.org>
Date: Tue, 10 Mar 2026 11:50:11 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: vbabka@kernel.org
Subject: Re: [PATCH] mm/debug: optimize once judgment with clang
Content-Language: en-US
To: Xie Yuanbin <qq570070308@gmail.com>, rppt@kernel.org,
 david.laight.linux@gmail.com, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org, Liam.Howlett@oracle.com, surenb@google.com, mhocko@suse.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
 justinstitt@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260309153405.20130-1-qq570070308@gmail.com>
In-Reply-To: <20260309153405.20130-1-qq570070308@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/9/26 16:34, Xie Yuanbin wrote:
> commit 242b872239f6a7deacbc ("include/linux/once_lite.h: fix judgment in
> WARN_ONCE with clang") helps optimize performance and size under the
> clang compiler, but the modification is not complete.
> 
> Port the modification to VM_WARN_ON_ONCE_PAGE(), VM_WARN_ON_ONCE_FOLIO(),
> VM_WARN_ON_ONCE_MM() and VM_WARN_ON_ONCE_VMA().
> 
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: David Laight <david.laight.linux@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>

We don't need to make debug code (hence perf doesn't matter there) more ugly
just for clang's sake, I think.

> ---
>  include/linux/mmdebug.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
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

