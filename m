Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A258C68
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 18:18:15 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y12so60112285eda.12
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 10:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WE2EyhdaIKRgniT2lkFi3qndNcuUWHIlT44HhHt4xhI=;
        b=CNOUylDm39x63E41s5OZ8UaB156/vDwnH5BuYVCS8wlXEnQiVie4bOumiPwXCR+JOV
         XXGREV0opDGhSHyCgsI7srvQtyHyH/MwrczP4Bhi6Hm6XvnbnNlFfuze5pZC15/KqjEg
         QJiwXlXdECQ5sYq86gaZjnpO/UzJc/dNbZB2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WE2EyhdaIKRgniT2lkFi3qndNcuUWHIlT44HhHt4xhI=;
        b=Dlip9J9qIkrdXIrzJbjvMSglPm8Fq2gKVLeDltlIk3O/pqcg2C+h5qPt7kzgdhz33x
         XbqpdRyAo3OfNmhxNfy8JQttL1egFwpp6pU56EnBEO6RjY2lsSkEiYu44iwzifzcCHZE
         agwxXkUueK4/zSPO3DZHsm19z5WsOqJSBTwOSyZ8yFhBjiMNa3BWjDhujPNd6Bg3fC8X
         LphPfmfkZoZepbemaFqTyIZvVwgQxzlbKM/Fg/hyKnH+mYhSJNnHvBJ1e3DqtLnCHIW4
         X2LfqmPmRLOJ9Km4S7kY0fZjQdRrTNmK5nHPO60/QiGmZljpormVYC5XHpceWRNsP7D+
         VKJA==
X-Gm-Message-State: AOAM5328zhWqVVHZodNNHzY1DDu0NVy1Z1BdNi4f7Ni0LgrPxVg8ENGV
	ObKUrGPWEp7GuCUdcYV4utTkYxe33WALmn7u
X-Google-Smtp-Source: ABdhPJxD6E8hH82Vd8HSo0N3s98z9h2CfdovzcBwO8F5cxwuJlmj4cdwZk3m2pxstI9VNFj1rkKmfg==
X-Received: by 2002:a17:907:3f24:: with SMTP id hq36mr1193515ejc.390.1638901092510;
        Tue, 07 Dec 2021 10:18:12 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id b7sm419943edd.26.2021.12.07.10.18.12
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 10:18:12 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id o13so31212843wrs.12
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 10:18:12 -0800 (PST)
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr54060146wrn.318.1638901081204;
 Tue, 07 Dec 2021 10:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-3-arnd@kernel.org>
In-Reply-To: <20211207150927.3042197-3-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Dec 2021 10:17:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
Message-ID: <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
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

On Tue, Dec 7, 2021 at 7:10 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Working towards a cleaner header structure, start by moving the most
> commonly embedded structures into a single header file that itself
> has only a minimum set of indirect includes. At this moment, this
> include structures for

Ugh. I liked your 1/3 patch, but I absolutely detest this one.

It makes no sense to me, and just makes that header file a completely
random collection of some random structure types.

And I absolutely hate how it splits out the definition of the struct
from basic core infrastructure (initializers etc random inline
functions) for said structures.

So no. NAK on this one. I think it's a disaster.

              Linus
