Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0B1C29
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 18:43:13 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c43b4b02c1so21255685ad.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 11:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695408193; x=1696012993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G45tsaRVnQarxNiDw5nhtDFW/SFrpMwDHk6k5h9JLNI=;
        b=KP/f5bCdq3vDYCKj8Xc/ZSZ42c+w0dAUxrYlCLyQ0+S2cbZBTcMigw8iXNJc7ptUDp
         JxuM2DvhgisaLd9aPL747xGwdBlEAuzrFumcQ7CJoZg/dOdfY0rgSavgqrkyq77u8EiN
         Wmrx1jzaRGhxwhvTdvt38R6fSdKLJ1EptHeTcAjfHPyB0HBUNDju5YYGXEjBZLQEYXhP
         Kti6PDjsKO0aajoorsxVG3XX3h/+hvj/1SRiTcYGKW4rMVq0AAxX3kB94t8dycog/JA9
         oRRRaGQWrS+cOkebQFRbDU2KrhlJ0H1DLaHDJfumoAz/s34DiICrXgdIGVjWwWC7Z7sm
         PDYw==
X-Gm-Message-State: AOJu0YyDG1MobdQYhtNoQLMxWCrhozgaIZX1zOCIJE4vflJ7b1WyEy6C
	Pd+RD3H2IMzEKfecXRc378c=
X-Google-Smtp-Source: AGHT+IHR0oww9NARymoguRZjRSZ1K8ZJLMCiQdWgkelQ549GZG1OOOSByrXeBlT/DbnRC/QW1exoXw==
X-Received: by 2002:a17:902:8604:b0:1c5:ad14:908f with SMTP id f4-20020a170902860400b001c5ad14908fmr221082plo.39.1695408192626;
        Fri, 22 Sep 2023 11:43:12 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([20.69.120.36])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902a50400b001b567bbe82dsm3809002plq.150.2023.09.22.11.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 11:43:12 -0700 (PDT)
Date: Fri, 22 Sep 2023 18:42:29 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] PCI: hv: Annotate struct hv_dr_state with __counted_by
Message-ID: <ZQ3gFXgoccQ7BE6/@liuwe-devbox-debian-v2>
References: <20230922175257.work.900-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230922175257.work.900-kees@kernel.org>

On Fri, Sep 22, 2023 at 10:52:57AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct hv_dr_state.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Dexuan Cui <decui@microsoft.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Krzysztof Wilczyński" <kw@linux.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-hyperv@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Wei Liu <wei.liu@kernel.org>
