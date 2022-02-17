Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD55437A
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 18:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A760DC340ED;
	Thu, 17 Feb 2022 18:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645123304;
	bh=0P3vqxHlJAfwQg/wCe2MwrJkTAq7hFs2Cg2M4s18uXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTBjILvyPBPAfByfSTvDxpvxE8PnJbN1W+1tdMo7ZPxEg+dJcXCo4Pssf/Z697e8K
	 hu15gHCKNzfTnA+QVp5kfUV7QJfs4vtMwyTd9adl2UOj0SHRDevEggdqxqNAQ3UWgi
	 e2FWvLiyvlF3xfVavulAYkfk0FSTgRoQ6sZ1gcrY=
Date: Thu, 17 Feb 2022 19:41:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 4.9 to 5.4] Makefile.extrawarn: Move -Wunaligned-access
 to W=1
Message-ID: <Yg6W5XX4qQquz4yE@kroah.com>
References: <20220214161641.1818-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214161641.1818-1-nathan@kernel.org>

On Mon, Feb 14, 2022 at 09:16:42AM -0700, Nathan Chancellor wrote:
> commit 1cf5f151d25fcca94689efd91afa0253621fb33a upstream.
> 
> -Wunaligned-access is a new warning in clang that is default enabled for
> arm and arm64 under certain circumstances within the clang frontend (see
> LLVM commit below). On v5.17-rc2, an ARCH=arm allmodconfig build shows
> 1284 total/70 unique instances of this warning (most of the instances
> are in header files), which is quite noisy.
> 
> To keep a normal build green through CONFIG_WERROR, only show this
> warning with W=1, which will allow automated build systems to catch new
> instances of the warning so that the total number can be driven down to
> zero eventually since catching unaligned accesses at compile time would
> be generally useful.
> 
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/commit/35737df4dcd28534bd3090157c224c19b501278a
> Link: https://github.com/ClangBuiltLinux/linux/issues/1569
> Link: https://github.com/ClangBuiltLinux/linux/issues/1576
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> [nathan: Fix conflict due to lack of afe956c577b2d]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> I am not sure how many people are using ToT clang with ARCH=arm on
> stable but given how noisy this warning can be, I think it is worth
> applying this to all applicable stable branches.
> 
> This applies to 4.9 through 5.4 with 'patch -Np1'.
> 
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)

Now queued up, thanks.

greg k-h
