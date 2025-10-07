Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822321859A
	for <llvm@lists.linux.dev>; Tue,  7 Oct 2025 18:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759861147; cv=none; b=PEdvLJ2FDpSLPy2YyjzfeVu99RZJHxMun6qr6LgGiiCnxQbEhRlJlmyenZtk4MHSoU2BPN2nH0rcVTCqn8zLlXz/6VQb/qEUb6wN71ue2HNOKlO4xwOfoaBfAyeLDT47sBne7e9Blj9Nnb8myML1bWMu1ies2N/36Mh55zeU+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759861147; c=relaxed/simple;
	bh=1NYA5NXCfUNHGAMPIDINqsi5FPnYmleHEw4ndZr/cwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ba5d/2xyHLPpFu3Bgn3aWfpsa7uHVGiOzotpE43rwa5/MZroKNHMnS5GLLyWMSTC8u/EQ/xSWrskDW+TzGmzoFUXVRJgX8iayrvMOKRmDQ4/S5DrGFk8zWl75F7F7jE+NZxbn0DcELFChAT7gCUptQ+u3QlViCtVFPVJ83xb8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4X1OhNI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4X1OhNI"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2681660d604so69485065ad.0
        for <llvm@lists.linux.dev>; Tue, 07 Oct 2025 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759861145; x=1760465945; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1NYA5NXCfUNHGAMPIDINqsi5FPnYmleHEw4ndZr/cwc=;
        b=U4X1OhNIvu7qkAjqqGVflcd5mWsYHhe9GTcPW0Bz3Cvm+MnSxydVKfKnvguqdyqP73
         8Z3bVabgdnPxmwJASh1L1lp93D6vHMpHWooQospH1BaMx0GE7Ye90FTJEoBzmiuF0WDH
         mLthCGD0Gll5REXU/TTL4RPjCJPZzDhjNAIj02k+7cf1La545N+ILNHktJbLZMfh4f/i
         +UnsOvbYCoK6zL6hxRePG14LCqRDiTMmPO1kDDmJfVw5pydzVNDX5TBb8fFhK7OhJt6o
         TvBUQsw6Hk3twQAujXsNWnM3XDyQWtt2oCWkDfBAxKYZx4X7SEiRVQYfnswZmx4umSUA
         31hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861145; x=1760465945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NYA5NXCfUNHGAMPIDINqsi5FPnYmleHEw4ndZr/cwc=;
        b=V6Ozick4cAG0eTJZjXPKlaQ0CTOtieM509LLz+02vkypVcvtALrAtttdo+95nRiKMq
         2PqlgTppMH53cvQpccmyBk1yDs/rTleRrJI/dy9iy/CNOP/u0wRDRTKqyrjVWvkHf/9W
         LC4DXgLOIBuZ++Jj0lrS/A8xApJt1VSXwnlp70bse46pHe8sbcwbLYFU1/R99RP5IGoc
         idxVjvagPrupvmpo130NIOkQwiRL1TbveMcGLxTKeigdkkF+dy4vzwlqhKMnBwqFZteG
         g6yVfwE3dw8kHwD3BcH5rIL5YLy9mCZ0DPl2BbpaYcByH46ocSX7at1feczdDT/A5UsN
         DGng==
X-Forwarded-Encrypted: i=1; AJvYcCXewRvwQ4WhG3y8VlL6D1ZI3NHXwsnPyBZAmx7Dq1BmRfpDFllJwPuo07IYaU6p9TmHFmgz@lists.linux.dev
X-Gm-Message-State: AOJu0YxlRhWQlgekMn001Vi70C5aMmIc3/4LivJNtVX5SggygqwwvrxD
	UXycADZ6rFuZNiltMBUukXKnWW1KHIYQoVWycca850T/XZHNLeaCqk5W9hwvomI+FNKbnQW3jvG
	JYBBGIAtppB0vboqeD+BcMRhba1jGnGsDj5QwBUgK
X-Gm-Gg: ASbGncuEA3D8vm/HXKxS4Awnx2VlQkAQ9MEgDMPDY4jFYXVcDZ8vWG5M2Vb/RJ+tIDu
	wq6jMww9AyFzhq5B/Droh/e+OY2dqHZzD4gHJhIhA5664fic5DhPxwqY0GFlyWVYbyiBmoW8/Zb
	XGyXG8W1BAW2+PswGGI6NfH6QUzAx7iLV9Bo4Ffaib5ITxjb0a+FOvEQvZtM8hzRAwrbDF9tGo6
	TbnAtidF+aE8bi1vKY1zwrtrfJ4jT3q69Wm4Uag+1Cqr1HJ5ayygQbLbXv9aCil/TqSbskObrRS
	bxU=
X-Google-Smtp-Source: AGHT+IHw6dFIKAHzPTv9mVtUGHjBlx7WlkdXf8MR1ZgGcxSTfN3zEfUpxsIIe3xlxd6CYLBEcLBlT5+Vp1Gkw1TXYKQ=
X-Received: by 2002:a17:903:2343:b0:28e:7f50:5d80 with SMTP id
 d9443c01a7336-2902721336cmr7056975ad.7.1759861145158; Tue, 07 Oct 2025
 11:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250315025852.it.568-kees@kernel.org> <20250315031550.473587-2-kees@kernel.org>
 <aOR15Xb6DfolYM0z@casper.infradead.org> <202510071001.11497F6708@keescook> <e019c59a-ba8b-ec04-dc5b-923cf9dd9d9c@gentwo.org>
In-Reply-To: <e019c59a-ba8b-ec04-dc5b-923cf9dd9d9c@gentwo.org>
From: Marco Elver <elver@google.com>
Date: Tue, 7 Oct 2025 20:18:28 +0200
X-Gm-Features: AS18NWCHLWcuBl7emRjgyAd7xCJevIo8qneqm5GOzEKlmO2F3nZsj3gxx6OmYQU
Message-ID: <CANpmjNMsSGY+QEn=GV8S2sXuuQsioikPR+OhGa3+6EoTqYPkHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] slab: Introduce kmalloc_obj() and family
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Kees Cook <kees@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Matteo Rizzo <matteorizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 19:47, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
>
> On Tue, 7 Oct 2025, Kees Cook wrote:
>
> > But all of that is orthogonal to just _having_ the type info available.
>
> iOS did go the path of creating basically one slab cache for each
> "type" of kmalloc for security reasons.
>
> See https://security.apple.com/blog/towards-the-next-generation-of-xnu-memory-safety/

We can get something similar to that with:
https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/
Pending compiler support which is going to become available in a few
months (probably).
That version used the existing RANDOM_KMALLOC_CACHES choice of 16 slab
caches, but there's no fundamental limitation to go higher.
Note, this mitigation is likely not as strong as we'd like to without
SLAB_VIRTUAL (or so I'm told): https://lwn.net/Articles/944647/
