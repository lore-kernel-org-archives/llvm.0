Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9F21F956
	for <llvm@lists.linux.dev>; Mon,  8 Jul 2024 19:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720468022; cv=none; b=rjrLowwb4VTynB6SnvYLXb1bhn+n6xrk1e/suz8LThD35LmNHxH1ns9uvbOPRwrJmLuLcfNTFuaJq5XHisUW7ef7zOUoIqXnWfEyoiQHpNcEP9hl3aVk+alh163qV/wMYK8YoDiqbHkZJcEhz2LUIKPHGzMkktxYEj9RatHoMjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720468022; c=relaxed/simple;
	bh=xfUwHFgIQzzqJP6stxoZusU7xDn7i1MUCcKHTwTW1G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2tPX942RBu/2axGlHu7Td/4vYhXq47tt5IxveLjaBJp6h1FcmjWYN5JdmK+eNBsZqmrThmI4pdSwsv5WoH6od/3KaTZqHZOUkrQvtFpSc7JJZrqp7BolIUnAv6V3dS0NgM2SAn7NaxjpuproOAKR4FlhoOpsC+8PUlBtdDESYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y+iUnRKx; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y+iUnRKx"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3817084f7dbso20438795ab.2
        for <llvm@lists.linux.dev>; Mon, 08 Jul 2024 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1720468020; x=1721072820; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NWkzAQQtVxjkKH80LNYbBQ6QWoqweGmef12U+XNbKY8=;
        b=Y+iUnRKx4IbG+h4xa96UsJ3MZCuvhG7lTFA6Bq9aCJzZ3qPH92ao0ROmuPIG4hrv8v
         9PgQbGP1jyc0sgQ2nkphgd7fEtn67oCcn/cdOKcaqU5vA7nmpyj0pg0xn4NKmRdDS9li
         6FVbrimORRasB5JXpbb07D+Q+zVyMEZm42JWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720468020; x=1721072820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWkzAQQtVxjkKH80LNYbBQ6QWoqweGmef12U+XNbKY8=;
        b=oiqYCOcxgXCBXGMIJAOc/9sCMWMJxEIq2PCOEeoE9J2+G3+aRmsbovweGrNC2tViug
         g9nxWbAPEIvIr6ieMvQ0q9cbazGckD0HTV590nDdIKU0SPRQCS8zQZ/+Ep+cUHYmkiLp
         OIW5rEOhWvAsfNFwLc+b+GwN4F66ukPWNwrrS4tL7MjDC12Y5x0E4f138t7mv9cn6J4R
         HtDSmWhY51UcCIdQrghTR5q8DBopBHyRPpGEBkuf9vXJH7wHfmMTvGCX3Xn+kHC9NRRT
         MVgMcCin7ZJUKPwaMYVvN2yOBL0wlazmS33f1thuxqwTQSv58fPPXyLkeGLN8XevYZg4
         gEsA==
X-Forwarded-Encrypted: i=1; AJvYcCWtspdutWspMuMbt0ET1ZgIM0kPrB8t8XmAG5IMSNorFoLMvjX92k4QTG631KVOKiKg04J49J5gdHm5rHZu20ed0a5XMQ==
X-Gm-Message-State: AOJu0YxS3JRM2PA7StskSfkZ26PTjyRUQzoy+cE2F/YWT1fM+IFLUSzP
	r3XT3Cx9X0JCZhj5Wdfbsp023HfZSDmlotF0R1MFiDNhOcu32V54EBhMJwZTjg==
X-Google-Smtp-Source: AGHT+IErjqc2QuiwhjqsE6ydLSlVepI8J8lRB04ybk799vAbtxt2hOpEu1DCYDbIFaBbcAs4+l8Lkg==
X-Received: by 2002:a05:6e02:18cc:b0:375:9e20:beef with SMTP id e9e14a558f8ab-38a53e858b0mr7958815ab.0.1720468019700;
        Mon, 08 Jul 2024 12:46:59 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:3e22:9cde:6b65:e5e8])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-77d603f9bfasm192237a12.30.2024.07.08.12.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 12:46:59 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:46:58 -0700
From: Brian Norris <briannorris@chromium.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] cpumask: Switch from inline to __always_inline
Message-ID: <ZoxCMp_ZQ-Su-r0D@google.com>
References: <20240514204910.1383909-1-briannorris@chromium.org>
 <ZnsML1RYMmEhhdPP@google.com>
 <ZoWhPFJIvGpMGKm4@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoWhPFJIvGpMGKm4@yury-ThinkPad>

On Wed, Jul 03, 2024 at 12:06:36PM -0700, Yury Norov wrote:
> Hi Brian,
> 
> I never received the original email, only this reply, and can't recover
> any context.

That's unfortunate! I don't know what happened there. My usual culprit
would be something in the DMARC/DKIM/SPF spam-filtering space, but:

(a) it made it to the archives, such as:
https://lore.kernel.org/all/20240514204910.1383909-1-briannorris@chromium.org/

and

(b) I don't see any red flags in the mail headers on lore
(https://lore.kernel.org/all/20240514204910.1383909-1-briannorris@chromium.org/raw)
such as DKIM, SPF, or DMARC failures.

Anyway, if you just want the original mail contents that I stripped from
my "ping" reply, they are available in the above archives.

Since I don't know what went wrong on v1, I don't really know what to
fix on a v2. But if I send a v2 and don't hear anything for a while ...
I suppose I can "ping" again!

Regards,
Brian
