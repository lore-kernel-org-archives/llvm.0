Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDE5145B0C
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708118512; cv=none; b=FRyQDOQK95r91AAkLtf0DBkEF7k3v7GNuNwNDTCQxUXTAFrCTgz+r1a7O2zyFk0vtZQFqsAm0nfWi9SqGuq2aA1al/G2l3AGyDubx0uw4a1TXxyngKEpeh70Iv59bURp7XRXUwChNl27hQHHNVroe51RbkBm8cFBb6DnsVo+WfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708118512; c=relaxed/simple;
	bh=8RkIdklDyDDa8h8JrnVfHzosWxPgtS0o2uyCwRZpqro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHSuCPGNfnrJw2M0odQuLdDgYpdHwngoqcESMPPEnNsIS0zpyBp4tsA2buafkqXuXLilaTOBnSy0srGLw127us5TbfqCjMW20A3M5AbjSrrCDSgsPJIUZprydl37oXT/5H/3XBYEG9GRZWL4AcSyOdspyZfoUcF3VC2nqT2r/xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aZGB27Kk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aZGB27Kk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d95d67ff45so20754555ad.2
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 13:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708118510; x=1708723310; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtsFfzG8a5Y4gKlVc4iSnotBnYQWJOU2Pi/S9waSvFY=;
        b=aZGB27KkXCbgnpiFlxKTF4jRJl5Q3x1bFP/TCSDZqB1awIozwmryuJYRKaUrsb7jJh
         kGHqD3pZjPqz3WKnaSo8zT2IRU3ot5YzTmv9B3mFy3T9197h/eTAp+sq43z0vkg1YrFA
         bFutri3EFsePwbylzrjYv1/cA9nBhic6QRoNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708118510; x=1708723310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtsFfzG8a5Y4gKlVc4iSnotBnYQWJOU2Pi/S9waSvFY=;
        b=U6ttMT0/vwW/ZCJlQlsAlfbvPdpA9t+MGJYdd3qWAbuiNrlYqaifIaBXaKlAuF5DSp
         X/LQ8x92PeqwZL+5YeXq6ZtHHzCFP2JdgBJKfhzgf0ZEUHdJExWtYQzuXYZ48gATnUFN
         rBZlUHyq3V980XUgND4nAodMU770+GXBojlKrL8RFJkxZi5QVdBGSw+O+tNY/GB2J2w2
         ObxiXgkurE8T+8DncZQVU7Ncw+BmxTDUfSs7JAQwd01yEB/l4Rh1/5MTG9fTVJ1zBFGu
         RYU0HlBulXhx28x852UtHMql/BeF799GF1DRuCiM4mEBwID2cIhXOJwQKmvSYy/jDuqN
         QaWA==
X-Forwarded-Encrypted: i=1; AJvYcCVpL9YYh9kXf6V8X+D582SJXgtdpXQcSipqOgXt0Mr2TwVYNP0kdBJFu3nRLeJfFl0/Ot9upQ0VAfq4GbspCtvw2kuizQ==
X-Gm-Message-State: AOJu0Yw5AmB6RqgrgT0F3PesEPIPxSZfBPVeAshguofqcf3Vjopuc+wk
	6qkQ5S83Ng7w5acoMy9pmOaTP4sJaLFQXBLv8itz4ChxyvRY1ZFs1LcI90Owtg==
X-Google-Smtp-Source: AGHT+IHTg+sL3pxx87dFYUZnA4CdOFoi6N++WUXNc0EriN4rhXpqlCmCapRn7SKh0gVSuZ2EqKK3rw==
X-Received: by 2002:a17:902:784e:b0:1d9:ba26:effc with SMTP id e14-20020a170902784e00b001d9ba26effcmr5713961pln.51.1708118510303;
        Fri, 16 Feb 2024 13:21:50 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y12-20020a170903010c00b001d974ffa1fcsm292574plc.173.2024.02.16.13.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 13:21:49 -0800 (PST)
Date: Fri, 16 Feb 2024 13:21:49 -0800
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andi Kleen <ak@linux.intel.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] fs/select: rework stack allocation hack for clang
Message-ID: <202402161321.B0B1D6F@keescook>
References: <20240216202352.2492798-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216202352.2492798-1-arnd@kernel.org>

On Fri, Feb 16, 2024 at 09:23:34PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A while ago, we changed the way that select() and poll() preallocate
> a temporary buffer just under the size of the static warning limit of
> 1024 bytes, as clang was frequently going slightly above that limit.
> 
> The warnings have recently returned and I took another look. As it turns
> out, clang is not actually inherently worse at reserving stack space,
> it just happens to inline do_select() into core_sys_select(), while gcc
> never inlines it.
> 
> Annotate do_select() to never be inlined and in turn remove the special
> case for the allocation size. This should give the same behavior for
> both clang and gcc all the time and once more avoids those warnings.
> 
> Fixes: ad312f95d41c ("fs/select: avoid clang stack usage warning")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
