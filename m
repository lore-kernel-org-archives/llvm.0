Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D9133CC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 17:43:32 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id m13so6173986edc.5
        for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+gmIONhiXxkz2QJGmvVZScE/IgGuCeLYBs+pSoO9pY=;
        b=RGPUIhfoMFuO8Nz6WNTx5S6fXzIrWaujiJ8+ZVTxL0UMEI1w8YjhuXZASMY/1PkOEf
         wrDuh+xkXq2veGdBhkHADlnD4KK3QudpUdUqUjmMlq/vBQKFdgpt1N1bySIrbFRiMqRp
         J4wVHKuRL13W3MVrXhJqtIAOdKm6cxzUE9NHXqi9vJYyBI2WiBMGPxXA2P5dO9iazDwA
         F3iog7f555bBhhktMA8gyzP9Wz3NVFS3Q93ZkRP9hbfl5Loq/B/du4XHpXhcMQbQmvMt
         ZAa/A57EtA/Hz2P8PJkHCI5B/Sf4YdG/SG+J/fMPknvUi8mjM8GKfDPYvzEdQc+XdD97
         oVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+gmIONhiXxkz2QJGmvVZScE/IgGuCeLYBs+pSoO9pY=;
        b=T2AP4xYzservIKWN+dQtXqIclS9X45JtSxlYzECTLD9YgDghkjirHKOOd9cQN4k8H0
         rLNOlyQWvdCZtyt9CgbkJXU4TtabJxxrshv2mb54gVwct4joBEkQY/2eZk42CGJBl2Gq
         /BUo1R2pcHAeLJL7zm5QaK0qCraByGZSko+9uRMr/OEiu2xrebN4qowV3Lw4JQEMJeC8
         vwgbIbPBZ1mEUtTEP8eVlCFa98wfhn8RVSPuv58kEP5UM2f8zw22gwsmHRzKcB5l2aE9
         +5EBodkQfWPVyBkOtGoAx5KanpgRm2ytXlxR8Dbm3IHXqCfjChmm4qBKZlH9PIw4gtjT
         XXcQ==
X-Gm-Message-State: AJIora/AwplmS1oUBWHsrQ67dMY58mo8wc3zekZyqzDF6eAkWwsCdI6g
	3CAIZ9i+iok5XgVQRcS0xF66VOb93s6nagWEo5K9kg==
X-Google-Smtp-Source: AGRyM1vE21LyXnyQ/OrPc3rCfEUlrSagjLX1JjDE56Zzri+Os/07JIqlU6uqq/K10QqFVfs4y8jvMIl1/dbEDe2aMQs=
X-Received: by 2002:aa7:d9ce:0:b0:43a:6758:7652 with SMTP id
 v14-20020aa7d9ce000000b0043a67587652mr38817237eds.351.1658166210314; Mon, 18
 Jul 2022 10:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Ys3DwnYiF9eDwr2T@dev-arch.thelio-3990X> <20220712204900.660569-1-justinstitt@google.com>
In-Reply-To: <20220712204900.660569-1-justinstitt@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 18 Jul 2022 10:43:17 -0700
Message-ID: <CAFhGd8p2o45-mw50=4dPxmpKe5kZf2t_p=vpy7T5vZt3VUkYiA@mail.gmail.com>
Subject: Re: [PATCH v2] netfilter: xt_TPROXY: remove pr_debug invocations
To: nathan@kernel.org
Cc: coreteam@netfilter.org, davem@davemloft.net, edumazet@google.com, 
	fw@strlen.de, kadlec@netfilter.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, ndesaulniers@google.com, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, pabeni@redhat.com, 
	pablo@netfilter.org, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Any chance a maintainer could take a look at this patch? I am trying
to get it through this cycle and we are so close to enabling the
-Wformat option for Clang. There's only a handful of patches remaining
until the patch enabling this warning can be sent!
