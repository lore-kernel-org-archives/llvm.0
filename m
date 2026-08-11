Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2B289E13
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428272; cv=none; b=C2hRIT66ISbjGHXusaIbMSd+Jc6CorkyR6+mdXPAR2PNbmG5beVvd0gAtZthQtaxKKaa99WLhbkzC1WkHXx9QyHRnqiUt1JD+LW1/5UjhsLuOjemdxClZfy4RSrnif+gI/Ns8/SLwzOhbz3eGDquMQjbe6DSA38IBpcvsGRY6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428272; c=relaxed/simple;
	bh=18tPJmB2IrXlw/93X4CGmfMThkYsZlIjuAOdW+XO01E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ycwjc4mPbmzpvelvEKak/PdYjtPuVdkzYUmtlaDr2Mh0gJ/sX+28wCJees4Z6pBDcprYIAKLzwXh04bi0t12+rpTJPaIcrRBCMm2LKcYHf6lQFDHnfCH+IZb8NWPetZVmQGqEpJ2uh1JxGtGrBnsthtsWW5euEdVzT1Iht0rP1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe/vLany; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe/vLany"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cad8076b01so5140535ad.2
        for <llvm@lists.linux.dev>; Mon, 10 Aug 2026 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428271; x=1787033071; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYM1O+Rd8ITfgZXWgWXDbgYDCcPMCN1QFwc54SaPkqY=;
        b=fe/vLanyzf0fwnnc8sVQkQ9Kbs1Oz38xBpWNq0IBTbvHZZFmS4mCvrLxXFmVikqcBW
         CUuW/+q82KIxwadvQ8Zmfg5cpPezF5RQOlqgbQa4+wQxOmEFiKTtrhuugSQ74iiFGQQA
         m4MbWEXU9Hm/zbIK4QLHbfWSz7i4vTkyXgBqm/rc+TQFWONuqOHQYirio+Zv+Pp2nwPe
         0lMCGJxpOhGo/MAawpmPLkw8mg37f8jbxY7cjkRiGNPPSzMEMAVK/VyAz4GbXoULxbI1
         bEehw9ysHgq9qD1tth15ghy3RHoklv0wwjz9i1kw6zeVG2eIJfu1GBz9D/b+qgg6jx3Z
         JoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428271; x=1787033071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DYM1O+Rd8ITfgZXWgWXDbgYDCcPMCN1QFwc54SaPkqY=;
        b=Ht6gjaE3rmVOMMfsjV/fvrojUQV/aL8NJu1NqpcgrfHCJxqh2N46jnO1hK893iaU8I
         5beDcdcqekC7FuhQSCCBsHFJRV7BmZjiyaURmq+jt+Lh15hLdXFdRP23FJd+Ulpyn5Bz
         rC6Jsgxvmh9qlJYuJqsOlo7OylOpSqbkxWfwWzUGjiqcjTrFzjlt5SUaxtPt3w1uzROi
         VbLewxjxPDN6AXy0x/qkLSyOqbdm/M/vlkYBkijBx4XLjHGd5Vp7ygIjxLeGSxATgMwD
         tFJ3zREwdawpxtfqQQqFVfVUC96rEEreV2ewRQRrvwYbTfn3kh97BVqfGnURwXq4cG5P
         KOnw==
X-Forwarded-Encrypted: i=1; AHgh+RqGGD5rY3xwe4IrusbnzITzz+F8fX1/0hLSR+mVObcDA6l4u4oUHBFlH25qhdQesuaaA2er@lists.linux.dev
X-Gm-Message-State: AOJu0YwxL8pFGJVThehU+8h3MugNKczQJoaTxkZraXDl1RScqb+4FgiA
	1t8omKUrKT+1D5eQ79zaLONMyJgiSB4m5SGUBaK5+1ocyWIXRrOgJwx3
X-Gm-Gg: AR+sD10sC8DGZKxz3W88hASY/h1MCUV3eQgLofcOsOOdt2GhF2VCCOSu8sYbYrvaxC8
	x83Yo6aU38za2lVa98KuvVPO1rESC08Y6i/ek/TCuxrJAaazMzmUgw+WaAc2i5hPcxdP57waxmZ
	DajUJ0kMbjvnkcLIuLMj9XAdfXoDGHvX3msh7i/V7vn99pYKwH+20LIkfhGDYvNwF9rt546MlIL
	6kbIWDHEX+NgUfDg5j8R7nuj4vJ/H+Uka6eZxil4drJUNuCLson3kSzexTDtU5zcOi284kwDprc
	85rmG82wIDfNOoO5RhrCt6caqB7wFcXULsq8OnS+o9tijPc/apnZrL65DTNoqkMuXedJB+yRW5N
	yIeeMfgAmX7iDY92yC+ig1BgxLNpj889MkbvEMZMkX8fr03qASazDO6+ML3hGxx7+ZxlSQfGgmw
	r78ytBhmqoYM5tWORPw2kEWYarSiIsKRY5awuPbdeklIL7FKqblM/q6QCaYWMwDxUGx0uoYEgSg
	+Q6KZmPFLliUjlw6nt4XPmvWOLQwf9+LHd/H1e8QwM=
X-Received: by 2002:a17:903:3d05:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d317926724mr13979715ad.11.1786428270656;
        Mon, 10 Aug 2026 23:04:30 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160d475bsm1935445ad.50.2026.08.10.23.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:04:30 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:34:03 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, wedsonaf@gmail.com, 
	mattgilbride@google.com, boris.brezillon@collabora.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] rust: uapi: replace direct asm-generic/ioctl.h include
 with linux/ioctl.h
Message-ID: <anq6-zI1NItuRMLR@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260808032143.2767112-1-mkchauras@gmail.com>
 <CANiq72nH+7P0PtE5h_kpn2oSK3-CgM-q5f3B=YemJOgQ-AfwPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nH+7P0PtE5h_kpn2oSK3-CgM-q5f3B=YemJOgQ-AfwPA@mail.gmail.com>

On Mon, Aug 10, 2026 at 05:29:02PM +0200, Miguel Ojeda wrote:
> On Sat, Aug 8, 2026 at 5:22 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> >   uapi/asm-generic/ioctl.h: warning: '_IOC_SIZEBITS' macro redefined
> >   uapi/asm-generic/ioctl.h: warning: '_IOC_DIRBITS' macro redefined
> >   uapi/asm-generic/ioctl.h: warning: '_IOC_NONE' macro redefined
> >   uapi/asm-generic/ioctl.h: warning: '_IOC_WRITE' macro redefined
> 
> Thanks for the patch! I can pick this one up.
> 
> I am wondering: the quoted warnings were shortened intentionally,
> right? i.e. I saw longer paths when I reproduced this.
> 
> If so, then we could put the full ones (at least personally I prefer
> that, even if it goes over the line length, because I want that it is
> easy to search for, to avoid edit mistakes etc.)
> 
Yeah, I intertionally trimmed it.
I'll send out with the full path.

> > Applies on linux-next.
> 
> This would normally go below the `---` line, i.e. outside the commit
> message (and ideally use `git format-patch --base` to provide the base
> commit too).
> 
Sure, i'll fix this and send out a new revision.

Thanks,
Mukesh
> Thanks!
> 
> Cheers,
> Miguel
