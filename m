Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5281DA53
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 06:25:18 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-533d31a8523so18451014a12.1
        for <llvm@lists.linux.dev>; Sun, 01 Oct 2023 23:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696227916; x=1696832716; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2YcTDEderIpntFpryzrhPKAAizvOt9pYBBFwAoTJCX8=;
        b=AFBaSp90gTcvlC4MN33RfTOfbtNSvmiV+/yqA64je2XLioD+HX7ApoIgv7XkS4rDpU
         Nf9Vp67yaYYyCwIzWo3oBg9u+XPWN5IBRS4ib0ccAvqoPSPWTJsIqIcDCxEPiWnXm7K7
         frVxLzgajKysp0GQ02gooaZQsM9muvh/Rr3XUsCc0SpyXTyE+u758lnT2C5brJ3+rEHQ
         A92I1CFLws2uZ/lpNo+UZRQPS7sANAt5Y6mv394pnCR6HLNbZYf5kKFvqM0pQnBZ1tAK
         JMuENjq/2jDgs3fv6syhATFnCl2+9CDI8OTROpbmgvHye7H8/kN5ClequH+NYnbLqgel
         j9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696227916; x=1696832716;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YcTDEderIpntFpryzrhPKAAizvOt9pYBBFwAoTJCX8=;
        b=wbDCQw6p7q98t5i5oMBNxyPAs6fUc6DLj+t3BLzXTlOzQTp57PTMhfLcSj49SQT98S
         eKTDnbkS6LWED0mZiAGCdyB8bia9Pmbxxo9+oVRxX8e8P7/7C8sMijKudk1mcMFCKFz/
         2+Zk7VYQuiBMmQ4L2sa4SVWCl95e7g6ARaLf8KX+SVvgryCNKP7g2/qm1GVdQ4fM75zD
         HOpLQhtmtvUZBjaJ+pjOH4HR0Q0gsWAEK6a08NU+5G22hlnHy/+FS0run2c5pMgsV2rl
         Fsctqm7uHCQPDi85L5+OHfFJ5/lPv7RxC7MIoSPBg04kuaS4AwSSjOP0XTKQWjDKcLIU
         mi3w==
X-Gm-Message-State: AOJu0YylVjNjZVnuirnxmuvXFFoCJPRY+ViDbrvOWoQlgn7eTlt07/aO
	gkF9HmF3OeeiFi5ZE4CJEIOriUzPsFEHFSXUlQ8=
X-Google-Smtp-Source: AGHT+IFpTjGH6qen2IV4QM1xW6WnN+JLnlHWop8RcZYM7IzkDdK22YogY8JuMXUDC8f8zWEJww+PXxWSvSyaqsMpyy0=
X-Received: by 2002:a05:6402:4516:b0:536:e03f:62b6 with SMTP id
 ez22-20020a056402451600b00536e03f62b6mr8385696edb.30.1696227916167; Sun, 01
 Oct 2023 23:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 2 Oct 2023 08:25:05 +0200
Message-ID: <CAFULd4bEy9XTsdHuQMukjiTtWbrej63GThqUhbXKBgtF3Tm-GQ@mail.gmail.com>
Subject: Issues with named address spaces
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear clang/LLVM maintainers,

I would like to point out an issue with named address spaces. In the
thread where segment qualifiers would be introduced to linux kernel
x86 percpu functionality [1], it was pointed out that clang crashes on
a simple memory copy with structure assignment [2]. Perhaps you would
be interested in the attached testcase.

[1] https://lore.kernel.org/lkml/20231001131620.112484-1-ubizjak@gmail.com/
[2] https://lore.kernel.org/lkml/CAHk-=wh+cfn58XxMLnG6dH+Eb9-2dYfABXJF2FtSZ+vfqVvWzA@mail.gmail.com/

Uros.
