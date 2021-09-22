Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A403FC8
	for <llvm@lists.linux.dev>; Wed, 22 Sep 2021 19:41:43 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id e15so16297792lfr.10
        for <llvm@lists.linux.dev>; Wed, 22 Sep 2021 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UmFPDI1d5BzjEMka3R64lDEKaSGQ2Hx85mz9gwpZRwA=;
        b=qbq8Zgs5uRnbDmSRnC+R+QRizOxu1Mrjlod0TvDVT6S1v4IrWRyyxiV+tbRXR2PKI/
         60uTTaNViAb9ohODJFH6PJVVywtd2i0uqnSZvrEW7vqtrcfRQK4R+RLVjY9ZTWtAqo8H
         QayzzJqCKhc9/Th+jQKD4yHTpWFAaFWnKfCecSQ1AE4FhHhkRS8OZRH90uZ4Cmx8aO8L
         s+aIH1PGDNTW7koujDzWi27//z0xFnJsD4kwzZ73pqzcA3ZYeG6BTITR4x0Xa+d6KNhO
         1bKuDj6MJR0PYRLSRzQQc4LErzQJ/67ZMK7G7jF6SzTVz0imZNFRw1qSDfukZ/jG2ERV
         TJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=UmFPDI1d5BzjEMka3R64lDEKaSGQ2Hx85mz9gwpZRwA=;
        b=7Cu5TD59MhE7z8eCk7cNZxmrDDuDKD2U/Dcz4OfgtOW1pkLeLwGkfnv4tAoA9wEJeg
         +pRyuFBE4g04pvSFnMcL12pkHcUb5ljc1wKIhu51O411RP2VGaWHNRSD8K1rARNpbNBy
         X9SNLv3fag/noPJHIieXxsnhnyYQ/UeQvMNHth7DEN+vIeALIEaDXkMlj6DbNZz5eoKc
         ezEBRMv9Uqg2cPSdAw5inme3a8QMZ+yQV+rwcNjF/sOF59kiW98nrjfLq9wz513CxO4H
         vqTmKp7nuzlh8/gErWj8mp1vJCVRU+4WQ4MO8umQPNAGEoGtnakXwM3D7oYXT5MwiwD+
         dG2Q==
X-Gm-Message-State: AOAM530F+73j4HpxZrQ5vgbSpECqtHwh7dukm/3ECBSEdwCZT8qTfNtm
	t3dOpEV+6FO0ldUSWKQlkMJF8fGd7E01EmmOh8KMbHQ5i5U=
X-Google-Smtp-Source: ABdhPJwwUcQamMVk1UuFs1G8akbmA9DywFseXHYV72wggUSp8rqDeWr4sM1SHKxH09ukSaEWIaMiEWNQrI+d+QNf8g8=
X-Received: by 2002:a2e:750e:: with SMTP id q14mr1062874ljc.338.1632339700810;
 Wed, 22 Sep 2021 12:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000000000000cf6d4005cc9ab191@google.com>
In-Reply-To: <000000000000cf6d4005cc9ab191@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Sep 2021 12:41:28 -0700
Message-ID: <CAKwvOdkZnkk8SszKOdEkVvTjk0L39FhxO_jfDoAzaYLEeb6fTg@mail.gmail.com>
Subject: Fwd: Clang-Built Linux Meeting Notes - Sep 22, 2021
To: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

re-forwarding as text/plain

---------- Forwarded message ---------
From: <ndesaulniers@google.com>
Date: Wed, Sep 22, 2021 at 12:41 PM
Subject: Clang-Built Linux Meeting Notes - Sep 22, 2021
To: <ndesaulniers@google.com>, <android-llvm@google.com>,
<clang-linux-fellowship@google.com>,
<clang-built-linux@googlegroups.com>, <llvm@lists.linux.dev>


http://go/clang-built-linux-notes
Meeting: Hangouts Meet

Sep 22, 2021

Bill describing difficulties in implementation of zeroing callee used regs.
Plumbers (Toolchain MC Friday)
Almost back to green in CI now that we can apply patch files

TODO: re-enable -Werror for allmodconfig builds

Arnd=E2=80=99s randconfig W=3D1 builds almost green for GCC and Clang

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=
=3Drandconfig-5.15-min

Kees had QEMU buffering fixes for ci
Nick bootstrapping llvm against musl

https://reviews.llvm.org/D109837
Try -DLLVM_HOST_TRIPLE=3D


________________________________

Sent by http://go/sendnotes


--=20
Thanks,
~Nick Desaulniers
