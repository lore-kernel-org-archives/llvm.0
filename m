Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558717F6
	for <llvm@lists.linux.dev>; Tue, 14 May 2024 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650179; cv=none; b=iz9mKwp5hZaaavld8t7Lk1qP9+Dg0MjxGT/P3nVlfJkuCtfsDlzHzQTCwvZZMImE34vTEnEHyzyJAUchWwG0HRKZETAfNrfzSinF6i1V04j3NpV1Pf004qtsUpkiA9MM24xzn6809zxJtZCCdruSqPqmKvc68eBF0HTkpAJbzrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650179; c=relaxed/simple;
	bh=ydzzvUXzzyHYXDB3rdnfrOfaFvankCzu/PpfufEIZ8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXYLnfR8BETidnJUbGiRRh9QN1urDuApC23SDyaBYLJRIk6+FylPuRlLzIrJjv9UVBboKrbIf5VbeNlBLbuTRFzmo8WaNMitpXUb91umV//A3Kt43CWyxq7kyXSu27Vs9F+3uaEN/cARU7yGT8HqjJwvM+9OzRQAg6tjJ5sgGbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bPIgiAps; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bPIgiAps"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a2da57ab3aso3910000a91.3
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 18:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715650177; x=1716254977; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G12oTJkF8iLsh/4R29i5V3FaUw9E3HvRiqsr9Lc4hks=;
        b=bPIgiApswqMwWvJWMcfiDqkk+XJuT6kTgN6M5BZw/k10P1nwsXVcChmXKSO9dB6H+q
         eK2Ox0Gqg7+k8ZGD60Mq5F+GpFg7ZWlhRM2+2K7UBt0OQKPuhBXd9lTQhhB0xl4hSFv/
         mX5fBifuvp9oLDn3CyOy9q4VFqWvtsfmhYfew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715650177; x=1716254977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G12oTJkF8iLsh/4R29i5V3FaUw9E3HvRiqsr9Lc4hks=;
        b=wekW1ZjyOfA+KNAy/gCP5tKqMA39PxityvpZDa5t6HDfil76dqVH2X6Xr24ihFDUxO
         E6x5FxGiF4eti/mGFKnPRP79ey3qkfLWw9MbT3e54f2R4Uvo7IBWDm/mdBiYrDT7gtFV
         qPDSmVP7wZDg1Ro1I8NGepZUGgOW+2c0dFd6QAp7tMeQ9XsUpnDUBX8JZUVpWesH0WmI
         b/rX1LTTivdvbow6eSspJE7drcszZhQ2nXg/cpMgk5jlSMgbJeRnlDFA1iViHvbyf19F
         Yf+cPHf8+2J+iOvAF/RnFDVhWGZoYHusISPlrhn8n+/xsk96JOi1n5jX4JuyI0hi5vPe
         fJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXSkPS5YXmVPgaxk8s45p9thidrMHesWtSflb6hffIjIegRMWrrOvBV3ZmasBdxRbq+cgR/jvSvyMYl7t5bgt4SrCo/uw==
X-Gm-Message-State: AOJu0YyKxbauwY54C7btjN+YhI6JMb6TA74q2qtGEA1eZaeN97sY6lZe
	YRsG5r5pSbt9kAHGePyrcG6AzcIPMYKEzXgdRKMrVpa8BlBZ9PKpH5360F7hGw==
X-Google-Smtp-Source: AGHT+IFEJye/Z8WAoZs9+YbGZcRqMhUSZmFn6dkSlu0jABBG8huBwOzQtMUM1ErHVjwk6NyoQ170SA==
X-Received: by 2002:a17:90b:3a85:b0:2b2:c85f:aa0b with SMTP id 98e67ed59e1d1-2b6ccfed296mr9212935a91.42.1715650176932;
        Mon, 13 May 2024 18:29:36 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b628ca53b8sm10361200a91.45.2024.05.13.18.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 18:29:36 -0700 (PDT)
Date: Mon, 13 May 2024 18:29:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Bill Wendling <morbo@google.com>
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Justin Stitt <justinstitt@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-hardening@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: [PATCH] hpfs: Annotate struct hpfs_dirent with __counted_by
Message-ID: <202405131828.9CD8E5A@keescook>
References: <CAGG=3QW4b9mqh9oGQ16NmMGbo4HVHmdM00Be1Qk97StCpW4xTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QW4b9mqh9oGQ16NmMGbo4HVHmdM00Be1Qk97StCpW4xTA@mail.gmail.com>

On Mon, May 13, 2024 at 04:45:54PM -0700, Bill Wendling wrote:
> Prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with
> __counted_by can have their accesses bounds-checked at run-time checking
> via CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE
> (for strcpy/memcpy-family functions).
> 
> Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  fs/hpfs/hpfs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/hpfs/hpfs.h b/fs/hpfs/hpfs.h
> index 281dec8f636b..ac137787f1f9 100644
> --- a/fs/hpfs/hpfs.h
> +++ b/fs/hpfs/hpfs.h
> @@ -357,7 +357,7 @@ struct hpfs_dirent {
>    u8 ix; /* code page index (of filename), see
>      struct code_page_data */
>    u8 namelen; /* file name length */
> -  u8 name[]; /* file name */
> +  u8 name[] __counted_by(namelen); /* file name */
>    /* dnode_secno down;   btree down pointer, if present,
>         follows name on next word boundary, or maybe it
>     precedes next dirent, which is on a word boundary. */

Looking through struct hpfs_dirent::name uses, I think everything checks
out. I do see some confusing manipulations in hpfs_add_de(), though. I
*think* it'll be okay, though.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
