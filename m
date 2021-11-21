Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE468
	for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 21:56:51 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id g14so68230015edb.8
        for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 13:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=aB1Cg9IKegOfxlkWXk0reTQpUexfkwXg+7RDHJWfQkE=;
        b=AShRsS3YT6dEgEibKPYf7h4nVn1SLiY33n64QswwwldP508MH8fHiF4JPWHek0Aggi
         KG55ITc4drIT5ssEvUdKnoKPDNOv/Hct7jquyZJd0l64uwGujdAqPtf3qAMooKtYEZh3
         A1ifKV+0fc/mQmypRoiPLpgbJiuxUjX7pMBg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=aB1Cg9IKegOfxlkWXk0reTQpUexfkwXg+7RDHJWfQkE=;
        b=Bq8ZTXpUazqIQTZ0LKtV0WsdT6BesVVKRX2aN1bME7LBOY9piDNbDamsbRgucCRXp8
         12vKJ7X7EWI3NJ0oRI458OjTHoKpEasnoGiNu8Uy+ys3y2EOyNk6N5NrHQ07lkeJRjHr
         yMt83Tk3to3hP3GC5Ru84DOUmXgr/bh35VZ7OGZGqMnsVWgSL7ohQNqIyaSKXmmueFBi
         8fdrBJjLiub4+bx+mHuCrkEjDRXkXRJIpFVsG24EmlrqhbQs+Wp180PS+9bg+6j0TthJ
         s/ucz4oSYjFXjSe7Y/qfvWxgtb3FxMXMhy4cgi5gypBLpRwBEKcTm0FYQCICE96CClZ3
         IFlQ==
X-Gm-Message-State: AOAM531Du4VIaApnCPVT84LTo/wjIgStP4a1gXXyXvE68G7DqxkE/CEy
	yVJOpBaMP5exhG+bwWo423hRvBI5l+uMm19c
X-Google-Smtp-Source: ABdhPJw0Zsoh0pP/qmswmUIi0QjYeQJRz3LI3PsASH4mUPHIY0B7xcrO4BiE3nycXBpNa+UwLuBFFQ==
X-Received: by 2002:a17:906:54d:: with SMTP id k13mr33279716eja.545.1637531809299;
        Sun, 21 Nov 2021 13:56:49 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id jl8sm2811792ejc.59.2021.11.21.13.56.48
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 13:56:48 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso15113115wml.1
        for <llvm@lists.linux.dev>; Sun, 21 Nov 2021 13:56:48 -0800 (PST)
X-Received: by 2002:a05:600c:1d97:: with SMTP id p23mr23400103wms.144.1637531808397;
 Sun, 21 Nov 2021 13:56:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 21 Nov 2021 13:56:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh-f=eyP3i6nc8Hj49E4UKtgYionLs4LZbZYDorh3OLjQ@mail.gmail.com>
Message-ID: <CAHk-=wh-f=eyP3i6nc8Hj49E4UKtgYionLs4LZbZYDorh3OLjQ@mail.gmail.com>
Subject: New clang warning.
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ok, so I don't think this is new, it's just that I updated my distro,
and am now running clang-13.

And I think I've seen things like this before (it looks a bit
familiar, even if the exact details aren't - I think I've seen
something very similar this with the bit test functions, for example),
and others probably have too:

  WARNING: modpost: vmlinux.o(.text+0x77d8e):
        Section mismatch in reference
         from the function __next_node()
        to the variable .init.data:numa_nodes_parsed
  The function __next_node() references
  the variable __initdata numa_nodes_parsed.
  This is often because __next_node lacks a __initdata
  annotation or the annotation of numa_nodes_parsed is wrong.

and that warning is just very misleading.

What happens is that __next_node() is an inline function, that is not
inlined, but specialized from a caller in an __initcode section. And
one of the arguments ends up being that numa_nodes_parsed that is
__initdata.

And that's all fine.

What is *NOT* fine is that when clang specializes that function, it
does so in a different section than the calling function. So the
specialized copy of __next_node() is _not_ in the __initcode section,
and then modpost warns.

The code is harmless, but I really think this is a clang bug.

We could avoid it with __force_inline - and I think that's what we've
done before when it was really just clang making bad inlining
decsisions. But that function really doesn't need forced inlining.
Making an out-of-line specialized copy is perfectly fine.

No, the problem is purely that the out-of-line copy of the inline
function is done in the wrong section, I feel. It should inherit the
section from the caller, I believe. That's the whole point of
sections, after all (think using different sections for things like
cold code - inline functions specialized for cold code functions
should themselves also be cold). And it would also make the modpost
warning go away.

I realize that clang-13 isn't exactly cutting edge, but the warning is
a bit annoying (even if not fatal - modpost wardnings are not compiler
warnings affected by -Werror).

             Linus
