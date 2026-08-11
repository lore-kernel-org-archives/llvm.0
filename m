Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9603BAD9C
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483316; cv=none; b=EhlC3ueuLjLqkwSV9k5sglXssj1KBl3vXtQmzR8cpKaqbktMsn0/cr3A+5YznI42NpLl2DeDATng3n+1KDcqYceB4Sd/zIJc46htUhv0b05BuRDOB/iNq0yzDOR+43hya7NhPIXjF15F/5XriVMaQJIJOJckRlm2cFYlk+T/Yxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483316; c=relaxed/simple;
	bh=Fs1q1LuXAYTQ937j0F968WLbSfpvhN7jSqDN7Jd6uBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMcn4u1CuBJbo7bMvJ9latXKIS927JtQwE2OpJR7/llxG6MQcvq0wyIyCBjJJxtgzQGp7jN6HB5HvuqxiRPtMuuhe3/pMtHFe2eYQckp0vVtr4Zv9HDxMVzDKN/x7UIFftWDkz8gDHJb3THg/8uwmX/aQmZ+lJ9hdBPeKfUTrwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yy22w9mW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yy22w9mW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cab973140bso7123115ad.3
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786483314; x=1787088114; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GgcKeBktnliFILPgH5Yp5qgxA2fPy6McTHeUrYz6elM=;
        b=Yy22w9mWBs5EW7B63Krvt1hVMo7oQaCtk9roLp5Oks3V7U5F74qYQDma4Q7y7oWlwT
         16T9MFwmCyyMgtDisI8GQafv6xzu9sR9idiukqza7LFZwDxYnaGH/pkxxacRysV0rTcl
         Eu2weOGCQc8dgMt87hf66fIFgNj7RaFofK1d5v3hXEGF31HPjqhKIOCcVxW2BQXFUXke
         TxushLvTAY0SnTJcuoHIv0llZ6FRRwQ/xaVJNZ+PIclJOxPi/hneRWjH9euhPIjBRxVC
         dEQ3PgE8fSeaDgBSc19QHtoZ8GknrLe8vOpEM5TM08r6zH91Y+u04ibXKv48ZGQVk3BR
         3mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483314; x=1787088114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgcKeBktnliFILPgH5Yp5qgxA2fPy6McTHeUrYz6elM=;
        b=PuBknsp8jVezkwGVtJRX5C585nAimIuY04x3RtrDN0fJboeg9iGZDiizUL+Mw2V7sp
         FQH0r9kT9k1lJttyl4oN4+SzELnetL8uRbZiRMZfRMq4TiRltZHObTFPXSwDLh39PeBI
         hvaCf9goJslxqNW/ATM+8GCPfbznk9jjxTM+N/uslLQMYxPMHSohkScjYMJ3Fb2N8kMR
         m/BC8/hbHBTICAqoYX9M3wyPMlaCiCbsZtxer7uu+V5ccg4kGhD2iDAMdy6je3+dhnRC
         cQxcg70rdfPn4l4z6KtxIqGH5s7XOQZQcm+oxHTv9b/fBYHfmb0QvT0mkzzzjPJuKb15
         Qy3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr528v8DRjtL6h55uqYIkuZwdqai5oiSd46GPWhR7gMsOJ+8nXxXbIsYoqW0BwNIQPA3YvU@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/+LguGndHIayZD4R018azzq9z4j6pzAB0YHKf6+QZyAuhrzxY
	ED3vbrqiFVLIXkLrlyHSdi1wq16C1iKJ70yzKYJGDZ1lwi/erB48HemPYY9CcBFZsA==
X-Gm-Gg: AR+sD13M11RJX/rfnsKV79HgH65gRs0vhMGBA/a4Ia8849EfJLkT83awCyzTmvMOxQh
	VZlNxcD3343fSF22UM/ODUg0uWKA2oKGDCWKZtTj9JyyO46LKRuvmf0aa4PUzwUz3mTVKvGH8AC
	jZbMAE93oxQXmfolZmJychabSHgePgSFxLUDbtsXmVngleyU1dWO6qWJSF7GZh6qiigkJvAaesG
	miXUOjxcTA132C6AjWYZwes56aYyjyA7KykcErUgnokJ61zNqJ+bNpQXxkykOd0JItpQWwYVecF
	bMaVsr25n1E6VE4O5CEMB1O9+K+MAK01X2nX9JM7WYh4rCH1YgfTT0yAnRmRYN9Z/waij6aqBo1
	R/R/+Rnm4MEe92scojYH69QL98GTVput2zyQMxdcxR3XBkchi5A0Qm7FYTU6nZRqtUyWBfym/oF
	vxdfQzTOC3Qwj1WjdFfBttTwM3zHlq2fcAv41xOHEUUIbfhPVYZCGf7VtrhvUt1D4V6IKXuwVYQ
	f5lxbeApfv08d2TOat4ds2lC66i7CBMzVokyx7e
X-Received: by 2002:a17:902:e946:b0:2d0:cc92:f7c2 with SMTP id d9443c01a7336-2d34535651emr6182815ad.1.1786483313141;
        Tue, 11 Aug 2026 14:21:53 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f29d82sm12934165ad.20.2026.08.11.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:21:52 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:21:49 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>, patches@lists.linux.dev
Subject: Re: [PATCH v3 09/11] vfio: selftests: Add mlx5 driver - HW init and
 command interface
Message-ID: <anuSbSEiEfCC2MUR@google.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
 <9-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On 2026-07-16 02:03 PM, Jason Gunthorpe wrote:
> Add an mlx5 ConnectX selftest driver that programs VFs and PFs
> through the command interface. Create the driver skeleton with
> probe(), the command interface, HCA boot sequence, and all resource
> allocation up through ALLOC_PD + CREATE_MKEY.
> 
> The driver implements vfio_pci_driver_ops (probe/init/remove) and
> registers with the VFIO selftest framework.  It matches the same
> mlx5 ConnectX device IDs that the kernel matches.
> 
> init() brings the HCA to a running state:
>   - Command interface setup (two-slot: regular + async pages)
>   - ENABLE_HCA -> SET_ISSI -> QUERY/MANAGE_PAGES -> SET_HCA_CAP ->
>     INIT_HCA
>   - EQ creation (CMD + PAGE_REQUEST events for PF support)
>   - ALLOC_PD, CREATE_MKEY (PA-mode, covers all IOVAs)
>   - Force-loopback capability check
> 
> remove() tears down in reverse order through TEARDOWN_HCA and
> DISABLE_HCA, including async pages slot drain and FW page reclaim.
> 
> The driver region (~18MB) holds all HW-visible DMA buffers (command
> queue, mailboxes, EQ, FW pages) overlaid as a single struct on
> device->driver.region.vaddr.
> 
> Data path ops (memcpy_start/memcpy_wait) are left as stubs for the
> next patch.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: David Matlack <dmatlack@google.com>
