Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4492563;
	Fri, 28 Oct 2022 13:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB28DC433C1;
	Fri, 28 Oct 2022 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666963776;
	bh=yoy7PO12QsYoz4vuwfCSn+YRNZlRSqRXCb7OSUVWLzM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kHPXT/57Lei7XMehuxrDyoGDfWpzwV7m4MVMmGn9WVfSvcz1KEGQ7fy/RD907w+np
	 OXIWPSyGiYKsUAQypPYEgkyK9o0MuRgRALm7LdOCwUx/xxKd9E8xhRXEvwSWvz8vQk
	 CfAjWeW/ULlsXnB9KkYL4894F5qfLzSuOYkzTmGFOBzYtCnVN1+JNLO0u7reWzuftL
	 H6ggQo9KRoveWb5InC/2i5VjvBMwfhfy1zzpxkIhPOcrXnm5VzZnE88mHDUcBii1cl
	 5RC5iSGcrApxRONiBUwtB0WmhFMXSPxTvDeX0dErtkmAfoiC5kkKPdT8B6uyDhiLPL
	 qrGqScoNoHR0g==
Received: by mail-vs1-f43.google.com with SMTP id 1so5120312vsx.1;
        Fri, 28 Oct 2022 06:29:35 -0700 (PDT)
X-Gm-Message-State: ACrzQf11/EXswW4XZd6RRAtQ4sypvm/0bvGGUwhrXc0IIi27fsDF3B3f
	bAKcL3GT69Qf4nWdU8yRNxtcotTrX3sQCw02L2o=
X-Google-Smtp-Source: AMsMyM7nYYvKskZSF85fJK9uXmAgjYC9qFrgwJIOAXEbND0GZOU9feL0lql8jabxvDIEXK02GtuX2IpOIJBR+pcpVqs=
X-Received: by 2002:a67:df18:0:b0:3a9:f07f:876c with SMTP id
 s24-20020a67df18000000b003a9f07f876cmr25885556vsk.21.1666963774862; Fri, 28
 Oct 2022 06:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210282021.SKiobE3i-lkp@intel.com>
In-Reply-To: <202210282021.SKiobE3i-lkp@intel.com>
From: "Jason A. Donenfeld" <zx2c4@kernel.org>
Date: Fri, 28 Oct 2022 15:29:23 +0200
X-Gmail-Original-Message-ID: <CAHmME9qUX0cmxntB7Fmw8aDr8mcsVPJzr3keP9XVBZCPDaXMrA@mail.gmail.com>
Message-ID: <CAHmME9qUX0cmxntB7Fmw8aDr8mcsVPJzr3keP9XVBZCPDaXMrA@mail.gmail.com>
Subject: Re: [linux-next:master 2671/4127] arch/mips/pic32/pic32mzda/early_console.c:141:11:
 warning: result of comparison of constant -1 with expression of type 'char'
 is always false
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

https://lore.kernel.org/lkml/20221028132344.1993934-1-Jason@zx2c4.com/
