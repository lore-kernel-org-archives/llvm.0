Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454CB156656
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012987; cv=none; b=Bu2v9f5DnTCWu8EtI+J68GghcKRavf3aFsifvy1oIpj+AWJikpqWOs6nZacisG3ajX/UHnflV/qre/8oHY5trdA05iOAIl+F2ofLVVbM29kFiOmWVYAVz3mrJNKwZXfaZMHdrpWtUG8oyD1wHOV3TYm3nVx7bYbAt54LZ4MDwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012987; c=relaxed/simple;
	bh=djIR0MvTC9on7MEXMWdmMMuXY59ptlBzgD64Z//dn/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rz/mFw+pFv8InCFEJVhjTlpCsn6S5ohuuS+vQl9BqhpeOcE65KwGeFxtbDeVJJkHjjiRgGO567tWQp8OVkm0ysKXV05IN6CdeK1n1j/4oPhX/cJ8XKTykqrPR96Pt767n0vISZCBZ5wgxe11QWPng+AuHmC5MCak7yI8GWYBhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UMH5rlE5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UMH5rlE5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ecd3867556so14379375ad.0
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 09:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715012983; x=1715617783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4FGZV4xevlS61uYYoN9aqvtjUqiITrQIdhJ8KhnBQtc=;
        b=UMH5rlE5FZ97xX3TOTuwQIC4wu56Fvg73sX15h9W8hJ25f6+YB+9+eKXqIusXSEUJ2
         IOnQW42kKk3maQOsWl9YpRE8E63wvp46FT5Hkd7rN6Z0tN1FDdoLs8Wy7GfkfqhLrc+2
         FE6/W3mhMzYDFJs0XpoWH+oZ1FiK751ySNal4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715012983; x=1715617783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FGZV4xevlS61uYYoN9aqvtjUqiITrQIdhJ8KhnBQtc=;
        b=ErY2SmzNGy2zqUBP7znVqMBQzsqLuZvzS7DqZaVYCUgcMWuU7xENCw7xgjNsRL2Krb
         3vLz1tumCPZVBxQ4yhOzideKnV6uZhMVcuGz9icj/v1utjc5PCnlerfe//JSSZT9BFQY
         z6h+1G3wFCo6iH2XXvLrVP7EVB07ZFpte3TeJQ42IB/Jk+z7FZGNXSOuEg1Tlfd9hFhN
         GTJrshRETQCu1nY6FdSExv16iV5a1mGvTpydtdsqRGLttxLeWV3z/nL0MlyJFPTtBanf
         bBJnpzS+fG/h6tz0BDQxb7SoF2yHcW/w57Fx5m/NRq+3bIICY2LYNGlZgM4i7bctGf0L
         azdg==
X-Forwarded-Encrypted: i=1; AJvYcCXk0dg33WQqefbf7YGp2BYEeneBr6fNCIYt6uagBTNR9TqTjeIwGPksBvlD30irUTYIhFGoz7Rxje15bJBw5byA7O4mkA==
X-Gm-Message-State: AOJu0YzuG72c3FG5agF/REzp0Ge4jLJ8Bkgfn0C1zylzy+nqtr4Zh35E
	e7OUYnEf3UMnqPoQrj12KVE5gv0EF8y+ZNx6tflvg1ovEv7buc6fXSLt3rM2Pw==
X-Google-Smtp-Source: AGHT+IFbFO7WG3T0AZk4k9Vs5NN+nUuBbULzCcUX9OeVRvDR9+EhwfFkTTZglRWvChOo6sF8QSal5A==
X-Received: by 2002:a17:902:c40c:b0:1eb:dae:bd98 with SMTP id k12-20020a170902c40c00b001eb0daebd98mr13243215plk.51.1715012983437;
        Mon, 06 May 2024 09:29:43 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id im16-20020a170902bb1000b001ed33493868sm6958248plb.243.2024.05.06.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 09:29:43 -0700 (PDT)
