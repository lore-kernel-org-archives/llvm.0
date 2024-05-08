Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E8410A28
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715189444; cv=none; b=ODYeOmjYGMdIykQT/YLqEB4C5F3N6G2sEZjKgrjCBDfSN32cPqgI63HYN+Vr+jaFjN78DWjFjz9ElTWZUWPfWcJOHCcXIv+mAwfJwayYvQMI+QvX52WTzVxSMZtVjS0GSTRw/4gX1tfRTZO+TRZKfTcdOmAziCODiU+521j3zjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715189444; c=relaxed/simple;
	bh=Pz2VI/tUnCe2PTX/epLY/zIwUao0PXF5XSpGrBWENXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq+D7mNjmYkkBg6MfjsPwKs13rf2UZ/C+7/XVbier1BAxJOF+FeOWEDFLf1A1BUgWcQMEYwoSA5Ydx5iTd4EFZlDpQHkZ/Z6HLxBcvWUjKj1jM5cKyvfghqqrZETd6DIUdXVb2egccCTztsgaBzWSt24bHrim9YOlQES+WGHniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bfcNkJzI; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bfcNkJzI"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-36c5fa79a6eso19337875ab.1
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715189441; x=1715794241; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mgm/AtxEukOMRpXROxzGV8zR2nPhcjaYsjDxy8RLMoE=;
        b=bfcNkJzIkh1t/1FnzhBhN5jsULKHOBM0VoHSqZ4mTqQxixAwwQ1AX3n0GMsGY4nfZV
         9LJW9b/asueZPq2B0EuvVrlx7nukWJdZKdDJojUlAiC4Zl1Za+vXDEk/UjwhkjtLYXEd
         sYiUyA1T9fjvXCHDurwvbju6LC5PlT1p2bmccCOLO4XuoucqAGKcr2HRvXAgStX47KdP
         G0bdiZIlQrL+Y+/2jdyRzpEgScKp90JDEaCoL7VaEeK2+gxytGO5rJhDi4D4T3JmkEdW
         YcK2PvWAZHJnLckix9T4tx06kH8QguUXNFxgma68C8J+1/srqpsmjg+vF7+8tncG7FXP
         kepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715189441; x=1715794241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mgm/AtxEukOMRpXROxzGV8zR2nPhcjaYsjDxy8RLMoE=;
        b=kV9HfzlTcASfEd3QEyXeYOltlCN6GvIHrTgHkZFI485dcq8+/R29TYzuINNOH8GYle
         NYlKdAdSsVeNBNGHk2lOJ6La92VXjTajADbMNuTPKkG09KlztYo8ETxJoE2ky+b7N0T0
         FCe8qVt0M5DDiDpgkArV/p2QxCZG5XR3Emv+0QmGT0hNmlYzk/Lgr0kbVRXF9gGbU45h
         Q0uWexSPnzOdPzpDo1Hvt0sXj+s+SCRYZZx8bqBjyzAq6sVZ+w1tA9u+5lpxsYnZuG7h
         9WuvwA9Ofaeab2f7WUUuG/cZ+zp5qZDDpCDdGl3X+Uf6iVXSla9agbZVB+g6C34jlhs3
         mLZg==
X-Forwarded-Encrypted: i=1; AJvYcCVdF8r6M6MvcYAYSzZVbUuZb8MWJ+x3XMtd1GMBTJ/kVBF72CwXi98b0kHWcpPakmb6zyV0jMB2wwen1OO2cuyTdTTqXA==
X-Gm-Message-State: AOJu0YxMjWTCLefgHtBKl2C5LowEsqFNU9ScEolckGEaRVqZ+uGgqBUG
	qkvJb1OPgkcbzWT357Yy3wKB23/zjkeg6lPuevDPZByZlMzdVwKcA4iej17SEQ==
X-Google-Smtp-Source: AGHT+IG4qUlJD1aPV5UJ4KvhFf5gOtyA8cYn/UXu+JKeaXX6SvVh6CB/+n/AvLPMv49pJsB3HndHlA==
X-Received: by 2002:a05:6e02:b23:b0:36c:4348:35d7 with SMTP id e9e14a558f8ab-36caece1c45mr33919075ab.9.1715189440618;
        Wed, 08 May 2024 10:30:40 -0700 (PDT)
Received: from google.com (195.121.66.34.bc.googleusercontent.com. [34.66.121.195])
        by smtp.gmail.com with ESMTPSA id p6-20020a056e02144600b0036c4d8185b6sm3300996ilo.69.2024.05.08.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:30:40 -0700 (PDT)
Date: Wed, 8 May 2024 17:30:35 +0000
From: Justin Stitt <justinstitt@google.com>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jeroen de Borst <jeroendb@google.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Shailend Chand <shailend@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Larysa Zaremba <larysa.zaremba@intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] gve: Use ethtool_sprintf/puts() to fill
 stats strings
Message-ID: <c4feqxslfjh6arvmwww3vylrfue3xl7ywj3eeg3wcujmjyteai@i7ymdkg2ihd6>
References: <20240508-gve-comma-v2-0-1ac919225f13@kernel.org>
 <20240508-gve-comma-v2-2-1ac919225f13@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508-gve-comma-v2-2-1ac919225f13@kernel.org>

Hi, 

On Wed, May 08, 2024 at 09:32:20AM +0100, Simon Horman wrote:
> Make use of standard helpers to simplify filling in stats strings.
> 
> The first two ethtool_puts() changes address the following fortification
> warnings flagged by W=1 builds with clang-18. (The last ethtool_puts
> change does not because the warning relates to writing beyond the first
> element of an array, and gve_gstrings_priv_flags only has one element.)
> 
> .../fortify-string.h:562:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
>   562 |                         __read_overflow2_field(q_size_field, size);
>       |                         ^
> .../fortify-string.h:562:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
> 
> Likewise, the same changes resolve the same problems flagged by Smatch.
> 
> .../gve_ethtool.c:100 gve_get_strings() error: __builtin_memcpy() '*gve_gstrings_main_stats' too small (32 vs 576)
> .../gve_ethtool.c:120 gve_get_strings() error: __builtin_memcpy() '*gve_gstrings_adminq_stats' too small (32 vs 512)
> 
> Compile tested only.
> 
> Reviewed-by: Shailend Chand <shailend@google.com>
> Reviewed-by: Larysa Zaremba <larysa.zaremba@intel.com>
> Signed-off-by: Simon Horman <horms@kernel.org>

This patch looks good and follows similar replacements [1] I've made in
the past.

Acked-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/net/ethernet/google/gve/gve_ethtool.c | 42 +++++++++++----------------
>  1 file changed, 17 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/ethernet/google/gve/gve_ethtool.c
> index 156b7e128b53..fe1741d482b4 100644
>

[1]: https://lore.kernel.org/all/?q=f%3A%22Justin+stitt%22+AND+dfb%3A%22ethtool_puts%22

Thanks
Justin
