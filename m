Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A651AA1D8
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 22:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190811; cv=none; b=sRe5K+CtQUaV13F/3wK0oIic6Hq8yX+hTBYC8QBYFx/JQZCfNaTcR9at3R1zE6l0POI0R6TcNCCG4wK/tftNBeKNn/x/zMrgbO0Kftvv5NH9pCQR4cJv8gkq7hK2HYhTDa/cWiCXLTdzIG5X4xFLPJlDy7UwDYCU4fxRq+6YE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190811; c=relaxed/simple;
	bh=jM+JF1tuc0aPq+iNTEeRlvQCh0lTlkEWbnnMIMUHuqI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZifFfbkRpVouMztNcZjkqzuxYI/wSQ3vt+VtWQtkMLmOBXt7AfHUWWhns2jRSBvNSVLbkz5DmLGiTYDZkPfveK7cROY2T2Bt6AqWe2wbp+sDtNvx/SHU116oFB1aOUKI3+wVtY5dtTy5WCEd1npgtFwyv82k+mWyqn93AKlZJvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eT5Q5vmP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eT5Q5vmP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so725015e9.1
        for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 14:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738190808; x=1738795608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmvxfS/EO0PIn6aCNLLuoJebE/8xsvo0sCWW4T8X2eE=;
        b=eT5Q5vmPN9LjP7hM1M4ZPHGSeLPI/h/XIfaqUDmMmofT3LoycOX1WfDsiytTEzaaIf
         jlKWsGz1ARpT8zcmikofXKSTsMQnejCbLvHd0NbnZZyohE40wGyCvJA67AAgd50T9iuE
         RyLT/UtAsAHjneN3+KkyezjNXYr47DTLBB4+po6fJlrMtHE7DPuYI3Pm3sWIn9c5rBBm
         Qk4F+tHmY7N33o2qQE7yaE6aiXL8kGzrF1/4H9SuFTwFTz9xnputNSr7OCY7Pr6tnq6V
         TzvtZSkza7IbymJWNmmbkOGFiAcDr/ojxGZysJlOJhlznkskVLGJvQtV48UXu7bceaEK
         5svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190808; x=1738795608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmvxfS/EO0PIn6aCNLLuoJebE/8xsvo0sCWW4T8X2eE=;
        b=vSWxJxbx65u50M+5kA2uDVzOFr7ABUSZN2Rb8yX0sexzRHM16kfAlcJatjhrlbggIw
         4/bOhoa3uIFZQKZBWT1WjDpo4f33f00OUpxJDPywKvipaBXmWY9CeXb8y+6HgPmve7Yd
         F7CM1CTJqOEdN4bxSlXb64qwoZD3uTDqxhEUvJblSmNfB8e+Of4hLNhKs4f6aDhCgeAn
         /mST6phVynKhn9jr+F00wy8dDgqNGbOg8obBA2LYHvxTU3Is8c0QI3zb5p7cU/mY1wrl
         ooagaLOHzVypDrWR4Ay/37QtVOPIAeV7c55+TPNHef1RWkihKOCd88msmJxzhG3dLJR7
         olaw==
X-Forwarded-Encrypted: i=1; AJvYcCWMB80newEHuuStUGzAWTnq5+1CJGYyg/INTclvDQ4pREaKeEztWyAacZNq8u3Uc943UpI8@lists.linux.dev
X-Gm-Message-State: AOJu0YyNWMCqeyShalwXwdeucG4WYoUkqjetIZyBejc7W3JiGN4qPG8K
	2nvlX8y57thTNFaJic2o9JBxn2wzHQkxtlw7ZDcdWLUwIVKJKp6f
X-Gm-Gg: ASbGncsxdT1RiV+t7CxXXvbjQmikwn/D83lh6uRBwK6F0DYk2vyV9aBparhdcfIhXoU
	VtGpEv0y+R54P/mvCNVxcEimkt2S2wBL35EtIxij/gIfwMSk1GSRao15HIZBt+s+4Fb/mg6qSl/
	cjbtl4CTIRrrXMXJdQxyFDKcg50XFnTULB8ssIfEoIzKwU7KmMi7zw6fiugOsrzQAMazBZJjm6I
	JK4+d+Wv5trvAqamrTzN7Dyq8DcGXqhHSmHIwb21Jb99M2IFcydFC2r5wELMxk5pe+Jb4Ick2hM
	ZL2lxZokOQ01OMHtY9tSFTUbAF/EJL2GaSrR6tpwC1B/NPjH4ALUfg==
