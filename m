Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F3F7B;
	Tue, 13 Sep 2022 06:32:44 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-333a4a5d495so127849287b3.10;
        Mon, 12 Sep 2022 23:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UoQ28Kix9CadreRi69EyX+ldkRLWeLo2Q5k9iACgE4I=;
        b=Y1Q89KwkYzAHSigQEYEXus5Ug+5BK8mK25+4i2lyKTage4SbMj2vPVOakyK3XRQqN0
         XZBpGa5DBuVgbQDPbkC5p+eJYTETxHEO5atUNthgQxJI+RT9uCb6f/1V/UGSElsu0oy6
         tbHdy7UsZtmSe3Af42ehQ186k1aFEEyrfJLfNkbTfMA0NJEkxakM3b8wPyj7wA/lE9Mu
         ijxt+n/xhxH2Kn4rh5RwiN2t+sR9/KysFNGXcU+DR0wCk+9WJYK05vat0/ouEQQ+rRnT
         iOfnP+L3T/tW0ctyKyydMPkkZYeSx8BbiLiWo2lIB94I7B0bMqLAzJqVz1GKxBGEnNmg
         T3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UoQ28Kix9CadreRi69EyX+ldkRLWeLo2Q5k9iACgE4I=;
        b=kW8KtBLKHUEWvpcDNd965oD4k+27g6EEjVdXxHqT7+I2TpGQA5/3tGg+0YuIVKYyeP
         ntDkesz0rEFGAtrtQkhU/4kYzbc9lU1vAbDxwW54wHTzjGvGA9PcTSg3XVv9/la3BtLB
         wyu0U2mse/ro7kwstj84DnCKqe4+ve+gZ8Vbkc0Xr+DvhReSBKUfTgyZp7UhPG71d8FJ
         ZP2Zdtktn+ikxEh9ladxjYF1S7MdZ2WXYUHdMKc++4brOyu7Spnh8FI4NIOxfWhFVR3X
         prBmyRPvg90co8QFvdi9M0S721RnoUcBnIIs5LFT6lGaisDwuHkV8NtDFCQvGktc/qvG
         Scrg==
X-Gm-Message-State: ACgBeo1SoJNbQzlM89ZyLqIeQDk5p5VSftCVprctUHTjOyAwtiP9qlwx
	Aunpou+2dkhXS0EdlAAS+MjKuysNJaoAqDGSM/c=
X-Google-Smtp-Source: AA6agR7vJdcYJ1/d5RVqxccuCSAUIxaq24XEnGW9TXhYpfRs4skcLkMSg0t33aDJzr021LbOQwU+u1u2i7YknowD2Yw=
X-Received: by 2002:a0d:df93:0:b0:348:f7a9:97db with SMTP id
 i141-20020a0ddf93000000b00348f7a997dbmr12350017ywe.268.1663050763139; Mon, 12
 Sep 2022 23:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912214535.929116-1-nhuck@google.com>
In-Reply-To: <20220912214535.929116-1-nhuck@google.com>
From: Nam Cao <namcaov@gmail.com>
Date: Tue, 13 Sep 2022 08:32:32 +0200
Message-ID: <CA+sZ8B8RStBhofQ0=vvzH5FeQ66fj90DdCj9EQSaVErbVPLi7g@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: Fix return type of rtw_xmit_entry
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Pavel Skripkin <paskripkin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ivan Safonov <insafonov@gmail.com>, Saurav Girepunje <saurav.girepunje@gmail.com>, 
	Vihas Makwana <makvihas@gmail.com>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 12, 2022 at 11:45 PM Nathan Huckleberry <nhuck@google.com> wrote:
>
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
>
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
>
> The return type of rtw_xmit_entry should be changed from int to
> netdev_tx_t.
>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

I am unable to apply your patch. I think because of this:
3e0a6c4414ac ("staging: r8188eu: remove os_dep/xmit_linux.c").

Can you update your git repo and resubmit?

Best regards,
Nam
