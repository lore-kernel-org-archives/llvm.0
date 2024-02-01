Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770897C6CA
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 17:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706809968; cv=none; b=FR6JzWXQBZ96zDq8bTDaDlSIQJ8N7STAV7eaSK0zQQqASL8OvOgyotKt/Gl84g6sM5rA/Sk0f0v2iLm+L0UaKWNp0pUZNSABRoKV5ve9ugThVi+hRplHhKqR8lRp6Z7jxHp/VxjbMMDjaxpPfoedhozTPKD80F4+NbJa+2tR+vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706809968; c=relaxed/simple;
	bh=lIJSSJQHgI6dPqglJX+BpS/xv1aEFSMZz/COulwXiUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkYLdya8EZbCiHBjgrdMsxNCRf58AEiyhuXEamlRU5hD7eqS+gOI9Oh6Z1UaSYnZjHQBcdrEzAItr4lc2KgL+VGcZrja2ikpLjmeaBzAXw7zFDJTh3LUQ2FUn0h0/AKCBU2dab1+jkVHQCQAH+uXSaHOTqiIty/ZfXuCo8f8IxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=duz6oj9f; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="duz6oj9f"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ddb807e23bso843608b3a.0
        for <llvm@lists.linux.dev>; Thu, 01 Feb 2024 09:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706809967; x=1707414767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeB/5jBcZmtDcrKzl0YysnvyegKxpdljcraOQkK2rDw=;
        b=duz6oj9fF5ltWwQKu3WWetMZ8K1f5mz+wjMhaxLwu7+og4ioScW62mwmHtmy9VYoH9
         JGPX5ECWr9193YCHIbaecdcIrvevDZ8syA6lnYoxOYmlpNxaHjBvGz9z46NklWZncwGm
         CkYAj0kdoPrErcu7NEAdWDBwEvsOiFbw1e4q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706809967; x=1707414767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeB/5jBcZmtDcrKzl0YysnvyegKxpdljcraOQkK2rDw=;
        b=Uv9BRoh89IjU46yV17oVD7cbAloWPH1H94YJKBb0uaqJv5LhdfzA0Y0qUmw8uSrIF6
         wPAT2hw/at0PjLwagoMwbtSQf7VYXTLJoezhNWY6wOURwD0CBm80ODBMroKeyXr63ipF
         ephWztxiIMlSA2aljsXWxh5EIXwkd70zDbbu50tulakRkEj87YHY1Qwdj95sOHETzl53
         fOrEdVaZzH3kprGLolaSIjBm1uyO6HFs6eUrs6oK3vi9/Pr3Dpye58PoHyQhnVBiWnM+
         yi54VyXTfezrNkLTJ73ImHLjYxg+ek8A/xUDzL5KeywZN1KKU5qJlQWom3x/4eKsiv16
         5qEg==
X-Gm-Message-State: AOJu0YxfVSCA5bFcoDVEjBGh0yg9E1ZTuoPDXHz6acQrt9d4ADZQbpY5
	GNIL5mckF4kpuW6AIBBWMtfak1dIzaZu4HdrojbA4g6iXi0Wg60YBw6gMfDcHQ==
X-Google-Smtp-Source: AGHT+IFywQN1VuW1cJxTCfwWkXxphyAozHQiCzAAuSTqK+KpTMUrHhQklPCAnJl9YxQODGS8sDGZEg==
X-Received: by 2002:a62:f242:0:b0:6df:eb95:f50b with SMTP id y2-20020a62f242000000b006dfeb95f50bmr1998531pfl.11.1706809966859;
        Thu, 01 Feb 2024 09:52:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX+hPHocTN3Krdrwx2BAO45nqlHKtddyMcZedxVYNqfzp1g5llrSQ77t/t9540v3ksZVJyxQHtPp7krFRWB79cagtGUcq8AeS2fk18vBwQA2d1Wxj5V+bsCqzxwezYa7X+BNRsEjRuA/DD5VtS1iXq9O6G7yNUp/ZLFgvOLS+nnsn7Imahnj2Zf0LcZ/e/RxzPcoteP0ppMFjLjaYdlU9LM+9f19epNvqqjUk279j7/+ZLgKsnTnB5zzxGMAcwvNfd/ZARI6PYz8PTcHSfYa8MANfTeAB443UY+Kl+gFLoC1VvSo7sXPQZvKjZIP5CDlrpicY1s/1vQEd5uHQJEK1Lzz0LMiP+z8Qlgw31NG5qePmuYhJasxqV5
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i1-20020aa787c1000000b006ddc133f1d3sm12700pfo.194.2024.02.01.09.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 09:52:46 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <nnn@google.com>,
	Tanzir Hasan <tanzhasanwork@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	llvm@lists.linux.dev,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v6 0/2] shrink lib/string.i via IWYU
Date: Thu,  1 Feb 2024 09:52:00 -0800
Message-Id: <170680986503.3370813.7406880929037173095.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231226-libstringheader-v6-0-80aa08c7652c@google.com>
References: <20231226-libstringheader-v6-0-80aa08c7652c@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 26 Dec 2023 17:59:59 +0000, Tanzir Hasan wrote:
> This patch series changes the include list of string.c to minimize
> the preprocessing size. The patch series intends to remove REPEAT_BYE
> from kernel.h and move it into its own header file because
> word-at-a-time.h has an implicit dependancy on it but it is declared
> in kernel.h which is bloated.
> 

Applied to for-next/hardening, thanks!

[1/2] kernel.h: removed REPEAT_BYTE from kernel.h
      https://git.kernel.org/kees/c/66a5c40f60f5
[2/2] lib/string: shrink lib/string.i via IWYU
      https://git.kernel.org/kees/c/38b9baf19469

Take care,

-- 
Kees Cook

