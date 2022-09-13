Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B447B
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 08:15:53 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id r12so11869915ljg.10
        for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 01:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :organization:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date;
        bh=4ZZv5xCVVnY4y6rYdm7dulVMSoOLJlOJUQL0RHpll98=;
        b=qgXNIR8wAXAwWAJ6ChzaJEDc385w5xU5sTXNBOhucQiH7k5wNMoSwB+UxHaKcZZca9
         9krr/Mg5miP2No270CtLt0pKUNXHRG8hI/g7x2kFsYLe96seFldobIDrg95T2EzxCE9p
         XRcO2Z2AZn2ZC5h6pCCyeoVQ0o1xSti1hCS6pAbqo74OKoOjaplPCCkzhhWK32Uxn8rz
         hPk7hBPwY29iCrn+8fgA85kxNCEWwJJdCtLAyOtczPRP3z0Swvxc2hHaNbtjxmgQ60+K
         ppmTlRRcp5OlWHj1x4Qp+HCuM04ogniDaKSHnU/V/AnzwsMCJL5OqEd6kdoyzaEL7fqu
         89eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :organization:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=4ZZv5xCVVnY4y6rYdm7dulVMSoOLJlOJUQL0RHpll98=;
        b=e54Ex+wmoukINIxURUw3N9c+8f8/KtoGiYMBMdHh/lordQxpvkCND3KJj8mGo4GWeL
         7Tipms5mV/E4VTD6NrfbDC3zrwDtqlypYEVHrhblLWoIryo9oxROQg/EuGITVBPyYDwj
         EQLXN4BAUBBZbfmF2Pul1wqXEvjv0Lt1ZL/q1n94OSMLyzo6F5oOaU4OaqCtSgRYv7Ea
         UBcTQX1feEtA7FoyIWyQfeH4wM+95bdIzWYi8PlNZczwUxs2ocBkoda+VcEor9/jYc4j
         cAoydE9WHlOegOXJG1TKh0XIrBCZHxgiNXz977ISWq1d8NjYzQP/mygULlx3tEN2tqBV
         J3PQ==
X-Gm-Message-State: ACgBeo1jvjdqrS9TOlLbP4vEFcvkq/QPo9kAQHkn1V/1cjJ7sju7BfYg
	vhlr6K61BRDT3/v4rpr2A+g=
X-Google-Smtp-Source: AA6agR6yJVHuuaqQSsevIAm5TLHRMUDcbyGPp84h0+Qeu7rIxl3UujxKPvj36ABCMA9af+8S+DeYlA==
X-Received: by 2002:a2e:3e13:0:b0:26b:e6f1:ce14 with SMTP id l19-20020a2e3e13000000b0026be6f1ce14mr5735525lja.454.1663056951361;
        Tue, 13 Sep 2022 01:15:51 -0700 (PDT)
Received: from wse-c0155 (c90-143-177-32.bredband.tele2.se. [90.143.177.32])
        by smtp.gmail.com with ESMTPSA id p39-20020a05651213a700b0048a9e18ae67sm1554255lfa.84.2022.09.13.01.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 01:15:50 -0700 (PDT)
Date: Tue, 13 Sep 2022 10:15:48 +0200
From: Casper Andersson <casper.casan@gmail.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: sparx5: Fix return type of sparx5_port_xmit_impl
Message-ID: <20220913081548.gmngjwuagbt63j7h@wse-c0155>
Organization: Westermo Network Technologies AB
References: <20220912214432.928989-1-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912214432.928989-1-nhuck@google.com>

Hi,

On 2022-09-12 14:44, Nathan Huckleberry wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
> 
> The return type of sparx5_port_xmit_impl should be changed from int to
> netdev_tx_t.

I noticed that the functions that assign the return value inside
sparx5_port_xmit_impl also have return type int, which would ideally
also be changed. But a bigger issue might be that
sparx5_ptp_txtstamp_request and sparx5_inject (called inside
sparx5_port_xmit_impl) returns -EBUSY (-16), when they should return
NETDEV_TX_BUSY (16). If this is an issue then it also needs to be fixed.

sparx5_fdma_xmit also has int return type, but always returns
NETDEV_TX_OK right now.

Best Regards,
Casper

