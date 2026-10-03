Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A498439BFED;
	Sat,  3 Oct 2026 21:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062068; cv=none; b=IBGOcfbFHkfhid4jWG2oFH18ezcdTpnZXR4Qza8qT9stCftAsbSLdFCFuNP0Y36iCXRNMpbCLuxoF7Z10aALoSJHuNEpd+YqsJ4uZ0mRMNnvfKi0zgygIeF4MPlTUxIzjXdJK7dV8C3orqrdN3aPIuDtcAlJwFmhkH0MtYFnHgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062068; c=relaxed/simple;
	bh=CJ6c5Zd1uYQq/ti9meGO7cyRW6CJGI8tPRrhWTQG0m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVMhLOXq4T1mkA7t41lgfZDBxkv94arfzM/ynBo/RfdBPhdPmiybr3yzmgZqM/h6L/J8tdGXRj4evG0O/7nRTGznQk7AKw1Jn/TTo/+9teoCyPdlLtgUvY1loht3H4CRbeS5qi5MSxbZhAtEmfhKF3XMWQLzPJnrvBk5PT8EUVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltMCYBJh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltMCYBJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333431F0089B;
	Sat,  3 Oct 2026 21:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791062067;
	bh=91Re1ki5i06ImfQ2WQcYkJL+cFX6XDihWfIGyXVk9j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ltMCYBJhrHGywMCwYCJ9iRp6v+aDzPtsuVq2HKqfaurd57oEobFkLFNFD5tiGhRK6
	 6mCP1gWhsYHLavzgdTNI+TJrrxsMt7jVNJW6grUR4JBpRhVI/Y4XWsLTvXw/RPrIIK
	 pP08cv3FpCr8lM7nLmTw+UmWiJ/fMloU23eW+C1z0o3CItNgmi4vq6zp8BLjHJMnS0
	 1ZIEZyeAIC4iQzaP130AYyCzvbqZ7D/PJ/pFk1rTLCx7lkMYVszdtHqwknkrTw57Ji
	 xRUwAVeLYWfSHSdCudnhgyuaxAU9dP7HTIqOxxFwxYoeqyD+Lq0ccQ9ImMsvqjOEtF
	 cCLMjIb+uciFg==
Date: Sat, 3 Oct 2026 23:14:21 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	"kernelci.org bot" <bot@kernelci.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] arm_mpam: make the mon_sel guard conditional only
Message-ID: <20261003211421.GA1389115@ax162>
References: <20261003121251.3942666-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003121251.3942666-1-sashal@kernel.org>

On Sat, Oct 03, 2026 at 08:12:48AM -0400, Sasha Levin wrote:
> Building arm64 allmodconfig with clang fails:
> 
>   drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
>   of function declared with 'warn_unused_result' attribute
>   [-Werror,-Wunused-result]
>     207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> 
> mpam_mon_sel_lock() is __must_check and can fail: for an MSC accessed
> through the MPAM-Fb firmware interface it returns false when called
> from a context that cannot sleep. The mon_sel guard was defined with
> DEFINE_GUARD(), which calls it unconditionally and discards the
> result, so a guard(mon_sel) user would carry on without the lock and
> release it on scope exit.

I wondered why we do not see the same warning with GCC since it seems
like it should also warn on the same construct...

> The unconditional guard only exists as the base for the conditional
> mon_sel_lock variant, which is the one actually used.

but this is why: GCC may not emit warnings for dead code due to some
warnings being emitted from the middle end after optimizations happen
but clang will always warn because its semantic analysis runs in the
front end before optimizations occur.

> Define mon_sel_lock directly as a conditional guard class instead, as
> posix-timers does for lock_timer: the constructor returns NULL when
> the lock cannot be taken, and the destructor only releases a lock
> that was taken. ACQUIRE(mon_sel_lock, ...) works as before, including
> ACQUIRE_ERR() returning -EBUSY on failure, and there is no
> unconditional variant left to misuse.

These macros make my head hurt but this seems correct to me (though not
enough to give a formal review tag).

> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:66f869ecbbb5b8592562ffd89f049c5ddf682547
> Closes: https://d.kernelci.org/i/maestro:647269216758644837afcaac8e67d8dbe713a0e2
> Fixes: 0db1715e4c9c ("arm_mpam: propagate MSC access errors for hw_probe functions")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thanks, this fixes the build for me as well.

Tested-by: Nathan Chancellor <nathan@kernel.org> # build

> ---
>  drivers/resctrl/mpam_internal.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index ee7c3953a9b6c..be1795b29aca2 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
>  	return devm_mutex_init(dev, &msc->mon_sel_mutex);
>  }
>  
> -DEFINE_GUARD(mon_sel, struct mpam_msc *,
> -	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> -DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
> +DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
> +	     _T ? mpam_mon_sel_unlock(_T) : (void)0,
> +	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
> +DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
>  
>  /* Bits for mpam features bitmaps */
>  enum mpam_device_features {
> -- 
> 2.53.0
> 

-- 
Cheers,
Nathan
