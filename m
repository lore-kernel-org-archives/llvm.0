Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEB9219ED
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708104069; cv=none; b=LRyZZKQHkuOuDaDyncujC2Kgx60wV3p3PxKz4iw5h2VPfP2ZyugCyjCVrOLxaCxaKnJ0/n0BXn74/6t+PT7FCFp4C3w8dSZ/FczCwMhQYjgrnLF3KlWebN4UTkAems1bCdRjZ3qwRYH2mopHNL7PwLya07Lvh3figpmrRHciXpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708104069; c=relaxed/simple;
	bh=yESAlwHUyoqJ9dwcB3Qp++fB/3R3GtWL28LNJ36pRc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrHX3Ub2BD6fZ+tZ6kj36lrCqOShAQzUdOQ8L5nG9Wa+hDwX9S82313vS8buvzjqefxTwYThBuY4z1HP3n6jVs3SH67B3KJu/5yrL4IvTdXhTq5JOscH44aMzFJ5662RRGgbtAAVrbw8u2SAkuMCV0kdrd+kTegN2q8nH/DYSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29067DA7;
	Fri, 16 Feb 2024 09:21:47 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A04A63F694;
	Fri, 16 Feb 2024 09:21:04 -0800 (PST)
Date: Fri, 16 Feb 2024 17:21:02 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] firmware: arm_scmi: avoid returning uninialized data
Message-ID: <Zc-ZfgVbAvAZVrPu@pluto>
References: <20240216163259.1927967-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216163259.1927967-1-arnd@kernel.org>

On Fri, Feb 16, 2024 at 05:32:53PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang notices that there is a code path through
> scmi_powercap_notify_supported() that returns an
> undefined value:
> 

Hi Arnd,

> drivers/firmware/arm_scmi/powercap.c:821:11: error: variable 'supported' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>   821 |         else if (evt_id == SCMI_EVENT_POWERCAP_MEASUREMENTS_CHANGED)
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/firmware/arm_scmi/powercap.c:824:9: note: uninitialized use occurs here
>   824 |         return supported;
>       |                ^~~~~~~~~
> drivers/firmware/arm_scmi/powercap.c:821:7: note: remove the 'if' if its condition is always true
>   821 |         else if (evt_id == SCMI_EVENT_POWERCAP_MEASUREMENTS_CHANGED)
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   822 |                 supported = dom_info->notify_powercap_measurement_change;
> drivers/firmware/arm_scmi/powercap.c:811:16: note: initialize the variable 'supported' to silence this warning
>   811 |         bool supported;
>       |                       ^
> 
> Return 'false' here, which is probably what was intended.
> 
> Fixes: c92a75fe84ce ("firmware: arm_scmi: Implement Powercap .is_notify_supported callback")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

thanks for looking at this, this series that I've just posted is still
to be reviewd at all, so I would expect issues :D...BUT in this case I
dont think that the clang report is valid since, inside the culprit
function scmi_powercap_notify_supported(), a few lines before the
reported usage of unitialized data there is a check (@line 816) on the
'bounds' of evt_id itself

	if (evt_id >= ARRAY_SIZE(evt_2_cmd) || src_id >= pi->num_domains)
		return false;

so basically the mentioned if/else WILL be evaluated in some of its
branches for sure and supported wont be uninitialized.

Indeed, I removed from here (and from all the series) the explicit
initialization at definition time right before posting the series.

Having saidm that...maybe it is just brain-dead this approach of mine
since it is able to fool clang & friends...I would add bACK an explicit
initialization of supported all across this series in V2, if this
sounds good to you.

Thanks,
Cristian


> ---
>  drivers/firmware/arm_scmi/powercap.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
> index aae91f47303e..8ee3be8776b0 100644
> --- a/drivers/firmware/arm_scmi/powercap.c
> +++ b/drivers/firmware/arm_scmi/powercap.c
> @@ -820,6 +820,8 @@ scmi_powercap_notify_supported(const struct scmi_protocol_handle *ph,
>  		supported = dom_info->notify_powercap_cap_change;
>  	else if (evt_id == SCMI_EVENT_POWERCAP_MEASUREMENTS_CHANGED)
>  		supported = dom_info->notify_powercap_measurement_change;
> +	else
> +		supported = false;
>  
>  	return supported;
>  }
> -- 
> 2.39.2
> 
