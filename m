Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794799920;
	b=hA1JOjlypoPXekrobuAuPNdBvDf5wx/xvJyCIEHNEPXnT8Rq4enVBSNo7KQmjOQiekEW
	 Nn9bv874ZvLozkCnOKVUkOFJ/HJHe/HmiFp3ZSNitwEIHd7YO1PgdXFogCi5k8B1h+48K
	 fqcs/2A+YwuAR224pBHiTAkdRUMH/EHAFjob9VJfy3II7Mf0mmpwGkKUIe4szW3P0kkA7
	 eG/jUjTsZ+qWRM1tqpwjudQ1T3AjDFyfepZpsQKfJYhKn7gae1pMU3qxTeaekhI90XWPz
	 T3p1UfWtd15cYrUiI8VrJrr6q0/pBLjhYDQmza3SoHCMRPX0X3lvf5Ut6vIaFLrfAHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794799920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=QbnteX2l0Jb6TmLxEnzbnWrqpp3+eF3+v/z+RV2T9cc=;
	b=fZH6mc4Mzu1mWGt31n941bz98ExVpJ5VOqGscpmbhhX3LTZxIbdkNriJawjjeEBSW6qC
	 jqwmwVK5OLT6z3JdH3p5BdmJGNvOVlhMRCgL51Kd9yPSxNczvvOCLF52hAtX2Cz6Fec0d
	 mV21LIEG8/Zw4sX81RdBlVixOH/HnkkRInlZiQlymRhz0/Se7GPDX4NzUsHsWR4qWuNYq
	 lHB29HwWEgS3njjUCTlnKfLmMBybnVTm8GKwlVQb9XUoovfu6kH9Q3Lzp38rgD/zf1+x+
	 TwPTbq/yHvAt94YrN+LqGJpGdlgy3gLLtDFWbreez12SreTYzndE37rZGTupooqaiPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TN6ABrWH;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC53606A31C
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 03:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TN6ABrWH
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b24f4b15c4so919188c88.1
        for <llvm@lists.linux.dev>; Sun, 15 Nov 2026 19:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794799919; x=1795404719; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QbnteX2l0Jb6TmLxEnzbnWrqpp3+eF3+v/z+RV2T9cc=;
        b=TN6ABrWHGkJb+pz/Pof1IFzf3wDIvGPjh/9CMOEcuACoq8h4lXaczxOpN6Hw/1lZ6T
         5B0ksqQTzhNiKKPti0TQq3H/QAzC5lmrvdsFPxzzaM2rWACFnBC+RGAPrTmwSCuwgWFh
         GoTNrRyulA/QOff/t6mN8TZR1ozhVBSLf7YsNVNf/1z/CyBSVq9SKpFpgbQoR2KmmoVf
         rfR2b3baO6m8q9KblQuwkKBqahYDrbLVUmv4irwB80wQoSb8jUAH0a1LH/ZPrgR+lZDn
         z4RjtBUkrJUZMj+4SYj3m6UC333QxHUlpnMO+ACG3bxBILSSRKwtOHhj8oRobHl0R8NJ
         xuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794799919; x=1795404719;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QbnteX2l0Jb6TmLxEnzbnWrqpp3+eF3+v/z+RV2T9cc=;
        b=IfRv3ZgHy234Aks5L6I1UXOTqhZirYBsy/6naS/1Mc65HElAMW7RHlc3DMfDY7nWaB
         LfhJlYd0LAvESMtTWtt8KG5EC82FJtiFRkzcfoufp1evyhvYAjnb7HFsMfR/Lp3xYuNw
         FZmHIjuHjPSTp1XZUZWsZpJs97u7/j8gIv2IAmOPoIKGWlYnIXB6XIDhGPVa/7ZO3yC3
         AFChUQC1sJ8VNmg6I4tiyz3RmjXMr8ptyTbreF246lM+pvy3FiAGBoh589ua2gMAMnLG
         UYXFXKFpK36Q4oFJo57s3OwBB/M2+Uknx+Ac4Jnk6E9iqJrzXRLVWHv98SwAA3kPO1nR
         kfbw==
