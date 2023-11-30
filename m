Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA85EE8C
	for <llvm@lists.linux.dev>; Thu, 30 Nov 2023 22:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KeVd0Pe+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cbe716b511so1460091b3a.3
        for <llvm@lists.linux.dev>; Thu, 30 Nov 2023 14:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701381614; x=1701986414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3oJFeliwcGWQRUno3CXq/iefN/z87FyQUWuXF3JGq8=;
        b=KeVd0Pe+HMfxlDDXTj5QYgjwAQ9TteH7WMLyhcUKc1/A79ZhFX7eidcaOe8sbNcqLt
         6GBW6biEauRD52xk1pQyGokafrlrl/vmQtkQtD94sWI0GWaWN19D/OfASVUi4KxM+V94
         BhCu6TbQ+T1eKrX3mrfNjvy41w9Gq4A7zosM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381614; x=1701986414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3oJFeliwcGWQRUno3CXq/iefN/z87FyQUWuXF3JGq8=;
        b=oTYPz/TNodJ4+k+NkPanPgqJqfGqcEiQp4hlBPP8NR9tCcHG6qRefuOxuhLToo/Ide
         C5xmhpf6brp7VsUW39WwkHB+wG8XWD9UIDGaldq12Q8rpTcqdMURfPhIno//BRcqxuhQ
         I9FEiPPqkccmGO274ePWJrSdsjxyTNjOaVhtQOauaLt7B9IDxVNuy8mIXh2BfWU/cj78
         Njvn7eIIV2ESmj33nh9FBPGVJ9eAig2e7YlBjfYrGlfn/J5jkEOwL0L9SQ8G1qK9SSf4
         Hn440+oR5AwjMtoBTOttNK8t7lwmVApF5ar9SOH/3BF3qLWE6PAv03/6n4XLap8QJc2V
         rTog==
X-Gm-Message-State: AOJu0Ywa3acddGgMmPzs6BbxS0coFHE42I8vQRFpgNLtNxORS1vojX4u
	Z7Osv8In7aBS976TBoNMDYp/Cw==
X-Google-Smtp-Source: AGHT+IHXj/e2zptmeZA5+AQNZP+QCtXebes1TXUPHkf0woeufQzAqe9Ylzhwe1YtCnXulknD2ks53A==
X-Received: by 2002:a05:6a20:e123:b0:18b:fde7:71ac with SMTP id kr35-20020a056a20e12300b0018bfde771acmr23958783pzb.60.1701381614459;
        Thu, 30 Nov 2023 14:00:14 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78691000000b00690ca4356f1sm1699814pfo.198.2023.11.30.14.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:00:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Bryan Tan <bryantan@vmware.com>,
	Vishnu Dasa <vdasa@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] VMCI: Annotate struct vmci_handle_arr with __counted_by
Date: Thu, 30 Nov 2023 14:00:09 -0800
Message-Id: <170138160625.3648908.9493256732138039199.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <56bef519d982218176b59bbba64a3a308d8733d5.1696689091.git.christophe.jaillet@wanadoo.fr>
References: <56bef519d982218176b59bbba64a3a308d8733d5.1696689091.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 07 Oct 2023 16:32:34 +0200, Christophe JAILLET wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] VMCI: Annotate struct vmci_handle_arr with __counted_by
      https://git.kernel.org/kees/c/81c643edd8bd

Take care,

-- 
Kees Cook

