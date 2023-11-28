Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB31515B9
	for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j9xqDRMp"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6cd8c3a9edaso1531388b3a.2
        for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 16:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701131658; x=1701736458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYiTIXqRTDarNbi0aa1f81qxroNRuY69MIWNnPKjAyY=;
        b=j9xqDRMpp9FKDhfIjs1zN4CSJfBR76rTm0NzSYCAYVf3wOcX/umfhI4UyVG6Rka06C
         NxCoFSuILa4Ybd3qPB+IjSs1buvb4AYD0frXjkR0zVSvaeZ5JmbKFZU35Pz5RdtZmaaV
         0TH49eUBZ4zNgkSSkBP5xCxIGGDdw9vw3Pa+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701131658; x=1701736458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYiTIXqRTDarNbi0aa1f81qxroNRuY69MIWNnPKjAyY=;
        b=AMHSXJoKIcAT+yQulz17cb3fECJRQxEBpd0DVeYOkoA8p09J4yMPhi3hOXwfgXfAb1
         a9xvUCcjDlJnKQuFStMpyC8nOMs9Xqz5wFJK8hv1HZCGx3tOz4K1lRmm3Lz4Y+rRHpKM
         MZPqHlBegGIhMxyLLzC7iE7KNBBUeKulnYfq0Ey85+/mQ5tGsg9IGWrI0b8bQBHEMcV+
         NUIF0RmqjJKaWI5bugfFbKACCj4h3OukCH5uudNMnAY6HyzriZwCZLamqiojb2AhhNyr
         gABv4f97YkobW6Ay5/JBpR8LSkHpGc12zWvYROED0wvUCn5Fcj6bPcfPea2fYYiMsY9S
         C6kw==
X-Gm-Message-State: AOJu0YyoyQ0UUxIezl2Fn/5vDux5+qlDXaCpsqx/j+pQBbirVOe5OLyI
	5FnLOWKP1ddK6hLKVTt6n/GULA==
X-Google-Smtp-Source: AGHT+IE1qopXbd9oTJotAIwAhuzGIfmugcli9ua2BkHYosf3Vb/rPrjdoH2dQ3EIE9Fwv7Aw8jhVSA==
X-Received: by 2002:a05:6a20:144b:b0:18c:382e:48fe with SMTP id a11-20020a056a20144b00b0018c382e48femr11176362pzi.15.1701131658027;
        Mon, 27 Nov 2023 16:34:18 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 102-20020a17090a09ef00b002800e0b4852sm9214040pjo.22.2023.11.27.16.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 16:34:17 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: ndesaulniers@google.com
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tom Rix <trix@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
Date: Mon, 27 Nov 2023 16:34:11 -0800
Message-Id: <170113164796.1670732.18133777682518787773.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 17 Nov 2023 11:24:02 -0800, ndesaulniers@google.com wrote:
> As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux Plumbers
> Conf '23), I'll be taking a step back from kernel work to focus on my growing
> family and helping Google figure out its libc story. So I think it's time to
> formally hand over the reigns to my co-maintainer Nathan.
> 
> As such, remove myself from reviewer for:
> - CLANG CONTROL FLOW INTEGRITY SUPPORT
> - COMPILER ATTRIBUTES
> - KERNEL BUILD
> 
> [...]

Applied to for-linus/hardening, thanks!

[1/1] MAINTAINERS: refresh LLVM support
      https://git.kernel.org/kees/c/9099184dec26

Take care,

-- 
Kees Cook