X-Forwarded-Encrypted: i=1; AL+hErHPI6ohbYj8Leu9QGLqjO1DXZ4dNooPqqdNaPGHkb4i1ZYEQt9h99Rsd9TTX2Z1/gB6+vKp@lists.linux.dev
X-Gm-Message-State: APuU4Z/QUkZINO4OlhCjk6MIpCaIxuYIe5sqerDlpUHi1JlhgPrue80M
	bb6+E5VziClsUuinwmMh7UJyBb2ZDxupUpbPrF6907j713rBciteURmS
X-Gm-Gg: AYBFou1JaHk3U80lLBPdq3/f3NnQmxo1+UqjH2ZFwUY5ONhpqsqVUIHMFf90ZjoollJ
	ZqSAiyBD5G6BY3js+WM4Q7wMFX2uZjqjOx0lXZG2Lox8WcxG0N7WrIX5pbDy7Get2gaqRE2hK/Y
	3iOUacBj9/clYtmBPxhhgAlIU3bsMkWie8su4oQXalNmxPzeNBfNeSaaT2HfHX1naqGhvfO0tUh
	8eP88lXI5e1Z3H99q7xs2pFaNFTYDpZB1CIV8zb2+oLzNRJCfBAlnnvb343rNySA9InUhidtpZi
	I2T+KeDhqsQQ60GI9ieD6zAn2TyfyhUV4AAxpvG6uplPoALSxNdlyZc+hg9Z3Mce0GVxu49kCLE
	IZJylwnhvsqGo7MzZP91Xm0Q1wAtuDICc+MO0kwcVu7ta0L14uUj1UaApP5tIwJBHboFSJE0AaA
	VIHajCgtvy35xGxVjM+2pr6RN2jTwgQdrkJPD9H6d3R9uGMshoCGgKo+B6IoRYIAntRNsCEvQTw
	r5ZHjcrKElj/Ns6PvTarV+DANHVls272M/03+m9mT/dXUw8gNrVG8OJvJxTMovPRLHw02UKSDjf
	N1NZ5K6Xsc9a4VlJkqAvQ96xAwNToPaYdzO+Q9To7Mc8g49X
X-Received: by 2002:a05:701b:4294:10b0:1b3:b3d5:566f with SMTP id a92af1059eb24-1b5030990dbmr8883780c88.11.1794799918907;
        Sun, 15 Nov 2026 19:31:58 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm27456340c88.12.2026.11.15.19.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:31:58 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] powerpc/xmon: Avoid unsequenced accesses to tsk in show_task()
In-Reply-To: <20261115-xmon-wunsequenced-v1-1-42ae3fe45bf4@kernel.org>
Date: Mon, 16 Nov 2026 08:54:13 +0530
Message-ID: <1p8l8nmq.ritesh.list@gmail.com>
References: <20261115-xmon-wunsequenced-v1-1-42ae3fe45bf4@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

Nathan Chancellor <nathan@kernel.org> writes:

> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in show_task(), which can
> break the build with CONFIG_PPC_WERROR=y / CONFIG_WERROR=y / W=e:
>
>   arch/powerpc/xmon/xmon.c:3262:3: error: unsequenced accesses to volatile qualified 'tsk' [-Werror,-Wunsequenced]
>    3261 |         printf("%16px %16lx %16px %6d %6d %c %2d %s\n", tsk,
>         |                                                         ~~~
>    3262 |                 tsk->thread.ksp, tsk->thread.regs,
>         |                 ^
>
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
>
> tsk was made volatile in commit a2305e3de819 ("powerpc: mark local
> variables around longjmp as volatile") to ensure its value in
> show_tasks() was properly restored after returning from a potential
> longjmp(). Aside from that, the value is not being modified through
> other means, so rename the volatile parameter and add a local variable
> named tsk to hold its value throughout show_task(), clearing up the
> warning.

Yes. Reading vol_tsk into tsk (local variable) in show_task() function,
doesn't cause any functional change and also fixes the unsequenced
volatile accesses as you described.

>
> Cc: stable@vger.kernel.org
> Fixes: a2305e3de819 ("powerpc: mark local variables around longjmp as volatile")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2199
> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/powerpc/xmon/xmon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

So, LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

