Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E233C6
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 15:39:57 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id fy5so3387024ejc.3
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 08:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=x6h3ZUYE+fSHbOcAtnhM53hC5fi6FUTsoF2x5uuPJ2I=;
        b=HeMQ8zAXI4QJmplndokyGN4KBA2GRue+xq74R5DjkSz15v0bKh6AhytDDiX37HKdpR
         ho0aHxKcelq9/L6PPYv9w2sMZURJjljYqPVMZ8dH8/fres9luFz8AHpK4pO9dGonPjXy
         0MmrvWv42qdBW0TVMQOjQ0rRic8iIwEMO3R/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=x6h3ZUYE+fSHbOcAtnhM53hC5fi6FUTsoF2x5uuPJ2I=;
        b=7VQp/NRh1iMhnws70w6p1+Rv5wiFZW1wY+WO23cZUC3zbciV+JLXzEGbZ/XpbLxkUJ
         NwKxvfBNfOg0pSaSGDgWGdcEaI5Nivtze3/kItwWrO5CO1KG3Jqnaj9MGIDjzKiRvLwV
         x+gt6TWQ2z67BZx8NE7CCUUp0RMQ1tlt8IQjSeg7WOOtqa1s0XKpGpCn+ji9uaMB62st
         EpBvtcMJksllM0QICTv//1TAcxRCSERBqgiuB26sbhmyH/uCmvzCO0gPjXtDKUpcyFRK
         QFhUHgEYABpVqLaZyo0umOXN1O6ZGn/NexA5l0Q72qHi1uA7NLtweU1H0EK2yJn8HA21
         6grg==
X-Gm-Message-State: ACgBeo3We/omku1g/51sIMUIE7k+7uWzF5G443zpbdNgMK0l5dtESPgT
	3YXonqpDLofteWpoNUDtCCViimNn7tiTCy6G
X-Google-Smtp-Source: AA6agR4pUVdgXFsB70wOH5lcPEDFF6ZYRN8d9BbTYQzToz7Pe/oOwJ/Qt3yBArZHizuwFiJBH59+4g==
X-Received: by 2002:a17:906:98c8:b0:730:7ada:87a7 with SMTP id zd8-20020a17090698c800b007307ada87a7mr25169098ejb.748.1660232395589;
        Thu, 11 Aug 2022 08:39:55 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id q17-20020a17090676d100b007308bebce51sm3644770ejn.171.2022.08.11.08.39.53
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 08:39:53 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id l22so21780729wrz.7
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 08:39:53 -0700 (PDT)
X-Received: by 2002:a05:6000:1888:b0:222:ca41:dc26 with SMTP id
 a8-20020a056000188800b00222ca41dc26mr11935404wri.442.1660232392668; Thu, 11
 Aug 2022 08:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YvSxeDkmwxcJL+Z0@debian> <YvUZ+9kJ/AvUMxzO@dev-arch.thelio-3990X>
In-Reply-To: <YvUZ+9kJ/AvUMxzO@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 11 Aug 2022 08:39:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivP4zipYnwNWCLF5cd24GLs3m8=Sp7M-CmmPva_UC+3Q@mail.gmail.com>
Message-ID: <CAHk-=wivP4zipYnwNWCLF5cd24GLs3m8=Sp7M-CmmPva_UC+3Q@mail.gmail.com>
Subject: Re: mainline build failure for arm64 allmodconfig with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 8:05 AM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> Right, these are exposed by commit 258fafcd0683 ("Makefile.extrawarn:
> re-enable -Wformat for clang").

Christ. Why is clang's format warning SO COMPLETELY BROKEN?

The warning is *WRONG*, for chrissake. Printing an 'int' with '%hhu'
is perfectly fine, and has well-defined semantics, and is what you
*want* to do in some cases.

I'm going to turn it off again, because honestly, this is a clang bug.
I don't care one whit if there are pending "fixes" for this clang bug,
until those fixes are in *clang*, not in the correct kernel code.

For chrissake, the value it is trying to print out as a char is '3'.

But even if it wasn't, and even if you wanted to print out "0xf365" as
a "char" value, then that is how C varargs *work*. It's an "int".

In fact, even a *character* is an "int". This program:

        #include <stdio.h>

        int main(int argc, char **argv)
        {
                printf("%hhu\n", 'a');
        }

generates a warning with "clang -Wformat", and dammit, if you are a
clang developer and you see no problem with that warning, then I don't
know what to say.

Nathan, please make clang people see some sense.

Because no, I'm not in the least interested in getting kernel "fixes"
for this issue. -Wformat for clang goes away until people have gotten
their heads extracted from their derri=C3=A8res.

This is ridiculous.

              Linus
