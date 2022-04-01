Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3681363
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 21:00:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso4328977wma.0
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Nfe9G6FAXY/E/AbmQAdSvRU9IORQQkMBI1TaVXtl0I=;
        b=ehFx1CZeNauNPlFJDPhsoGXqJb3EGKznWsNWXmYtJm2Na6JRkBguhTA52xhCey8Ejx
         CUvRZmh9SWpsgjDc3W0Y/ZBS79AbiCQvaq+2UHKJuudI3ZnZstW5wGzAI+qPtEe5XD07
         drxVG8g1aUPzVzzSPdP6+Ve+glSHGap368kgnS5tW3VYzFiF3PG555f4nfT1Tu91P2jx
         vs9p24XHMfSd7lAUvzqqOFK9Zh6WCBNciTwnR6sZvTv2xVHwJrXS/96HvBN/ku8Nknkw
         iRriKxEMXLdWFKmnL5Nc9QVS5bCTovfNobAt5dVkY9epn/pEzxZUGlD2n3GLA4BS5vp/
         ZZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Nfe9G6FAXY/E/AbmQAdSvRU9IORQQkMBI1TaVXtl0I=;
        b=0nqssiXqp85VjtQ9NGTS2054L/67PBSuPIVeDDW8XL348Nalamq8Lc3aoARK2XStGy
         +CvYG+ub1+NGKxcG0j9N+hGQI0uLGZ5d+YILDvKV63CHX8yy3Sr94iCYnKj1s23LB1/F
         a4aVJemcaPScfiqhekI+g4PU4mxuG4H4eVD3TQsLd2nJ7IibJUIMAbR4ZRc54w5k4ULb
         X0CTOqVi6HpC+k6viJ77+4QWtWIjcMbSmWeD0dFQpI3O8HbyXO6ZuqLX70QuJo2X8jCM
         CqHS/ID2pAey1AG7SAUVQSN7CpYieEpL07iDoy2GfD6xlboeR51f1z+iylWX9GnuQWVW
         9MaA==
X-Gm-Message-State: AOAM531RVECVzF3Eh27yzXA/3gULZOdpHgqvuasKgYuS7HiGL0ZaIu/Y
	hzWFYTjWwOFWiJgFBLpj7sYPBA==
X-Google-Smtp-Source: ABdhPJylXTtpK692bqz4KfNgI5xyVNjcHc+ugaJ2/3bPUryjXJPVzLcLU12s/iWShAy+/1hfqoWlbw==
X-Received: by 2002:a05:600c:5106:b0:38e:38f8:858 with SMTP id o6-20020a05600c510600b0038e38f80858mr10027515wms.109.1648846834887;
        Fri, 01 Apr 2022 14:00:34 -0700 (PDT)
Received: from localhost.localdomain (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0::2])
        by smtp.gmail.com with ESMTPSA id r15-20020a5d6c6f000000b002040552e88esm3479405wrz.29.2022.04.01.14.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 14:00:34 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: lienze@kylinos.cn
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-block@vger.kernel.org
Subject: Re: [PATCH] cdrom: remove unused variable
Date: Fri,  1 Apr 2022 22:00:33 +0100
Message-Id: <20220401210033.2078426-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401032623.293666-1-lienze@kylinos.cn>
References: <20220401032623.293666-1-lienze@kylinos.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> The clang static analyzer reports the following warning,
>
> File: drivers/cdrom/cdrom.c
> Warning: line 1380, column 7
> 	 Although the value stored to 'status' is used in enclosing
> 	 expression, the value is never actually read from 'status'
> 
> Remove the unused variable to eliminate the warning.
> 
> Signed-off-by: Enze Li <lienze@kylinos.cn>
> ---
>  drivers/cdrom/cdrom.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)

Looks good to me, thanks for the patch, will send on for inclusion in
5.18.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
