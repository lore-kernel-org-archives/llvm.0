Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB170217F31
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 22:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895603; cv=none; b=VFgknpKkGULzZ5w7TFerUAyoGxU4xydzyOU7XtfCMgYiSdfAu1x7WowOI1XSLEcdipRsm7v8tgxWoF+I73wkZ0RweEbOpMrjk7/qmAEveyBEdGl0MdnQj4Foy+CnT7+ykMgy14/P7/ZLfwt+WM3qoa5OAHT6Yb3AEfUmRtQk/Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895603; c=relaxed/simple;
	bh=SyQ8KjxFK8NhxQXCPghiE/MhZ4V/j5BotFRr3AMG02o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwPpg7ON+UWl2yx93lQgkbSixP5NusK0TjdbfIngb/RfciXzKm6pRMdBbcjfqu0vcl7C/bEkUIkMz6Vuz144ugX/l8EShkGh2tNdNYED/ZBiHu0cPoKn7X2oPKVEIZbctwEiI7MtMnenPYW5e3kesNAxwMlBgaW4KnCHuwEQ6fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5K9k4TR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5K9k4TR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47724C4CEC3;
	Fri, 25 Oct 2024 22:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729895603;
	bh=SyQ8KjxFK8NhxQXCPghiE/MhZ4V/j5BotFRr3AMG02o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5K9k4TRK3jWdpe36sQK0qlHNsRr2vVSOIlwrxMnRLq5yj8T4y1Eb8r+04l5a5Eok
	 dmymmatnpb621u1ocutiZ9cRtawUhfur5MeIeSzxVGmVUrTmZtVa8Z74few65TUr0M
	 mBuOWFz6K7eEHtQFVYUcdLAS+2sAXZtmY5Uaee890qefHxXcXd3z0HJl8/XnXFXVd7
	 am7dGYmaSTvJ4p98u+eI2e7setf3QAA9hI4gltm8IO3D0B6dTEYtXK36NGZvH+9LU5
	 1ru/jXylvP1qNeyRtaxOAb9iCyxwOUcFdUj3Lh1KtpysTx9bG9ESVzg5R21B2wYLPH
	 YCim2KLxE4s9Q==
Date: Fri, 25 Oct 2024 15:33:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: llvm@lists.linux.dev, Kalle Valo <kvalo@kernel.org>
Subject: Re: Which LLVM options impact function stack size?
Message-ID: <20241025223321.GA3647469@thelio-3990X>
References: <bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc214795-1c51-4cb7-922f-67d6ef98bff2@quicinc.com>

Hi Jeff,

On Fri, Oct 25, 2024 at 02:31:47PM -0700, Jeff Johnson wrote:
> While doing Linux kernel builds with both GCC and LLVM I'm encountering some
> very large function stack size usage using LLVM that I'm not seeing with GCC.
> I suspect some nuances in debug or compiler options may be at play. Curious if
> there are known options which can have a significant stack impact.
...
> +UBSAN_ARRAY_BOUNDS y
> 
> With GCC 14.2.0 I see a single stack size warning in the ath12k driver:
> drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_bss_assoc':
> drivers/net/wireless/ath/ath12k/mac.c:3253:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> With LLVM 18.1.7 I see:
> drivers/net/wireless/ath/ath12k/qmi.c:3546:13: warning: stack frame size (2456) exceeds limit (1024) in 'ath12k_qmi_driver_event_work' [-Wframe-larger-than]
> drivers/net/wireless/ath/ath12k/mac.c:5601:12: warning: stack frame size (1176) exceeds limit (1024) in 'ath12k_mac_op_sta_state' [-Wframe-larger-than]
> drivers/net/wireless/ath/ath12k/mac.c:10024:12: warning: stack frame size (1080) exceeds limit (1024) in 'ath12k_mac_op_remain_on_channel' [-Wframe-larger-than]
> drivers/net/wireless/ath/ath12k/mac.c:3132:13: warning: stack frame size (1112) exceeds limit (1024) in 'ath12k_bss_assoc' [-Wframe-larger-than]
> drivers/net/wireless/ath/ath12k/mac.c:4940:13: warning: stack frame size (1112) exceeds limit (1024) in 'ath12k_sta_rc_update_wk' [-Wframe-larger-than]
> 
> Especially concerning is that first LLVM one is which why I'm trying to
> determine why there is a large stack size with LLVM when there isn't with GCC.

I would expect CONFIG_UBSAN_ARRAY_BOUNDS to be the difference here. I am
not familiar enough with LLVM internals to say why exactly this occurs
but it has occasionally come up for some kernel code that is array
access heavy. I think it is often a combination of inlining plus
instrumentation that causes LLVM to be unable to reuse stack slots
effectively. Arnd has sent workarounds for some issues like this in the
past using 'noinline_for_stack' or rewriting code:

https://lore.kernel.org/all/?q=f:arnd@kernel.org+Wframe-larger-than

Cheers,
Nathan
