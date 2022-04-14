Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277163225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 21:33:31 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id n17so2701925ljc.11
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 14:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FiXeDUXp16zKJj+mcJh8ScMaBjpuOPaR9nYFXOkk6f8=;
        b=FbaIuBg/7dhs/uWN5PQfxk10t/IWdc/zHPtC49e7dSuPrvc0fUWL/iVsIUWRAwVh7p
         Xv1loUqW0tud004xqJbvaSyr5tibUNuE45FUmhSwvyABWxIb3Hw+eH/bz2jSKwYbkC3M
         IdadwSERGLt53qj6Aq4GM7JZLwBHEXWJ6WEafIxuMc/CBSJTqWuGltW/s5A4ynrZb5Yi
         fgFD8JJDXqa+hTH1FGN6dfGQ1isz5OOH8wscgj93dJm39BIEVVIt5C9Go/jD3yxC7gWu
         1uudOcmrEw+5vjqSHjgAZse4VgnSUZ/utk5CqtpiKskw/b/AYHnDKaugJzpjHg5itkoK
         rLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FiXeDUXp16zKJj+mcJh8ScMaBjpuOPaR9nYFXOkk6f8=;
        b=2Q5xZBNIjpR0qj/WR2xNvgGLP9NWptv7aWfK5U02CX4OH03sL3Oqv2LLfkH4uoGzN4
         IC7NSRCPHz4MtUzcLXQWtDFAVJSxNw92n0e8ZjAXqoFOmwrwF/Hy0lLJlaWGynbDRudT
         qtol2N19pD+vogNjBA646sJcJSGu82SIitE2dnWqEp/SGw7ugyV72H+MiLLTA0nAeprE
         u+xl0j2sB4lZdLOxYh2+xHcqfb00S1pN81GBSePOnnq5/3lytq707ZLEIV4hf5l+XeOZ
         gh2KIbUoghKbklKJJ4No2KHMsbICx5ysJa0V8EzoYc9reKXI7+bfMQp4SCEwzWlJYKfH
         R5NQ==
X-Gm-Message-State: AOAM533CHgZV4XNdKU4wh8N1WeAwNtyR0FngsS4OIfws9LqhhXwMs7It
	xDGXAUYMvLNQexO5lkVULigj46/CBKlNbu6u/WQ5yTxWOTEYjw==
X-Google-Smtp-Source: ABdhPJxiromgUQTsDqM/zPpDXJ3yXx2P5o8IzHVl6OnC92TnIGa2AEdEcKXbGcXC8ARiCXFBqr8m4Yu1Ofwy987EclU=
X-Received: by 2002:a05:651c:2115:b0:24c:8e91:d14d with SMTP id
 a21-20020a05651c211500b0024c8e91d14dmr2778881ljq.165.1649972009113; Thu, 14
 Apr 2022 14:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Apr 2022 14:33:17 -0700
Message-ID: <CAKwvOdnb-MV+Fw2oeZ5qiGQH9FPOjgYTDtVrYc1=ynY7=NReDQ@mail.gmail.com>
Subject: Kernel ABI Monitoring and toolchain support
To: =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>, 
	Giuliano Procida <gprocida@google.com>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Matthias and Giuliano,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.

Would you all be interested in a leading session on Kernel ABI
Monitoring and perhaps what toolchain vendors can do to help, as part
of our MC (which itself is currently still in planning phase).
-- 
Thanks,
~Nick Desaulniers
