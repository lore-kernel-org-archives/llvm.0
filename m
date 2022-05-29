Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B4F2F34
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 20:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E0EC34119
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 20:05:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FtDvl2gg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1653854738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Argr6fXaGYDKzuwZLxGJ6Cs/7Z2TaejXEWF6j6AcVuM=;
	b=FtDvl2ggpYN52LbT04SGAqlc/dUPz7q7u5DbC0YsmD9PdUfwqm+377yGchHKasMLDclPFo
	98h5cMmRTokCAHpVohQ+9VmXo2BN/HiHJwdtOVkCtCjExAt9XSLguMbb0950i4jhv4HW3R
	PvhYpiqXF58WbrCztmWZqhOrkj58RjM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6435dea2 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <llvm@lists.linux.dev>;
	Sun, 29 May 2022 20:05:38 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id z186so11805191ybz.3
        for <llvm@lists.linux.dev>; Sun, 29 May 2022 13:05:38 -0700 (PDT)
X-Gm-Message-State: AOAM531D65JX8Q7Bprjj2maDcSCT+SPyCiBeRzfBC4bLm6MNH6Zy1O0X
	vW3SqYO/F7m1Xumh+/YGMQuUbfsvlVb+ycM9PuY=
X-Google-Smtp-Source: ABdhPJwULGEIsmJKgeGNYz1n9HgknUk45ZJay3VTpYQPkm1miUfYn+LiLd7mt1QDPwEvYOcK+OOdJuws1rxLZ1/JNg4=
X-Received: by 2002:a25:7901:0:b0:64a:a1d9:43dd with SMTP id
 u1-20020a257901000000b0064aa1d943ddmr49533364ybc.271.1653854737532; Sun, 29
 May 2022 13:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:7110:6403:b0:17b:2ce3:1329 with HTTP; Sun, 29 May 2022
 13:05:37 -0700 (PDT)
In-Reply-To: <1031873030.1325.1653846880509@jenkins.jenkins>
References: <1031873030.1325.1653846880509@jenkins.jenkins>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 May 2022 22:05:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9qcCPuBy_7xrawTxAJhcB5skG+kmAXSKP050_RK159HtA@mail.gmail.com>
Message-ID: <CAHmME9qcCPuBy_7xrawTxAJhcB5skG+kmAXSKP050_RK159HtA@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by linux: crypto: poly1305 - cleanup
 stray CRYPTO_LIB_POLY1305_RSIZE
To: ci_notify@linaro.org
Cc: llvm@lists.linux.dev, arnd@linaro.org
Content-Type: text/plain; charset="UTF-8"

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ca7984dff94c091a68454b61eb754ec9d4b782a6
