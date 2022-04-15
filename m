Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2A7B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 17:59:48 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id b21so15076318lfb.5
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 10:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ZACS5WHiI7gChdgJhb6L8E+uQLLjhDmU2/Qe3HsDIMI=;
        b=XQQwxdMI0ImldHNKxqFX00q9oRU1fpELODiuK1zpOXyGiFAA6kL6FzgSrRjxqWF2kr
         G6KnStB6LrWLi5u2nj0ZFxquM++LK7WmvUJdKQXIS7lTDBZEGVDbsWTnZ5Eiuv10FaP8
         KaPcpZxl1ajQdG7+9VV8k/GqAQt9XWrZv48TeiU+tE4JFodOiEXjZaxeIQwzbZ2+GcH/
         q5C5ucF+7rf3V86RvyRv0EPmB2SNHtd3QqApleeTKWdssO7BHf0iPc/wHBYrC8XZ9xeX
         gkyEeQSLF30o5vbg9vrQgQMtu1EnI4oQll6paq473qT5ZpAMAjbvCmuVCXOpZsx/Ogzw
         NEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ZACS5WHiI7gChdgJhb6L8E+uQLLjhDmU2/Qe3HsDIMI=;
        b=wr1uSj9NSV6/Y9MPioKpFQjkT+FN8QEvgZwC52zBWSE86AWosvAzSFoOoWFHcbIcDh
         S4JwIEuD913Ek2YA+guuwRFud6cTxqT9pbesS09on2pLB1S/UbPQVn6MxyHLLYqmBbfq
         KtrMUkpH1iqwVqZ69H6hCgvpqNsyuxM2ggTgKaE4fnxDBjq47pAYf+PBCpPxpEfwVmOW
         QZA2f6qjf84HoZ0s0TMynwj9Ay4+BaB9w1HIf9+H3rW1MFYZaSHPy/5Jn57zd86XIu3m
         v3yXgtWaKUM0JEUSFwxeyGGMtaccmoHOtvNaQbN4JG/C8aZtEDliD9mCAeNLccfN0Vwj
         0wog==
X-Gm-Message-State: AOAM530bOpvzWRQ6lwrSPwG1XmM3gD0z7Oe5dDGS9MKCJ1f/H5YZ6C0h
	b7KopZnzTqWcucnW1bZRRnBu2zWlTKEb62iQfzFxzw==
X-Google-Smtp-Source: ABdhPJzF5rxX6OUHjiotcRapiD2RkG7bHsp2HuJ5fZGDPasXccrqlA8FxWBntopJ7Rrb4fF5JAPkvKMRINBnBQuqPTc=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr111228lfl.87.1650045586873; Fri, 15 Apr
 2022 10:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 15 Apr 2022 10:59:35 -0700
Message-ID: <CAKwvOd=_ihOghnaWCmGs3xx1Tyn4qaEpZ1bpXvbGJhjGJR2K-w@mail.gmail.com>
Subject: plumbers session on drgn and GDB+poke?
To: osandov@fb.com, "Jose E. Marchesi" <jemarch@gnu.org>
Cc: LKML <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Omar and Jose,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.

We'd be curious if you both could lead a session on kernel debugging,
and maybe show off drgn and GNU poke GDB integration?
-- 
Thanks,
~Nick Desaulniers