X-Google-Smtp-Source: AGHT+IEbiT0NntEOD+phSpXzHaEDeog5yXd+fKeNamOBs2OoNyYQ2pruZWg7BKcGdm/hSVEfYQUk+A==
X-Received: by 2002:a05:6000:1788:b0:385:ef39:6ce9 with SMTP id ffacd0b85a97d-38c5194c69amr5482326f8f.21.1738190806495;
        Wed, 29 Jan 2025 14:46:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244f38esm1406115e9.26.2025.01.29.14.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:46:45 -0800 (PST)
Date: Wed, 29 Jan 2025 22:46:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Bart Van Assche <bvanassche@acm.org>, Ivan Shapovalov
 <intelfx@intelfx.name>, Andrew Morton <akpm@linux-foundation.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, David Rientjes
 <rientjes@google.com>, David Hildenbrand <david@redhat.com>, Joel Granados
 <joel.granados@kernel.org>, Sourav Panda <souravpanda@google.com>, Kaiyang
 Zhao <kaiyang2@cs.cmu.edu>, Johannes Weiner <hannes@cmpxchg.org>,
 Konstantin Khlebnikov <koct9i@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] mm/vmstat: Fix a W=1 clang compiler warning
Message-ID: <20250129224644.0f7228db@pumpkin>
In-Reply-To: <a4dc3313-b9b7-4075-b082-7232b3b7717b@suse.cz>
References: <20241212182425.ad1f7894cd0f00b2e34bbaed@linux-foundation.org>
	<20250122015818.3308696-1-intelfx@intelfx.name>
	<6a45a521-71a3-4087-9320-b8aeecea205a@acm.org>
	<a4dc3313-b9b7-4075-b082-7232b3b7717b@suse.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jan 2025 11:22:00 +0100
Vlastimil Babka <vbabka@suse.cz> wrote:

> On 1/28/25 22:36, Bart Van Assche wrote:
> > On 1/21/25 5:57 PM, Ivan Shapovalov wrote:  
> >>> Spose so.  One always suspects that adding a typecast is a sign that we
> >>> screwed things up somehow.  The relationship between enums lru_list and
> >>> node_stat_item is foggy, and I'm unsure whether this is the place to
> >>> make the transition it.  Perhaps lru_list_name() should take an
> >>> `unsigned int' arg instead.  
> >> 
> >> All of these *_name() functions do seem to expect arguments in range of
> >> the corresponding enums, so perhaps keep those args typed as a form of
> >> self-documenting code, and do this instead?  
> > 
> > If nobody objects I will submit this patch for review after the merge
> > window has closed:
> > 
> > Subject: [PATCH] mm/vmstat: Fix W=1 clang compiler warnings
> > 
> > Commit 30c2de0a267c ("mm/vmstat: fix a W=1 clang compiler warning")
> > suppresses some but not all compiler warnings that are reported by clang
> > when building with W=1 about NR_LRU_BASE and NR_ZONE_LRU_BASE. Hence
> > revert commit 30c2de0a267c and instead make NR_LRU_BASE and
> > NR_ZONE_LRU_BASE integer constants instead of enumeration constants.
> > 
> > Cc: Ivan Shapovalov <intelfx@intelfx.name>
> > Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> > ---
> >   include/linux/mmzone.h | 22 +++++++++++++++++++---
> >   include/linux/vmstat.h |  9 +++++++--
> >   2 files changed, 26 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index 9540b41894da..92ed919ea99d 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -135,10 +135,19 @@ enum numa_stat_item {
> >   #define NR_VM_NUMA_EVENT_ITEMS 0
> >   #endif
> > 
> > +/*
> > + * NR_ZONE_LRU_BASE and NR_VM_ZONE_STAT_ITEMS are often added to 
> > enumeration
> > + * constants of another type than enum_zone_stat_item. Define these 
> > constants
> > + * as an integer instead of enum node_stat_item to prevent that the 
> > compiler
> > + * warns about enumeration type mismatches when these constants are used.
> > + */
> > +#define NR_ZONE_LRU_BASE	(1 * __NR_ZONE_LRU_BASE)
> > +#define NR_VM_ZONE_STAT_ITEMS	(1 * __NR_VM_ZONE_STAT_ITEMS)  
> 
> Seems an acceptable approach, dunno if this multiply by one is any better
> than casting to int?

I'd probably use (enum_value + 0) rather than a multiply.
And, if you are going to use multiply, I think it should be (value * 1)
for the same reason that 'if (1 == x)' horrible.

	David

