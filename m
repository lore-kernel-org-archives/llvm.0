Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5683CBE74
	for <llvm@lists.linux.dev>; Thu, 27 Aug 2026 23:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874068; cv=none; b=AJbT12XXJXZtM85alPEkr0NwaC9Y6jViNI6CQe2ebUixxqfbyU4SMUfy+cnZMjQ785GGosU5hvd+dxhuo0s89CxcsccjK1FcsJWvXiF/OUMqvTGBtzRrFhilmrDN4vSjZib/FLYnbRfB/j1y/xCC4re9+yWm3fC4TVM9btfvufE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874068; c=relaxed/simple;
	bh=VhXID8Q2Dlk7SGe+8uD8VtqeZ11RIRSkFnVIvMqoK1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M14q84aEIEXqc7KG4/Nc+fZ3teRFsRp+F9LFv4FLG557MRqNeTDeX5wQz6NmVCzOdVuoxpiF11ifHPcDa8JUzr9iTw+7SlVoeNmRvBCaSUU3uc8oLT3SG/1SkNr2fghHSk1imX0ypv4tFzn1QNBwvw1L4QpRz2nqmSom4rNjJYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=oOnxWlqK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="oOnxWlqK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso602150a91.3
        for <llvm@lists.linux.dev>; Thu, 27 Aug 2026 16:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787874066; x=1788478866; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAjqfC0SW4nxG2w1tJx7WfUnmE/BSNkbt+YGxZxti/o=;
        b=oOnxWlqKSzDu3OdToiB4D0ciKF1HeMuBpizAl1xk+Xw53D4P5ijuBU/R2S9fWzb2QD
         A7oE35XIUFpKnhoNenZaknmC/9aLPeVd1dHptkQSHVkD4nBD7aTSc6Q6prsgDW/35hAK
         JEShxCAP2hYnKGdN5kOwBh3vyq4NbkHohqxXYdi4ZSrRykguf2BPScZLBvtotVmNkfwT
         uT0MhjdOlUemTgTRbPrW8qziYC7x0cpiumI4ogo//VWQ1sR/Gp/jD5wcYUyos8+4eKuC
         +Kst9ck1VhetfUE/9O8F1+ZMlKuRAnQ3XdpcjqVlROlvxU0PiNwS6Fbiy5A+6lEijElE
         i+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787874066; x=1788478866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gAjqfC0SW4nxG2w1tJx7WfUnmE/BSNkbt+YGxZxti/o=;
        b=lxz+bB6TYJmPMwDgplDRkW9w1iSY83fTsxqSD125+IMPVApZcwZXSDfWHfvqd1L5tM
         ecsBtw/SmyAfJmEhew2k7mUwd0DLrUugSkc936oy9GQp6ADj3Buqej+4AiFYfOOfMY5f
         HY5zyWljh6IZ3Bq535c1eIoAgzcRDIURYeLkZQH/xW1idHRtFvID3He49Qflg0CL3heu
         tZDx/SQLWU6ISapuS3lJYIKVCgsM9t0/6VRO8QC2XoOgHHU9OZCSXv/pozmhEjOoO4zR
         j5ffMxgS0Mwfw4KK3EXT1w3Vfv2WFwyo5EZTBUpj4fFs2sZ1NzmOHolW06H+CreT/Wdv
         WHqg==
X-Forwarded-Encrypted: i=1; AHgh+RocEuggZAkyhxaKYbMdoWOad7JKzYZ3LcrNwpMb4GQApb6V0CPgGaHlA0d3K9y8OA4aT12O@lists.linux.dev
X-Gm-Message-State: AFuF++lOthOxoTAgazojrvjROg+2tITCrnVeJ6awxsH4haaxOEy8/w9E
	U7PkYrOvbudgFaAmGVb5KqXMvNeAaGhlfl6/0HCkdrWZik+Nw84gDn1ef6B9diAEmLg=
X-Gm-Gg: AR+sD10d5eUI4EVs344xxKTI8PVccitaQoROwyaCTK6VsVhbrH/TWlH5x8pslrG5bWR
	tiMEC0BS/VjqYVS6tpXqwAsX0+lt19ikuJSnccGyVKB3Me8XgpSVrOcg998zXlgEtXrjaOjivKH
	aLzTUklxvDhjfxSDx0SZ38Dbh8AxGwvraT20yGhDM1qEqY+KRPlnTCHC3AExJA0SKz7GO1Kd7pA
	KqgtB32qsagUmlYt4MurLU66L1NK8/lY4tq3Pr4UdQ8Fw92OCCtq5/zTBIQjDGK6/gLoCVHXMio
	9MClBr9JWj5yPQQiLdBok8u2bB8Mmf7bNcmc+z3l7ZZBYKIPC7O379q5XBmQgMoWn57PFXooaGv
	nELrp1KoTPbEmd0Xqyx5dJgVZLJAxfoRMUnApcIg782P5AeCHgrO+fg1Ny528esI8/atYnqt1FL
	j0qMhhRvXbk/SqJYb99mW/SjE6f8u8KyCqiD1O5DezMg==
X-Received: by 2002:a17:90b:51d2:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-396d0f8ffdamr5528045a91.9.1787874066635;
        Thu, 27 Aug 2026 16:41:06 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992e05sm4677116a91.15.2026.08.27.16.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:41:05 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:41:05 -0700
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
Message-ID: <apDLEbEu1PLTGU+f@devvm20253.cco0.facebook.com>
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

Sorry, I should have been more explicit in my last message: is it worth a
respin to remove this? Unless I am misunderstanding something, it's harmless
and while not necessary, might be more clear for a human reader?

LMK what you think.
