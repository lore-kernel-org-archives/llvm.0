Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C03296BD3
	for <llvm@lists.linux.dev>; Sun, 11 Oct 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724278; cv=none; b=VqEqyh71UoBybNuwacdkAB0jUiCWe6r/04DTdjMtovt5pSZC7z8MkrfoLyLsEv1FPofhAnG/+EWWg16u6tLIufI8pyQilLzv5JrBG6661knU/cnuRUWIFWNLdDOyHJnIhzGuY0138iSzQqZgazll77cPJY8R7n0/VP64uqW8tUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724278; c=relaxed/simple;
	bh=aErJnkieOCM3MhfmM3LqUVLaeFiqhygrEa5kgMqxaXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqKo+9x5xnNGWP0gJHoQKgO7DfmRSXZp+CSRIbcQEyzIpPelv2KWM57tvm6FtKb4lQUEz23vcPOfyVjdHRG66km9by9+heJvRwRSHGvp6OS3jr527Ueau9NGmwY+6FQ+4t4wzgvVzGTWmcRCmiSKtiQb7t+wB+2FBrzDEFdjFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNetBBBq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNetBBBq"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so13591395e9.0
        for <llvm@lists.linux.dev>; Sun, 11 Oct 2026 06:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791724275; x=1792329075; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQKR4lZeKCCSF3S1g9JSmEoRlY8sr+ryqydnKO0O4oE=;
        b=gNetBBBqH62ABsEay0jhAxHG1Vmdvbd2Bvc01gqW/48gKz2IMTIrL0TTcI+MRA9QMq
         3SenDoFHbhDeApPGc/AjDqBiTV4suKAjiEVfbuLem0eT0Zz9t7I+pNHHISkkxx8xLrTs
         N/KXGG932t8xJlGNR4J+IClO+vnDN/Xoqqbp4I/AalhOeRpMKllccgzpqCvlWaVREPp+
         cHtgNrkda6Yq75j6wVhMR4IwPDwjb6acv6uvxDUR5uZlvzA01ZdHQVRrv8bWY/ORcN97
         dCdVNAfAD88KvA3WsRpMDyq/vDLiCn55JmatYZNSVKHjcHt9aOGE9vlybTdNwAP8zv10
         EiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791724275; x=1792329075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SQKR4lZeKCCSF3S1g9JSmEoRlY8sr+ryqydnKO0O4oE=;
        b=jIPT+W5IZCTxobAv3qShbOcK7V25qmHZ5rtFbjoZDq7ak6J7PfVj5qSTOKvNMArilB
         3FtmHJadSCo3gI4n22TihmUkPHZLPSHm+zDlK8VFbLYxLCMiLyWFEX5h9pFqSIi+PNqk
         JU9ySOhyLM50CSimMM2h/dUxu4jpB4a2HGWj0CZ0bewhOM7cKpsSVtVmFISvGUbzbpdJ
         REKHwFqC2yrptuM8RhVcfqAIf8l0Yi/QwDX9unDPeukrTar8kq75L2GM+GJX/ZAsQstb
         UcjTRfRPV92Q1TPUbUVWRiEFWc6M7YfAIsaQJ/ewLaYAddd7YDO82vGjGETLDpZtcsxe
         4yTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG5zsmq5N+JIMYbXuk4JeqQV0LsqFJA32k1os/nhxjOM6P5VdldWmaQg3PpDizll4yA8mG@lists.linux.dev
X-Gm-Message-State: AFq9FYJM6aZ9f+Xj7qe2nga8pyQh70KUAJFrdoLxk2Om1ytvHAKPLSjp
	/gRrDH8aAohLmyv+BbPC0rSXk7LO0J9LMrybfCzbPBqVSqp0B3zUct+z
