Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93300111AD
	for <llvm@lists.linux.dev>; Wed, 17 May 2023 19:02:31 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6434e263962so895058b3a.2
        for <llvm@lists.linux.dev>; Wed, 17 May 2023 12:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684350151; x=1686942151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cQTCNheYZl+3yNBMCx3sHGYTeFIvig1PSLkqmRnl24=;
        b=c4/xIh+TlUQipA53k5weP//Y9ntGrUcZcfCaC+Ro3CgAcfELru1Fwua2gzPbAkTxBJ
         nJorT+TlzvlTJgfhob/eVzwHf/+d4pEhgSfC8n0AozlqfZY7nYbsoc6CK9P+UzlhNQfq
         9l7QcA3K8bd9/EbKP8kNalAroP5gS6/wxxs8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684350151; x=1686942151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cQTCNheYZl+3yNBMCx3sHGYTeFIvig1PSLkqmRnl24=;
        b=NVL+dEqN7EXp5WBLb2KGn7UX8vpQV1epaBWDjEfP/vGSv7qfXb+Y0Yn/DOodMiMU9E
         R/xHVOB101Z/DoE4BssiaZzHx9c0lxr1Kc4GMrm2AY0MjFoTcVhQCPzl1P6/InEvzRCo
         Jb8uN6fBpZpapoIYk8WCsEDma0xaQlD4Jrzgxc5T0nSi2GGNgPNCHgfQwMGmqCqU+1e+
         zoQggHr/Ls5eEMYkff3E+WVzljRkwi1Ol2ze4RLZkcjGEd+i5MX82uWgegFeMRv0XPyY
         9J/5aY1yvcyVbU1vAHqw7otiYieTZR/apx2h5wAdhqAQY/neDdp1D99jPitBKluGwGG3
         KxxA==
X-Gm-Message-State: AC+VfDy6xlS9JoR9pdGsMD0MOnFaGurFzl0TQZtA/mNLcPcXTd/MKVvK
	VT7odcR3DeHrn59oKDZbUa+zKw==
X-Google-Smtp-Source: ACHHUZ5AQB3xPNC8HeE5B7ZSnQJ2q0B1Dhpm7pti083TO4i4yE+YkV+L4SebHFCZSa52EeGOU/k4+w==
X-Received: by 2002:a05:6a20:4389:b0:105:6e1d:5605 with SMTP id i9-20020a056a20438900b001056e1d5605mr15348701pzl.62.1684350151063;
        Wed, 17 May 2023 12:02:31 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm15521703pfk.158.2023.05.17.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 12:02:30 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: ndesaulniers@google.com,
	masahiroy@kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org,
	nathan@kernel.org,
	linux-hardening@vger.kernel.org,
	jpoimboe@kernel.org,
	llvm@lists.linux.dev,
	mbenes@suse.cz,
	linux-kernel@vger.kernel.org,
	trix@redhat.com,
	peterz@infradead.org
Subject: Re: [PATCH] ubsan: remove cc-option test for UBSAN_TRAP
Date: Wed, 17 May 2023 12:02:25 -0700
Message-Id: <168435014337.2056649.7592777028793700479.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407215406.768464-1-ndesaulniers@google.com>
References: <20230407215406.768464-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 7 Apr 2023 14:54:06 -0700, Nick Desaulniers wrote:
> -fsanitize-undefined-trap-on-error has been supported since GCC 5.1 and
> Clang 3.2.  The minimum supported version of these according to
> Documentation/process/changes.rst is 5.1 and 11.0.0 respectively. Drop
> this cc-option check.
> 
> 

Applied to for-next/hardening, thanks!

[1/1] ubsan: remove cc-option test for UBSAN_TRAP
      https://git.kernel.org/kees/c/08e4044243a6

-- 
Kees Cook

