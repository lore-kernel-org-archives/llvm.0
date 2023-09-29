Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209CE658BE
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:18 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c0ecb9a075so110441355ad.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015278; x=1696620078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilE7Vn1v/6L1xjJiSnZJWIX4iPYebLM1xUgfMUUBIXI=;
        b=E4m2Cw45IjZpfJGJ+YgDq+abAhZp9BDsyu16KD2pP4m2TYTJ2OYX/Wq6zYaQM//3Lv
         haLYBWynaHWiQyqOb0TQk7gN447IRTwJLIppUJMt75Mcdf/6cPHxfaT73REKSDKbCjbZ
         86ds3SKvto9qYocllPFnAVC9UI4xOEo0YVqZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015278; x=1696620078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilE7Vn1v/6L1xjJiSnZJWIX4iPYebLM1xUgfMUUBIXI=;
        b=r7E2or/s0EuOht2RSK6PbpRRjSnV1BoJMK1YdxLzJ86d2aS2KTtvedmyi/g65lMFa3
         I/B4Zbs4K5FvNnLEB67ex+njKT8IBFbVLsYXOaBL6H6Rw42eQTIpqpsfq2LAb4e8mYSE
         ANu7UJv93oyJXjxCOnTti2+LyfXwetD0BYgq3WS/qPRC3bpqKZ+Vbpu59+FbMrtuALgS
         NBv/z2MWCSyy7T0Pz7IGYnpvTMgxBEfma0AvCtVB3+KeEEBoQTG4VjJpGGAizo4ze5mH
         4Vy37m4DLPHLS7pnVsBUF7WNEiKcAUcS7yOsqMV8rwOhA8epYZ/AQ46MQm7QFhbs2PfK
         4DYw==
X-Gm-Message-State: AOJu0YyCPMne1qWUzH29cvaDfm1Ix8a+X18f1TtfvD/t7fXt+yIeLfxk
	LoOMvsI0kqSVMuQL/SBN+2eGpg==
X-Google-Smtp-Source: AGHT+IF0tQMM6MXJc6XxNKRi0sTdKpt1DN5cZbXrTlB5Mp1e+iC1EFDxKCNZm0dE3mY+fujU5z55eQ==
X-Received: by 2002:a17:902:e549:b0:1c3:d07f:39f7 with SMTP id n9-20020a170902e54900b001c3d07f39f7mr5943508plf.62.1696015278370;
        Fri, 29 Sep 2023 12:21:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ec8400b001c5f62a639asm13455348plg.196.2023.09.29.12.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>
Cc: John Keeping <john@keeping.me.uk>,
	Peter Chen <peter.chen@nxp.com>,
	Hulk Robot <hulkci@huawei.com>,
	Allen Pais <allen.lkml@gmail.com>,
	Will McVicker <willmcvicker@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	linux-usb@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_midi: Annotate struct f_midi with __counted_by
Date: Fri, 29 Sep 2023 12:21:12 -0700
Message-Id: <169601526970.3013632.470911371867487341.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915195938.never.611-kees@kernel.org>
References: <20230915195938.never.611-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 12:59:39 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct f_midi.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] usb: gadget: f_midi: Annotate struct f_midi with __counted_by
      https://git.kernel.org/kees/c/cfe2af2d553f

Take care,

-- 
Kees Cook

