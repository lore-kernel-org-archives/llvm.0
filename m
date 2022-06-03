Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFBA31
	for <llvm@lists.linux.dev>; Fri,  3 Jun 2022 11:02:04 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id v7so5985464ilo.3
        for <llvm@lists.linux.dev>; Fri, 03 Jun 2022 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SGV5SsKbSd2QdHPl8LR4HxzpZDbxIoUIGiTmzmYRICU=;
        b=pTs3iB6pTzJtRvoxfh2eEuGwMr+d8vioWpsetePj816n7Tz/NNC3l3FSOFVCXMdeZk
         hLP1SWblTC+U/6yblN8X9EqpqlTpsWqNQ7byW1YxdPwSszlYgLPsHl3TUYr95POo++/A
         kEyw+rAg0a7K9btirU4Bcpt+Q0+NBAid/pLfIqCU6ytkFT9cUx+8LJ4FAwnn3a1DGDk4
         eQWpRiVM3vQyUh2MQrVRYdVSVskdGf2A4UWNvaOzYAh0AgQAIEHnUWoTt0J8b31q5w6o
         xts8eVhu8x+eR3ZtQxfybwkt3ljALAD+9jtOkE9DKO7+t9IrPieSsQoZwPB+Ls/iINT4
         XCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SGV5SsKbSd2QdHPl8LR4HxzpZDbxIoUIGiTmzmYRICU=;
        b=4dZObXCfXFFd5INC0VUag0RtDq+b4hbhRAh2ZgyYzL2mbkgGWsY9D80gDwOcgmS6x1
         h2rh7cGL/ENgFjRt6e0KB/mnj0NLpC86AoB3PMov/lmZAli9ZPOb4cbJNXpidre7qpil
         MVvF6tNMFkggurUhUQtSE30h7dwShExE6A6KxYANUDSprby6/M9JIMlr5coBmBBl93eT
         vHtwbxkyzPtepVAs2SElFNgHLYtkfLFKy6ex9RMc3FsHIrWTD8ZSkNk/vWAJ7J9Qqnt5
         w9/hiQ4KF+NrbdLY7QVvlznisjGFKIUK2jtx/xTt3enTqzjF6TlrOSQpasUdQ2Bp0Vg1
         GxRg==
X-Gm-Message-State: AOAM533sePiIBWrHUO08DlsdtH3SWM/wYBJJHHi4S1ostjKJv6J5UzrV
	9iyxilRC9IT5o605hxy28latuqawGCjPOXokvdI=
X-Google-Smtp-Source: ABdhPJxV7dB9gEgpQyA2p3QXnsAEKKA1bjMJgQFfQx59SR/96koLig1G7LYsfePBxG02Vo2liG0CZrJjqV9KdJVMJHY=
X-Received: by 2002:a05:6e02:1c82:b0:2d3:b7c2:1129 with SMTP id
 w2-20020a056e021c8200b002d3b7c21129mr5634371ill.237.1654254123233; Fri, 03
 Jun 2022 04:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202205240321.sb0gX2mq-lkp@intel.com> <cdd02535-b446-5547-4fdd-6deaf3fba6a6@intel.com>
In-Reply-To: <cdd02535-b446-5547-4fdd-6deaf3fba6a6@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Jun 2022 13:01:52 +0200
Message-ID: <CANiq72k69wUZxvCeJFH3=9LsyjT76XFcfbf5aKZbb-u91wMmkQ@mail.gmail.com>
Subject: Re: [rust:rust-next 2/24] ld.lld: error: kernel/built-in.a(kallsyms.o):(function
 get_symbol_offset: .text+0x5f0): relocation R_RISCV_PCREL_HI20 out of range:
 -524435 is not in [-524288, 524287]; references kallsyms_names
To: kernel test robot <yujie.liu@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, kbuild-all@lists.01.org, llvm@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 3, 2022 at 12:32 PM kernel test robot <yujie.liu@intel.com> wrote:
>
>  >> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x5f0): relocation R_RISCV_PCREL_HI20 out of range: -524435 is not in [-524288, 524287]; references kallsyms_names
>     >>> referenced by kallsyms.c
>     >>> defined in kernel/built-in.a(kallsyms.o)

There are similar reports for the same relocation type in trees
without Rust support merged, so this might not be being triggered by
Rust itself, e.g.:

    https://lore.kernel.org/llvm/202206010956.rOpdU4dr-lkp@intel.com/
    https://lore.kernel.org/llvm/202205280837.PPVZBhXr-lkp@intel.com/

Cheers,
Miguel
