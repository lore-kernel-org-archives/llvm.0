Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21786D1DD
	for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 21:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gHkW8P4H"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d069b1d127so53036195ad.0
        for <llvm@lists.linux.dev>; Thu, 14 Dec 2023 13:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702589866; x=1703194666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CoBcF2VO2o0vu9XC2M9RSfeyOc73hCRdoFweAl1iysg=;
        b=gHkW8P4HbV+W6s1/EOKgtya8lfUoJtstqTWYkv0MTIs3eZ8Mwryrun7YrvAYPmx3+f
         Gqm+qdl2TTyniZ2vDuc9xXASxB7Kzb6v+T8KNR/3nXPWVdw+WTEL/6U9+w3lggQeNzLI
         eAUljHwC1B7vpvJyjwOZLDbWkcURliaeLjzkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702589866; x=1703194666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoBcF2VO2o0vu9XC2M9RSfeyOc73hCRdoFweAl1iysg=;
        b=Fi8H169eYHsS/+8YVPHdsVC/hbHiUQGWM/hz6TtZnAjWArDedNxLCoGdBWkg8e3JQO
         oXceQevcg9mf4yWegvbAbHFKh4XYw2GR4b4nVwCDJuYLbN0/jetgbxJQUdi474Nak0xZ
         NbbcT2CXNPqieXTXo/jrFRGz8S8e5zPo+fOC+ne5l0qllWI33OlG5tzSLSK1AT1T5uTt
         YkOG85eUIx9YveMaD610Ri2HreDXZvso4MciwbLX9UEOBJdVcJIJfFqwn+DBT/WWqRwz
         6AXW4jADNxt/f+WUjvZAUQrYGNqXIgY/xd1nBCSYUFFtXy5dtqaeWDAJ2jjxzmZE+UrX
         mgww==
X-Gm-Message-State: AOJu0YxTev3MGreIFrxr9GwG1nkj0dNFp/Zf2XVvXtCXcbfYvukhXeUb
	fVBNy4qWDAxnmhOw0RwKSkjbFw==
X-Google-Smtp-Source: AGHT+IGiNnCSqfi9NhA3YuSaQM+1pX8bYPHHVgcte0hFIjkH7thLyLUNZ6FFoPuMhywABFfzjEa/dg==
X-Received: by 2002:a17:902:e804:b0:1cf:7c3d:df68 with SMTP id u4-20020a170902e80400b001cf7c3ddf68mr7534686plg.39.1702589866015;
        Thu, 14 Dec 2023 13:37:46 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id iw21-20020a170903045500b001d3650256fdsm2016861plb.294.2023.12.14.13.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 13:37:45 -0800 (PST)
Date: Thu, 14 Dec 2023 13:37:44 -0800
From: Kees Cook <keescook@chromium.org>
To: tanzirh@google.com
Cc: Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v2 1/2] sh: Added kernel.h to word-at-a-time
Message-ID: <202312141335.45C785B0@keescook>
References: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
 <20231214-libstringheader-v2-1-0f195dcff204@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214-libstringheader-v2-1-0f195dcff204@google.com>

On Thu, Dec 14, 2023 at 09:06:12PM +0000, tanzirh@google.com wrote:
> This patch includes linux/kernel.h in asm/word-at-a-time.h for the
> sh architecture. WORD_AT_A_TIME_CONSTANTS depends on kernel.h.
> Making this implicit dependancy explicit allows for later improvements
> in the lib/string.c inclusion list.
> 
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>

This patch is missing your Signed-off-by: tag.

Also, please double-check your email configs: your full name is missing
from your emails (it's just "tanzirh@google.com"):
https://lore.kernel.org/lkml/20231214-libstringheader-v2-1-0f195dcff204@google.com/

But otherwise, the change itself looks fine. :)

-- 
Kees Cook
