Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F1B3C099
	for <llvm@lists.linux.dev>; Mon, 13 May 2024 18:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715626628; cv=none; b=u+2N9u9C3Lwl8YG/09Vg5zsX0kQ036EeOeFwEO72P0bnTnL9kqRmq26SUGfAais+noqBWnFqCmT6e3KEilOR8xsbEMzE3Ke1x1ztI95CNVNNeN/rEcSxb4nKGDSgw5WotVCvpAYTToi8V8sFgsyp6uyHnybzG7Yqxj2SjI8yJbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715626628; c=relaxed/simple;
	bh=q5wPdG/4nQ7huyx+fHjYRyb5vaRB6g0n6Fi2oJpjudg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thS6h3zQelDXd7Fz1h1+ivIUP5Chv1XhJuIcZ8KA5OLfTylpOPvWPzTj2vzYX0bU4bnuWLXw76hp7Bx7YLp03PxRTNZuLSedt6ekc83NrYObW3Zb+sQI97de0pHrzZ9lL0W4JBV4xE71F7d6U2MQ0LLPi4Z2hqj4Qi0eVYhhTHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fZMRdGF8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fZMRdGF8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f44bcbaae7so4242366b3a.2
        for <llvm@lists.linux.dev>; Mon, 13 May 2024 11:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715626625; x=1716231425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Sr9kb5P0bdJ6cwmhx72J5XTZqy5p16gtf0vFcQMPyY=;
        b=fZMRdGF8Q+/k2EhZeyzkfzLGg7vHlTDE1xSdOPTt93FkA50lTDL1f2J4dQY5wgpVCS
         1ti2jh/EjHTW3K9N6mvB2Qzxn9VyNmgGGXAzbjtCq9vD7ZsRGdIdcQk8w4rHcPVNip/Z
         FEHvN19MriquAremBdWUXs/QLbBJYE89mtJ+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715626625; x=1716231425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Sr9kb5P0bdJ6cwmhx72J5XTZqy5p16gtf0vFcQMPyY=;
        b=rWk0Y5K1t5vwJzGbW/x6ULp8ZiqOfPWbylXjIpVu5PIzmXG94sfjNrEUFwE/omkiP4
         QsZOrOexfpF3slQZdUwuXEHlzk1Ws5i8nknONQy4bn5Y5cMTHjkKAyo7XLmsQK6Hc6mp
         kw8bAQefMvzWzDHw7D6xUkOIJp2uxQMxD0HSqWf5ZnUJOt9R5fp70f6Wk0IwcAnOtFex
         NrhWj6ZzVPdEFc4bFV4VRUnF/0oKPPHompmwp/91lkL5wwuNkJwVz/fiXZnmPVYRshZX
         4+5K5N/k4jWsR6bkWqZot77FiPogRgOHoCuTcbVYTm/yADddGdyBnqmIIAf4cQ+48SgA
         RaEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwcd7X4HAhiN0ca8jMaGyvLFr5W/47wZTB0nV1LHrLtIJRtDonQiXjkzt+8IU2idyqGsheJsgAFF9lvg6R9p1N5EHFQg==
X-Gm-Message-State: AOJu0Yyaop2aPcBpRK43ucvFZEkjRVgtuV8pliR3OkC/Y1Zl15LKDXa6
	qKsfw094cn33IfWz9shw5EWZGVJ8ICNXhNafuvpLAY6iPGqXNXnVxQK0qADFwA==
X-Google-Smtp-Source: AGHT+IFZy10S65Q1vfaN/XWvg9gq6x4mClMImz+nVw5XGcRK6RvacpVEeTsgn5spmcSloAx5/jBJ3w==
X-Received: by 2002:a05:6a21:2b0a:b0:1af:cd4a:1e1d with SMTP id adf61e73a8af0-1afde1c554bmr8986093637.40.1715626625368;
        Mon, 13 May 2024 11:57:05 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a7asm84964695ad.140.2024.05.13.11.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 11:57:04 -0700 (PDT)
Date: Mon, 13 May 2024 11:57:04 -0700
From: Kees Cook <keescook@chromium.org>
To: Erick Archer <erick.archer@outlook.com>
Cc: Taras Chornyi <taras.chornyi@plvision.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] net: prestera: Add flex arrays to some structs
Message-ID: <202405131154.BABC943C@keescook>
References: <AS8PR02MB7237E8469568A59795F1F0408BE12@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB7237E8469568A59795F1F0408BE12@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sun, May 12, 2024 at 06:10:27PM +0200, Erick Archer wrote:
> The "struct prestera_msg_vtcam_rule_add_req" uses a dynamically sized
> set of trailing elements. Specifically, it uses an array of structures
> of type "prestera_msg_acl_action actions_msg".
> 
> The "struct prestera_msg_flood_domain_ports_set_req" also uses a
> dynamically sized set of trailing elements. Specifically, it uses an
> array of structures of type "prestera_msg_acl_action actions_msg".
> 
> So, use the preferred way in the kernel declaring flexible arrays [1].
> 
> At the same time, prepare for the coming implementation by GCC and Clang
> of the __counted_by attribute. Flexible array members annotated with
> __counted_by can have their accesses bounds-checked at run-time via
> CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE (for
> strcpy/memcpy-family functions). In this case, it is important to note
> that the attribute used is specifically __counted_by_le since the
> counters are of type __le32.
> 
> The logic does not need to change since the counters for the flexible
> arrays are asigned before any access to the arrays.
> 
> The order in which the structure prestera_msg_vtcam_rule_add_req and the
> structure prestera_msg_flood_domain_ports_set_req are defined must be
> changed to avoid incomplete type errors.
> 
> Also, avoid the open-coded arithmetic in memory allocator functions [2]
> using the "struct_size" macro.
> 
> Moreover, the new structure members also allow us to avoid the open-
> coded arithmetic on pointers. So, take advantage of this refactoring
> accordingly.
> 
> This code was detected with the help of Coccinelle, and audited and
> modified manually.
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#zero-length-and-one-element-arrays [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [2]
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

This is a really nice cleanup. :) Fewer lines of code, more readable,
and protected by __counted_by!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
