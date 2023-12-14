Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AC16ABA3
	for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 21:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="giMFCSFe"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d336760e72so33372395ad.3
        for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 13:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702589951; x=1703194751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9p8Ajf3tFQXbwC42EgP/DdM/mZur4gEPrUVHC58JLk=;
        b=giMFCSFen9WjEi0+t6eDUURM/0XiANfIS9rxhqVR0/w/UKKZejsXVfECYyjX6uFdiz
         CwP4diqt/Ymih1mhfCq7BvXzBQ8nnd9H0FGweSWJCNSmryemzrvbNXg1PrmvUC+hSTk7
         Sc6NTSLrXvBa96CVYE7BkIatmtiO09IH+ZUtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702589951; x=1703194751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9p8Ajf3tFQXbwC42EgP/DdM/mZur4gEPrUVHC58JLk=;
        b=exFan1OinvMw0Nz9AzjxSe9rBewMTQwfHms+dUONF9zhKA1UjJq+0abhZB8wTDO9/K
         8c+DA1GObws0jC+KGK7OzGj3ZAGZH7KslJByQDhOakVXzUrptO7mPaZDawWculG/kLdG
         rmYR8crISx1nMIhSPfpeOJRjyctWS86oe91lpxd4bVca0S6E4Ri9gePV27rF0AQ+gCp3
         uJKQuervk3TyEM+QYTkVCIA7GpXdwRUJFYx97Bc2JnuR2SeVqb/CrK1sUHvS78ATo1qO
         foAhVoamhNUCAZmsTAMPFLG6Wn4eKRm4+n0dnLWUf0lzbqN6Tx6MeLWtAR9Vq4JeL8cY
         NVgw==
X-Gm-Message-State: AOJu0Yyuk2LaAlR86RJD1ui4sYw0TPZC5iUxaiOa5BQKGvNg+qbUw1qK
	W7OQVp3y9dMRW7YfQ3WNv20IvQ==
X-Google-Smtp-Source: AGHT+IEU6ftrI0VMvvVDF5jJLD9KtjtMPRzjUvkB4CgdFRkuRurVj+l8UJlY1TjY65o9czmfNcLAvQ==
X-Received: by 2002:a17:902:ecc4:b0:1d3:6b17:67c0 with SMTP id a4-20020a170902ecc400b001d36b1767c0mr1775536plh.75.1702589950824;
        Thu, 14 Dec 2023 13:39:10 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g16-20020a1709029f9000b001d3561680aasm3191596plq.82.2023.12.14.13.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 13:39:10 -0800 (PST)
Date: Thu, 14 Dec 2023 13:39:09 -0800
From: Kees Cook <keescook@chromium.org>
To: tanzirh@google.com
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] lib/string: shrink lib/string.i via IWYU
Message-ID: <202312141338.CAA7708BC4@keescook>
References: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
 <20231214-libstringheader-v2-2-0f195dcff204@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214-libstringheader-v2-2-0f195dcff204@google.com>

On Thu, Dec 14, 2023 at 09:06:13PM +0000, tanzirh@google.com wrote:
> This diff uses an open source tool include-what-you-use (IWYU) to modify
> the include list changing indirect includes to direct includes.
> IWYU is implemented using the IWYUScripts github repository which is a tool that is
> currently undergoing development. These changes seek to improve build times.
> 
> This change to lib/string.c resulted in a preprocessed size of
> lib/string.i from 26371 lines to 5259 lines (-80%) for the x86
> defconfig.
> 
> Link: https://github.com/ClangBuiltLinux/IWYUScripts
> 

nit: Please drop this blank line to keep your tags together.

> Signed-off-by: Tanzir Hasan <tanzirh@google.com>

I'm glad to see such a big difference with just a little header
tweaking. I look forward to more like this!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
