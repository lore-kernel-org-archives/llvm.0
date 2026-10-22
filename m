Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699152;
	b=XYFK71TMhtY2c7zvkTg83p+WTmM4b3FvbUZFXJknBwd5LI0SBRVwSVI7CfPi1Bvnnh10
	 ueg4v/lqtIx6AUu+IcC1Itn+p7+5dL1WRcdfALxsAvaBzTNAoHdMYUs1hzEw681B7pOhI
	 HQoXbeMtoqR5FyzZDNIDZu8HfjASTV4MzVRA3PLz6d95GKNouwDK75tNKFHRNp0+g6GAl
	 tOZLgDKUWzHWsouJKGy1/GVteMYj3OEtTMRN2hwCVefTezo54lohrpV/Xhz66Q+sT3H3W
	 HeMAOp4JQt7hd8HrbHRil+MKD5qLxatIbaWXmhQlyxUI8YBTrQHTMfVXYuC4Z2oGJ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RoCWPzkDrHJr/dgaCUqN2HXVPucGfm6YZCghqMmtLIk=;
	b=QGKPL94CVY8JOedPVuDRlgQc1fVZ2wCVndGuTJdR3Vgz5E2+YOndbEAm42TkLaKby19e
	 ZhELCZ3RAMXtOamb4fl5XfhvpRgYxZZf65ZGrzU4gl2nl4gwrG5JRz39qJb/BDc8ViezB
	 QeJrcIdRbhq9McXPPvcHqhdWsaQmLQUWdBECYM38UBL08ESLTmBdGYT+rfxOlQG8WZOpv
	 HOviNap7wJQrqVyz6iUj9cAPvWLOEwZr7lGlQpD7MsoctLHG7hIH+2j9NQxV11pfhxxfC
	 /0jqX6QwS+Xt9ejJGRq7LS5AVsz66J2+J4FGdrsed+A15YJAt7Ft7h6db/P276pcGMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i5l7Zo4l;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A598B606A31A
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 19:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A598B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i5l7Zo4l
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eafb65e169so182776e0c.1
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 12:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792699150; x=1793303950; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RoCWPzkDrHJr/dgaCUqN2HXVPucGfm6YZCghqMmtLIk=;
        b=i5l7Zo4l7BuBFULhBA4I7AtyIJvtEloLm63sje36FVv0tJZbbc64beS+zXI2ighnBx
         DaI4y7qp6FEcE41WMbgUEY71cuo1oR3x6+IKaY193sP/zdgdpjH03ZTbtKBsJUl74nV7
         XiRsz4nIlGosrsCBF4RrHJRXCUxMCyTqSiZCoDvrSfcVjIdAlOOeBrPgxLsa7GQOYQ4K
         tgawEm+wKuT6Vv7tHyNQibamMFEp0l1cAb8rT+SwLywQlFdIlMiLzgxxgiItkJMbHhbf
         WF6xIeXC7fkskQYiarAO1O1764/E6EyECTzjP6KcUb32tlhGSAt9wk7/eMGCIzs82Xmp
         ZMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699150; x=1793303950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoCWPzkDrHJr/dgaCUqN2HXVPucGfm6YZCghqMmtLIk=;
        b=EeJKwPbgDQmXmqBq4dLWeFYkGxCa5IAwWuPWCNgyZr8g5Ld7bXFxQAThw2P4V2FrW3
         YUbFmH3bN/Mfmtzl+vZyZXH0bVqHs1ACsMh4KVKPLms6m8VmGwJ0qM07YhSVGh9TUDD/
         FbcqVZ/ofYHOmKO5ISWIPfso37evsJCOOhIsqQpJEXLA+HD1bdk1uxdSf0KItBxxy82U
         lEgjB//8gVXCx6103oAuS/0kRx7tqdG1wO37gqe9Q7RkEUCPhmH87qRcHtT4BdCTT+Pp
         k+hc0y9nrZu/Z0AOKIyRlbNNO3kvnK4gKfD2VVRGlpL0lh7/TjoW4pDN3tQ/rrH4iKoj
         L00Q==
X-Forwarded-Encrypted: i=1; AKwUvByT1JNL7gUxFKMgtdn5bE7cGAFETNm64E3/OG4atnnxAn1kq4WI/ZzcKTGMQCEQgczwwUFR@lists.linux.dev
X-Gm-Message-State: AFq9FYKUgyONub+1kO7vSUqy13kyXi+ioPzwEnmziLiNl84Id6D236/Z
	45OTx896I1gJzhOmT7sYYgVFO6Kh13Jy2NVbD1bFYMCvodJeUt3jhjxY
