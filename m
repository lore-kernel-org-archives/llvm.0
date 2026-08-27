Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C902A3890F8
	for <llvm@lists.linux.dev>; Thu, 27 Aug 2026 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872371; cv=none; b=bvwzvw0TB0MCzIEHBFOlGHanWDF0WaUqEDZgdrSKYfUFEbrDL9p0WmSqkKYCQLFc/nQitFnpc9fE3PAT0x3fZmyIGqudTBFb4xazulQT69vdbu0wlRCFKAlj/bFk4Miku4en3gDZmKg0xGqhhkl1kg0YWc5xmuQC9TpiGPOxLSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872371; c=relaxed/simple;
	bh=W/VboFtsniwlT13CzTXqyyKAo6bLiMCk0pQp6dNAoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAVjEUGaGTr/vt0GN2IZut/sz+uuiSm5ScaouOwgeaBLHT0g4GjhDarvan1+1UNg2awoGErBL4PAQqSLpNB6PcV3fuw7uiiGjPMb/hvkDaHccPkMsmjbTwpAbnFKfwX5ogQcIKKEOwwlS35TUK7UG05n7pSOsEeFSMUz7TQ4cEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=J0jiXWoW; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="J0jiXWoW"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so224439a12.3
        for <llvm@lists.linux.dev>; Thu, 27 Aug 2026 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787872369; x=1788477169; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owiJggVEjqcjWE0DQ/s7zqsjd4JZVI2c130pUmNZmGw=;
        b=J0jiXWoWfg+kQg7gQlEhS2WosEDckckoA1uaJBHdBXy82OCDpvqydpXsGSQwNDGxLL
         K5cb50ButBj0JRwMkdVsngSIJEn9J3mJh21AMczQJPBYG2Kx3dsvoOTFbo4YhvXAnuOO
         /ba4VJkdxOO26IecMRa2+AQlJOXRVwI28zYzh/KZuj+cPdilE+l72JuzNRc5d/j3mhRj
         KJ71ou1YX3O+97koGnE/7Wp3x1ff0K82Q9KPkOd8rlViPAPcupIhwZVrLUt24l4KQqRj
         PkxLKjAUt/XKQD9qrKg8suN+cFuCdKYu7xvtDqsaHEAVPOUB9trpiRiXFnSyzNajxCOR
         tI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872369; x=1788477169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=owiJggVEjqcjWE0DQ/s7zqsjd4JZVI2c130pUmNZmGw=;
        b=fmHckWsoumfG8OWOpyM9HqbUAF7Plk4rq0MERN4+0Y04PEtvkODggX+lx69vdOtQQy
         X2MLjJ1dhTyMPBK9je9lNiOWTiN+XzakuPA8xoYvPNjJBg9Cn1E6UV+sYRUsywTAe7qY
         1cZweVnqWc3qYzh8Ulfl8EceoNUmp0uVrlWSRL+5d56yKRbreVDjp6cNek4kmw8fN4hT
         7jrrvodA73/fRlr5Ah2MBEJoBFpt3l1N2vmVeDDfGcxrEF5FJCZcvMEJ3v5OspFPJQwF
         jtdTVM8RxGe92pKa7DE7P8isQ9YgvsXrc/588exmwGpebSpmfCh2Hpg7ib4dWY03/lbD
         UpmA==
X-Forwarded-Encrypted: i=1; AHgh+Ro932Ju9+ctkPFENmxp8xEGy+7j88sPSAr+8oIzQMiTPQLND1mjG3wQ1/rKDFW69mXsma8k@lists.linux.dev
X-Gm-Message-State: AFuF++mPRVXni14YTakuqdV8jNa4Uuxa/glvSyVQv/X6zd7Ip0479UWC
	KdEfILzlC1Q5sGmAYsxlfsH0yGzV9e9i0len0kKf893NsnUHhGK094xyLPEtn0UvkU4=
X-Gm-Gg: AR+sD13gf4pR5L/WQlZVqEA0LSw9jUhhFi3Yb0aXbk9V9rhIubAeJy8Kyd9rCjUTOlK
	HIKqFMAgMJ+QZSeF0pB2ig2uwU13VJNwA4SqCfe1do88rNT3Jo7Ioa3mnT/SHEfSZUmkFcw0hcN
	aYCSx6vkm/hnDkiFXFOXsNXOpOF78CItfZTj2RiJg7Zdulf/CaZUW7nSEQmAZUoSQRKNqogFCcW
	Vu3tZalAJaKJjQktFNEvZJYQoFsE7zukfZumWMKirWBlMWjOnsQ7k/e7jYg9ruTrjJeNmfqFI15
	yG8NL31fM03poB8jB9Iqlulm1nLcus38zhWoJcfX2zvFyJIg4ItHANPcVmbK+4CY9KYvsOicjtu
	b5ZZetKG3owfrab9fwN9Djee7s+qAC7pN1fe4KfSoX5cBkjuydIlRdNid0ylwlHpyvAgJQcWJtP
	Gni//vNjAYgK8WZiJCKkdu/m0mZ9zhKi8meRsCM0/yETE=
X-Received: by 2002:a17:90b:380a:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-396d0daf810mr4835678a91.5.1787872368810;
        Thu, 27 Aug 2026 16:12:48 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4f::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0d3c9e4sm4598254a91.2.2026.08.27.16.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:12:48 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:12:47 -0700
From: Joe Damato <joe@dama.to>
To: Michael Chan <michael.chan@broadcom.com>
Cc: netdev@vger.kernel.org, Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Colin Winegarden <colin.winegarden@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, horms@kernel.org,
	linux-kernel@vger.kernel.org, raphaelcf@meta.com,
	stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net v3] bnxt_en: Bound SW TPA IDs to prevent crashes
Message-ID: <apDEb/LIqcrI9LoV@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Michael Chan <michael.chan@broadcom.com>, netdev@vger.kernel.org,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Colin Winegarden <colin.winegarden@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, horms@kernel.org,
	linux-kernel@vger.kernel.org, raphaelcf@meta.com,
	stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260827185700.2157164-1-joe@dama.to>
 <CACKFLikJiCdjej4ezF=U16Leef3oAjSZGQAyetRnF=nLRvUfZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLikJiCdjej4ezF=U16Leef3oAjSZGQAyetRnF=nLRvUfZA@mail.gmail.com>

On Thu, Aug 27, 2026 at 04:07:16PM -0700, Michael Chan wrote:
> On Thu, Aug 27, 2026 at 11:57 AM Joe Damato <joe@dama.to> wrote:
> 
> > @@ -3831,6 +3834,7 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
> >         int i, rc;
> >
> >         bp->max_tpa = MAX_TPA;
> > +       bp->max_tpa_roundup_size = MAX_TPA;
> 
> This is strictly not needed.  If we return early below, it means the
> chip does not support TPA at all.  We skip allocating the TPA array
> for every ring, so it really makes no difference.
> 
> BNXT_SUPPORTS_TPA() will be false if we return early.  LRO and HW_GRO
> will not be supported.  So I would say it's a false positive from
> Sashiko.  Thanks.

I see, OK.

I suppose that means I'll have to resubmit the v2 over again in 24hr?
