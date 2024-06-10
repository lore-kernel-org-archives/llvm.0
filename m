Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7302214D2A4
	for <llvm@lists.linux.dev>; Mon, 10 Jun 2024 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718047547; cv=none; b=MwLQkI1NKyhZSgt0sybOwCyQ2/Qy6f0WPshKUmN5+95GeU6KD7mLoZ4nrDK+rMWSgZQaUC9b/9dpkL2bFKrAY3ZArW7qgKGRVY8AJ3jlsO6QPGRM0CFmSX5376p05GI+yR6dCOs8ZSxueWAPOG6hExpUXM45mOdYYmhB9wnQjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718047547; c=relaxed/simple;
	bh=7bsXVi0TLI+JJc1WAlezseRuGrFBaa3rd0QJp0OIKYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsNEMsbFx8i87s8zcGjHaDIdYZ0L0fpcBRPV7dGeByN0DMvWN058bf+B4xHQBcKbm/XRvyiKZwhiD3qaoYg8pIABW2PUxni+XiDaZD9oDwDB5Av7ZNJeDLHFexe0wsb1XcMqahXzszAK5pZR9Xlv6Fy0aLJW9CqxfvjPK6EcfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfvLwyjU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfvLwyjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56EAC2BBFC;
	Mon, 10 Jun 2024 19:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718047547;
	bh=7bsXVi0TLI+JJc1WAlezseRuGrFBaa3rd0QJp0OIKYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfvLwyjU2W1f7NzFgPkA8IeNvyDW5p9a82AXiad0XeedWwh1QltD3tZ1Zt4k7uD05
	 eqU9XDch1MV5bHx1sLwgHzIuG0RQBzjCKapiBDdIwAaX22Jcrk8yo+iWyTPJFjVsT5
	 IzUAmevpoTySjB+DK+Q9kSNkNrgsbHnmX42J3IharGvwnqSbfi34akiOElwgK4Qo/G
	 fZejpjWwunLA5CvPujtiiVZGyVnXqMoroegihUxm9M8R3vcg4C+uMBROjMiYtJtrDN
	 NYjtYhG8zFI4VVIEriqmyg4vpT38wnnOvfu4ydTOarhQ0w6gXop/20sDmLoaVsqlhW
	 8r5JPGsEjJMOA==
Date: Mon, 10 Jun 2024 12:25:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] llvmorg-19-init-12271-g29189738b832: Failure on
 aarch64
Message-ID: <20240610192545.GB1089674@thelio-3990X>
References: <944395997.80401.1717976265852@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <944395997.80401.1717976265852@jenkins.jenkins>

Hi,

On Sun, Jun 09, 2024 at 11:37:45PM +0000, ci_notify@linaro.org wrote:
> Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.
> 
> We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.
> 
> We track this report status in https://linaro.atlassian.net/browse/LLVM-1233 , please let us know if you are looking at the problem and/or when you have a fix.
> 
> In CI config tcwg_kernel/llvm-master-aarch64-lts-allmodconfig after:
> 
>   | commit llvmorg-19-init-12271-g29189738b832
>   | Author: Dan Liew <dan@su-root.co.uk>
>   | Date:   Thu May 23 18:35:24 2024 -0700
>   | 
>   |     Reland #90786 ([BoundsSafety] Allow 'counted_by' attribute on pointers in structs in C) (#93121)
>   |     
>   |     [BoundsSafety] Reland #93121 Allow 'counted_by' attribute on pointers in structs in C (#93121)
>   |     
>   |     Fixes #92687.
>   |     
>   |     Previously the attribute was only allowed on flexible array members.
>   | ... 130 lines of the commit log omitted.

Thanks a lot for the report. This is expected and how Linux needs to
react is still being discussed/figured out:

https://github.com/ClangBuiltLinux/linux/issues/2026
https://github.com/ClangBuiltLinux/linux/issues/2027
https://github.com/ClangBuiltLinux/linux/issues/2028

Cheers,
Nathan
