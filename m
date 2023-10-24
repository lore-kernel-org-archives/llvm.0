Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB73A3E49D
	for <llvm@lists.linux.dev>; Tue, 24 Oct 2023 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T18dlPkS"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5ab94fc098cso2980484a12.1
        for <llvm@lists.linux.dev>; Tue, 24 Oct 2023 14:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698182350; x=1698787150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf0I5QNq2gKNhp+QWqAtgU2BkAhFb6b7w3QJr2Rt56I=;
        b=T18dlPkS/3DIxrIZaExjNwgasduX/KXG7D/uW6ECdkQFkJ5MAjmnk330XJor4QeqS4
         DyQ6Y0v+FWdYlsgoaC54LuKwUeepcgRC4aOyGwtzHVpkgZ6Zf49363nHfbmIzQCDCedx
         vMQv6a+sDAMwXCNOaLoylqfiuRUHSTMuTf70c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698182350; x=1698787150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nf0I5QNq2gKNhp+QWqAtgU2BkAhFb6b7w3QJr2Rt56I=;
        b=JjFviXLDQSwckDlKCPMVvqJbSK0l1rzTWabl5MP9aJyBwgB5fvS3RlxU0pHZqCOAxN
         MsFHYOQKGEEha99RmcooH+apvnesTeTlZPlBVQU75usKjzqWKj1fhQOLFVrwurC3yJAC
         Vbjz8qLhoMmINZJNZvYY5Aab0ZT5ChM2cXN3LpqJ1uIsckEM7v/ownUT2k3ME1HjZUrE
         Cr1W9onO8xxUfQnkTfBe6NjxMneBxlIumHFItP30d6Bl+IxUE0ZATH1Pm/B57M/dkUCj
         e9feZ8BgjM6y46RMtC24EQV6eya4bTclyUZLtYwCIQmjm9GzbNJhST7Y/rqA6rAxU1cO
         4i3Q==
X-Gm-Message-State: AOJu0Yxk1C276+RZJbDHp79RJI4jso5n4UpuAgCsdTar6rjEoO9Xv8W/
	OMvikazYfllaErhfL85rT9552A==
X-Google-Smtp-Source: AGHT+IG4QxdxC8vQGJgNfcCeZZI6jENfk4ntlbbjFZnDCc1T/n//1rqezHHk0nSA1UzaU5cN06ODAQ==
X-Received: by 2002:a17:90a:d995:b0:27d:4901:b0b7 with SMTP id d21-20020a17090ad99500b0027d4901b0b7mr9801197pjv.30.1698182350137;
        Tue, 24 Oct 2023 14:19:10 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ci7-20020a17090afc8700b0026b46ad94c9sm7669915pjb.24.2023.10.24.14.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:19:08 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>
Cc: kexec@lists.infradead.org,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kexec: Annotate struct crash_mem with __counted_by
Date: Tue, 24 Oct 2023 14:18:54 -0700
Message-Id: <169818232965.2100071.5860676864005280334.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922175224.work.712-kees@kernel.org>
References: <20230922175224.work.712-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:52:24 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct crash_mem.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] kexec: Annotate struct crash_mem with __counted_by
      https://git.kernel.org/kees/c/15fcedd43a08

Take care,

-- 
Kees Cook

