Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501863FFB
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 15:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3970BC433C7;
	Wed, 30 Aug 2023 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1693409961;
	bh=ne4Gc5MN3+77rtGMwaPZrR9E+QAA8QsqVqxCBZ0rPBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z0eu/k18sxOxR+B3cSOhiqjW50rAMxUSR2ntv0kFJ6Um38IrQv4a81J9p/G0+9MJG
	 vi2dBGfwvsPsprnfOo4ZiAroD6MvcyCDgRzvTA6WutxyIpLM15sG4vEBVnrPcInxfZ
	 1+Yf5yPbxTKs/ToAgO8GMahlv1b7RfRzUHkHukeA=
Date: Wed, 30 Aug 2023 17:39:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Apply 9451c79bc39e610882bdd12370f01af5004a3c4f to linux-5.4.y
Message-ID: <2023083056-figure-plasma-1774@gregkh>
References: <20230830153342.GA888898@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830153342.GA888898@dev-arch.thelio-3990X>

On Wed, Aug 30, 2023 at 08:33:42AM -0700, Nathan Chancellor wrote:
> Hi Greg and Sasha,
> 
> Please consider applying commit 9451c79bc39e ("powerpc/pmac/smp: Avoid
> unused-variable warnings") to 5.4, as it resolves a build failure that
> we see building ppc64_guest_defconfig with clang due to arch/powerpc
> compiling with -Werror by default:
> 
>   arch/powerpc/platforms/powermac/smp.c:664:26: error: unused variable 'core99_l2_cache' [-Werror,-Wunused-variable]
>     664 | volatile static long int core99_l2_cache;
>         |                          ^~~~~~~~~~~~~~~
>   arch/powerpc/platforms/powermac/smp.c:665:26: error: unused variable 'core99_l3_cache' [-Werror,-Wunused-variable]
>     665 | volatile static long int core99_l3_cache;
>         |                          ^~~~~~~~~~~~~~~
>   2 errors generated.
> 
> I have verified that it applies cleanly and does not appear to have any
> direct follow up fixes, although commit a4037d1f1fc4 ("powerpc/pmac/smp:
> Drop unnecessary volatile qualifier") was in the same area around the
> same time so maybe it makes sense to take that one as well but I don't
> think it has any functional impact.

Now queued up.

greg k-h
