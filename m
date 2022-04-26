Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B277E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 07:09:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mo6zD-1oFHxB1QUN-00pgK2 for <llvm@lists.linux.dev>; Tue, 26 Apr 2022
 09:09:14 +0200
Received: by mail-wr1-f47.google.com with SMTP id s21so9346621wrb.8
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 00:09:14 -0700 (PDT)
X-Gm-Message-State: AOAM53251ecRcrctzqBQDKXsMlgJxlIg+sZV97oK29HwVFVFgOXxOP6R
	yML7cepMQZ9+dH1d/wZ/DCaBWbbhCr10s/ptS94=
X-Google-Smtp-Source: ABdhPJyitCaInx6Z72kT7HbV/L3WDZBD4emX0Kods9Wdg6Wr0aF21Su68bBHEfDdGdOQZlLetUdsQlPgJiAxbWD3KTA=
X-Received: by 2002:a5d:64a3:0:b0:20a:7931:5b84 with SMTP id
 m3-20020a5d64a3000000b0020a79315b84mr17597415wrp.407.1650956953878; Tue, 26
 Apr 2022 00:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202204261130.D9GY2vp9-lkp@intel.com> <15dcf5b4-a5ee-66b8-2762-db7728c9928c@kernel.org>
In-Reply-To: <15dcf5b4-a5ee-66b8-2762-db7728c9928c@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 Apr 2022 09:08:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2EB4k5oQDSK5n9RTGJv-Zwgijb-NG-qr7mCTz=mW9baQ@mail.gmail.com>
Message-ID: <CAK8P3a2EB4k5oQDSK5n9RTGJv-Zwgijb-NG-qr7mCTz=mW9baQ@mail.gmail.com>
Subject: Re: [soc:arm/multiplatform-late 13/18] arch/arm/mach-s3c/s3c24xx.c:683:9:
 warning: The platform is deprecated and scheduled for removal. Please reach
 to the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
 you still use it.Without such feedback, the platform will be removed...
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:W/Mpa2J8KQfoAN0PPNhy/VGGOzNcbmG9qEW4RzsEVmTrWIcP8E/
 8R62cEiK0XmTX3PTeHtwwa0ZrTMWVhRXwHjm0RsN4KpcpoPBupZNVNziEgWfKAtRX9avmub
 WWd9H/blpIDlllYTrnSqsYf23OcZpLFmyBz/LQCYskfM219bmCrOgYaDzZ8OHGqA9T5cgO1
 SFTPR2XXtfODD3wOt4mBA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dUuw182wFgM=:aaYjqyUEdl9SSG2n2VDUmZ
 brNv0rt5YfwqEhIKZfzOuEIY6VD6lNZeeZkU76u/r7r5j+IaKSIku9MPYl7QdKtu+Ws0q5h0y
 rUH9Sq5K5DnqBsxjuiDF+0bHw8dcnzDu/FaiB9MGRUkrZMMMeBDm+ba1TZqERrCGh9mDqUESD
 /PgP2e8w+uGzEpekbS9iY5yXdirSKPkL6G9T7KA2HaDBPGD0hjzmAj3veVxcRIjbeRiVh9F3a
 8/BMumOC9csBlqGKuQoUN0wVvamoaLRT4WCN7fh8Lqulcda9WT73FRZ4u2JbdfWPaqy9XUJIE
 vFC0UR3SUHujkpIgPlKDrKDriPN5CJ05/dIw2HMz8+igGFlibR9ejB+0AIE++Q4Lfn+IxQ81h
 ckFQ86bLTbI6QMwZFm5I0V83ni7wdODwb7uA7t83+xSKBcDjS+ru22s5ot3+pnrvgzqv9OMkc
 x/uHp7Bbu978dKQppEfDkpaom0FzvHU1wKMgD5p/4TBvf2/OHP0K20UCs0FmSB4MlvbfxWHch
 /Ril8e9ys6Xga2ehoVcaN0/7HOEN/z6yNzciehS1dhNmGawTUyPiLtz8YaXu2f245z4pZAI0a
 SidvoWZZ8PEnsoMXwc7NggPjjcpmEpDwOHrShiBWvgptY/+0AnxQjdf3yfQkliuEo67xg0WP7
 1y7LqCXl73tGJcC/6kMGNTn5ARKYSRhOB9vmu4oYvJex8w8Beks859Y94a93JxO+WZ7o=

On Tue, Apr 26, 2022 at 8:56 AM Krzysztof Kozlowski <krzk@kernel.org> wrote=
:
> On 26/04/2022 05:24, kernel test robot wrote:
> >
> >    arch/arm/mach-s3c/s3c24xx.c:177:16: warning: variable 'tmp' set but =
not used [-Wunused-but-set-variable]
> >            unsigned long tmp =3D 0;
> >                          ^
> >>> arch/arm/mach-s3c/s3c24xx.c:683:9: warning: The platform is deprecate=
d and scheduled for removal. Please reach to the maintainers of the platfor=
m and linux-samsung-soc@vger.kernel.org if you still use it.Without such fe=
edback, the platform will be removed after 2022. [-W#pragma-messages]
> >    #pragma message "The platform is deprecated and scheduled for remova=
l. " \
>
> This pragma is in purpose, so -W#pragma-messages is not helpful. The
> message will stay for 1 year here and ~2 years in s3c64xx.

I don't think there is much we can do about this, from what I can
tell, this is just the way that
clang prints the message, and the kernel test robot pricked it up
because clang has the word
'warning:' in the output that gcc does not:

$ echo "#pragma message(\"message\")" | clang -xc - -c -o /dev/null
<stdin>:1:9: warning: message [-W#pragma-messages]
#pragma message("message")
        ^
1 warning generated.

$ echo "#pragma message(\"message\")" | gcc -xc - -c -o /dev/null
<stdin>:1:9: note: =E2=80=98#pragma message: message=E2=80=99

       Arnd
