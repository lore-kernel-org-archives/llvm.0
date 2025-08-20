Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689E01F5EA
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755686597; cv=none; b=avlKDgm5x6/OC6fnHlKqptPtURH71G6V8pkJtg89YKcB/CqmdQVb+/QNG2Rt6mDHG0dgHmAGoYBTHhv6kcxUH1ULJ/vOixW2YQC7q3gXYYlLDwVlND7Gm7Cpq6QbnYy+L9HBGGHHuh59/uzDiHmEQC4TMlWRrzqjFnI7YwCiOSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755686597; c=relaxed/simple;
	bh=Y17Rj5E/GRtenqS3b5BfPh0zb3y9f6UoHKe5XhkCVjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iR73Zxc3pe2F8RVklUzv2ny/VgexTD0ciR2L2fCF5i+hO0aKG23aDkwKbvk6froQPAValZdxDiRKr82ruX87oMq8GHO2XichzGz8BAMOi69hk+B/3xiq0eZOhGSAkZiDOcoZnTS2n2Y69SmJERZS4a5eu31ccyB2+eMm6CwlWnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URNtyePt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URNtyePt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso5320463f8f.2
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 03:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755686594; x=1756291394; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6JbHXLCu1gk8Hmp+tYteMxiM391FXMH8MSo5yWpG5E=;
        b=URNtyePtI/wgz0ixQyQROvmwNofYFvET86BzKMpK4uyDTYfoQPQBLWsFojhBlmcUG7
         jbbQgBgxNNvW9LtoetxegOLeL4BbUeYLlBFzZejD7U4nbBplV7ebiiRGk9HH8d2iljmJ
         tNfylz3O5OO4n+6P6xyKtPwZaI+SlzmdC3IP1SOA06ohC2F8dz5p4eb4/+9+8gxKGliz
         k9Zrdjl+s1JDe7JVQwyJjHBb9ZWML15q1aLRXgKdjALoH6dSdrXZ34Tg8Xin0f3E0rp+
         AyTkd8DdOnkpMWLo0dug90Bwsr7Ubictwba59zG01kG0CeACFkLD44k6AmirRj2ISY2i
         RdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755686594; x=1756291394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6JbHXLCu1gk8Hmp+tYteMxiM391FXMH8MSo5yWpG5E=;
        b=Q//YtijCQD7xnlNpFOz427US06uK/udryqg6LJyDaAjD+7uJ6hjYOTMqQjuXs+LC9K
         zVmlkpYVaiqw2iPkKk7oZQm+IZDHmWgq8bsL/TCkJ4BRjnL4Q7i94NFkpqSgi5Fa28oS
         VBfO03gap1oYUzYTTsYAqzLSr2HARySjQrICbUvyX0nv3W7+CJ6ZrwlMXYBDhKyCtL1H
         sRoLG0zpKwrdLasq2MW1l2tdRcHJcaSNZUKxnfv/YOjEY7ObWXhRD6ZgpGVhftVZDHhR
         so+UwxdD26mISaa76IBYPckRCQ7JaELZh1l0RRGmKqVyFMkwk2z0VJpk7wB+Oy59MRCv
         6wSg==
X-Forwarded-Encrypted: i=1; AJvYcCWFlMcm7YTuOsXuWwDk2CM4mCTrsUlzPgX+TMQCQxT2ZPT+ZRHZbtY1gxRJ1NSsxMSWMdV3@lists.linux.dev
X-Gm-Message-State: AOJu0YxSMgnTsnNHVilQ9sIs43ZIfvnMLvf5XPQXwNlfYNbe/l19Kii3
	05J+/EeLp1Al+Owk33Ougr+dzitPH1UlGrwSvEZ+74xApRMcwYWVyZ2Nva7gwq9SK1Y=
X-Gm-Gg: ASbGncuBg0QukrVxeOWFEVe3caxWCKmMqtQHllNeje75ZVYhTNoSMgk5V54sQ8/KSRr
	39c5GkVaxTw0Mj1q1oxbtb6rOrKKPOswc+KnlOwlw3etY9/j/mk8eccqMGdPK1ntiuZlVUu39LS
	RABnvQnEKA31o2kZsDyF/84CKWbn4K0HH786+aLzSA/6qZU3H5XG+Nnh5oVFoKQaBhsqCgZGwu5
	BrN3KB5D3sYGJnKFjsGssHF/7E0/FgtUqJd0oFq34iISylzK8M2fyFnkyMNBcQyyhqEtTIbma3X
	54sOl+tJA1DojeZ8W3OLOURQWWhFRcjpha3meIhtOpDyER7H+/Flvk+iK23mVZZDcWXD7RJrP/E
	yEdJJMwy91BEvWszqarxDxVJtwBSm8NHVjDyoe4LNnFQ=
X-Google-Smtp-Source: AGHT+IFfThC5sQ086sb4zojIb5S4YMtFRvJBKvING/uRhqmvc617M0JjqPhE3vfuS8adHjIcpEJ+Qw==
X-Received: by 2002:a05:6000:4210:b0:3b7:99a8:bd10 with SMTP id ffacd0b85a97d-3c32e606ce1mr1724387f8f.42.1755686593663;
        Wed, 20 Aug 2025 03:43:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c0748797a1sm6893279f8f.5.2025.08.20.03.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:43:13 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:43:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] mmc: sdhci-cadence: Fix -Wuninitialized in
 sdhci_cdns_tune_blkgap()
Message-ID: <aKWmvWTtQ_QZYgEm@stanley.mountain>
References: <20250819-mmc-sdhci-cadence-fix-uninit-hrs37_mode-v1-1-94aa2d0c438a@kernel.org>
 <2560300.XAFRqVoOGU@benoit.monin>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2560300.XAFRqVoOGU@benoit.monin>

On Wed, Aug 20, 2025 at 10:07:35AM +0200, Benoît Monin wrote:
> > --- a/drivers/mmc/host/sdhci-cadence.c
> > +++ b/drivers/mmc/host/sdhci-cadence.c
> > @@ -288,13 +288,12 @@ static int sdhci_cdns_tune_blkgap(struct mmc_host *mmc)
> >  	void __iomem *hrs38_reg = priv->hrs_addr + SDHCI_CDNS_HRS38;
> >  	int ret;
> >  	u32 gap;
> > -	u32 hrs37_mode;
> >  
> >  	/* Currently only needed in HS200 mode */
> >  	if (host->timing != MMC_TIMING_MMC_HS200)
> >  		return 0;
> >  
> > -	writel(hrs37_mode, hrs37_reg);
> > +	writel(SDHCI_CDNS_HRS37_MODE_MMC_HS200, hrs37_reg);
> >  
> >  	for (gap = 0; gap <= SDHCI_CDNS_HRS38_BLKGAP_MAX; gap++) {
> >  		writel(gap, hrs38_reg);
> > 
> Thanks for the catch!
> 
> I don't get how gcc does not raise a warning here, only clang does. I
> did build with gcc-11 and gcc-15 and they don't complain about this
> uninitialized variable.
> 

We disabled uninitialized variable checking on GCC.  It was too crazy
and especially if we want to use -Werror.

Smatch also detects this bug.

regards,
dan carpenter
