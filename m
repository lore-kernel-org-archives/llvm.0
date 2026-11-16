Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845798;
	b=tUNWwiwRXvqeYVnyfW0fsunPqb0OakWc8vhYB/t2avy4ASJ85VUjKEmbKHqYzdZaAVEM
	 iu91e1vh5nrW0JEjdt4IaoMptspvK9VqyQjHgvaosSr3v10pt0dPmMSWIYthheqCGskho
	 r5XKMOSXpyrci1zarBd2eRROrLuJDKphf09yYDZCYOHXEZhIhV2lc/RouOywsWLKDlo17
	 mDAu9rFHbIjW5uMrYJWLbUjgVNlEY5nbXaErcKKI/EMJWXhMFQRD0OxI+BSbDCKdzY3Ph
	 YS0ku3JGc9kHeQ38CcwOOFnaxaFaRbFEuso2CWyvjELguzQeLqRs5Ryta+KP+GvJWtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845798;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yCSzCrkdCOCPlR1zdVahyL9VLjI4SbXe7wRt306JhTo=;
	b=gWaonx5kOIA3Rbf32T3h2cHPpXtbnaqo70C3XK/VkbW6UIiKTzGQEz9RuT1zWb+4a/IY
	 U8DurSYn9HsOwRRqVQ9OBvXjWFJwpJOUeaX9CZwfiym0/yV2ZBjbI0mDHMf+uKUFnFWfE
	 LzJbnNdHhNlzNMkViJljsywxD4XTkawZPDuv26UwSdVTABwyRD/KWoDj7o3LCLyCAnnGn
	 A4+koHazKek7NPW5nyD9dCkv7zoAagTdyrYeGpS1JplEQZn925+Kr43XKK9Crug7GhATM
	 VNTnKGfCWiFyG+Qyit52wGxNLYXpVwfT5s65hyN48ZvQmMPOj0V1m8f0Rs/simdNEUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C7606A323
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB3C7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-71aed54d4c5so821896eaf.0
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845796; x=1795450596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yCSzCrkdCOCPlR1zdVahyL9VLjI4SbXe7wRt306JhTo=;
        b=TWGg9RCSlvIfzUS5YwqqMUusUB2Uj+8ZoLVfwPHw3FjfCE/F1ROBOytiB11eWBDiDG
         LP/+ARdv3hdDwsE/Xfm7/C5Ffo2ZxOl6GbTLaFQSao3eB/Ym7TXbXq/5N7Bp7z4MTF7f
         ApF/WUS98ZKfZHIsDuguo4m9wD83R0PcHESgbeQAHYCddHCcGB4twU8loElXmq/O4WBZ
         5OCpUEqdWTb861GVyiQlZI3zEPYof43Fv1Mk0dclhT9GHgbCV5EPr8EE9PNai0eK1NQI
         leskLkQmBAmT6cB9XZI5EHzjwOs24aKMZaE6bIpB5vps7q/TwBPEsbQp4jLoNtsbUZd4
         hkGQ==
X-Forwarded-Encrypted: i=1; AL+hErEuVBXOc1r7fm/cbBfKG6DKrm/idxUSXQJPB0HXEetZYzYLAs6CXQROh2GlEnxtYtv811oX@lists.linux.dev
X-Gm-Message-State: APuU4Z+xvwDWaK5v4XmhxMyHserf28DG7KoTE5+M38xBO460OKAp5o0l
	X0R0+dVsM7sIZd9nJsgEq6ulqjROQfVg3RC21QMaizj+Vbcycu2/tSUk
