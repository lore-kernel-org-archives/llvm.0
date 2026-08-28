Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0DB22AE65
	for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 03:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787886213; cv=none; b=s8Gw9lmPErS0KlvXCuUfghhPea7nqKiXGb7au20DoL3Wa7qHWdDj1eI4Y8zSk03jsXKk8SemiPMZnr1gh9DzuEgXV3jdHBf9UeKV/yseTqb08AlCjWsi3sFwrcFjD5VM6bsTcD+ZhwiZtSPqBERPkGxzurfpjWtmYBYKqMx4/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787886213; c=relaxed/simple;
	bh=hKjcfysmqpwkfoKcmOZNV4zNNLgROO+mCygL3RPRE0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtgNYxEp5I+0zQatzSIBjMXIFuYmo3ZMoWwdKtLqLX6gOBawRnk7DSrded0d8550CSV1Al/VZRbcCkWNkILYckIohaGrnYTxenPttHClh5Evlg2y4rvhy8GsRonlqiRXvsymbBYFZGAS6miuKMeu6rXf4tv1iDbRTYQi3/cvQHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=qoCL9ahS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="qoCL9ahS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-854f8068301so416469b3a.0
        for <llvm@lists.linux.dev>; Thu, 27 Aug 2026 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787886211; x=1788491011; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/6wjXJ5t2JcwV8iIbOzHQwgonuJXRvuDvZRhLDazjw=;
        b=qoCL9ahSDWvmK/Y8/4Vvwm3s5fbOm7HHVl0itT0N1DBypJzdVuV7l0YlBHLWwwvEty
         s8Nssp7Chu5GhVEJ3TjjDuGWtK799AuB0UnA8xX6vxNnM03zzW6SBa8UDZawxbJokURo
         Sgcmdlzao1c/WLQ5AsDvzYJ/rYn52SP7LILK+InRVyWWyou90Ny4oQK9mCeK5LUEHIWY
         D52rnSE87KES0o1N5iVdWgPgKBbc3CK6z93G9ucSzJLobOFqMgohwEqekthGGnsM3gpr
         qZqQS5O+VnUkd4oHacls97IIBd68NvOscnwgcqfCdvf5XpSY3DJPcxX+AIV1TAjz/D9y
         cWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787886211; x=1788491011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S/6wjXJ5t2JcwV8iIbOzHQwgonuJXRvuDvZRhLDazjw=;
        b=BQsFXXHOpEsBveG1BjqyudiES36zIH+LUQoEizL1C/uQB1ZA/WhKp4R76WmYR7b58b
         klkY2XeCjv6WlFerLQy5rfCCdFdMxXGXBMyT1p7DvGGkWrF/+SvnYWS4Ml5aouYH3an9
         ZEOP/Cuh40FanUivCHI/LpkpJd80ZVOk9O1ZTzIuDCoI3mXQGw1xkx2p3S237GvgB71U
         Jv+WwgoRYH5NdHvtAjOKFfbv4F5OOE6suEb+Cc2zlSg5w1e7qgAIKSkNIJknYWOnXQiU
         6KunKNLoizRdbRc4GVq5QUyWCRLvrJpXf63TIMzHNRBU/VC3LzxuwlUPsmHPOFfsqo3G
         l50w==
X-Forwarded-Encrypted: i=1; AHgh+Rrf9fmPxrVSz8YTBCNn5fSk+SA3j2+vOuAFZkyU/aAVPO7mptncwS+zmtBYn1qnjFwkoZf9@lists.linux.dev
X-Gm-Message-State: AFuF++lsMNYx5MYilHWbsurH7h4oW3MK6wRxTxk+TVJNjHAIMgyzPq8+
	RgANRFMtX/3fNv0gPUGpZNyFDZmA1/Uz86hmx3quKMeEf/bm7FCAd+GFb5dyMevq+Vc=
