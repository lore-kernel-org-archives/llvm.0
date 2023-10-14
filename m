Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC41CF80
	for <llvm@lists.linux.dev>; Sat, 14 Oct 2023 19:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-694ed847889so2595993b3a.2
        for <llvm@lists.linux.dev>; Sat, 14 Oct 2023 12:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697312541; x=1697917341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3Pgxs65bzmqRGU8eNhxQM9/CMPLQ60nbxboGtVM7Ts=;
        b=nHIXUWBevf0APgeJDt05+aCPCN3iIh2kG/p+mErdlc1PesKxF5yxcq7zn0wMRN2oHe
         /IJY3/d/w/NKKvjFnvpWY7o/ZN8vG2SnBFTBYtxxTXurfdtLf4cBt12yT/b2ssVO51DT
         ziYXkFA04APQmS/2vihJ/hKZJpNDjHMuj2vb38YgN4Tdvd+KF9VhyI8v891FWvaAxwV4
         0/uELD8Ms88sf14OMFX2WYnCjkGRs/l45vZNdL1dnwNM0Ww4dkQ3pX2Z7OJlZH8dsBYQ
         DaHnBYqWl9e8zLOFM7hu+/FBopuB/islSbRpPmiQPRWwh74E4K5RkYP7GhalBtlj49rO
         DbJw==
X-Gm-Message-State: AOJu0YwQex0UZn2Yw6icqgYxZ+g9cV2WNWLydFt3/slH2vP1QRlsItB8
	nO9HfEg5we4p1khOo76zHig=
X-Google-Smtp-Source: AGHT+IH9SsXxFtZ7hhyfnLmTYErPL+SJUkVcK5yffxgXrGSKgMglp9OxgidSatV+IqZVNbRAvPokEg==
X-Received: by 2002:a05:6a20:430e:b0:121:ca90:df01 with SMTP id h14-20020a056a20430e00b00121ca90df01mr30647667pzk.40.1697312541143;
        Sat, 14 Oct 2023 12:42:21 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id h19-20020a170902f7d300b001c0c86a5415sm5889941plw.154.2023.10.14.12.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 12:42:20 -0700 (PDT)
Date: Sun, 15 Oct 2023 04:42:18 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Kees Cook <keescook@chromium.org>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] PCI: hv: Annotate struct hv_dr_state with __counted_by
Message-ID: <20231014194218.GA1246721@rocinante>
References: <20230922175257.work.900-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175257.work.900-kees@kernel.org>

Hello,

> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct hv_dr_state.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Applied to controller/hyperv, thank you!

[1/1] PCI: hv: Annotate struct hv_dr_state with __counted_by
      https://git.kernel.org/pci/pci/c/45538f68b052

	Krzysztof
