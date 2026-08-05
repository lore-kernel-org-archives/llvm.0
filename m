Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF354582E6
	for <llvm@lists.linux.dev>; Wed,  5 Aug 2026 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932528; cv=none; b=CjORqzQCiKKuBmq0EvUlB3OboQlDSekkJZL5c+sZLczkNmPEK4rbGnjg48gJ53L2e2Ze9WW8HWmZsMysT6C3v88bvZxIC0xi9npk+1efYof8Py46ATGLdH2ipkT7K14HH+pXHJLtrFWu873Z2zTs0awCkr2MLoPzrRijRI6xRlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932528; c=relaxed/simple;
	bh=cAUsgU4EJXakijwIowjwI/L1uubpmLUU6TxOAgZOF64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgkvQwoCTBVb7YBTI5rywiIR3AHbY8OQm0Vmz6fH48pII3paqX26yAdMr9TAouC9If8uFQMh+QzODy6NcSSHGVcdPNEtj/TQGh+/Zj/DUL7EfreBrKayXAtwW5zfhER1UHGh5SooCZ3rvtlt5vah6AogfGBCZSI/hb9wxPUzUUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 0B87B70A144F; Wed, 05 Aug 2026 14:21:59 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:21:59 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Link Mauve <linkmauve@linkmauve.fr>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org,
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com,
	rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org,
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com, gregkh@linuxfoundation.org,
	prafulrai522@gmail.com, nsc@kernel.org, japo@linux.ibm.com,
	lina+kernel@asahilina.net, j@jannau.net, airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
Message-ID: <anMq59xoOrusKKl2@desktop>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
 <anG67Q6Y59kDqh-c@desktop>
 <20260804202217.GA1109939@ax162>
 <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anMnoT0KLd5PRGmX@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Jabber-ID: linkmauve@linkmauve.fr

On Wed, Aug 05, 2026 at 05:40:42PM +0530, Mukesh Kumar Chaurasiya wrote:
[…]
> For these warnings below diff should fix it. I'll send out a patch soon.
> 
> diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
> index 06d7d1a2e8da..acec2d2fede7 100644
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@ -6,7 +6,7 @@
>   * Sorted alphabetically.
>   */
>  
> -#include <uapi/asm-generic/ioctl.h>
> +#include <uapi/linux/ioctl.h>
>  #include <uapi/drm/drm.h>
>  #include <uapi/drm/nova_drm.h>
>  #include <uapi/drm/panthor_drm.h>

You likely want to keep the alphabetical sort here.

> 
> Regards,
> Mukesh
> 
> > when building this series in next-20260804 with rustc 1.97.1. I am not
> > sure where the clang diagnostic warnings come from. I assume the target
> > feature warnings are expected but it would be good to get those
> > addressed sooner rather than later. I see '-hard-float' has an issue
> > open
> > 
> >   https://github.com/rust-lang/rust/issues/117347
> > 
> > but I don't think I see issues open for the other ones.
> > 
> > -- 
> > Cheers,
> > Nathan

-- 
Link Mauve