X-Gm-Gg: AYBFou0xan8PCWBgma/jxkCeIzbagQUQLwSc6LIZ2EIz5pwXegwyVFxPvSqagPDH2j1
	TZElTCrABMBEOZripzGEDp8phclhGCoRhdsA718HFkeMzWPxwWXVbEWi55di431T+eUWCY7rbGb
	YvYsV5dR0YJMoISbpqqHwJAJJvLO0Hu6QcHSVou2gd311xv8FiXQGBgThaP6B91AHC7aBAE4GQx
	fuj8RYR8yhKNLBwrrqDnlAkLQleAWoesCRPVr04OvC7vULNERiEK+HpspXDcPaaHD6vLje47/GP
	9egHyICn2FDkgBIovB6GNxggoyYPDpSbwX/g5MyiqZNvb8qOYE7poO8gDLhnQpAAQuyiNEQionL
	6dus71GMYPICJ76e3DEdztaNi26t4hlhQ2U3zluayt2sWum+59Bn1TDj6URg5RVKwxHPv7GrV99
	mzbWojbKi05PJPSgFUlqLLzhui1vSv5CHkYAguzJCb+Yplb+1C5veAKsFjzIEjuziBdgeUFm/PC
	gSl28VCHCAuJmlRLA/NrlPF9P05bmDE0+h/lScXcHHwLWJfmzV2UhZMTEpkEWSzA0hplWcHVSoC
	tzqanWuHhM0hsSx18EYkYGYP2VhX1I2o3veicTJBngrfNTmsCO34C5pxsBWDyDdHqd6Z
X-Received: by 2002:a05:6820:570b:10b0:71a:fa49:2f33 with SMTP id 006d021491bc7-71afa49313dmr939115eaf.41.1794845796620;
        Mon, 16 Nov 2026 08:16:36 -0800 (PST)
Received: from [10.68.32.41] (bba-217-164-143-222.alshamil.net.ae. [217.164.143.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm8997106eaf.6.2026.11.16.08.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:16:35 -0800 (PST)
Message-ID: <a89b5be6-998a-4f3e-8768-0a64a9b33d61@linux.com>
Date: Mon, 16 Nov 2026 20:16:30 +0400
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: efremov@linux.com
Subject: Re: [PATCH] floppy: Avoid unsequenced accesses to jiffies in
 show_floppy()
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <20261114-floppy-wunsequenced-v1-1-a54dba6754c4@kernel.org>
Content-Language: en-US, ru-RU
From: "Denis Efremov (Oracle)" <efremov@linux.com>
In-Reply-To: <20261114-floppy-wunsequenced-v1-1-a54dba6754c4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Applied, thanks!

c1a8feb71ba8 floppy: Avoid unsequenced accesses to jiffies in show_floppy()

https://github.com/evdenis/linux-floppy branch for-7.5/floppy

Denis

On 15/11/2026 08:41, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in show_floppy(), which can
> break the build with CONFIG_WERROR=y / W=e:
> 
>   drivers/block/floppy.c:1839:30: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>    1839 |                 jiffies, interruptjiffies, jiffies - interruptjiffies,
>         |                 ~~~~~~~                    ^
> 
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
> 
> Add a local variable to hold the value of jiffies before the function
> call so that there are no unsequenced side effects, clearing up the
> warning.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2198
> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/block/floppy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
> index c677d783811f..f6339d779be9 100644
> --- a/drivers/block/floppy.c
> +++ b/drivers/block/floppy.c
> @@ -1830,13 +1830,14 @@ static void reset_fdc(void)
>  
>  static void show_floppy(int fdc)
>  {
> +	unsigned long j = jiffies;
>  	int i;
>  
>  	pr_info("\n");
>  	pr_info("floppy driver state\n");
>  	pr_info("-------------------\n");
>  	pr_info("now=%lu last interrupt=%lu diff=%lu last called handler=%ps\n",
> -		jiffies, interruptjiffies, jiffies - interruptjiffies,
> +		j, interruptjiffies, j - interruptjiffies,
>  		lasthandler);
>  
>  	pr_info("timeout_message=%s\n", timeout_message);
> 
> ---
> base-commit: ab43ec385580b8f8abf72d70fa3acbf4e4f098a5
> change-id: 20261114-floppy-wunsequenced-8b739d08b849
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 

