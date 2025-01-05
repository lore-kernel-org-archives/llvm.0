Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80582BAF4
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 03:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736046282; cv=none; b=CnX4q0mFOaOCWMZNcMwEkolzm/NBdmpJiv026sNY8QD474q3dPzLKD1CPdaQ+cVXc4Sw2yMImxSic2RJvJGaQZADEsrkaQfOc2N+ut1IJNgPZGH0lIiP7qL49G3QFgAxm5LFH9qfvJTZOg198plVDRgF8Rd6siR9eRzjzZ4C0y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736046282; c=relaxed/simple;
	bh=wVPtncUionGSGB6weARFJPnaU0WDaku2K1rIZTIFdI8=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Ll/dYAjFxkwzZl/QALi5TMI9Z4GNZZm+glz4GF7b9qdUkZZ1cpiNIP5FyhH6m6Ec443pUlAOpHAkPs+F1DS8Kgz4L9qAykVTN38nuChOIcUOEYbux5MO0W0u77anWoNEIoUYj892DKiAuGjHOnncYJD4whjNikabCAvkfVd9MJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fRk24QH2; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fRk24QH2"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467a17055e6so148628701cf.3
        for <llvm@lists.linux.dev>; Sat, 04 Jan 2025 19:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736046279; x=1736651079; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6955gtKfg5oEFuxtQGlyDD5kuPjGFQ5vk5JbxQicH/U=;
        b=fRk24QH2COPUYZBx5V0nw9aIgBPDWgHRRcMuiIwXRhaNiS1HKxZ0OdT3sCN5IMP9vB
         kCdGxpb0gu9qGHA8931rDrUl7Ayh95LnVDe6uDGHLXp4yHnb4wcID7IAYtgonytjAWzs
         3hOmPWSHhFgRniNfRP1voPGxGHnxMF3oDVVafL9YHg6gqngdQJFbu6LuYTKQXmf6t+gh
         rP7Li4RqWHkWhPXjkQhxTz+b+KRbx5SEbrw2nJnE5Ydw2FaShfQvi/chIoXq+xIALDPn
         rcZv+JVQ+KvY2S64XyNJCrUgT/WL/D0dbfbkX9XIUG1a8OTFmcZHpIVztLVg5OQxHmbn
         9zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736046279; x=1736651079;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6955gtKfg5oEFuxtQGlyDD5kuPjGFQ5vk5JbxQicH/U=;
        b=vZ9JscuuVl9TF4WNOkLnIe0Zo9d1fXEwd0SYYQ+JTw2ILfueaEZr+oMWdTaoG2pk3v
         cSS9KaEK0r7WhIgcRllwWiMdlKHewq1zzQzzPjayxni7djU+65ztKt8Ta0P8C75e2uLE
         e/5KzLqX2pzMsi+hFCEWvwc6zfBjzd6VWPGZ4HlyhgEF5FRZq7c9kQCS5G33Qmx2LycX
         HdehF8fCGhKb/hl/+kd9wHUfniPH8cM9wYcCNdtHitcU0gR3SaVS4CJ1i6gNotXFG8k7
         8F1rlnBqU1Pcvs7lWBelsR6qgEZYXKQWAgtqXYhsEHVgpJMW1rCGAn673QITdqCOJfZw
         sbMg==
X-Forwarded-Encrypted: i=1; AJvYcCU5dCmzJTsOuKaIyR2ODZ7YZVX6TSNEvlA5itgnRAgF18PHWuoS7k4z4q03LqOAYrJ3Zbfu@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzq1rnv9/FSmIsbFESZ9X9wBdHykzlJqPxyVnW7OnGxXIJxPds
	72tZNTGhuQEzMQ+r+AYc9eJpUuqQhpd4sWpiM+MjieeObCnjkgd2ziiDwEF/NA==
X-Gm-Gg: ASbGncs+SsvnitftkPmtw/lN/M1xqE36qxBrG1WewMUt+E3+7SEPbaV6bDJ5jnXzNp3
	rseMiOMMQaPIvUfcp0XBbz+JXegL/m/2+rcFVDEuEHYkGBa4EDLrfCYi3Y/woSJx/i/6x86Zam6
	aG6axpSw1zSSh4dD+q6niWBDzPtnEQw0FuajMFR541LWYnJtlgu6fgkSt0luhKb/NnKccuXCfar
	40iCGJpzuJrefDNkwKhfxZDaEZEtMxppUhlKWkQG7mBAJCujnE=
X-Google-Smtp-Source: AGHT+IE27NYmWwTdi5HNIXq4FMJ6UExsCybpWZLcTHc/1IkULeeLF6BI+iMXURnMbLFG6lC6o05CZw==
X-Received: by 2002:a05:622a:287:b0:45d:82a0:5028 with SMTP id d75a77b69052e-46a4a8b879cmr794375121cf.1.1736046278825;
        Sat, 04 Jan 2025 19:04:38 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb2c578sm161953691cf.77.2025.01.04.19.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 19:04:38 -0800 (PST)
Date: Sat, 04 Jan 2025 22:04:38 -0500
Message-ID: <a0d6421cd8fb725ebb627f5e22cca220@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250104_1133/pstg-lib:20250104_1133/pstg-pwork:20250104_1133
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] lsm: rename variable to avoid shadowing
References: <20241125105926.47141-1-cgoettsche@seltendoof.de>
In-Reply-To: <20241125105926.47141-1-cgoettsche@seltendoof.de>

On Nov 25, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> The function dump_common_audit_data() contains two variables with the
> name comm: one declared at the top and one nested one.
> Rename the nested variable to improve readability and make future refactorings
> of the function less error prone.
> 
> Reported by clang:
> 
>     security/lsm_audit.c:302:10: error: declaration shadows a local variable [-Werror,-Wshadow]
>       302 |                                 char comm[sizeof(tsk->comm)];
>           |                                      ^
>     security/lsm_audit.c:200:7: note: previous declaration is here
>       200 |         char comm[sizeof(current->comm)];
>           |              ^
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/lsm_audit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Merged into lsm/dev, thanks.

--
paul-moore.com
