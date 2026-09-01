Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185D6490BE6
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 17:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285557; cv=none; b=l5eSoUxoC5bKb9tt1tMSa/jrppbHb3MllRNprqwtEbUSumGghJ4r0adt/pIp83R1GGUKXNNOBww0eV3ZFvbABKxIfBfnGjBVwF0QEZ7CJpLzwHeGi6B65jniVFc0AItmNxIJLzTHisvNowP60vXuMXyexQw0yWRP6fAKpZAw6Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285557; c=relaxed/simple;
	bh=upOZfp7nr+JUKjA+9XgwYeougAECpv2MBCBLML5bTbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvI5efRbnmsCPHxjIAJU00fcBJXyH21UkIUa4RSmG9skTpY8knrz1KhKYkncbzOJlEKMQC3U/+pynvFhCuek/RV9Py5fprkltJHD9Kpygp6RP3BLcXocZWzQG3y4+qyJIlORe8La7s+tvAP6gCYTMprNYQSkA3XBt8ur/UJSVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=nGUqRvlF; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="nGUqRvlF"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so134110a91.0
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 10:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1788285555; x=1788890355; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQGQ/jT41D7XhkwOcvrUM6Q+rqlIuyJ98icVtqutpDY=;
        b=nGUqRvlFOpxFntoseAUfXXIzkvUnibi1z9PhirdFmGbCSZNTjAHtmy9WA+blE/juzv
         7CUsPUwkMw7R56jJ9TyOSxiolvvxigy3pcxuW5TH0zfN09kr/SexGTzGov4KAtXkhm/G
         PlT/7cmUhjo8Ujj1GtXU9/rtwJOlii9DrfhzQuPiTxT4gDV5OUSWF7BoMMtlk+xqzoQb
         MEwJ1PpkbhuT/LnH/g+vzpQInIgGtDozihjLM+E+8HrQzGynGzHKErjhXCKQZ5jXVQ3+
         FejbiPEFwl3f/3zYX6xJ5NaRgCVV3PI9KvowO51O5B2qpivlFmUmTBvHR9vdee9inarB
         x1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788285555; x=1788890355;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQGQ/jT41D7XhkwOcvrUM6Q+rqlIuyJ98icVtqutpDY=;
        b=RCngb9XJSZMbTHMv/KPFkfR7AqCaaqnNtL9yMaOZp4HQlUqi3K7Rm6lkb4XkAoaz8u
         f/seMNy7AGkKw4r7RCdS/OehrVmbLA3jOqKiJDdv0F9O9vwbSKykv7T8zLExRGmmu+hu
         7PaxbB/vQtyRT8y8UBp7dVcQFnUtOuR4COuBiuq2r+0r28HqZLOyjiEhf0Kcn9J2Q4N2
         kz1rZIvnG4pFseYMvx3ykyaOFcKmCcqOi34TAGijzAvy9s3XLLCPX8ba1h0eKCzJg1k0
         uFgSa5vHmIs8fjtMaG8osH6KbEIxRHa3pcm2IwcWmgwz5YWAFF9y2tk1SrSn34HepbYX
         kTaw==
X-Forwarded-Encrypted: i=1; AKwUvBxWYm4pqMHL8/92P4ncoyJ8o+Qvmw0rrbkE7jkuRdxm2wZpGgIgaz0SemTpQPglfd3YfgNe@lists.linux.dev
X-Gm-Message-State: AFuF++kRDPWhVBUhQpI9e6OWXz1VC21Db7Bdf563/oPeu4rQEr6TyaJt
	iq8PREN8Cri1rR4ywDMgLv/KDlpRBCAjOre9grIgYboyZtCbdjr+KM5TJeNOwM125eI=
X-Gm-Gg: AYBFou0vfN4nI/PCB+bIhpTPLwiteQUB8lhpw38Cm4IPyvwuiqON0K0L2zR/uOfiiMj
	kRC48E2MlcfWRgH42DSeCahmlBOx1upJxuhq2Ce6YFy2Dq/j+zrL5rRqOI8Nzu2rMoXNelBxxhH
	AkvKjNKtnB4XdGMgGdwqQ7swDdvTV1qoN4UQm+EJU9+nNYaQxw/vNUpBRjZqJDYoWqOfXtN05/Y
	w49O45NbjvjXZrMiJdq+Jb2+4e3MbJx59u1YUpcnn4tASPFK5OaULm+JKGqb67+wJsVjOXWy89B
	gcLBgvTOUVmd/iOm3h6jeiCNkvBv/nmgx0fllFQOyVygc6IXfuHo4IsUlRTRFwtZ+s+3wtrzxUy
	ZPaKbHbcWthUj5gYZcZT7QZfh+kITpCeEML8Lbzg3F/uu181/3yPiflq7n0jVGcX8F75F51NVda
	wt2ssyfia38U3Pt3pmw31cybS/Xnf08Gh+zNIzk/YziQ==
X-Received: by 2002:a17:90b:39a3:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39907d659e6mr14262544a91.12.1788285555109;
        Tue, 01 Sep 2026 10:59:15 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:71::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c1d85bsm768983a91.13.2026.09.01.10.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:59:14 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:59:13 -0700
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
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
	colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
Message-ID: <apcSccBgd3nwrjvt@devvm20253.cco0.facebook.com>
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
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>, horms@kernel.org,
	colin.winegarden@broadcom.com, linux-kernel@vger.kernel.org,
	raphaelcf@meta.com, stable@vger.kernel.org, llvm@lists.linux.dev
References: <20260828190900.1767611-1-joe@dama.to>
 <CACKFLiks4ueY4faqOiu9-Zk6odEdNL1Abyhg+giOE72iMe0Z7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLiks4ueY4faqOiu9-Zk6odEdNL1Abyhg+giOE72iMe0Z7g@mail.gmail.com>

On Sat, Aug 29, 2026 at 12:20:26AM -0700, Michael Chan wrote:
> On Fri, Aug 28, 2026 at 12:09 PM Joe Damato <joe@dama.to> wrote:
> > v4:
> >   - Moved bp->max_tpa_roundup_size init out of the early return path and
> >     documented that TPA is unsupported there, as suggested by Michael.
> >
> Thanks.
> Reviewed-by: Michael Chan <michael.chan@broadcom.com>

idk what you wanna do modulo paolo's comment on this thread.

i have a v5 locally that expands this to 5 patches which should address most
of what sashiko is upset about:

  bnxt_en: Bound SW TPA IDs to prevent crashes
  bnxt_en: Handle buffer allocation failure in bnxt_rx_ring_reset()
  bnxt_en: Propagate TPA buffer allocation failures in bnxt_queue_mem_alloc()
  bnxt_en: Don't free the live ring's TPA state on queue restart failure
  bnxt_en: Only restore LRO if the device supports TPA

but ofc, who knows what other stuff sashiko is gonna find if i submit this and
how much furhter we'll push out fixing the original crash.

lmk if you wanna stick with the v4 you reviewed as-is (and i'll send the other
4 patches as a series) or if you'd rather i submit the above 5 as the v5 and
get them all in at once ?
