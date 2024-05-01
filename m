Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE867160887
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714593973; cv=none; b=A0j5n/eWquIAosoTI66qATXe2iGgbmwD0ILoKy/YqAJO3icEIxXRCRZLxcRgPdWHJ2VPz3vaFjj4pwNLxCgZ30FAz8xXzax2M5Nc6Q09AqeWjiq8sPVAB4tNRcKaKJAZmClvX1KVzHZXPETv/JN5ARH4DbmFrvq9n10zILejTLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714593973; c=relaxed/simple;
	bh=MxqZIuh4IKZCsU3TBM1EeIPccCk29czriRckRt4Zj58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnnqrhVBCtiiDH1bDoHOZg0stDVnbnJ3+g8QZ9Bw9GTQix0P9Hx7LuZ+WLBwk6MRnYRblTt6jeeaWP3OCIPDi4UTqRu+GOdayfnJOajpQbMb7G4zXV0rdYU3kBgQEKZp5WDUnIeP4oGnpqrKGUxkQSIrS5hPgY88bjqjJw8C3FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fg5ONAnL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fg5ONAnL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6eff2be3b33so6593505b3a.2
        for <llvm@lists.linux.dev>; Wed, 01 May 2024 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714593971; x=1715198771; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y2o4tlUNctY7U6Cr6T8194ul7f2V0l6ukmfj5Y5+0nw=;
        b=Fg5ONAnLuWcRV/+ZvJ25zkiZMjXEn2hqAXvKSZH410gsKcmEud7HjCHi/Q/s3YC0mq
         a/IJXfNO8+sydKoh03XSEGArGygDMtjjNkiH+G3qp12RHJzlkcJ8EHNE/8ZUlS5Gj9Pv
         /8x8SU7jQO2MW1pkrhUbVHekNK7qWsluC3XBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714593971; x=1715198771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2o4tlUNctY7U6Cr6T8194ul7f2V0l6ukmfj5Y5+0nw=;
        b=LrDiRvCKRyu4YiuxhcdFgg4dmP1sOexLX7HZJusivN33bZ2qJKNRDLFCkNwD2lAbdb
         wGtVxctZuEKWPsVgQpucSpqKqXgfuGwesHNSTmTt33hjE6qp1XOeQoT10TlqnTxYlXw8
         bnSs491iOyTq9BrchxArEcWFP6Gr7K64YagE/jGYwEL9IuwstFjPXppzhbtXilKsjLUg
         SfsB+oRvQ1r/i106ak+6SjxDGTF26L31t1Dyon5hZn4vL+FcUuuhPfDj/YT14jJipt/N
         gD3De9HIcQ/HuBHk7Z1sZLbN0BDAFvakW0evKRAb+mPbbhJsm6kCD4HZrj/8dIkA/fKs
         25lA==
X-Forwarded-Encrypted: i=1; AJvYcCWzSqXSMZHTYzK3Cq3RY290u+K1QtOC/7PmZU1G5vw6NSTiQ8sbLtOfZcihy2Jj4xwBYUrgmiBUkp9TES/NOW1ASnyKAw==
X-Gm-Message-State: AOJu0Yyog84L3X2vFLuP54oU+zNxzaco4/gIOX7LDqdIFxjTZMykGwit
	m4FIEIRW1TMGcQYrv+U0V34BEVN16Cx8cKx08wsgUzYcsXbkyxqXLcvbrGK6cg==
X-Google-Smtp-Source: AGHT+IEw1MN7ZWjyOSnwvYGcsH7NwE54BG1k+72eDhYVUcDgtLB0JDZWdDTjdOhh9mn3t7M+X/IQiw==
X-Received: by 2002:a17:902:c213:b0:1e4:24bc:426e with SMTP id 19-20020a170902c21300b001e424bc426emr3467826pll.28.1714593971355;
        Wed, 01 May 2024 13:06:11 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902a50100b001e0e977f655sm24582522plq.159.2024.05.01.13.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 13:06:10 -0700 (PDT)
Date: Wed, 1 May 2024 13:06:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@outlook.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-sctp@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] sctp: annotate struct sctp_assoc_ids with __counted_by()
Message-ID: <202405011306.0B9D906F1@keescook>
References: <AS8PR02MB723728DA244A82D97342D6498B192@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB723728DA244A82D97342D6498B192@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Wed, May 01, 2024 at 07:01:22PM +0200, Erick Archer wrote:
> Prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with
> __counted_by can have their accesses bounds-checked at run-time via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE
> (for strcpy/memcpy-family functions).
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
