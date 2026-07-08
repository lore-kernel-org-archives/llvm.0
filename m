Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB81340927A
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523376; cv=none; b=Y8ddwM0/tLgJILaTDW5MAH6oTckdbqbF66sh/ghw6Jdi9sowG0e0mN9tPUKBNdDnT+aDyCgy5mhdFmkK8gzNg+Mj0ioXVdAbFCQhQuDWBaWpSmjYqGXo32FCDgtVx3DcAjrQIhgbNG/qjECg0n1Y9LfK9emqZaAXadQmU6w1ngM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523376; c=relaxed/simple;
	bh=Ojm4HC+Qo3NA3bCB4Voj7HSWNha37gVnNM6dlE9kbIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rN25uL2wCGIhNa1NENPaZtDgUdfzQrYcmE0WwZZSsQXDlfBxEWkC61ZzQ2f36Elze3l3bDRaCcDx9JmShWWvutiVkVayc84N8FrRDSeXRvxRk1iqZYPJ/gsZoHhwl5/jgg199Tk2aHeIUXKc0FZalpuJm/q2ct881U7091R1L+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFTD3djl; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFTD3djl"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso8946285ad.2
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 08:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783523374; x=1784128174; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PZNUkHdJ6nqcdgkr9hcvPfqh6tCZ4YTms0UgHLH5I0=;
        b=bFTD3djlEvgFYaSxV29/KqkRlvODAWOHlhUWQMb4uTJuFjUn+ajnhSes9mUEUuon2f
         Csr6cjlLlY82W8Pqrx0Pk88kiVJOWx4/Fnx3izcnyU8RUQSrfJ3QCXOx/WYdcRUHsNlI
         sYQJkADMAwcwEIPZoraR6VluVi30TUXPwmh3BwGBqZ0T8cYq0wMAUPWIWOIzRLF6Zwdn
         G6txtL8pqsAQto66Nia3z4gURmNoZzJv4+o+bDaBdBUEa64ES4zd+TsFUTqAfkBL81X0
         3uXUKxXFezgSgPjS+uEaDnpuI/faVOchET6boKXnUet5DqpH8ZPQZwfWx6n7CTPPosBz
         SdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523374; x=1784128174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5PZNUkHdJ6nqcdgkr9hcvPfqh6tCZ4YTms0UgHLH5I0=;
        b=iEf7LajN1e8kMSJdpQycwe8eSff7chzVFren2DnPmTILmqGQnrZNu619yOaePp9a/i
         G8etOAOrI+BKnh58QLDAgSuBaf8wIsnPxIl5Ul157oKpi58T/NMBMYGLV+OOXkmEFYIo
         rEuuRFrp74SvLUgBDg2TjZ9bt3Dg2FWZ4Mwib1ucoid3dsWfP8pWc0tK+/LIx5K7Nh8M
         th3iyQOEnXnCPC4J6YG+N38ouxyVXrbBaxFz+f92qtTE9PctbrYzfvZqD61n0HwUxRiq
         MRxFwdWAMHWRNPPdx9GEGmWrm8nYB44N340W11GK6R+eSGqCu+n8Z6UGL0kXrPMo0wXn
         ovAg==
X-Forwarded-Encrypted: i=1; AHgh+RpYPX4fP2bXzggiJebmpQdzkWL9xZpnnPeT6I491Y2gUB0I0RDBE1qHnf47QarUqfjCfHrQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2AVhxc4+gKguvEeCWyD6XBO4vD0+5DXIOgwgmf5FijZUyWunj
	bjzzUEQj2TYNaaD4JdDnX2EMtCgKlrs7sEbYVLcDvO+Zz4wO5807Y0s1
X-Gm-Gg: AfdE7ckXO3Zm0niix5u2Ycjlsz/VdbYvdtgkYINaWckrzB92xlEksA7J8/MLzojVFOm
	BzbrKRTIiZvAXvzJaXtdsCZ2TbjNN8Al9pMpy7Ui+VLPrVv2Zl2KvbW4TiT1msrRAVbG3qp4RYS
	PfKyUdz2C04RCrzTRaPzVnzRjeMXy7GYGpTsg2vL9tcG7XBloreerfHnAjtzXeytAFtPNKsqW3r
	Wc+NeZpamREUqP70CkRMzCyM4y2XhcF5ACR1Dsu3T+LsIVW9cVLZVkGndSxCnx7vbI1oMXG6hw5
	kMM62Q7rRXfYDb5IyDiyl998umOWHNeRu8I0Tofgd7sXFTyp5mnNhyeXb1SeYTR6m3QTzmpv8Vz
	5E2sFeyyavD3DQyCj81EeuTRHtt9PInmDSEXrrh9r0q4u4xAwOeTu071JAEPsIYdrPtOzmIJ8r2
	9w+GzN8LHb3sm++V/u9NrJPw1+GhOzzkyCZKDlMHshC2JrlMZB31R69WbR6NwR
X-Received: by 2002:a17:902:ef4d:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ccea36556dmr27151965ad.12.1783523374093;
        Wed, 08 Jul 2026 08:09:34 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm29932865ad.15.2026.07.08.08.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:09:33 -0700 (PDT)
Date: Wed, 8 Jul 2026 20:39:19 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	fujita.tomonori@gmail.com, joelagnelf@nvidia.com, gregkh@linuxfoundation.org, 
	prafulrai522@gmail.com, nsc@kernel.org, japo@linux.ibm.com, lina+kernel@asahilina.net, 
	j@jannau.net, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ak5ngpTqcKS1rOvH@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <20260708082454.1254320-5-mkchauras@gmail.com>
 <ak4MwnDwIgdUhK3K@luna>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak4MwnDwIgdUhK3K@luna>

On Wed, Jul 08, 2026 at 10:39:30AM +0200, Link Mauve wrote:
> Hi,
> 
> On Wed, Jul 08, 2026 at 01:54:51PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > Minimum `rustc` version required for powerpc is 1.95 as some critical
> > features required for compiling rust code for kernel are not there.
> > 
> > For example Stable inline asm support which got merged in 1.95.
> 
> Didn’t we decide on 1.85.0 with the asm_experimental_arch feature
> instead?  And possibly on 64-bit 1.87.0 if it isn’t possible to disable
> altivec correctly there?
> 
1.85.0 or 1.85.1 is not feasible for ppc64le.
PPC maintainer is ok with 1.95 for PPC. It's still experimental for PPC.

Regards,
Mukesh

> > 
> > Link: https://github.com/rust-lang/rust/pull/147996
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  scripts/min-tool-version.sh | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> > index 031f2192b390..99bfdcaa3396 100755
> > --- a/scripts/min-tool-version.sh
> > +++ b/scripts/min-tool-version.sh
> > @@ -33,6 +33,8 @@ llvm)
> >  rustc)
> >  	if [ "$SRCARCH" = "s390" ]; then
> >  		echo 1.96.0
> > +	elif [ "$ARCH" = powerpc ]; then
> > +		echo 1.95.0
> >  	else
> >  		echo 1.85.0
> >  	fi
> > -- 
> > 2.55.0
> > 
> > 
> 
> -- 
> Link Mauve
