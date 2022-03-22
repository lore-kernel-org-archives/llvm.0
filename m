Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A1A52
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 18:38:26 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id a26so13290794lfg.10
        for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 11:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D80ySFmBsx3NNLCSuiS2ulSu3CzLkzhJu1O5d7Yeia0=;
        b=BGj/qAj/CIZjHIYtdJd6+Vuiq1RG+X1DBLvxqqmbqp+eZgRVkx64QSB7iE2AqLihc/
         mIgD+h83xKB1b+5Duw/CRkt07LklXvjiddGvPZsj/XVa/HzsUMtEDYlGVfRtYoWthzza
         8sAmKfutzHNbnBxEmWXCPdyazYKMBzku/d4/iT2QYGQ9vRCuGE3/OtB7RiHRCC9JLdP+
         ptxdeoKMQHbqBxGEHVz9eEW6M8W/3LRSN40liJ7dYZJB6jlNvdQOvj3My9Zz4c8AP8qh
         6p25cq+oxZGzjke9g2A+n7agtk79KVWcpwtSjurvcgnQS2/GNvNtk94A+NxlxUkNRxDH
         AfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D80ySFmBsx3NNLCSuiS2ulSu3CzLkzhJu1O5d7Yeia0=;
        b=QViTcm07CSpFlSmU1X527wHpNgMSzCPJbURPV0QEan7vspfpLZIhmY4PugYn64Zotv
         WSSgfBDJ60S+QFcNCv6tg1UAMrAiRXZNbCuwZ60o1rDQW1mwpTRzbMArfLuvORraBUho
         hotFpFhnSj3JIzlPGb0tgU6NVVYpPc8lFQXQkDnBFUiu3LK6PJHhjJkKtIqKNSkxwtHi
         vqzE9s5gMCrAgw21jW2yqcARKDbhB6qd7jSnATmDJPGHubzkiSu9Z0C9zz92wbX4S2jw
         1q6etnslkONXLLdhda4Hq3l1c4/VQ0YLfFyhSZ4tZG2GRwIcgREaakMMtNs6/D61Y/57
         iXcQ==
X-Gm-Message-State: AOAM530z8VRaDl+bWr7XaTfo4/uJXs0jpH4ORsJSqLKUBU81Q2jmHXvZ
	JTD0OCDhT+jgKwimD+Ec2hgZLK7HOyo6/xham3Higw==
X-Google-Smtp-Source: ABdhPJy672VvhyeIyIjAVRfF4mLRJODEUnGZ3/5feXX2ykQinqIawhClI7hj0L6LFSzncZK/EEQCc3xzA55//DF7J84=
X-Received: by 2002:a05:6512:b9e:b0:44a:10eb:9607 with SMTP id
 b30-20020a0565120b9e00b0044a10eb9607mr13883136lfv.626.1647974304749; Tue, 22
 Mar 2022 11:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220322102115.186179-1-ammarfaizi2@gnuweeb.org>
 <20220322102115.186179-3-ammarfaizi2@gnuweeb.org> <CAKwvOdkEwkzT0uf9a5SokCScDTY4gbhNFZ+fLxsti9innaEZRQ@mail.gmail.com>
 <20220322172550.GL10306@1wt.eu> <CAKwvOdmr6u-zNynUDAg4pmwerQFUkG+eD0QhpzDED9eg+U2pfA@mail.gmail.com>
 <20220322175816.GN10306@1wt.eu> <CAKwvOd=LvBL4NTUWMc0rJ-3K+MU5rv-p+j2pfbuseGdiA2ccJw@mail.gmail.com>
 <20220322182448.GQ10306@1wt.eu>
In-Reply-To: <20220322182448.GQ10306@1wt.eu>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 22 Mar 2022 11:38:13 -0700
Message-ID: <CAKwvOdm1mVvVN1+c3gJEDz+__FF_yW484j8z7a+k=JVHC4FcKw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] tools/nolibc: Remove .global _start from the
 entry point code
To: Willy Tarreau <w@1wt.eu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 22, 2022 at 11:24 AM Willy Tarreau <w@1wt.eu> wrote:
>
> What I particularly like is that I don't need a full toolchain, so if
> I can build a kernel with the bare-metal compilers from kernel.org then
> I know I can also build my initramfs that's packaged in it using the
> exact same compiler. This significantly simplifies the build process.

Neat; yeah that coincides a bit with my interest in having builds of
llvm on kernel.org; having/needing a libc is a PITA and building a
full cross toolchain is also more difficult than I think it needs to
be.  The libc will depend on kernel headers, for each target.  LLVM
currently has a WIP libc in its tree; I'm looking for something I can
statically link into the toolchain images (even LTO them into the
image).  Will probably pursue musl (if I ever get time for this,
though maybe a project for my summer intern...).

One thing I've been looking at is a utility called llvm-ifs [1]; it
can generate .so stubs from a textual description that can be more
easily read, diff'ed, and committed. These are much faster to build
and reduce the chain of build dependencies (when dynamically linking).
Last I checked it had issues with versioned symbols, and I'm not sure
if/what it does for headers, which are still needed.  Within Android,
libabigail is being used to dump+diff xml descriptions of parts of an
ABI, it looks like llvm-ifs might be useful for that as well.  Not
sure if it's interesting but thought I'd share.

[1] https://www.youtube.com/watch?v=_pIorUFavc8
-- 
Thanks,
~Nick Desaulniers
