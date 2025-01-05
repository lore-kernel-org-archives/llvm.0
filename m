Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC433E1
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736046280; cv=none; b=Liq6HYWEc9rWKeqCcXKRnN+zhE8jp5lWq1m5zTIQ5UuQOWBli8nvIJHt5zSqpUiO16V7k7Xi5qiChZg5NZ+TwzBDxNiadZgzYOz5PE7aQQ6UPP0bgYsAkpeKdYY+HjkMoQO2DZUPNk/OVpZrqmo2OCnkZKQzh1+XQX3EAXuobDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736046280; c=relaxed/simple;
	bh=hd892KwPVoDKj6L3O0TAWNjNiGEbhmwOjdXoOj1Tbl0=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=AGXfwRR1RkYZQmoXjerzjaF/uL6TD+Y1Kyqoc8+uFPwhMECcZcc8aA7uYdYvsufizy4YuiWWlrITp9/4ujBwT7LLCMyfbyYlzkqF+M4LA2cleUVtq/mcqiWdeMappGEQbceHtjj7pRvvOt9GkIo2ZZ0NWI76J3XOjRroIVwrAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TFohZy30; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TFohZy30"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467725245a2so89320841cf.3
        for <llvm@lists.linux.dev>; Sat, 04 Jan 2025 19:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736046278; x=1736651078; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/ypkJniTy2sqyoish9hOsiaKAFlmo543f6O+rUVzGs=;
        b=TFohZy30Kiqm16NjIJT43CgtH5XJtJ1Po3gBg+Cn50shBFh4d0XRDpkKm8q5DVeZ6W
         PdCxP55FYt3oRaghUkOnNq3fQ6ev/J7BnpoInf8Le6N/hi1qeaqSlrQJ5q6ULXff7DEe
         Se+xrd+/roUw3W/QF355YS3mQBZMcwr6wN4Wg6gLSFVNJKXOVW/qugu8F12amDIT+D9I
         P48SdavxHXB6nYdrNA7xOQgQtHn7eJXxV44XUnqMGtY2DEq+26lk6qAJ8rdohgVdbleB
         oAa5RCrAeza2ERjr9Tk//WMv6BTN3xB2Nt8LToPRG11v6re9bFLSAVi1mFdDQef5LzpP
         vQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736046278; x=1736651078;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z/ypkJniTy2sqyoish9hOsiaKAFlmo543f6O+rUVzGs=;
        b=gDa0631gcRyDuOHpG40+0XociuyNVHTRbhDkR66LAa3EBGap1nnCofwrpKKpjF7w1W
         INvkCx1xFHJNMxC0Kr5yCa6P1eqgyiJuHkMwW0Yt5mvCuW4rlBqUa2STBHv0SgDNr2MT
         3BBAoiaFzRtCBhsB/WWxwDGat+ZyUp+wNgcstYtrxxSBf2yrUWOB4/+YpoOUnbZVDsjd
         8/H/3GfHpebDmHR5oSXnUgYGO/Fy6y0rM+Mes9+N/F+C1hyBzrPzOQYNIgsT0h6GyTl+
         VPxG5OznUg/ZT6Gc92TdL2cn4iVEd7AKurH+oAW/AFuGN8V0/vFiIt49r9AHt4jM6hlM
         oLEg==
X-Forwarded-Encrypted: i=1; AJvYcCXY784T7jDqs9yireNduJPZDFqYMM6AKiCehff85wpRaJvQAQ8uMEEM4XjsHeY9giS9rseA@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1fB3Ls4fTcVdW3CX0d4xre0kU14opACECyNoj3oAeJrtOEYR/
	Pk4m7hrsejPdxwjp1+7Qe1jgmmtATwHjTPvMHobhPSn0l94IKOdIqZ0y/dxfgA==
X-Gm-Gg: ASbGncsymlh4AftH3wyV2H9ci7DigVqzqCShxC9HKjRuAmwvf6p/TuWFItpfPfiPjcN
	6WVfKlKPanTPPIqENXA1jBqnjj5kv/9uqlzp8tljko3MSAvPyVqllmAs6LOFV7M/rj3F37ZjCxz
	Y1+shWJFXmlNhoRP8l/wbwH2SygaMQOSHrd5CoEGXp6MSYSGgJ/HjPe5nTtLDaY36tdpP07Z52r
	8HgP5X69EL34jCZNnLdKe/eMtgV2aMNed/fRnXk8BiDmUrjYAI=
X-Google-Smtp-Source: AGHT+IHRKFmN9qbAXkzpX87dy3tF+Dit0bfAJ4XWTifWGarIFaNZroIWRSMyGGq4nY0LZqvSdLQhSA==
X-Received: by 2002:a05:622a:11d6:b0:467:b625:b37f with SMTP id d75a77b69052e-46a4a9e2d94mr1094866931cf.56.1736046277895;
        Sat, 04 Jan 2025 19:04:37 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb16ca0sm161329711cf.65.2025.01.04.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 19:04:37 -0800 (PST)
Date: Sat, 04 Jan 2025 22:04:37 -0500
Message-ID: <a5fc0502242733d15612435ead352396@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250104_1133/pstg-lib:20250104_1133/pstg-pwork:20250104_1133
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] lsm: constify function parameters
References: <20241125105926.47141-2-cgoettsche@seltendoof.de>
In-Reply-To: <20241125105926.47141-2-cgoettsche@seltendoof.de>

On Nov 25, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> The functions print_ipv4_addr() and print_ipv6_addr() are called with
> string literals and do not modify these parameters internally.
> 
> Reported by clang:
> 
>     security/lsm_audit.c:324:7: warning: passing 'const char[6]' to parameter of type 'char *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
>       324 |                                                 "laddr", "lport");
>           |                                                 ^~~~~~~
>     security/lsm_audit.c:183:27: note: passing argument to parameter 'name1' here
>       183 |                                    __be16 port, char *name1, char *name2)
>           |                                                       ^
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/lsm_audit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Merged into lsm/dev, thanks.

--
paul-moore.com
