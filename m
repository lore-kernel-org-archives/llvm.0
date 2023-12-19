Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B431B1DDE9
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VjikgF8J"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-425928c24easo24561cf.0
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 10:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703010967; x=1703615767; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cdlfGRn9Pik/X1WCRvEtMyeQFE6g33e6UHtZ+YZ/+mU=;
        b=VjikgF8JbzHYV2cI/efNchQPYJemV17THMEZeiEZLuN7roS76G9GSHE2ECuggnr/ct
         wUzwv3p3qBgm7X/Qiyw0RhUFIzWVgpQSfCFAdS8Go3CtkxX9cltzlNrKX0lfrHdrYOWy
         paAvdk9rn2KMy42CbWM5/iKl6EkKuPxh7rQqCqtjJEcprcNnWg6rYGjWmtz7oZNC3oLZ
         eSZocbg6nfxFEKtsC8dL4zCB2vEDwR42tbSUkiHPYWRSIZGmJcZjeIIN/1NXAqsL5Zih
         1Cm3NFb14DxTB1yZw4UqxgUoFrUpo0Ged1365jPWC0L23GN2NXcuIwcPfJZ9YQr2sDz1
         2tzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703010967; x=1703615767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdlfGRn9Pik/X1WCRvEtMyeQFE6g33e6UHtZ+YZ/+mU=;
        b=vbrcDtyTdkMDGEpcGztwk+txxZOLc/3AA4QTwVTQAV1+ZgXnFy+qq/pz7RDCtztvVr
         DwkFKbNzhO5cVWrFvRuCc1IBXP4toB+904oHtSyo5gPSpzfuz9jAaXjsC7sHlsqwCrej
         CfJqGFDRokm7XeJSYEzdYPiXUbQGMZJvvOGVa1hbrCpzcqSBa6MhzcNuOsvXVcCoudY9
         j+TYayzjTC0D1Foj0z3LvzRnbeP337UqjumsX5uAg+Jj5kNbPppXT0fH1UAM5+6ZMHUz
         Bt51Xsbgv1d25BAIyRLZeysc7qvaxicOWyfND6BOiTZDfs0G3MzjaDYLWzvdtOT+Pnby
         ORhQ==
X-Gm-Message-State: AOJu0YzkoWkrbZvNYgF3OQFDb8C8SplyESUd1KOL0vfRYWalaZg179Q7
	jWE04q8GbNbjtyKWAAa6O9zUKwd6/QON5D2UmHLSH/r+J/XU
X-Google-Smtp-Source: AGHT+IEBLCNdsO/90AJuMfJS1bbNyublmOBRFluX1ANBAWNG5IR6t4QBsmCeBb7+ZRef/sCDxlO6WJZbnp1+cFls3p8=
X-Received: by 2002:ac8:5d0f:0:b0:425:8bbf:f6b0 with SMTP id
 f15-20020ac85d0f000000b004258bbff6b0mr13822qtx.29.1703010967554; Tue, 19 Dec
 2023 10:36:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231219-libstringheader-v4-0-aaeb26495d2f@google.com>
 <20231219-libstringheader-v4-1-aaeb26495d2f@google.com> <2023121938-stargazer-purse-0dc1@gregkh>
In-Reply-To: <2023121938-stargazer-purse-0dc1@gregkh>
From: Tanzir Hasan <tanzirh@google.com>
Date: Tue, 19 Dec 2023 10:35:55 -0800
Message-ID: <CAE-cH4p-TzH3zyJfmSg3r=fw78j8y-0t0dp-NvaLyVYAMULw1w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] kernel.h: removed REPEAT_BYTE from kernel.h
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Nick DeSaulniers <nnn@google.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	llvm@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> Legal note, this file is NOT copyright Google as no Google employe
> actually wrote the logcal contents of it.
>
> Please be VERY careful when doing stuff like this, it has potentially
> big repercussions, and you don't want to have to talk to lots of
> lawyers a few years from now and explain how you messed it all up :(

Ah, sorry, I didn't realize. Will change right away.

> Nick, odds are there's a Google copyright class that Tanzir should take
> here, if not, I recommend the free LF one that anyone can take online
> that explains the issues here:
>         https://training.linuxfoundation.org/training/open-source-licensing-basics-for-software-developers/

I will take a look, thanks!

> As-is, this change is STRONGLY Nacked by me.
>

Best,
Tanzir Hasan
