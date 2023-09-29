Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D2A658BE
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:17:50 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c364fb8a4cso130962695ad.1
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696015069; x=1696619869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9Agy5s4S8M1IK3kKW72b7BGJqP7wh82OnywEz1kIDU=;
        b=JuZtWJ32G+cc9MyQT4PW1J4NSdwCgdqHfNTW10adgiH7dLVuvVRpBUsTMD8orDYMmk
         Gxbs8L50Mu0fzRjprqln/a3TKSPi+Jw+BTGNrLxOZmM3T8qCyQKZ4rhGCq0nQIi4zWh+
         wrql3gD2Gau87GcNchzvQiWGPgjol9ONthp30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015069; x=1696619869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9Agy5s4S8M1IK3kKW72b7BGJqP7wh82OnywEz1kIDU=;
        b=bmQMX5HOFtlW/vzTQNgcQiOVQcqP5k2TDy7KjgvltjsgBP3HKszmcSjds0bTyxI6SC
         6SQagL7FuEsZkKtyvXHRbKuObSDY5tGM/Zb8DIyi3gQ0mPxD4r4qi67uUJTXfv+6dDI4
         MRYlbqwVw8PHUEG1jQP+djJsqGKzErp1u4mSLn8YC/Jl3Gmx9daLhK53n15bkRrGXldy
         ML6McDUvrXRFaQhfDOT0SoBn4O7zpW1CV0yndK7IR9be+dOCeHSq6L1OyQso0q17XH1s
         3CN68JlTOO0tlR8CBRrV3s9YCIHPbWFhxjxGo2LxgqXyUhVjcR5syQcD2V5WU+yjYOxb
         eRBw==
X-Gm-Message-State: AOJu0YzDuOStThITWwVPFtHrM/MJJg0RgjE9+koHjzrMUnmzifVfFQIf
	UUVErc2hHd0OnMrC/GHmK/aKiQ==
X-Google-Smtp-Source: AGHT+IEVDhX/ETUEQbx2moy+5lx2QtId+M6PvXVx/7NtlV7iSWepfhzKC/QMvckGkhEfvGTPuEjidw==
X-Received: by 2002:a17:903:1247:b0:1c4:3cd5:4298 with SMTP id u7-20020a170903124700b001c43cd54298mr5884998plh.18.1696015069590;
        Fri, 29 Sep 2023 12:17:49 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001b9c5e07bc3sm17326434plx.238.2023.09.29.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:17:48 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Ilya Dryomov <idryomov@gmail.com>,
	Kees Cook <keescook@chromium.org>
Cc: Xiubo Li <xiubli@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	ceph-devel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ceph: Annotate struct ceph_osd_request with __counted_by
Date: Fri, 29 Sep 2023 12:17:45 -0700
Message-Id: <169601506494.3012633.9364328079132196540.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915201517.never.373-kees@kernel.org>
References: <20230915201517.never.373-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 15 Sep 2023 13:15:17 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ceph_osd_request.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] ceph: Annotate struct ceph_osd_request with __counted_by
      https://git.kernel.org/kees/c/b25373dde858

Take care,

-- 
Kees Cook

