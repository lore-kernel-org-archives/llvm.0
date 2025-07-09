Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D8417A2E1
	for <llvm@lists.linux.dev>; Wed,  9 Jul 2025 01:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752024272; cv=none; b=EUnd/dez3jC+6S8mMtN762YeGkfur4fVncJBqXNBf16ES9BErmvM99JaCFacbx8i8tacS5dDbcKdY81iFA/R0Ai4wnYlE3rvOFfadM2U/OI76lYMApyd0vr7PFFMpN0XdtZbC6byLG+1CIegPsqRoULfzes5TS1Zieg80VP0qAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752024272; c=relaxed/simple;
	bh=l9eZKe4aFMjo1W3brAfVlNVGnA8sDk2R+FE3hzIi/t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWPRTPPu5xI43zqWTN73rDqE4fx7x3nPQDYpGEblYWIPTrAFuQGW6gDcoA0a/sCeL1B3FtmGIeUKlw2xXW7kNbr6TCfKA4yQLZmBGhMz6Xqksk14Q0a/Pu8yLbY69P/OqeeMu79HZr+He1P2SUBlEwIECNblRfgmSoShVXVyx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=u2jiWhC2; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="u2jiWhC2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752024261; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=4MmB1BakiDawhjgLtgjN39SwS31oyDZQIXV3mIYwskQ=;
	b=u2jiWhC2Ue+qfjlk/4g9bUUjaTL0msimxQ6Vz07VktKOOGj26fQNUCgUTqWkVuViQuIv7Ph5uzu8bpZDdjb2ziodzr8CgELC+8lwoq+ckRfAp2/FhuAm/Q4Alq9LnbT+i8QIotC86OZlbQ66rC+H03YE1V43nI/mIb0tFFoUH+Y=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WiV0sQf_1752024259 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Jul 2025 09:24:20 +0800
Date: Wed, 9 Jul 2025 09:24:19 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lance Yang <lance.yang@linux.dev>, Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] panic: Add __maybe_unused to sys_info_avail
Message-ID: <aG3Ew-EB-T0hiOt2@U-2FWC9VHC-2323.local>
References: <20250708-fix-clang-sys_info_avail-warning-v1-1-60d239eacd64@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-fix-clang-sys_info_avail-warning-v1-1-60d239eacd64@kernel.org>

On Tue, Jul 08, 2025 at 08:37:57AM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   lib/sys_info.c:52:19: error: variable 'sys_info_avail' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>      52 | static const char sys_info_avail[] = "tasks,mem,timers,locks,ftrace,all_bt,blocked_tasks";
>         |                   ^~~~~~~~~~~~~~
> 
> sys_info_avail is only used within sizeof(), meaning it is only used at
> compile time, which clang warns about in case the developer intended to
> use the variable elsewhere. This appears to be intentional in this case,
> so mark sys_info_avail with __maybe_unused to silence the warning.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> This should be squashed into
> panic-add-panic_sys_info-sysctl-to-take-human-readable-string-parameter.patch
> so I did not bother with a fixes tag.

Looks good to me. Thanks for the fix!

- Feng

> ---
>  lib/sys_info.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sys_info.c b/lib/sys_info.c
> index 46d6f4f1ad2a..5bf503fd7ec1 100644
> --- a/lib/sys_info.c
> +++ b/lib/sys_info.c
> @@ -49,7 +49,7 @@ unsigned long sys_info_parse_param(char *str)
>  
>  #ifdef CONFIG_SYSCTL
>  
> -static const char sys_info_avail[] = "tasks,mem,timers,locks,ftrace,all_bt,blocked_tasks";
> +static const char sys_info_avail[] __maybe_unused = "tasks,mem,timers,locks,ftrace,all_bt,blocked_tasks";
>  
>  int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
>  					  void *buffer, size_t *lenp,
> 
> ---
> base-commit: 10f2351db2799f80af91da7aee4c60fd042bfcf3
> change-id: 20250708-fix-clang-sys_info_avail-warning-fa19cdd77b71
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
