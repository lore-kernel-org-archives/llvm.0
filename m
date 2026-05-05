Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E392066DE
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777968217; cv=none; b=lzmZWLtw7UnkHUMo3ejT5waIo7g/PnMtQVq9ITRLHf1c4aGhcO/pkhTfzcKO925w5c/N0scCV1ICsA10e/Z7tqVk/Zy1rP63HIPl4xzEr8KeFNRnsCXJgv/zy1hW6bGHxj1KFjpMdq2iXMEWTH7OkQdsmuncTTgyarEMPe4wsRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777968217; c=relaxed/simple;
	bh=eFl3ZW1fQsyuvlaAImo28QlmWhvfN4CAVYLlOWDD41E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kruxPVAxle/SPm7+cOVaw3LbB+bJjQIKBay2c+jgMW8qc8gBfHhYAz8l3yxZSVwVkVpUtHMjF/6UDY4b9S0XZf0+1C73gIogtl4Y5henXMRKAK3XEVDMnzjC0EGgwJZQkKjQOcOXSWnrOeB7z31uopO2+xVwxkrRO3Gvf8y7Wg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=xjIkz+FV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="xjIkz+FV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso40970045e9.2
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1777968213; x=1778573013; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqR/wy63Urn0t3ThqxSLpf9nxTN7sHcwtEOysFg+/Ls=;
        b=xjIkz+FVPXQrbSFWbSVCf6YDmDS4LQrRPFe3yWmzwaXyZICL3/CELutK44OGGTNp/B
         m4j/bYKp7RjQFJrPg0IpjOVCEIkzYVvxzkvSbcF6fY3gBjkjHRXybnOs6alrWnfPV86z
         ce1iz54qAwmfAzGB5c1xA3zFtCvBWh+BH8g6ATwEECH6oYN/wPwh8UWD62W7IDyNWWWK
         GWMaJ81UT37d4Ps0NAmEwwdsycqLq+hllLbqHH53n9REWLpR5pcZi4+t0GsdNdXWrlyS
         aG32/ssLPoVLCPqQi10/edm5X5IJXvI9bGWe6tymb1XPpxudhsmFb1bqlKHZxRYCW7oj
         A+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777968213; x=1778573013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqR/wy63Urn0t3ThqxSLpf9nxTN7sHcwtEOysFg+/Ls=;
        b=bCHn3zO9PGL390KbFe/W/s8esub+0GyqCq4VcTtwdXHNTLCmxNd0hzByqS/QkxNEai
         DJiDG3vhMWrI325Z+ACJaP3cYVs/YkMtw7aUOzHwIRUKqg93w/EUo8t7XcDToNiT2pcG
         yVN0hd/6jJ3UcVN5vsvWw5I/REYUWaCNDAzsJFbrcOL+ATZxrm7WwACTJxLV7oBDd6m+
         SORUcxkpJJd7FoOvE6pdM0a0RPBkTBgdk6RG0jnajX8z5EmuK7kCco82SVRH0E28Vrp7
         f8/IMdxdPBuu7BX9NblnK30bnE4pOXzWotM9woGmvE0RTVLjcaHewMNpzcAnUQDA4hb+
         ZgfQ==
X-Gm-Message-State: AOJu0YwjZiefg4rZsSACxzQSW7+t4k+l15ttaE/DXMLoRlvRzzzj3PX3
	dEhOTBRIngwDK1HaDXbyVnHSYbgP0k/xymkAftkwoGHhJXzMkaq1HzVnn2hTr3HVTb8=
X-Gm-Gg: AeBDieuo4KZnlPaoCWMmYhN+wivodt2BYGBH/RC0upxqq/tHkDdq378rbPPyb/yoMCv
	JHoIHFQQaK9aTL0PycZMovBU6ssrj2jYuWZa7EQr855iefiSGBJiv7wzHcQTlYanbQs+wg5PBpq
	GcT53A20axtMgAMgq2mkb+zC44E+c2DHq9v6w7AwPbBnfHGJ/MDU3YMGZwmYLaxq+DmJxrIvYEc
	6NEGN4Yk4nLAHzmUuDQn/jU5b1vuu4T5d5r7R4U40kS3Akiq4qUzO5NVBU8O/zAVsjt7O+Wf0r8
	PSSHlPJka96sYrxnrt+OZhgPWhIGKzbIYvkrhvG4J9ZnSa/CFeKlEru0N1DsDFVt57q26+XxcMu
	XD6bsQGJ4tUQxCYvrAIR/2g66+n/oplycftUtATJHhgBTwR+QAYzEtZUYRpw3aDbFDRu/Nf7aE7
	rbK8B3IaDfi77BiKrYIKj+liQm+98e6kgQGO3gV+tPWivgyKIM2NkOrHXWMDrvd8Wlk+uJwC9ge
	WCbX0A8UHFQsB2s25bQ
X-Received: by 2002:a05:600c:4e15:b0:485:ae14:8191 with SMTP id 5b1f17b1804b1-48d186dc89emr31013215e9.5.1777968212669;
        Tue, 05 May 2026 01:03:32 -0700 (PDT)
Received: from [10.211.9.173] ([213.147.98.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14a16187sm12914705e9.9.2026.05.05.01.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 01:03:31 -0700 (PDT)
Message-ID: <1f1e6ef7-f353-4d4c-8678-77a8728b1d0e@kernel.dk>
Date: Tue, 5 May 2026 02:03:30 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:io_uring-user-acct.v2 2/2] io_uring/rsrc.c:52:46: warning:
 variable 'count' is uninitialized when used here
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <202605051516.EwH8GTl5-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202605051516.EwH8GTl5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/26 1:58 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-user-acct.v2
> head:   3db2fc5d524bb4877e39659d0180dfc0112893ac
> commit: 3db2fc5d524bb4877e39659d0180dfc0112893ac [2/2] io_uring/rsrc: add huge page accounting for registered buffers
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260505/202605051516.EwH8GTl5-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051516.EwH8GTl5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605051516.EwH8GTl5-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> io_uring/rsrc.c:52:46: warning: variable 'count' is uninitialized when used here [-Wuninitialized]
>       52 |         xa_store(&ctx->hpage_acct, key, xa_mk_value(count), GFP_KERNEL_ACCOUNT);
>          |                                                     ^~~~~
>    io_uring/rsrc.c:37:21: note: initialize the variable 'count' to silence this warning
>       37 |         unsigned long count;
>          |                            ^
>          |                             = 0
>    1 warning generated.

This one is already fixed in the current tree.

-- 
Jens Axboe

