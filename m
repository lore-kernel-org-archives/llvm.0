Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D3615AEF
	for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 15:49:36 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-43f5da47667so259603137.3
        for <llvm@lists.linux.dev>; Thu, 15 Jun 2023 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686844175; x=1689436175;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3hmCfir7x2aNeYJaKfuY8ZLiQufVIyZmBz/otZX+kQA=;
        b=XDL88pJjoBpHvBtGko4FG9jRAvdAj4KLR+r9Ugu78p9ewdNLLuNx73kVyv9GhAu038
         nbYyYCqYdgA5aalnvnq3k/+Pmuz8Hejai++ErFyklZwXCSiEpz3/+PcZ3kP/MCFREQuG
         EcQot8r4cu+GysBKANHaZ/dcj0+dqr1NLNGqFNkJVyc1b25VKTv+pizxhWED8mfpogl9
         AVrly1xM5aD/DlIb0L5ZtwOS2HyZBSFP09aelhveUbnO/BKilJkT3ZAxQOWYwd+JTTo5
         xn71Vwjj5WHAlE0MFU6odJj+KQs+eGxdFGE5vBLpLiKOuZ+ZMjIxJ8RJZpKFZ6S9P1Pm
         95pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686844175; x=1689436175;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hmCfir7x2aNeYJaKfuY8ZLiQufVIyZmBz/otZX+kQA=;
        b=iWgLYmRdvW/FlJsfOuQ84xldupI9I4BvjFFxdd3x2jpkMgVKZN0sjeo6pnjZs7sWSa
         Eqkx1XehP/zXvDvq/dTYqYk5hJZQokAD3d8gIwTHDS1P0tcjIkJ8E4uNtEuE3m1HjHYd
         I/yw/7mah5auSnFhdKXKmwwAbzdPnGDu6id/JQ4sKidem/vWfZLiDAE2nwtQIFEKd7tX
         DN/FUx3Qal8Z6wDUhJalRoEQJV6VJ5j+Sx+Uu2LD2pBtcal/8ZoJeXG4wWDdF2vdLo3c
         jE3KefIid5Y6EnBj5AarRcD2d9vL6KUjOJ9HLyVG2nd9os08btpSdVivT9FLrSI8YSV5
         G+Fg==
X-Gm-Message-State: AC+VfDyulQdhz7EZ8oARRqfsYAvkF8HBeTnyvZTfOjg7UZeDyoYD90sX
	F9krLBLk5tU5QiT7bloGnk+3QFx+w3dIXcsFW/R0UtlCHST2vmMBYK82aQ==
X-Google-Smtp-Source: ACHHUZ6Jq2PkCbWouiId3Xvh8iT5i5upcq5CZ1vO0D2LXYMp/AXY6FxhVUthuD1FQL97hQ4V+w2wVwU0GUCDXCtDklc=
X-Received: by 2002:a05:6102:407:b0:42c:78e4:ef23 with SMTP id
 d7-20020a056102040700b0042c78e4ef23mr11221944vsq.31.1686844174945; Thu, 15
 Jun 2023 08:49:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Jun 2023 11:49:23 -0400
Message-ID: <CAKwvOdk6VP4ejRJk_+Q_Smj_=Ly0dd8nyAiXJb+w18y6VJb7YQ@mail.gmail.com>
Subject: CFP: Toolchains Track at Linux Plumbers Conf '23
To: clang-built-linux <llvm@lists.linux.dev>
Cc: "Jose E. Marchesi" <jose.marchesi@oracle.com>
Content-Type: text/plain; charset="UTF-8"

(BCC multiple lists)

My colleague Jose Marchesi and I would like to announce that the Call
For Papers (CFP) is now open for the Toolchains Track at Linux
Plumbers Conference 2023.

This year, Plumbers will take place in Richmond Virginia from Monday
November 13th to Wednesday November 15th.  Please see
https://lpc.events/event/17/page/198-lpc-2023-overview for more info
about the event.

The aim of the Toolchains track is to fix particular toolchain issues
which are of the interest of the kernel and, ideally, find solutions
in situ, making the best use of the opportunity of live discussion
with kernel developers and maintainers. In particular, this is not
about presenting research nor abstract/miscellaneous toolchain work.

The track will be composed of activities, of variable length depending
on the topic being discussed. Each activity is intended to cover a
particular topic or issue involving both the Linux kernel and one or
more of its associated toolchains and development tools. This includes
compiling, linking, assemblers, debuggers and debugging formats, ABI
analysis tools, object manipulation, etc. Few slides shall be
necessary, and most of the time shall be devoted to actual discussion,
brainstorming and seeking agreement.

To submit a proposal, please visit the below.  Click "Submit new
abstract" then make sure to select "Toolchains Track" under the
"Track" dropdown.

https://lpc.events/event/17/abstracts/

Submissions close: 25 September 2023 - Participants notified: 29 September 2023

We look forward to submissions, and hope to see you there!

-- 
Thanks,
~Nick Desaulniers
