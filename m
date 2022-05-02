Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5A17F
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 06:39:31 +0000 (UTC)
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mzhzd-1o7BpY2trl-00vdne for <llvm@lists.linux.dev>; Mon, 02 May 2022
 08:39:29 +0200
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f863469afbso113996257b3.0
        for <llvm@lists.linux.dev>; Sun, 01 May 2022 23:39:29 -0700 (PDT)
X-Gm-Message-State: AOAM5309/DwVy8ENGRHZ6WyiBOssxb3gnQ3zAFujIB/Bfz/9MhTsYsKP
	XEhFI8PttZB9IHYwyAD3kMKrBJR2tNDAiqkB/oQ=
X-Google-Smtp-Source: ABdhPJzE5OwpHzpXPFEJtsLJFYHLxPubCpwCFMQg0sr1QksMReTLI4jUw6Ctec+D9T/Lf1Yk2XlAE95Ueu1oyO8PiT0=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr10502132ywk.209.1651473568501; Sun, 01
 May 2022 23:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202205020811.kEEGO8QC-lkp@intel.com>
In-Reply-To: <202205020811.kEEGO8QC-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 2 May 2022 08:39:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Cq5oa8e7SAQ-mOGnytEjnOa4esr1gsfsS3ceH+A2f2g@mail.gmail.com>
Message-ID: <CAK8P3a2Cq5oa8e7SAQ-mOGnytEjnOa4esr1gsfsS3ceH+A2f2g@mail.gmail.com>
Subject: Re: [asahilinux:asahi-soc/rtkit-sart-nvme 4/6] drivers/soc/apple/sart.c:284:4:
 warning: format specifies type 'unsigned long long' but the argument has type
 'phys_addr_t' (aka 'unsigned int')
To: kernel test robot <lkp@intel.com>
Cc: Sven Peter <sven@svenpeter.dev>, clang-built-linux <llvm@lists.linux.dev>, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:WEWocu+1YPJJi8rXefR38vbY+75it7JV7HHOuyc66hdK1KLQLvk
 r7zYnWsVU8/uzl8HSmAYiqye02hANqdThu4zCzfUVePQIAWaL/QcqKaYPCMnlkQD8bkXhni
 T20FywxEt7tSw4c1M43Chjv9ln7478DdMi9ZjXKKizI+V4nHcDIREXgOmP7x6iq3rFr1LJn
 ao/vyVC7XfZTKRAPoa6iw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YqrtPzTjVBQ=:PMC7QThjgvP1Jb1Xsao/0t
 XfBPqu+D3InA5j+bWwuyRmJldRU1Jwb5eunZiWZbJdb3/DzUB1Z2+dVs2zxpFwOEb6s6nMRms
 x30PmT6ojhkGSNw7aumtue22/Tn+uaTlklRym/GoqNG9bm/7DAVacOL3V+Cbn08JwCfzMEkqf
 U7omqfuux1aRE81H114zGYBSu8w4eQvOZYD3vGdIGFRL9MQxRsYY90jWgYncD0pjaFTpDEdry
 M+Hn/QdD+xSSzgvsNJrUkDeb7McBpCXmZBiBGs1IfKIC2j0QgHUBvJx0bk+Izud1wvR1z7v+6
 /erGHxVKvxy+D4wGLSL+VgJrfYvSIqs06cS4CJvo4hh1sRtnWkoHnIS+8Rm/iK8P8eeaYn/KD
 pYC6W26y8QHMl022D7LK95krkE3CIE348M4k3Wqxjm/nmp37w3Y8iYSx+6lgIL1h+kCaTPm63
 AYKlbbb7fBHiKVj+/zuFrxYgAYcreePL/dgw+pAfh3y1oFUFLkm0kWnezNNJfjTWwGwsFagJ3
 EUUS3/W4vWqv/fzDFIKf/0LvwvhX4Ez5dvq/wOc3/4uDbmHDmdSCxTOA7X8yGdRK/AgMI4KrZ
 IiITtFSRnpxHPdVa+5KmpVMjXaLWPGhYqTlm2RwVLEI1pygptdW8KakfD1OPo6XesbhkHnCn4
 oDz9JONFoamT7zyuRBE//mWmBq67Ar9DwPibrAoadOvBOypgTMboPw6HV5UO1woz6ZTc=

On Mon, May 2, 2022 at 2:21 AM kernel test robot <lkp@intel.com> wrote:

>    277
>    278                  clear_bit(i, &sart->used_entries);
>    279                  dev_dbg(sart->dev, "cleared entry %d\n", i);
>    280                  return 0;
>    281          }
>    282
>    283          dev_warn(sart->dev, "entry [paddr: 0x%llx, size: 0x%zx] not found\n",
>  > 284                   paddr, size);
>    285

Hi Sven,

to print a phys_addr_t, you should pass the address by reference and use
the special "%pap" format string modifier. I'm not entirely sure if it should
actually be a dma_addr_t instead of a phys_addr_t. If the type gets changed,
the format string would become "%pad".

       Arnd