X-Gm-Gg: AR+sD12PvKCJanLvknVsWIEv+Jg0RuooNpEb0IFWBEacLiWTt2SPULErtzhmzqohMRo
	FTntimt2bjWF4voGDaq627x5cSUF9L1ntPoxkfd+82Ea4Ta+yHriHstKXLaPCBkgmktcTVmKwEs
	9LJSGjwlegaB70Tq9Hh9NvB1BXGKS6oV0PY2qTGi3a5pc5SmHLuAX/rbn/9FCOxhCdJacfpaklQ
	FM1L/ePRv6ysf1TKfHwedciORDNmOEC/kQHBCk2V+hqrhi5vqw7Lr/KUH3e/Z+11dFTtSGB3lvp
	+gg7e3lR0OnMiiGwzKl+sUH9OmAZDV90oUjec6sqtnD2i2AxIb3Dn45+rHjon1dopB9QkxNFQyf
	YNWMEVWaSRj6FxXrejGf1Q3e0etMb2+n6A5afnnlo03w9XFA33PCTQDh6IiwltUdDf064lsP4BT
	0FnLWCnFMLIwhRU7mKVq+ePBn2L7CKCgLRj98CSZ66AQtIu1f1UBPh
X-Received: by 2002:a05:6a00:4210:b0:853:59ed:5539 with SMTP id d2e1a72fcca58-8562aeacd01mr7858899b3a.16.1787886209642;
        Thu, 27 Aug 2026 20:03:29 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa7d94fsm137211b3a.17.2026.08.27.20.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:03:28 -0700 (PDT)
Date: Thu, 27 Aug 2026 20:03:27 -0700
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
Message-ID: <apD6fwM7beKVGz++@devvm20253.cco0.facebook.com>
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
 <apDLEbEu1PLTGU+f@devvm20253.cco0.facebook.com>
 <CACKFLinQHs80MQbn8o8Fw3Qg=1DJ+7ZMevPkDzxnDr+mNX=SfQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLinQHs80MQbn8o8Fw3Qg=1DJ+7ZMevPkDzxnDr+mNX=SfQ@mail.gmail.com>

On Thu, Aug 27, 2026 at 05:00:29PM -0700, Michael Chan wrote:
> On Thu, Aug 27, 2026 at 4:41 PM Joe Damato <joe@dama.to> wrote:
> >
> > On Thu, Aug 27, 2026 at 04:07:16PM -0700, Michael Chan wrote:
> > > On Thu, Aug 27, 2026 at 11:57 AM Joe Damato <joe@dama.to> wrote:
> > >
> > > > @@ -3831,6 +3834,7 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
> > > >         int i, rc;
> > > >
> > > >         bp->max_tpa = MAX_TPA;
> > > > +       bp->max_tpa_roundup_size = MAX_TPA;
> > >
> > > This is strictly not needed.  If we return early below, it means the
> > > chip does not support TPA at all.  We skip allocating the TPA array
> > > for every ring, so it really makes no difference.
> > >
> > > BNXT_SUPPORTS_TPA() will be false if we return early.  LRO and HW_GRO
> > > will not be supported.  So I would say it's a false positive from
> > > Sashiko.  Thanks.
> >
> > Sorry, I should have been more explicit in my last message: is it worth a
> > respin to remove this? Unless I am misunderstanding something, it's harmless
> > and while not necessary, might be more clear for a human reader?
> >
> 
> Yes, the extra line is harmless.  But I think it will further confuse
> the reader (or AI) into thinking that TPA is supported when we return
> early.  I slightly prefer not adding this line.  If you end up
> re-spinning, maybe add an extra comment explaining that TPA is not
> supported when we return early?  Thanks.

I think I'll propose something like this for the next version:

@@ -3832,6 +3835,10 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)

        bp->max_tpa = MAX_TPA;
        if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
+               /* TPA is not supported at all, so there is nothing to
+                * allocate. BNXT_SUPPORTS_TPA() is false in this case and
+                * neither LRO nor HW GRO can be enabled.
+                */
                if (!bp->max_tpa_v2)
                        return 0;
                bp->max_tpa = min_t(u16, bp->max_tpa_v2, MAX_TPA_P5);
@@ -3839,6 +3846,7 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
                if (bp->max_tpa <= 32 && BNXT_CHIP_P5(bp) && !BNXT_NPAR(bp))
                        bp->max_tpa = MAX_TPA_P5;
        }
+       bp->max_tpa_roundup_size = roundup_pow_of_two(bp->max_tpa);

Because otherwise max_tpa_roundup_size would be 0 and bnxt_alloc_one_tpa_info
(and other tpa functions) would use an alloc size of 0 and return
ZERO_SIZE_PTR (non-NULL) which would then break checks like:

  if (!rxr->rx_tpa)

because it would be ZERO_SIZE_PTR instead of NULL.

Am I getting that right?
