Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A847423A9B
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786483356; cv=none; b=td37gNPnAYZjh2P8RHw/9IuWCKY0h7U2k13moDF4JlhRXC1bRLxPg/zArSaClfzl+y3L32YEga96gPZakQSIj18UNaX/tnUh/U4+nkQvkXMIJPUsn8PniC8nJqtC5T8tpwPo1ELtfYNyBNvcnLJNqZlxfW2AfSXkpVEutEiuW9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786483356; c=relaxed/simple;
	bh=NdaLGblalh7y8lVJYv0NjjfAvsT9Ho42+c6mULsp9Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlQyk8ufZSvj3aA2kD9b4yBsqiIuNjKEH5nhTguSoVJLsEiiB8f003rSMg6WxYVaf/egBbA3nctSPj/1Wh3j3kQkYWNQxCP05/xPSkzYPD8KLhiPlLsysuFjOb5RDvRdG9T89/lTCVzj2VOhz6YFm9vzQP7NiuRM1vsydZ47uJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=utCX4AmC; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="utCX4AmC"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381b831d535so483496a91.0
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 14:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786483354; x=1787088154; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hg+Yr9bSAREbkWFulA8TyFK9VZyeo5bqgSMI0IG+zlA=;
        b=utCX4AmCqODdjRm6eJ3wT3PE95EVdlwzsFLddONW4VDt3bJjufRw3OOIY0L9Z4CKed
         b4k6OkYAmT9PEHpkS3TkIHjAHrQDO9D1YgvwFBUZRQFACGPUA3+VoyCY0URy7TIy2N6h
         WF61j5yLzEsuQXVcLQ+v18MK+aciaLlItNRjFhM6pJvv/pnKg0QACobTN+CLsp1hwQTT
         P1eLmU/l+2L4/1y2dMnbJTXPCFyMQn5siZ0+h9fTMKVwVYT/w0GKa9gWOe8wSGttiKos
         /eKLXhhEvvs4qLaxenVzMUoCfK4cfkxSKM9iTjTYIO72uoe0vbFHTY+33MVa9hbAe28E
         gfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786483354; x=1787088154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hg+Yr9bSAREbkWFulA8TyFK9VZyeo5bqgSMI0IG+zlA=;
        b=iE++Oltxfg23Ez2DlcKBAhQgc4lT1hLeWZC21uxaViMS7342gsanzusVCxJ2SokKED
         bzE6FuxVRrulynz3503rS+ydXwMAMv7xnFi9K6SvsrOu1dZKJNlp6CdL72Ftn4lr5KIZ
         iJEQnqO5sIZjVBsDYisUzvfeyDHc3bbVq05A7ghYTiHw8UGibsqX/ec0hqEDRhYwdzGL
         TZiJjFtyn9IX03wsCB6cxHDbEEgzP6Yen3KHVZfygdqoS1vN+Eqo4lBdAdEGBrwQ/knC
         INBKkuJ4UzfRdQZ8z+I2F4/WpPuQWY+F4hJJi5bbwe4FZL56gDgq83Yp4bFgJUCt600z
         0XBA==
X-Forwarded-Encrypted: i=1; AHgh+RrvI1T+6dTVAVmpdUyR4KxEJjDxKx7DPfxlaCRA/qEyqN3hGoWPZaB9NEEvlpYUGJJuWalA@lists.linux.dev
X-Gm-Message-State: AOJu0YybiwR17lJOYGALDuYrF3YRbsOARGH8xr2nXa90/NYLNmkW8J7u
	tGggJCA+Qv7LNitYPnRqbgBfaRaTQbiRqcqTKx9Qo+xXRsOocfpBcu32Y7iD+h1BZA==
X-Gm-Gg: AR+sD12hh4ZwPstNJzzsn9S+hWHcOZSP/I/h97p+RiB4QshfTakRCNxJCJ0zecWRB5y
	6T3W9jzdTSblrsn6t6HuUmRJkUsZ244058xUOsqL7r5+331y26BFmaSdsUFkThZeavxosBNEJ9Q
	JFOm5pgV1b+dhWlv5529G26K22Jc3BiiE2z49V23YMi612rIyylUI/aKXSWLBLwq/uAfS4wBG2z
	XuSbB7GWDQsZJlLXE+Ph9IMK2eUhgvgEGJQgpHOBtzjGRTQ2emOZVA1k+tx9s64XuyhhZ2ocNfA
	J4aCwjaEcbKT72SqAvjC6t4eBxH2nAdjmeruOSiO/smhD6Guizk9R4ud+wAN0jhV1S3zPUwe61+
	w0SvMu7hH3PpI1IOU9BzKEr98mqtBi319wxUYqda0VOS+1vlr6relvGXQyHwOq5/RUIlT/vqiQ4
	UUTHZfvu+Aafy7C1oVLIH5iZcurGYvufDAPpK7iDTjydpJOp+Lmbzv/9g170mN5IShXHLbst2vQ
	QaVcMN6eOLVyTjqWz37p7lPUUFzNg==
X-Received: by 2002:a17:90b:4a82:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-392ec672d1emr6461856a91.18.1786483353815;
        Tue, 11 Aug 2026 14:22:33 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f85feb67sm1080532a91.0.2026.08.11.14.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:22:33 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:22:30 +0000
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
Subject: Re: [PATCH v3 10/11] vfio: selftests: Add mlx5 driver - data path
 and memcpy ops
Message-ID: <anuSlnCd7NERCp4B@google.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
 <10-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On 2026-07-16 02:03 PM, Jason Gunthorpe wrote:
> Complete the mlx5 driver by adding CQ/QP creation, QP state
> transitions, WQE posting, CQ polling, and the
> memcpy_start/memcpy_wait callbacks. After this patch the driver is
> functional for DMA tests.
> 
> The data path implements RDMA Write self-loopback via an RC QP with
> force-loopback.  WQEs are posted to a 16-entry send queue with an
> NC doorbell, and completions are polled from a 16-entry CQ.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: David Matlack <dmatlack@google.com>
