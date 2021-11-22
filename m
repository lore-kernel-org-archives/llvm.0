Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6C2C82
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 09:55:11 +0000 (UTC)
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6295F3F32D
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1637574903;
	bh=XbrI8v5SiK/lQTgcd9wq3mq2WEL9a4Q5EFr23Q5MMJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dZLy8DdZnNife9klg87unVGKzWJIoRfQB0NaqTHY7sqdB5jj7nNCFS7sTrYvM/kOC
	 CGZhJUKDX5yoSJmk9wbomT4Dzof16bTD63LsH2zGEzMXaUAqWyfeAcw2wQAaxDPrwz
	 pvPSDb/qmeZ3Sln/kepduX7NQ85DaVYeRjOr/szTNbZT+epUT++fHoYQEhnLVnTvcg
	 auseX4tQhYUoBBRsDMljs2/41py2MwCOGvsm2d7rJJO9Ou8Z3OjCf7DPxSjFyCXeET
	 cdiDtO/GsuVX3ITCFOGf30xfyR4XdD6IcMQYQMwvuwhYdmfM+S9o09YTwqL7y9X7GX
	 xn8OHa0G1T93Q==
Received: by mail-lf1-f69.google.com with SMTP id m2-20020a056512014200b0041042b64791so11815842lfo.6
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 01:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XbrI8v5SiK/lQTgcd9wq3mq2WEL9a4Q5EFr23Q5MMJw=;
        b=FrSME4W0B71KIbOlYvquSpBQenrqtHQqUYb+VksBhrDBrxxObgnOgXubdzK2t89I08
         IrNCwhjGbIdmP07uREeCyUmQ0XnUoT5LTcHBN2EfFYKGeZKW+eFQOBlPQlX5/Gvo4Umu
         S6Mw7oomkLvpHEbL+5LK9uT3JiC32atIhVHstwZUUT4PaqxCaLDaBiVQJXSRGn/mYNVs
         fGm79HGEbMf7o+PwGChHNTjircS/WhkZ+wkFUpkkaOFdKeyjNQJtAsRPaf+rkx/rz/ZW
         5ZpqUfleCiu6V4wUoxD/uDoH3/nlRs/MaGKI7nBKi5r6rKfCPY8XMHU8OUamjkNWQ7wG
         BWcw==
X-Gm-Message-State: AOAM532czs5Li3jTYG6HA1AyhvYSGjWG+L/4FFpBtbPZML0ejEo3LO3z
	2x6VVuYQRxDV7nIT7n8gf+euf2daVEG21vtEMKwQGhFypgnYj2kwSREdqCWLa2gI1GucSU0g2jk
	rRQIIuf9IoAuUZfR7lY/FSsF+G+l5aXI=
X-Received: by 2002:a2e:9d05:: with SMTP id t5mr50466595lji.192.1637574902738;
        Mon, 22 Nov 2021 01:55:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwke2myThe8Gt/0eU50mIFwZeGa186M95bQ6FjvfYp1F25HVbkpTO5cJFBtu8Cq5yDswcSrbw==
X-Received: by 2002:a2e:9d05:: with SMTP id t5mr50466583lji.192.1637574902588;
        Mon, 22 Nov 2021 01:55:02 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u22sm908676lff.118.2021.11.22.01.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 01:55:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	llvm@lists.linux.dev,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Silence clang warning
Date: Mon, 22 Nov 2021 10:54:22 +0100
Message-Id: <163757486271.327364.15013387046506082286.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211121180155.9062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 21 Nov 2021 18:01:55 +0000, Lad Prabhakar wrote:
> This patch silences the following clang warning:
> 
> | drivers/memory/renesas-rpc-if.c:253:14: warning: cast to smaller integer
> | type 'enum rpcif_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> |           rpc->type = (enum rpcif_type)of_device_get_match_data(dev);
> |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] memory: renesas-rpc-if: Silence clang warning
      commit: 2602dc10f9d930bcc537467d13de4cfbfaa2126d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
