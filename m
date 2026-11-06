Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988003;
	b=WC/nvBpatKpF3QvvbSzDN6T6lItF8bOGnM7CuxnvuUQBa9jrAJUF41oTfdj9D8e/D7mg
	 qKyfc7BtVBydg4/ueeXIf3uRO7fsbNY5w++Lmc0spI+W0AAdkYkpIq5qjgQrswoW9p7QL
	 GZQ/5F1ARotVIvKTHsUoadXliIdswlnGTaTicNJC8WnNrmA6qRqhjGzdNF23Y6xJEEyAZ
	 VlGD/ZaFagLhrviuvcaBb6eHBq0IPEQcaIumZQmn32lyFbWvruPQoZ7f+wpV+NEabo4gD
	 oNrnnTMSoD441aialYSGGrXCoDxvWsOiazKPy78jnzxPO0DP8qHRlXUBsPxXWv2WoEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
	b=lUdHzXBSUu2BCDVwUyqxj2X9uPiZE0VSf3EA6nKpqw3VBeyIB9wAt0F00g4TXb98cXYB
	 xffnalcpIl4iltT/3JSc0+Ab9hE+gqy9xdJuHsSahi3Uy0N2PpFsdQEv2wgK8BDpv6CA3
	 pqvdqSumySIp3BW7eJ6kfLcqn0IZnqbyxAJLebfioWxti7QZ31diTwuONAFmmScLVQdcL
	 Fy+qQR4rBaHcNrpz4cYYDtzmJP8q02/MUwGU6gnJaT1M3qs2QnNuGfj1B25NJyob1xg3R
	 NdMeuzyJNTvjfaW/E+yCI7hlhjQf9PqgQGXVocpFkEavUSB6BJYSVHUzzJZFkNF4CbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="h/Wf1xar";
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E3606A33C
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 18:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4E3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=h/Wf1xar
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1020896a12.2
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793988001; x=1794592801; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
        b=h/Wf1xar8IxR1O4ql6cSO72HH+9+jHpDu/m+Vc/M5vdTB/geqTl8iF49pgMkkW1BO6
         aFwkodQlPUqfO3asGWczAqAbm/6iXZw5m/4KldjE53C4ma7G2rzu7vu7qTJi1fI/wUCy
         h0/uA7/ZumS8Z8NVjGqTBq9KU0kJZ+/ozTReU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988001; x=1794592801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
        b=qd74J2UM5t20FpI7kM6p7eS9CVZmZdIPLBZn720VbG8fNz5KnqnvXFpJUs1wy0WvMB
         DV0JlWL3Z0rHZQazoQdbIqu5XapdBxNlzmk+Yo6SG3UJkOTDxXfx5ISXfXXqY4wdsAVD
         hV51BuCPkF9P3Z1PL4TkZ1RC7rxebowCdXTuH7zVUCYCXu7eS/gclyJY45qDqyxXrHrF
         H/yfwB6rEKCyOiSXXzqMZz/kKrDYU1aCSOxt6dQ7hLYeB+JBPRacsC/aiB1T17fkR7Q6
         vmi6nG76TjuLOTzRfk9sUzENm5FyTb36xOiPBeKWo/25i7xbCAbU9xFmttPUt/FG+yIm
         mssw==
X-Gm-Message-State: APuU4Z/pi8XBioiKc/C3fgvS+XAPf9oKnsENJME/tk53eh68o5/d1ou1
	UEai7tb+ysi9JxjAcTLWUr6DEKLheUF2dheqaFzCnyDHjgROF2JcNSgX/Tra2JqkHycY2SZzkFA
	ebwoM6XRo
X-Gm-Gg: AYBFou3vkWBjulvQ1bdkwXC4kw+u4Rceb6pvS42q8YRnIZUjmm3TxJoWwbXAHVOzyZk
	D1pCXKqJ6HKygeAYvdhTeutQgVzS5tsPQbwRPKf+8MU5iWYRnKf2yqvn8kfOQdrm/ccZFP5VJT2
	nb8YcBwzdLUMmRCyi48phkba6Qe2QWL6WS7PT0hxUo3vC7XaPwFOdTbdnfhRlZodnOHHMx3N43J
	yCSgD7bGKTtMjf7cfczlt5iL6pVrEYbq7QP+tdKZMIUE37AiZsAwCbVaYxjkivO7NVGTzGkeG29
	L6Xj0tABbjRrYLQy+tHQtJgTeSoVaYYDXhUr4x3ps7SXQCU0Aw0ZlqgJWEs5p++FV9ycnNDoZ47
	X6ON+0ebMPr1NSAChN7pOkAzLjWvdOrCyvhuvn1PLJU+zuI5WnGvaOlWKSWSuvs2XZUeNnnKolP
	/288hvbnlZh/a2PC1kVSyUot/iLk798haD1uSGk2qKQKjAaYH2JHkbzpteumvhoK94qp5zB2QcF
	kBNQdKqQPBnhlZom6MRveJ3IJorKTu/QKe2RJfrvzo76tHXI3qSxIwGdNK1cirM+eAWcQTb51gA
	HhBx8KexLwIL+WuIYv54UU7y0dyW8KJL3mS3ajgtCydHtFU8ijRv3nkayUYLn4dxnzE=
X-Received: by 2002:a05:6402:43c7:b0:6b1:c7d9:b622 with SMTP id 4fb4d7f45d1cf-6b5977dffeamr2446444a12.26.1793988001545;
        Fri, 06 Nov 2026 10:00:01 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b664afe901sm962895a12.24.2026.11.06.09.59.58
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:00:01 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7734725e9.3
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 09:59:58 -0800 (PST)
X-Received: by 2002:a05:600c:8b28:b0:4a1:9663:7633 with SMTP id
 5b1f17b1804b1-4b6dd54b16dmr53499975e9.11.1793987997939; Fri, 06 Nov 2026
 09:59:57 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com> <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 09:59:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
X-Gm-Features: AclHuK8dSVweZwLxaeldnIMbndWhz_-q2OKzaAPnRAmMzhlMe2QAncAFrE9VlH0
Message-ID: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Just one thing: I think we should also have this flag for Rust so Rust
> and c are consistent.

Please see the commit message, which says:

> RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> SampleProfileUseProfi remains false by default in the LLVM backend and
> is only enabled by the Clang driver.

Is that incorrect?

-Doug