X-Gm-Gg: AYBFou2CrNfxdzHAOY+JtgTiYzNcM4LA543QOY7/v9cBb8VaLynQEIsdH4LOA2uahg/
	VtitMXHfsKyu3aZNsJyoY/lE8FmLZH/XHmirGvcPm/4Qq/kR5nnEStPCUfig634tGr7/vLu61SV
	WIWLn1Ncqfi5j/iVTPNney6U2PcboyIc22+7SMaWqcxz0a1OGIv+PjcPoi/OUFEHI2r8RI8bZa0
	Xs6/0mc9phAnmg9j1uzTkewC281ImcqvUHoepGQBUy0ehXnff7GEO/fy8aCUYZXH6Od5KCkvWwt
	dBwWnLj/2hDLlTswYywJE7NJ0HieXSDmzoTJizMXgXguwo2jGWXjhR0H6Qj6jEFGKrAlAomXCot
	CxR+4Mkc3q3G74QvR1I/Szdxdp7x6nBhSYgPIcTbs4/89BQxS66eVMsQpc4QFThc0Tkw3rbOLeL
	5J/7Gs9fep5nWC55AU01u7NYMrs9DckFIW6sNo+UlEdJJJzhjrYv+XJV53qg1VAHqTOXNnRy8i6
	ORb4vo2nC8LhjAJ074f1I5YVxJJ0pRZskU=
X-Received: by 2002:a05:6000:25c1:b0:48b:9d2:1a6a with SMTP id ffacd0b85a97d-48dba78a613mr11734232f8f.1.1791724274680;
        Sun, 11 Oct 2026 06:11:14 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abda3csm14712714f8f.36.2026.10.11.06.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:11:14 -0700 (PDT)
Date: Sun, 11 Oct 2026 15:11:12 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Tingmao Wang <m@maowtm.org>, linux-security-module@vger.kernel.org,
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	syzbot+a0eecb22de4d821a9e5d@syzkaller.appspotmail.com
Subject: Re: [PATCH] landlock: Drop __counted_by from landlock_domain.layers
Message-ID: <20261011.c1055cd53b32@gnoack.org>
References: <6ac91e98.bbc4c7f9.15faa7.0023.GAE@google.com>
 <20261010164450.194439-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261010164450.194439-1-ngocthang2710.1999@gmail.com>

On Sat, Oct 10, 2026 at 11:44:49PM +0700, Nguyen Ngoc Thang wrote:
> With clang 22 and CONFIG_FORTIFY_SOURCE, the second
> landlock_restrict_self() call hits a bogus fortify report in
> inherit_ruleset():
> 
>   memcpy: detected buffer overflow: 16 byte read of buffer size 0
>   Call Trace:
>    __fortify_panic
>    landlock_merge_ruleset+0xc46/0xc90
>    __se_sys_landlock_restrict_self+0x2bc/0xd40
> 
> layers[] lives in an anonymous struct inside the anonymous union
> that overlays work_free.  For such a flexible array, clang computes the
> address of the __counted_by counter as the start of the array instead of
> &num_layers.  The bound is then read from layers[0], i.e. from
> the first layer's configuration, which is not a count.  The same layout
> crashes clang itself in a standalone test.
> 
> The annotation was added as documentation, so drop it rather than
> restructure the union.  Keep the information in the member comment.
> 
> Reported-by: syzbot+a0eecb22de4d821a9e5d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a0eecb22de4d821a9e5d
> Fixes: bd3a19800dd1 ("landlock: Add counted_by in landlock_domain")
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> Reproduced with clang 22.1.8 and FORTIFY_SOURCE on mic/next (64b9e6eff524):
> the second landlock_restrict_self() hits the report, while 16 nested
> restricts run clean with this patch.  Mickaël, if you prefer to just drop
> bd3a19800dd1 from next, that works as well.
>  security/landlock/domain.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/security/landlock/domain.h b/security/landlock/domain.h
> index 60e8eb2d6ac2..4bf1555a4349 100644
> --- a/security/landlock/domain.h
> +++ b/security/landlock/domain.h
> @@ -246,8 +246,12 @@ struct landlock_domain {
>  			 * properly handle merged rulesets without overlapping
>  			 * access rights.  These layers are set once and never
>  			 * changed for the lifetime of the domain.
> +			 *
> +			 * Not annotated with __counted_by(@num_layers): clang
> +			 * miscomputes the counter address for a FAM nested in an
> +			 * anonymous struct within a union, which trips FORTIFY.
>  			 */
> -			struct layer_config layers[] __counted_by(num_layers);
> +			struct layer_config layers[];
>  		};
>  	};
>  };
> -- 
> 2.43.0
> 

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

I agree - it seems better to drop the __counted_by rather than
restructuring the entire struct for that.

Thanks also for adding a comment about it.  The __counted_by() has
only been added very recently in September, in commit bd3a19800dd1
("landlock: Add counted_by in landlock_domain").  Better to have a
note about it so that we don't accidentally add it back. :)

–Günther