X-Gm-Gg: AYBFou2Zl5URGxxKfT1RFYQ0o5TvmdhRe3C7rp0OTFU3HrOJIJH9ZtSNE+jSNEOhTL5
	Dnd03w5uYQUfD4T/sCVOU25yQy827Ko3MFBmrRPt8/DgDIQ9SQ6YmenZspQnCd+v192NjFhVtDj
	eHDx9g8S/xuNqE16rl9hwes1K/budGlVXT1QmuqN3RgjT2JBMpcoJMEGYA5GhTwQjv95mxmhsJT
	iGROFtKS1cJ3Xr5c6Xu0NKS/+Pw2ZBzx0gCGNJFRoip8wQjzc5SRASBBwO8Okg+xm24Vt+rroEX
	kL9xf/9XZPUqF7OkUIX9NR9y0GCQO/u46b1Y40AuSGRiByVZVWXxgId6V9DdFdfdZdLFRJJIkol
	nOpZUddBwkoRuhyJXzk3Vnq/mNl+mo1ghCBdkV0+a4CO+Sj9xyFUirc6LT6x5j8CLhhRwE5qU2s
	I4WizBJp3MpnM81YWBzjAxfNb+iinnpjgonWb3q0DC1kKBss0KerM1GvWEm1Oo1Z5DlRt2kisgp
	1B74HH4NJj1gWapDGr55w6+0C7x7r6XetXOuIMhuZ+W+1+uBw==
X-Received: by 2002:a05:6122:616e:b0:5ea:aedd:6087 with SMTP id 71dfb90a1353d-5eaebd9857amr3050579e0c.4.1792699150626;
        Thu, 22 Oct 2026 12:59:10 -0700 (PDT)
Received: from localhost ([2804:388:90c9:8e8c:18e0:eb4e:48f3:8b3e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13ed874asm131464e0c.9.2026.10.22.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:59:10 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Thu, 22 Oct 2026 16:59:07 -0300
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Namhyung Kim <namhyung@kernel.org>, james.clark@linaro.org,
	xueshuai@linux.alibaba.com, Peter Zijlstra <peterz@infradead.org>,
	leo.yan@linux.dev, Li Huafei <lihuafei1@huawei.com>,
	Ian Rogers <irogers@google.com>,
	Kim Phillips <kim.phillips@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Zecheng Li <zli94@ncsu.edu>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v7 00/15] perf annotate arm64: Support instruction
 tracking for data type profiling
Message-ID: <atprC5YrmbGu5wKO@localhost>
References: <cover.1791629326.git.wutengda@huaweicloud.com>
 <atFdpZG-b2JPS1St@google.com>
 <8fdf2566-bbac-4854-8faf-0276af5f936e@huaweicloud.com>
 <atkzKm_TPnhyzgx3@x2>
 <atlO6EJswVvj76rN@google.com>
 <b6c0b7b2-3ffa-4dd6-a4e0-23333e9b7d92@huaweicloud.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6c0b7b2-3ffa-4dd6-a4e0-23333e9b7d92@huaweicloud.com>

On Thu, Oct 22, 2026 at 09:19:14AM +0800, Tengda Wu wrote:
> 
> 
> On 2026/10/22 7:46, Namhyung Kim wrote:
> > On Wed, Oct 21, 2026 at 06:48:26PM -0300, Arnaldo Carvalho de Melo wrote:
> >> On Fri, Oct 16, 2026 at 09:18:38AM +0800, Tengda Wu wrote:
> >>> On 2026/10/16 7:11, Namhyung Kim wrote:
> >>>>> Please let me know if you have any feedback.
> >>>>
> >>>> Thanks a lot for your work!  Assuming you'll fix the issues from Sashiko
> >>>> in the next version, you can add my:
> >>>>
> >>>> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
> >>>>
> >>>
> >>> Yes, I'll address the issues reported by Sashiko and send a v8.
> >>> Most of them are minor, and I'll fix them accordingly (or explain
> >>> in the v8 thread if I think any of them is a false positive).
> >>> I'll carry your Reviewed-by in the next version as agreed.
> >>
> >> I applied the first 5 patches that are sashiko-clean, will push soon to
> >> tmp.perf-tools-next and then to perf-tools next after test building on
> >> my containers.
> > 
> > There is v8 already which should have addressed the concerns.
> > 
> > https://lore.kernel.org/r/cover.1792411435.git.wutengda@huaweicloud.com
> > 
> 
> Yes, applying based on v8 would be better. All Sashiko comments have been
> addressed in v8, so the whole series can be applied and tested as-is.

ok, I'll get it then.

thanks,

- Arnaldo 
