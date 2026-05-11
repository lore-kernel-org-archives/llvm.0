Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21AA2F8E8A
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 15:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511613; cv=none; b=SNl+GjArKCuBOVBIsPodRnBCaKdQD7362exMpZ9RYa/LuXryF7LHo71mqhpSoFUNGDVIahAX8uLJ1DiROR3dgyw4e7tQJfJGqRY/ZKBsJMNQcRbZIbxbjkCJbHgRPXLoSRq6T+pxQuOciyIrq6C7oS1BaiV+8Lt3DMWof0gjKwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511613; c=relaxed/simple;
	bh=0fl1FVlc4728Jngyah/QPyBoBZjAKjC9+pOxoqQncpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=P/GQqpq7HBYWTwTdHl2YEtkuA5tvYFWtTzHfo9dmPN/LZpjrPMSaE03W+PAnlQfgHtyKW5jRWKnoJGRr/rBeQIfN3hXNVfFb5olp8Ju1zl0VJU7FbI1kA11ghj7U42XXaDAVIiCNdvsgRZxulbNfd1d5noK/aX4lgCRSvArS/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SaXHgE3R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SaXHgE3R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778511610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w/eD3OaTHJb0ey72pgYTA9xJ2tegXQL9CnlHMvp4NrM=;
	b=SaXHgE3RSxAag9QTvuw9MKF5AKexYWkTU3xoBhdYqNwD+3K7nhQrX/xnJFrFSnkFTrA99o
	YlvbnyuW9ikC59QoI/qoOsK3XE5eqQVZbRyRHxEYywlXBqfQMNNkDPNFcGfkw8iwHiCi23
	CTFiaK4v0C599nIPRZWFEor4t5HZBI0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-VZAtk3kcNESwawAAccB58g-1; Mon, 11 May 2026 11:00:08 -0400
X-MC-Unique: VZAtk3kcNESwawAAccB58g-1
X-Mimecast-MFC-AGG-ID: VZAtk3kcNESwawAAccB58g_1778511608
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acaea1ffe7so99386136d6.2
        for <llvm@lists.linux.dev>; Mon, 11 May 2026 08:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511608; x=1779116408;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w/eD3OaTHJb0ey72pgYTA9xJ2tegXQL9CnlHMvp4NrM=;
        b=OpjUSgeRCCgE7jRc2e6Iy0/ja6Dwa119hSAkm+BUtiLLlvLZf3ElPcgw/eqRy+E9LG
         sCeLfAir+zvi46qrCZx56DZ+UMdouiHhh1cS6D7tmbvsNyCZT71eF4KDqK0Y1SjY/AuW
         la5dd025H+IiPm1bCdu90OW7U34GtKgjKIOHrldwsmQ7Yym7rQOVoZn4MHL1TpqtwLsW
         88F1S7yIPIoTqAdS49abmoMWLH3a7e3u2JFY+QprMRXOBi6P/5U4XKiEpK/HEYi0PUhG
         aF7TtdJEVO1C7eMHryUynmfKNalcgCGvaVGVAdISwEs5cvroiG4pAlHjjp96RTY7Ud1E
         sxgA==
X-Forwarded-Encrypted: i=1; AFNElJ/iC5KwDXaG5DW2GteIl3PYpBOw5yMvNv5/3PWU1yl+Kx/kI6Yge3u8n5mt8AaMvbs42J5y@lists.linux.dev
X-Gm-Message-State: AOJu0YyZylQebK39fMMu7JgcoR9VKeEWOe+J2Bfs/JjXx2LqyCtJ1LbT
	oY5U6Pp6TPwdyOwDHOumvpa3o2S09mKKtN1wIGfZYjqJcQlG9ROjx5mifUPYCkmW+D/i3Q8Fkkv
	tDyUH5BuCiETejgzl1nvsj/a/9uPSFpshVwoEf9o85O/LWniBx9GOGfI=
X-Gm-Gg: Acq92OF7YKM6XLusg+etFamE4KW/0AgJKpntmCiZOjbYAW4/UwekVC5NUCq1/y8huRN
	OvfS8MOXCTOoSOOFHlK00eBJD/JDs1iZkSW0aT+3EXhCto3EZJhWVTpyns6e29nBkow7oQ61cxt
	+ftSGQWL1BQE/YFO86KgghvmEeg9MBoA76CjsZQ7RHzUsaO/Pgq5I1GSYpkzSAS7E2FR0w2e4ji
	t6lyrqD7O4V/w6cmw2GW1OJBYme22kR73+g9KdmQyRCe5JgIqLtQ8OZCGMLNO0GdvPgcxcyxzGx
	CkJpD9w7cRPIWGZwOOafotVdt9wNnrmAWWbQm8SOijmSZQkQyNnsCHqfB4OWO/ejw3IQyTeByXO
	LFCY02ApLitIUlaBf5Z9rdvlwwWz83Zf4Hb88r2PFI+gUgY/VlLvwA2GQ
X-Received: by 2002:ad4:5c64:0:b0:8bb:2e70:7a2a with SMTP id 6a1803df08f44-8bc441e5420mr357791476d6.31.1778511605472;
        Mon, 11 May 2026 08:00:05 -0700 (PDT)
X-Received: by 2002:ad4:5c64:0:b0:8bb:2e70:7a2a with SMTP id 6a1803df08f44-8bc441e5420mr357785966d6.31.1778511600814;
        Mon, 11 May 2026 08:00:00 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a438e3csm96354776d6.19.2026.05.11.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:00:00 -0700 (PDT)
Date: Mon, 11 May 2026 10:59:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: hisilicon: allow COMPILE_TEST builds
Message-ID: <agHu78VflprAM7Yj@redhat.com>
References: <20260509051110.1061393-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260509051110.1061393-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J52291Z3ftSEB9HiCylTWnhDvcf4UDxxJiOrbIxVPYE_1778511608
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 08, 2026 at 10:11:10PM -0700, Rosen Penev wrote:
> The HiSilicon clock symbols already depend on ARCH_HISI or COMPILE_TEST,
> but the parent clock Makefile only descends into the hisilicon directory
> when ARCH_HISI is enabled.
> 
> Add a hidden family gate selected by the HiSilicon clock and reset symbols,
> default it for ARCH_HISI, and use it for the parent Makefile descent.  This
> keeps existing platform builds unchanged while allowing compile-test
> coverage.
> 
> Tested with:
> make LLVM=1 ARCH=loongarch drivers/clk/hisilicon/
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

