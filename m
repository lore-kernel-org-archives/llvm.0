Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834FF3B19A0
	for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576989; cv=none; b=YJjtOfnROYgyNoi4og85GfqXcMIc0ILZxboKtHABFSps2uStp9OYdSkCFPdheZIzVAY0aw0OwetjDqAQwaGgXW0eApIAvGZQfrJet0f3g7WJ2hzkp4C1ONmR9FV2GWlMngHZJ3DFv2hnpy45jvgdZrltmvetMqZ+FzsBPO5ePNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576989; c=relaxed/simple;
	bh=fUXGc8N7lOiu/ttSB1jFdmerxyjFkHx94HszQ6mCydA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XmP0p9vr1T1Qqg2hy5xaX7y/moYC2tXNgevJXYCX3W4gJbzRlut791cKCBCi21fnreMM2PLsAJ/e5ssMqyMFpPCl1vYf5sD9nIGNJUng3qY1f+bOm7pAiMVRz5ncu7gdAbYfLb1F7R/Kq6EEajpPGLQOb/M+bAGVaw7oAgaJrSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QdLXnT0X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QdLXnT0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784576985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R3g8Y+ZL+PfTaYg0OUzAkvSo6d0BBLLMuCBAXDGcKtE=;
	b=QdLXnT0X7iutb8L6wvHhwLMSPDWV3g/t0n14HDi/MmT0clk10gyOmND1v6HbNFzx9DUvjb
	GHA9IV5q2f6HlpMETGgV/iY6KwSKRYjGy8HDNVWUCyOkfGad+4C9wgTk6ZCHCYvh/JHcm3
	KmSxBOd+PIqx1Putz72d8V9SWUftHFw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-B04kx6eGNdiCE1_iiiGIcg-1; Mon, 20 Jul 2026 15:49:42 -0400
X-MC-Unique: B04kx6eGNdiCE1_iiiGIcg-1
X-Mimecast-MFC-AGG-ID: B04kx6eGNdiCE1_iiiGIcg_1784576982
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so90665131cf.1
        for <llvm@lists.linux.dev>; Mon, 20 Jul 2026 12:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576982; x=1785181782;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3g8Y+ZL+PfTaYg0OUzAkvSo6d0BBLLMuCBAXDGcKtE=;
        b=eQ0L5H3NRtT5tazE6p3p8i4qEkjPfzPb2lXH9hTTToLucvY6eTWGkqV5z4Ld9hwYyl
         foVvA5sLmlpl86HPaiA+mrsjK0EK63kkZgkRQzJXyS8psRDHDmAoccvHrZ2uCzXOEnOb
         k9W7HUevWBxwULVbsADpknee5GA0x8aWbq3vXtROlgOheisva0LoGEwIu+eQnQXeOd+6
         k3/UvEw7f440hFkMa+OX4fpRl8P8B+HJvoIyKVMWtLOoFGYjaWp6DuX6SVTv+O1iCy/7
         PsZE8KSLpPl+YJL178tla+CzfTknB5RZNbNMwCOZU/GUZa7e+7RbLKio4rPW/MVPx00p
         XQyg==
X-Forwarded-Encrypted: i=1; AHgh+RoJewuSX14i1kSYmalnyonzfb8+gmGBscCgUXgNCdFNrx0i09jLSyCLsTpw/tjG7t9Lig+7@lists.linux.dev
X-Gm-Message-State: AOJu0YyJgCM1SWzK7L57KvCeGDfaXLNDNbaAh3fvg55Def1YVTrKthWc
	nQj88uGFj+AIfO2u7ZlAwKaHJcQr7xlHI1pCBOKDm+FmlmhaLkAXynCUZjvJOhGSJ2q/XAy9aDS
	YgUJYjL2DB5FBnywcO1Yg2S27fe+K4Ggc7wHtGOyL+U/8six5rC79gRw=
X-Gm-Gg: AfdE7cndaSlEkWzri/JTYBqAZ6IOp1JiZujWNAh6tryyZTOaG3pTv0AvxQTqr7qeSKv
	ejLa2Qatg6qmRQs8nFCPSLpcEtKl7vU6cGAGLN/LGY/SaMAFW2zTnyqO7k+6a22UjHg5QzDyzJ4
	SzSx6illQ5jo7t8KO8ROvgtQf6Ikxts2sjsoBLin1VDWlvgKGpeojtZ1Iqozo0RelxgwX9COdyC
	XrQbeavWehDnbIWjbH4ivnUK2WDhDQTSHjmWIfyvjRB8z9u9c0JTtUOURgVgZTSuWYMVqTjq8ei
	p5An8ZZfN3KX9W4ixYvP9QdyJFB/Rz4QrYyEEx/tvcBC84l8QiybN6zU3VUpBuTH5d66f+TkE3B
	pDRa0OTuYS82HpxR5FNjo84M34LsB6vqxEG0=
X-Received: by 2002:a05:622a:1cc4:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-5213cdca291mr135213771cf.35.1784576981660;
        Mon, 20 Jul 2026 12:49:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-5213cdca291mr135213501cf.35.1784576981250;
        Mon, 20 Jul 2026 12:49:41 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214fae361dsm79033051cf.25.2026.07.20.12.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:49:40 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:49:38 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] clk: hisilicon: hi3660-stub: use
 devm_platform_ioremap_resource
Message-ID: <al570vTZ5ZXCCYUz@redhat.com>
References: <20260719215456.787188-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260719215456.787188-1-rosenp@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TwwoFjF9jsPdaSN4LfMHJaEE4P-s0olt4HlX_5QT_24_1784576982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 19, 2026 at 02:54:56PM -0700, Rosen Penev wrote:
> Replace the open-coded platform_get_resource() plus devm_ioremap()
> sequence with devm_platform_ioremap_resource(), which fetches the
> resource, requests the region and maps it in one call. Switch the error
> check to IS_ERR()/PTR_ERR() and drop the now-unused struct resource
> pointer.
> 
> The only in-tree user (stub_clock@e896b500 in hi3660.dtsi) has a single
> 0x100-byte reg region, so the region reservation added by
> devm_ioremap_resource() is exclusive and does not introduce overlap
> failures.
> 
> Built for ARM (drivers/clk/hisilicon/clk-hi3660-stub.o) with LLVM=1.
> 
> Assisted-by: opencode:hy3-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

