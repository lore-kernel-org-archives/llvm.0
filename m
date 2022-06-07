Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D4A2F48
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 20:45:03 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id u26so29390875lfd.8
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=on30OEe/DO5zamISOEay2WIQIU04GrMtf4oLpYULsi0=;
        b=qiK8I6WsrgYjyC91chUFuazIMqEbG3bN/GrHqaSMF4F8x6MV8QSOzCE71g3Nm8aqBY
         GkphlLTEkCrLci6izemxw/C9WRQBv0IXrmoR1/KWbahNRw7cGoDMRwr5A/9l3/GzShi+
         JRNwJT9PDXB63R0cJa3JnoL1VCWjQ1Cw1KWCrjyLqSoei6nvABDIIIhTw64rVpOQW1Kg
         q1rMMkLT+fM3bK5K1OUIlEHDQDNblUNPpHV3zEMjJkKkxaj0qLC8V8JO+mZY8C44m+YZ
         prF8n8lV7evp1UVmD7avSiGmHM86dDosTsCNkBqWSZoZeC8M3ague2Ctr85fdwk5aXGn
         nRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=on30OEe/DO5zamISOEay2WIQIU04GrMtf4oLpYULsi0=;
        b=yzJ/xKgW3WQsRZd8JahQgwPf+vV7qEg1eeUg7k+53qYtsAXJaoe4GG9qscClsdktKm
         SLTCKNgztmxtQx+KID6Qzv2a8aBBDT1pxSO93QQey2okZ9okA+sm0eDLvD/ab/btuf2c
         gKXxoP6PQRJhDaZ6bBbufemNSqd7WIck8U2nWwb0CuYcnGvmmvsPCNkS4Kw48BzE56+7
         tl9UKBDgpl5zxrIC8Ql17PLtNc/dgyCk+saBv8SPdD/rCoQkcLtKTLV8c/aQ3X4AVqZT
         6I86Pf23LhSSjgcFhWlUiRYpD5yILKen1ZT6Bd3MwCBRGaGsEToeMs0xnEU7zrltrcnf
         M6SA==
X-Gm-Message-State: AOAM530ot5j5O6NjfZadluQihbkT7Qlo0cv0KEeEG+NS3w9K88OOmsfp
	k2T82K4TTS5CieD2MM2Qndi+tWjsrS6eWfHlnn913g==
X-Google-Smtp-Source: ABdhPJydJnHSMFNA7KkWvxEBYxxyscRFA6vipqsuXxkhyRm5UrhSrOPz9WDL3yIG52KtyuSzUpI+acnnvERqzMf/7Ko=
X-Received: by 2002:a05:6512:401c:b0:479:7232:5444 with SMTP id
 br28-20020a056512401c00b0047972325444mr2089108lfb.403.1654634701789; Tue, 07
 Jun 2022 13:45:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607191119.20686-1-jstitt007@gmail.com>
In-Reply-To: <20220607191119.20686-1-jstitt007@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Jun 2022 13:44:50 -0700
Message-ID: <CAKwvOdkHb9W1dePaKAuSKv2D0e0uMGLGCZGeakzgD3ZWxf-2iA@mail.gmail.com>
Subject: Re: [PATCH] net: amd-xgbe: fix clang -Wformat warning
To: Justin Stitt <jstitt007@gmail.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com, Tom Rix <trix@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 12:11 PM Justin Stitt <jstitt007@gmail.com> wrote:
>
> see warning:
> | drivers/net/ethernet/amd/xgbe/xgbe-drv.c:2787:43: warning: format specifies
> | type 'unsigned short' but the argument has type 'int' [-Wformat]
> |        netdev_dbg(netdev, "Protocol: %#06hx\n", ntohs(eth->h_proto));
> |                                      ~~~~~~     ^~~~~~~~~~~~~~~~~~~
>
> Variadic functions (printf-like) undergo default argument promotion.
> Documentation/core-api/printk-formats.rst specifically recommends
> using the promoted-to-type's format flag.
>
> Also, as per C11 6.3.1.1:
> (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf)
> `If an int can represent all values of the original type ..., the
> value is converted to an int; otherwise, it is converted to an
> unsigned int. These are called the integer promotions.`
>
> Since the argument is a u16 it will get promoted to an int and thus it is
> most accurate to use the %x format specifier here. It should be noted that the
> `#06` formatting sugar does not alter the promotion rules.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <jstitt007@gmail.com>

LGTM; thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Don't forget to cc everyone from ./scripts/get_maintainer.pl!
$ /scripts/get_maintainer.pl
20220607_jstitt007_net_amd_xgbe_fix_clang_wformat_warning.mbx
Tom Lendacky <thomas.lendacky@amd.com> (supporter:AMD XGBE DRIVER)
"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING DRIVERS)
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING DRIVERS)
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING DRIVERS)
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS)
Nathan Chancellor <nathan@kernel.org> (supporter:CLANG/LLVM BUILD SUPPORT)
Nick Desaulniers <ndesaulniers@google.com> (supporter:CLANG/LLVM BUILD SUPPORT)
Tom Rix <trix@redhat.com> (reviewer:CLANG/LLVM BUILD SUPPORT)
netdev@vger.kernel.org (open list:AMD XGBE DRIVER)
linux-kernel@vger.kernel.org (open list)
llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT)

> ---
>  drivers/net/ethernet/amd/xgbe/xgbe-drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
> index a3593290886f..4d46780fad13 100644
> --- a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
> +++ b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
> @@ -2784,7 +2784,7 @@ void xgbe_print_pkt(struct net_device *netdev, struct sk_buff *skb, bool tx_rx)
>
>         netdev_dbg(netdev, "Dst MAC addr: %pM\n", eth->h_dest);
>         netdev_dbg(netdev, "Src MAC addr: %pM\n", eth->h_source);
> -       netdev_dbg(netdev, "Protocol: %#06hx\n", ntohs(eth->h_proto));
> +       netdev_dbg(netdev, "Protocol: %#06x\n", ntohs(eth->h_proto));
>
>         for (i = 0; i < skb->len; i += 32) {
>                 unsigned int len = min(skb->len - i, 32U);
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
