Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263B04682
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 16:59:37 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-328a1cff250so118025927b3.6
        for <llvm@lists.linux.dev>; Tue, 09 Aug 2022 09:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=QrQX8WK96u27I03TXOPBygFMgGD2Ibt/j+HCEDp++fQ=;
        b=m1M1yMVBnbgi7NhIwjdruOUQemUheuzKcNXghQUoailteEjFRoQBidSZMXENxUrPCj
         Tp1WnfFrrBzYRcJcIHBpnUbfK2ZAUS46AcAXmAJuFi2rgW5elvTWhoeN8aFmxpcz9XBN
         FHiFnGD56C2xbnyzh3cgcyMhrdUxL2KlXyoDZWlDQ+4/VaoXKDE0Ar4j99HPpRTgMJMt
         EZdISeeFd9OdLatpDDdWPxMq6C3v5eKdNyVRERxfF+G3Zbgn/bij81RWXs/uGLGcDAS1
         my10/om8ROtdy3n5qf2cPcd8JGXGArfLFDDNk8E/dzd/aiNFXa97mpuUBjVHD25kDY5W
         mrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=QrQX8WK96u27I03TXOPBygFMgGD2Ibt/j+HCEDp++fQ=;
        b=nzjy7dcOmqcbnc2S4LlJypmmX9osKUYhndA+xgmL9b6cOett7eEMnX32GxYmPQsKzP
         BNTIa9M80/6P9zk+tOokS8p1Q8ckBwJNSfZogfbwzDabV1sfdLcTE0o81erHx8Vr5ymw
         b3OQv+s/ZpB8sPiKXEmFRO9Ves5NvJl3uiosGbPnnCOoUhR8jzdD0F0h7Ktayr9I7aYH
         91DCGwWwtRR/T/3GbkBPHX2IBgrLHrIHbd2embc17b7DJhYY9xNFnhHouCnPCC/maHm/
         /2hWRDg8zXHMaWtaSOaE1QqVL3qV5HTH1XoPtOyzCLPGg94DErFNYlFUrYNKKiypJVSU
         2rnA==
X-Gm-Message-State: ACgBeo0Yb6w6BewYTvm5ikE1G5E76aIKVr8WX9LqEl53Wxe23Oc0VDQ0
	tVS5NNNVThFfp1l7GmobqPDDr4IgxjySr3digt0=
X-Google-Smtp-Source: AA6agR7HD7MwWKvSVk7kde+m8xcp73ooya/ogS3zlQNjq0dZm4Jn67V4SprdkkazYRaHVukqADaNGkPcGF4Qdgi/q2E=
X-Received: by 2002:a81:1d09:0:b0:31d:a40:8332 with SMTP id
 d9-20020a811d09000000b0031d0a408332mr25309035ywd.138.1660064376070; Tue, 09
 Aug 2022 09:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Tue, 9 Aug 2022 18:59:24 +0200
Message-ID: <CAAUqJDsAWRedULdKx3rEK7jL4=gHfJebCT4ujzWq4vSXZbju3w@mail.gmail.com>
Subject: Re: [PATCH] powerpc64/ftrace: Fix ftrace for clang builds
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nick Desaulniers <ndesaulniers@google.com>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 9, 2022 at 11:59 AM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
> Clang doesn't support -mprofile-kernel ABI, so guard the checks against
> CONFIG_DYNAMIC_FTRACE_WITH_REGS, rather than the elf ABI version.
>
> Fixes: 23b44fc248f420 ("powerpc/ftrace: Make __ftrace_make_{nop/call}() common to PPC32 and PPC64")
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Reported-by: Ondrej Mosnacek <omosnacek@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/trace/ftrace.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

With this patch my reproducer [1] is passing, thanks!

Tested-by: Ondrej Mosnacek <omosnacek@gmail.com>

[1] https://github.com/ClangBuiltLinux/linux/issues/1682#issue-1330483247
