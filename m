Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD39179
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 12:50:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MhUHt-1ntfkT1EDz-00eZqX for <llvm@lists.linux.dev>; Tue, 01 Mar 2022
 13:50:22 +0100
Received: by mail-wm1-f43.google.com with SMTP id i20so7465220wmc.3
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 04:50:22 -0800 (PST)
X-Gm-Message-State: AOAM532AC17KSFZ3fN15NVHOXFjvbfK0QCNMdGg3WBzopnsEEGuIx3de
	P51VwrzHfzVmpt2gCEeOENVtbKzx0ZVz8i7YELg=
X-Google-Smtp-Source: ABdhPJytdTxJtkfXAnk62a730WbGV02Ap40kBNu/h4zTCFtb0XEDgbyKRkvPnZSSqZTWRXdIzJY0v/IM8yqEmoJwMRM=
X-Received: by 2002:a7b:c001:0:b0:381:1afd:5caa with SMTP id
 c1-20020a7bc001000000b003811afd5caamr17002800wmb.35.1646139021712; Tue, 01
 Mar 2022 04:50:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203010702.6TRDNN1H-lkp@intel.com> <20220301121434.00003287@Huawei.com>
In-Reply-To: <20220301121434.00003287@Huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Mar 2022 13:50:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1by0F4QpLfKc-uSCpV+usngujy0rnVZizucbYw6fPm0A@mail.gmail.com>
Message-ID: <CAK8P3a1by0F4QpLfKc-uSCpV+usngujy0rnVZizucbYw6fPm0A@mail.gmail.com>
Subject: Re: [soc:arm/soc 6/8] arch/arm/mach-pxa/include/mach/uncompress.h:62:6:
 error: expected expression
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:1jlGz1X/LwJ8kVXFb4UcXscnSUvOEw8lo2BXpcV1PyjDufnAP++
 Y6VUQk75ifwYoh974pXrKKxfNwlp5DZfw9hidDdZa42rXvPrpjJ41ZclRKdO5YdcYr4f33N
 c8JCHH5F9+a3mMWyqZvCRpUDx/g6XoBw230uIGCRv7IH+EHSPIJpoGbCw1ENkDUlTB9wull
 iKgX6TDXpFGNkY0BgoTOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A9+PsDYHiIk=:WwatRwov0p3GlGl+IWKNfG
 83tS88KG33KcrpV9NFgGboYHHQMfY60QarKVnkyqwct+f83NdhA+B2SabGfFJ8YNt0jSGIwGA
 +ib+BM9YfHEMpwxTym426h8KxVbd+ow+WUiVCFXm8grn9pxfcqVljaD+GagPk/YfzybJEG7Ck
 TvjLb2xMnzfQ/7O6/KgmjhliE4IXAuDMiwv+2QVgEWxILTchn+qwMIqrBKbGLXYF5MhDnGVnk
 r2xKVr/2YmnLfuFVZIGbwyThijwYvkTH0YSswjKb3u+UliyqtTXRuSrxdzqjPmVrJMRhsY6ro
 ngG8nvq4FsbvJIJ6WhH+XCV+NOp7MHnoZeSmhRzRsaf3JLL4nzIK5MXjZy78vvkxx95yylx3W
 cOzw80N2A6jJrhANY6m+wRImaQXxyIwcR79DxJiu/60DofJ0cAj/r4hPlFB4IaccCaxwwv585
 cZLcFMTWSKQgEPAcxNpymoh1sJpw1k8jdwhWBJ+yezKcTONYkqTpzgP41KOoW6MtpEzQ9bFdX
 cZZNNT4c4xO+0Flt7x1JfmaOFV4xGZNwiYuGg3yc2fZVwLdK3ueGMC9wHG2R0tcLGhorv93XF
 ZniU77MspKaqNCvfemdFkMLtIhd+qdFHZSYyaXMREpXoB3XZREYVC8KcircCFyi71gHAw8Yq8
 gDIgft9EXucXOCGZ+jJUoGKIVv+XBw4VOGHmQ+5R0PnTa75yl6VD++ePLUHDkI5rvbL3T13dO
 UEUJZIZ6iXf/Y9x4OtWYq2wW/o+J5XAc0BtFr1et+u4EMlZhFg8r4JeCv77RtOwwfvT9vAxge
 K4BW6jChSRyqi6rxVTr7cK7+MHrccHWBq256DdpE52MrT728Ts=

On Tue, Mar 1, 2022 at 1:14 PM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> > All errors (new ones prefixed by >>):
> >
> >    In file included from arch/arm/boot/compressed/misc.c:29:
> > >> arch/arm/mach-pxa/include/mach/uncompress.h:62:6: error: expected expression
> >                || machine_is_cm_x300() || machine_is_balloon3())
>
> I messed up a rebase so there is a stray || on the line above this
>
> Arnd, new version or are you fine to tidy that up?

I committed a fix on top now, thanks for asking.

        Arnd
