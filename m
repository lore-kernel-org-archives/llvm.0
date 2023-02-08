Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416E07474
	for <llvm@lists.linux.dev>; Wed,  8 Feb 2023 18:58:31 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id pj3so19329664pjb.1
        for <llvm@lists.linux.dev>; Wed, 08 Feb 2023 10:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dkVne6QOQuiWRjarawnc2yDR1hi271zLDnK3/8Voi0=;
        b=UVbJ9xsLJiIJd2F3wQr18Dc6vf1t1u0vmP2LeaC8EAJTD0YwmMSpbp2WHw1gHsoG/g
         QYPN0EFStY/TgncavC3gzVnLZ0j3eANngoaJgpPhsPwgsUrShOB2ys3OL70zo3NnZmXZ
         3X/VdPwZ/EQXItjYA62Vk5s5T/8eTlUE9hKnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dkVne6QOQuiWRjarawnc2yDR1hi271zLDnK3/8Voi0=;
        b=keZb08u7ebDbN4rcfAgK/IVBf6mD9ZuD5GoHpRU0vO3QNaXigtHzKoeBUTQLHqcebb
         YffMxX7jQxMLTn+diMDGdjVhtlmuQXLJSWSeJ9/3tUWxzBfCCTaLvZt9JhPxFrsZ7sKF
         xlarTQ45ib/X4A+GeDy6YJ0vXL/jhNlfh/8OV+UQLsHBp1A82r6YSYtNi6TspBMCFGfY
         JWKXbPARhwLPxrnDwQDEuAmWIJsScskxOLIGPyLOSVq9VbwEGlaTgkGYCz6STa4skZrK
         6hsJQ0IaOzDJWWQ3hsi5GDPHnZsdQnWMK8NO18hdU+J+vQG+iltWhDpKjuv+Yjrb0/KI
         rcXg==
X-Gm-Message-State: AO0yUKXQwF2aNormNG0FEyGUZACRG+DOQ+QinqF7WwqVEP7+6dx9mkw4
	v2+ZTbXTd+fsZ3mdvbKy9VAvEQ==
X-Google-Smtp-Source: AK7set+W13zod//i71uQI6lj/ZQHRIZUB6Bc0TJ8c+Ig+pIur65SH1HtUzuX+65B2W8SuYAFLnoWGQ==
X-Received: by 2002:a17:90b:384c:b0:22c:2d76:2713 with SMTP id nl12-20020a17090b384c00b0022c2d762713mr9884383pjb.32.1675882710714;
        Wed, 08 Feb 2023 10:58:30 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x3-20020a17090a1f8300b00230e733599esm1850623pja.48.2023.02.08.10.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:58:30 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org,
	ebiggers@kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com
Subject: Re: [PATCH] randstruct: disable Clang 15 support
Date: Wed,  8 Feb 2023 10:58:21 -0800
Message-Id: <167588270061.464935.14207013093507497315.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208065133.220589-1-ebiggers@kernel.org>
References: <20230208065133.220589-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 7 Feb 2023 22:51:33 -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The randstruct support released in Clang 15 is unsafe to use due to a
> bug that can cause miscompilations: "-frandomize-layout-seed
> inconsistently randomizes all-function-pointers structs"
> (https://github.com/llvm/llvm-project/issues/60349).  It has been fixed
> on the Clang 16 release branch, so add a Clang version check.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] randstruct: disable Clang 15 support
      https://git.kernel.org/kees/c/7ee3819f2ba9

-- 
Kees Cook

