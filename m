Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6432D9796
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 02:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490429; cv=none; b=p16MihIWTmjmS1tKwIJ4DAwhq0/OeTQ2tFOYWiCpydkcwFpRh+RCjEtb0C2h9YFE65w6lqNXcs/Zc5JvTMshwCHr2KpgV4FdK6XQrBy4TenzYNfTPxAkX/8HN43G2yzMXAz/UGJDpiq0TuHnVqm2KgIWf1PIPoJPLsuDHIbAevg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490429; c=relaxed/simple;
	bh=RfijQGsKWUEkGdgHfWsVT1ZhVP2PeputQJ9VXpu31nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1DRtq8Q6jqyETgVHhJU5obwsTAxMwaeu8BxYzufgWynl/49wfGeKugJZo9mUFd9sk+Zglcsd79OihnGohLCo+6YGil/8hn2bUhbhBnFTEaQo0ZyNCD5aCQsFowwanBluAdgCAi6rGCnigNcUAYYjRgFUa+or2Djs7dJd03NqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmROjC1V; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmROjC1V"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so4460795e9.0
        for <llvm@lists.linux.dev>; Wed, 25 Mar 2026 19:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774490426; x=1775095226; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uhbkdLidpODGTRsYmLRF0FS3n+wDOfvaXSzlGywSvfg=;
        b=LmROjC1V8LhUbCl63fnmkRqlJs3LaLv2mnkCkEQ+KSrkWDm7yNNnFZERHEQ7E6NcpF
         14jN6kAhe+9DjLqNMmjqwKXKJJ+qC+Juj9Tc248FJJ/sU5HqA8zt7RBU0OIn5pwffyxT
         MUE7f1xXq45haQ3jeSqbJX432sMzKMMZORHnfwN/oAtelEjHisX3bxiI2OmIBTqWDawC
         yS/CvTvM2qi3rg3yoUZAsajGgeao/KSLI98GuS+vt4OvV2zdraovzZCz0MbKy29Tb0eT
         93BJGCU7k7rt3WfO6SQfD+tZ3OKfzPp8cXfDmhLTcu4IwcQtN3FYWU37uGRWcL0VPpfC
         VXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490426; x=1775095226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhbkdLidpODGTRsYmLRF0FS3n+wDOfvaXSzlGywSvfg=;
        b=nwlmXaqyu4vIFegBs3o8FNeQkrl1i/IfZLam9yFJ1REC8kSI+2nzQ0QUt4g8Y1m7VB
         xcXouG0jh6ahCjLSePiKjv/Tj5JRMN8X5iSfqzK+NqzHcVgILogihVnSF94GSB+nUtRg
         Q367h3G9qwGGxexJOGWutQdaDu2wJXNYHdJDKMdbQjglqNN6Hdf9WH8IWRACK/TBxUN6
         ukEnYvQ8V3rTb4YZ7dELdVNlC8g05Ad71VOe2NSsstSSt73shkTGTPBA9SUCA/Nubt5/
         rp4suO0F+A6Q2aDnH0fqq2XGuYe7kzmdB7KTvpLDDpOkrCzbqUuxi+CYHx2o8Ltg/M18
         u8gA==
X-Forwarded-Encrypted: i=1; AJvYcCUfAvD0xYEfK8FWyjEkWgazVEjf8+ZNPNqdYXEvBs+62njxNld7GdZpeESSZ0CQCQDpzE5I@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7rdpSN7N26lp1PFEx3A57Y1xGSTo2MXjHi9T8BWq0FN6+KW6F
	waqNagyA+TToJuc0acay10vgenkkH+QYnPZ8Q7fDuvEdrBwWqvGg+Uiv
X-Gm-Gg: ATEYQzzdvaiwNRFm3HGN/iWe/qSnH/psT1/vKGtpHfzWzkYWzqZCwjadYXYkfYFteEy
	onW7M+6ca2SXCIBvltxtKRKi3nWVa5PuNjb0vi3gDvUdJ+kaGcfpHFh1evwlwj1gCxnqrl0kIiO
	9pKV9eC9j3OeTP3hswm3iGzzNcGUO50128T1Zq0PwG03M0xvcVArCmdpg1PH0kUJAQ2X+JVq3pt
	ktcaUk2b/8HeKhFyPInaAt1Rl8KHtX42vuf7CcfV/+SOjRgn2RH+CQQP8XRjD7XVw7wD3cHX05u
	y/b2KUS7TIFpdRSHC+x/3nVFbN9+Q6Sht9uODqYv1YYBZiD7QOpWJqo2GOlRAQZSstHE+9uee96
	/yAR15bDEgo6pkX/bVfD7SvTj04DuTjKeK5tfFjmDxsMlZLiaW9AHM69IfRPIzEisYsgVomqyMG
	FGEkhKGGgWck+TGUVNz+El0qwyxKk5DufLt9HwgDOdoGQPZu95UPMshYFRW4yq2dJSJelRJAive
	YCZstmg/PtT5Q==
X-Received: by 2002:a05:600c:c4a6:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-48716042c15mr81428365e9.21.1774490425914;
        Wed, 25 Mar 2026 19:00:25 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb333fbsm33300625e9.3.2026.03.25.19.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 19:00:24 -0700 (PDT)
Message-ID: <fab5260a-b83f-4750-8b4e-ae5c1313d7ba@gmail.com>
Date: Thu, 26 Mar 2026 02:00:23 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] net: sfc: avoid format string warning
To: Arnd Bergmann <arnd@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Jeff Garzik <jgarzik@redhat.com>,
 Ben Hutchings <bhutchings@solarflare.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Brett Creeley <brett.creeley@amd.com>, Breno Leitao <leitao@debian.org>,
 Kees Cook <kees@kernel.org>, netdev@vger.kernel.org,
 linux-net-drivers@amd.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260325134557.3406655-1-arnd@kernel.org>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20260325134557.3406655-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2026 13:45, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Three sfc drivers contain the same *_fill_test() function that takes
> a format string argument that gets passed down to snprintf(), producing
> a warning with clang-22:
> 
> drivers/net/ethernet/sfc/falcon/ethtool.c:227:60: error: diagnostic behavior may be improved by adding
>       the 'format(printf, 7, 8)' attribute to the declaration of 'ef4_fill_test' [-Werror,-Wmissing-format-attribute]
>   210 |                 snprintf(test_str, sizeof(test_str), test_format, test_id);
>       |                                                                          ^
> drivers/net/ethernet/sfc/falcon/ethtool.c:210:13: note: 'ef4_fill_test' declared here
> 
> Rework these to take a varargs based test_format that allows better
> type checking and a non-varargs unit name that gets pre-filled by
> the caller, so that the compiler can validate all format strings.
> 
> Fixes: 3273c2e8c66a ("[netdrvr] sfc: sfc: Add self-test support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Edward Cree <ecree.xilinx@gmail.com>
