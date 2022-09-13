Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670101C28
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 00:56:46 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id g8so5739980iob.0
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 17:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=139dsmbsaAd8MZiK3fSYiaJDkYkfmCamFM0JQ/i2eFU=;
        b=cLHxg5Gi5bsrTRwpBekrWl2BN8GhA/+EAQqn9bmiMpoMrKCmaE4enQIuIr/4ZzaqLT
         /nhe4/8cQZOr86K23uXGuIHN8fYFuPfRgfJGMjggCke1fPnWsRmCP+0tXzU6Q2iIoF7I
         pQLtqIcUXPBJCwRBvAITTiLM6BHwXS+RFbYXSvZ1vgPNCvzXLL6LqJiFPuZVyTS24/wg
         7WOtOnNv0E1K8+LMeMpMVwuv2lIfYml4N6lyFmVuKiwfvF2UMR5t14VLxwdl2+wpjI1S
         dq2Hy3ePWCVKVcOtXonYMeNn9k5PVJw4ix9kor+tPdkFWC8dhgt46oldlZqlGlYzF6rc
         0kSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=139dsmbsaAd8MZiK3fSYiaJDkYkfmCamFM0JQ/i2eFU=;
        b=TwHS6FFrhtrB4vMheuLFIpkw33Xf80xb9LFfMZPFICt2oin8hRxSfYeA730ZfjlDGM
         AjVnRYVAmUtAYfGF1MNUfxnbTIR5lly7jUzRKQWOMuyjSV2o2/UCkAuHp1PZflHyy5h3
         UcPIvCE3DtQfA/20/FJ0wtLrxeuRf4Zoqn0vxukRHoy9VaD/2Dk6NkyLLp1AHailCxBp
         htX4o5HaqsJX8C2C9XchLh45HpXXcKm9t8YXDnNQN0u+qZRNhv8ldL1RW91sWS/VqzZn
         WiDcE2if3xhJ+1vuod7r5pwJHlRYl2u3yIktGnpGMNeHN80FfYQ8w3veWynZxJ+se8U7
         IBHQ==
X-Gm-Message-State: ACgBeo3dW+uD8we4PFAsizm91GxupMJpQWcyrHhLow2tRWta2yW4O5gH
	rEE4JwAwdAeNfpQTd7FwiOG9ObXe7lCRou4ICB0=
X-Google-Smtp-Source: AA6agR6E6N6UNnoe9DxzrJyWBdSoaS90BbaZ6XOn5MwMsTfUdg5oZYv/dYaycKs4WAY5hqDW3Gi55KONm1OWZ5/k+G0=
X-Received: by 2002:a05:6638:1a12:b0:358:4c15:69a0 with SMTP id
 cd18-20020a0566381a1200b003584c1569a0mr10661537jab.15.1663030605494; Mon, 12
 Sep 2022 17:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220912214455.929028-1-nhuck@google.com>
In-Reply-To: <20220912214455.929028-1-nhuck@google.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Tue, 13 Sep 2022 03:56:37 +0300
Message-ID: <CAHNKnsR8jBbJ32mia_XaP3SLWfHNJsFknbrMa9MxZMQbnJ1-pQ@mail.gmail.com>
Subject: Re: [PATCH] net: wwan: iosm: Fix return type of ipc_wwan_link_transmit
To: Nathan Huckleberry <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, 
	M Chetan Kumar <m.chetan.kumar@intel.com>, Intel Corporation <linuxwwan@intel.com>, 
	Loic Poulain <loic.poulain@linaro.org>, Johannes Berg <johannes@sipsolutions.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 13, 2022 at 12:45 AM Nathan Huckleberry <nhuck@google.com> wrote:
> The ndo_start_xmit field in net_device_ops is expected to be of type
> netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb, struct net_device *dev).
>
> The mismatched return type breaks forward edge kCFI since the underlying
> function definition does not match the function hook definition.
>
> The return type of ipc_wwan_link_transmit should be changed from int to
> netdev_tx_t.
>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Acked-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
