Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57165658BE
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:21:15 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c736b00639so18977995ad.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015274; x=1696620074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LW49HjAeDdFUYVHrqpmiXGwUFKL5qDwVnlMaVHIvZgA=;
        b=TuyygzkwLQx4EDQtzBB3miYc719E+wzEzdSpfiK/KOQr6sSOjNV4yNtIBiJPkX/phf
         P+Unk8tvqe5k9Zkit8zHdLB/KfT11vqA/yhqA5AqPY08W+LMLKZ2lcz52QiArOYkTLBn
         oKgp/m9ijrAP80Dj//NghAMR6BS4T9I+vEBxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015274; x=1696620074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LW49HjAeDdFUYVHrqpmiXGwUFKL5qDwVnlMaVHIvZgA=;
        b=mpetN0qLiyzrmL+YWiTZ3MZ7n9avAucsFZfkO1GOCEkAWR9owcS/qck116m+RogIWF
         JrryGHKwpEMvdH2e8Ikse4byCMtJKiIYcKlumlB9dqqiqDHEq6TBPXFGSQeXtpKrKejN
         s44AzPMznJxFuL78pvqIcV3swGj4jPAwZeFlGuGcVtEFbWQ2RxHf7Z4pv72z0fdok+HT
         uFKP+xMzX1RDLvDhtbsnmY0JnbpnO5W4ZN48L6sRQ7TOAYPi3HBiXM9qFaVTDU1CZy/b
         W5x3ibD1xGsUsT5TO4naytIfjMzElYtl9yrazSF2PoiH8ZpcbCfPPdmvcpuMSrrG04OG
         t6Ig==
X-Gm-Message-State: AOJu0Yyp3LMpX0pU+YjLBz7wsfii/h86D9f3W8gzsd9cxmXH8gjxv4QN
	bYtcSDRPfACePNRf3ih8kZGEmw==
X-Google-Smtp-Source: AGHT+IFqgSzjVU11V7YtNG7pPQTxvIcXDaDxaRn0PMHt1RkZSRJN+29nXd8ze3Jn9LTDaBVCzPc1CQ==
X-Received: by 2002:a17:903:22c7:b0:1c4:5e9e:7865 with SMTP id y7-20020a17090322c700b001c45e9e7865mr5825424plg.0.1696015274656;
        Fri, 29 Sep 2023 12:21:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u6-20020a170902b28600b001c61acd5bd2sm10606776plr.112.2023.09.29.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:21:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alasdair Kergon <agk@redhat.com>,
	Kees Cook <keescook@chromium.org>
Cc: Mike Snitzer <snitzer@kernel.org>,
	dm-devel@redhat.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dm: Annotate struct stripe_c with __counted_by
Date: Fri, 29 Sep 2023 12:21:05 -0700
Message-Id: <169601526975.3013632.9191876969851693974.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915200352.never.118-kees@kernel.org>
References: <20230915200352.never.118-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:03:53 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct stripe_c.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] dm: Annotate struct stripe_c with __counted_by
      https://git.kernel.org/kees/c/052b7cba53b4

Take care,

-- 
Kees Cook

