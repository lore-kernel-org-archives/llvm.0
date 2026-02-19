Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C3323DEB6
	for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 08:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771489451; cv=none; b=QYs0tF4AWOMwP2DX13dUetWmSUC6x1LiWIrTjeBWd/ApCQIqmXbrV2pMNsFrJHucVyUa+RQv4N/fdGN1sRk9tSW8RcWYCK/okrtIx/ipT0miqabv5/cuSE49s29bHlUOOCr2BCfMD2dSbAxcZIb5oGaJ2RpbH3virqtP45T7qok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771489451; c=relaxed/simple;
	bh=pl8NaGuc07730Vhu9Yi5iYedyPwIa2ZX8U6xHGWonLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gurra6jK4EynEbOODJGmm4/ZEGvh5bnS5ATIfP1FF0WyHCJJMvKZ/Rk04TxMWusZAJ8HLY9bzGUcIqPMl7epK6lOJIXaZeZpD1m8ap5hkensj5Gk8osTRodlaPsT6HMfOhbZgtEbZuScZlMoaTdqWvGNur+Z3jEOuFd1i7oeO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FcbFfHgs; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FcbFfHgs"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-437711e9195so434286f8f.1
        for <llvm@lists.linux.dev>; Thu, 19 Feb 2026 00:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771489448; x=1772094248; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0GbbSdysg+YFEUJI01k89ruDtqq8bN+fDTrKedLeRl8=;
        b=FcbFfHgshBE3DynF40DZJtPHHWF8ck+9c2eYPfAmFeYIwLheRRVtphtjBtJ4zAJj94
         QFumDreiWlGzheuihceIYoNMId7kfc84Hv2a9u6WSVk7rpK7TULkRRPW46uSZyod1LQR
         qZE8Am+9N93hUvgHdGEdGDTceqiOfCm9ELGu4dA/t/A9fYvccsULtA0YULpaFFRQ6caX
         5/h9cC0+0dcGHn/tqrmY2mcw5teq69dq9bRybXC7RZxhXgSY10XenXHA3OQh/pdtG4W7
         2T5pdnzzJ8gexZtVnJAOVUiXQWQ7B05SuyeSIHWkmIBVL96zat7emzBX3gMgpj3Yx83K
         8wtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771489448; x=1772094248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GbbSdysg+YFEUJI01k89ruDtqq8bN+fDTrKedLeRl8=;
        b=B+YreFgUk63vlUQhgDwxBWFOvFmkHBNW2Ow/RcGvHPmUs/Ytdu7fmWNAwc2Uzr64fC
         9CJRPmi0x3bGAmdx+cujEGeGVkOLtoBAL1UfhdTERG+bsmV7iGx7IclEUg8CrvsVkvcH
         qkbVdvhS8tSwwjKMS9B8LeymiJh58LZarYJ4fb8R3iojjhkAD9nqqbUbk94kAUSg8jee
         9KfYJ9oSsgWQmwTq6xWSphunCpM5NSWuKB3KzVCMpCcWtz0OxkoNO3Sakttns5w644+L
         pEC+FlephyAUlMpG2srviFlMT0elQbY5N0OOu/rSz+oTtO3XxiTHNzG3yxPexE3DfevD
         e1Vw==
X-Forwarded-Encrypted: i=1; AJvYcCW8FdNTkbyFzOaPQHCusVazGokmmyhoqRF4GshotSLk/vfMDOXVOK3a1nCwQYGM6LJnNMug@lists.linux.dev
X-Gm-Message-State: AOJu0YzgTCkgP9SNCfWP+lF1QACCBJF0TSVnET3YZrOPlDl6H3pyQUAr
	wWMQQFTCcX+kXrg/yw0X8Ugq5foNwgxVz8EL3F18r6W8pFl0KCXRPYihSjwA23lGjzU=
X-Gm-Gg: AZuq6aLtLhDhwPokTYkQFLDRvRTjTS69Lym53IylRsBSttkS+b2LwTSX9tTlNLrWV0u
	g1YeAL7mMFL40wYBnjEdUzyU3ISB6h1c68/9uUc69pYYDSmf7r3U+qsnRFC+5WotF3ne6a19XnC
	WT/bsLKkiYiX2PYT4dL418bUGnAYRLb1XSzFmgMenozQXykQHVuG3YOh3Iw/EFL0naUQSylrj8y
	bWBJvAe7FmmIaRvVrjYLEfMT1CYvdXpipR3C+2SJmzACP+XLJ4reIE4nrpctfBGddsmfHlZ14px
	qJauijM4ZayUV859TggyLEiawZTsCcSgsJ/HMMABk73QdRGxkTBJKuBG4sbkJlmh6xazpzogTgr
	47Ilx+g5ljWDnspHTUeD9f+xmVp6P1ebJwP4I3a4Eq1zKwpmDvli69NpcXbd/wLYXUbt4SDsed+
	0TG4oqdczathz51JZlBJZyPtIwUDD2
X-Received: by 2002:a05:600c:6912:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-4837108fed4mr354407295e9.25.1771489448240;
        Thu, 19 Feb 2026 00:24:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836ff00332sm412241365e9.2.2026.02.19.00.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:24:07 -0800 (PST)
Date: Thu, 19 Feb 2026 11:24:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Marco Elver <elver@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>, Joe Perches <joe@perches.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 1/5] slab: Introduce kmalloc_obj() and family
Message-ID: <aZbIpCSuKU45b66t@stanley.mountain>
References: <20251203233029.it.641-kees@kernel.org>
 <20251203233036.3212363-1-kees@kernel.org>
 <aZbDQLeMsHCv32X8@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZbDQLeMsHCv32X8@stanley.mountain>

On Thu, Feb 19, 2026 at 11:01:04AM +0300, Dan Carpenter wrote:
> On Wed, Dec 03, 2025 at 03:30:31PM -0800, Kees Cook wrote:
> > Introduce type-aware kmalloc-family helpers to replace the common
> > idioms for single object and arrays of objects allocation:
> > 
> > 	ptr = kmalloc(sizeof(*ptr), gfp);
> > 	ptr = kmalloc(sizeof(struct some_obj_name), gfp);
> > 	ptr = kzalloc(sizeof(*ptr), gfp);
> > 	ptr = kmalloc_array(count, sizeof(*ptr), gfp);
> > 	ptr = kcalloc(count, sizeof(*ptr), gfp);
> > 
> > These become, respectively:
> > 
> > 	ptr = kmalloc_obj(*ptr, gfp);
> 
> We are already getting patches that covert these to:
> 
> 	ptr = kmalloc_obj(ptr, gfp);
> 
> (without the *).  This feels like the obvious bug people will introduce
> with this API.  I sort of think that "ptr = kmalloc_obj(ptr, gfp);" is
> more natural, so maybe we could make it work that way instead?

Never mind.  It causes a compile error when people leave out the
asterisk.  Thanks for that.

regards,
dan carpenter