Date: Mon, 6 May 2024 09:29:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: Erick Archer <erick.archer@outlook.com>,
	Marek Lindner <mareklindner@neomailbox.ch>,
	Simon Wunderlich <sw@simonwunderlich.de>,
	Antonio Quartulli <a@unstable.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH v3] batman-adv: Add flex array to struct
 batadv_tvlv_tt_data
Message-ID: <202405060928.272B235@keescook>
References: <AS8PR02MB72371F89D188B047410B755E8B192@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <3932737.ElGaqSPkdT@sven-l14>
 <AS8PR02MB723738E5107C240933E4E0F28B1E2@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <9977759.T7Z3S40VBb@sven-l14>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9977759.T7Z3S40VBb@sven-l14>

On Sun, May 05, 2024 at 05:22:10PM +0200, Sven Eckelmann wrote:
> On Saturday, 4 May 2024 19:08:39 CEST Erick Archer wrote:
> [...]
> > > Thanks for the updates. But I can't accept this at the moment because 
> > > __counted_by_be is used in an uapi header without it being defined
> > > include/uapi/linux/stddef.h (and this file is also not included in this 
> > > header).
> > > 
> > > See commit c8248faf3ca2 ("Compiler Attributes: counted_by: Adjust name and 
> > > identifier expansion") as an example for the similar __counted_by macro.
> > 
> > If I understand correctly, the following changes are also needed because
> > the annotated struct is defined in a "uapi" header. Sorry if it's a stupid
> > question, but I'm new to these topics.
> 
> No, it is absolutely no stupid question.
> 
> > diff --git a/include/uapi/linux/batadv_packet.h b/include/uapi/linux/batadv_packet.h
> > index 6e25753015df..41f39d7661c9 100644
> > --- a/include/uapi/linux/batadv_packet.h
> > +++ b/include/uapi/linux/batadv_packet.h
> > @@ -9,6 +9,7 @@
> > 
> >  #include <asm/byteorder.h>
> >  #include <linux/if_ether.h>
> > +#include <linux/stddef.h>
> >  #include <linux/types.h>
> > 
> >  /**
> 
> This must definitely go into your "original" patch
> 
> > diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
> > index 2ec6f35cda32..58154117d9b0 100644
> > --- a/include/uapi/linux/stddef.h
> > +++ b/include/uapi/linux/stddef.h
> > @@ -55,4 +55,12 @@
> >  #define __counted_by(m)
> >  #endif
> > 
> > +#ifndef __counted_by_le
> > +#define __counted_by_le(m)
> > +#endif
> 
> If you want to add this (for completeness) then please put it in an extra 
> patch. It is simply not used by batman-adv and I would not be able to find any 
> justification why it should be part of the batman-adv patch.
> 
> > +
> > +#ifndef __counted_by_be
> > +#define __counted_by_be(m)
> > +#endif
> > +
> 
> This part can be either:
> 
> * in the batman-adv patch
> * or together with the __counted_by_le change in an additional patch which is 
>   "in front" of the batman-adv patch (in the patch series).
> 
> From my perspective, it is for you to decide - but of course, other 
> maintainers might have a different opinion about it.
> 
> >  #endif /* _UAPI_LINUX_STDDEF_H */
> > 
> > If this is the right path, can these changes be merged into a
> > single patch or is it better to add a previous patch to define
> > __counted_by{le,be}?
> 
> I don't have a perfect answer here. See the comments above. The file 
> include/uapi/linux/stddef.h doesn't have a specific maintainer (according to 
> ./scripts/get_maintainer.pl) - so it should be fine to get modified through 
> the net-next tree.
> 
> But maybe Kees Cook has a different opinion about it. At least there are a lot 
> of Signed-off-bys for this file by Kees.

FWIW, I'm also fine with the UAPI going in via netdev. It's the most
likely place to use the be/le variants. Is netdev still open for
patches? Whatever the path, we should get it into this coming merge
window so we can use it elsewhere too if we need it.

-- 
Kees Cook
