Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307CC2C9D
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 18:50:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id n12so535624lfe.1
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 10:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gmb+Apudh+c3b4tBgmQNZgnlcpZS4tKe6ho/6WlprlI=;
        b=QDFc9P5aML7+YtJ4kv8ohPRs/NxD8Xl31/KC9meyRbjsUWaCD8+eUYuX6yVUlGqPHd
         KK5IUmkhYJUj3NsARjU1eko53272JkmdRrJUgX+l9Aw8osNMVvggDJ3o5a2SoDGLt8Xb
         QZuDre4bR/z4KskwYlkuCw9lTYA7xJJPi1fr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gmb+Apudh+c3b4tBgmQNZgnlcpZS4tKe6ho/6WlprlI=;
        b=Sn7jB+QJdAzrdNpX+VEoeCqAyIIO/VN5aEXPmTGclaHmswPxq8xAcPJO/mTx4BZ5iP
         +I+X0XkpBDVbkQaZHyA8r+8Dy3tAJneNMXInSwdWwNI9NJXhjbQtFqF/eFWeXXvSLrNp
         +G+ooVW+wF/abmEydzfkHsQVU0fj+Rtl1EbRX7HXoTLOVCab9CtOUsiX504w3cTaknmd
         2V/6ET8uC4wLzP2louLXz4MrxuXCZMpVpDhAG6mO/nAjtxYuOOhvq70Zgh2+emuCmIKg
         htZ+Tj9i+hEMwNUoyFSBP9+7LACBu12lgf+FgGNZvzFWvoHCjM3q3408tmzZpVOSpqxd
         D6Sw==
X-Gm-Message-State: AOAM530NSeWKfe8mIxprnKNrDUpUi935oSpagKx8rNVH0ISv+1+hyugG
	n+jCn9aa+LUvnER1uOwDVgcjfthfHIvrswMAjwU=
X-Google-Smtp-Source: ABdhPJz7TrafgpPRJYock05STB3zKcHmfy3MmAG6ROk7DqoiniGm0IGgiDqz2eO4KrDF9Ym1EciKPA==
X-Received: by 2002:ac2:5bce:: with SMTP id u14mr43091286lfn.467.1638903052105;
        Tue, 07 Dec 2021 10:50:52 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id m13sm38422lfl.131.2021.12.07.10.50.51
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 10:50:51 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id b40so426505lfv.10
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 10:50:51 -0800 (PST)
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr54258440wrn.318.1638903040805;
 Tue, 07 Dec 2021 10:50:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-3-arnd@kernel.org>
 <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
In-Reply-To: <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Dec 2021 10:50:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsdmyN3qYjA-Z4bqhin2ZFkssRaaTRm_LdJBqexTxWfQ@mail.gmail.com>
Message-ID: <CAHk-=wjsdmyN3qYjA-Z4bqhin2ZFkssRaaTRm_LdJBqexTxWfQ@mail.gmail.com>
Subject: Re: [RFC 2/3] headers: introduce linux/struct_types.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Tejun Heo <tj@kernel.org>, 
	kernelci@groups.io, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 7, 2021 at 10:17 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Ugh. I liked your 1/3 patch, but I absolutely detest this one.

Actually, it was 3/3 I liked and that made sense to me.

1/3 isn't pretty, but I can live with it.

          Linus
