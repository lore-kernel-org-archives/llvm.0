Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110E19F421
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305208; cv=none; b=AsOoSVwry5sI6obooknnA5cgYPlhcUpZYONjDnW5DDIZkcZ7s+VVciCDr2BbfXmS4doDE8OuuRJ+5+IljhOKmZKoFx8ZUvsUN4z/8oM+c1KVBGN7jRctR2m7l3pJHyxticQju91jzc86/oBC1MQI4CG81e52sEuRtWWDA5qOhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305208; c=relaxed/simple;
	bh=kg/oZJ9Hh7esGFqie1eJQ0q3uOex3G6vTcn9GQYIXuc=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Fh5JCDd95bm5edN3ifFjPze3H/e969u6jxYVBTHEv1aQLKQRprmuoigMZb68GLR21GYxLj8pEcFIvoWUm7LtF8585EblG7tcBeHoGm4RVQ6++f++YIBMnwH1rkG9CdBrpLdNyIsxYbZPYgq89YMYq/AIybpQtB+hLBIhDmHObzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fYCdSUdj; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fYCdSUdj"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46783d44db0so155342351cf.1
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305203; x=1736910003; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arepOiqJBhTy8LJBXLbNVTvzMEQrYQ0+bVCvA32Q0h8=;
        b=fYCdSUdjzFdBTBdWNFMKyB8ES6s5otsdn9x8EvpTtjF7kKfqfGR/EjPR7ZDbzJKj2I
         UBNKaKW8ev6kLLjR3QnHv9Al8GGTVNoCK0LHwPsBSEKJUFsMuYfNj1biufKmbe5YGXmz
         t1EFJRqjxiPXy9PIXEsNYmivaeDjHr2FwBXHR5f2Mq6vEMNeT5cHHh7d9PGu6PR80qLj
         cMcjiMBZ2/G4jdhkGBFuoc4wb4DwZsbT3ZuKqV8zOZCkDF8t+zm3lqJGbZL5Kp+ZJzsk
         RRRC9IWgzMHC8H/8YZykhxVAr14WGSAHL6R9H0y/v1UucrclEWgPXJnsdpiHtdZvn9/L
         r3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305203; x=1736910003;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=arepOiqJBhTy8LJBXLbNVTvzMEQrYQ0+bVCvA32Q0h8=;
        b=YyenYAA3w085Ilqudywvc77J9EN6XyPdCARDzkGahvIKvqTzEfogV+98UfiofcT2bF
         rpY8QrnmCdVbfe365AVHlITg2l9+duk1huDUfhLaykd5SORvvdWfx8sOFzGiNC6hy7r3
         VvHa17/F3K6PA2MftN6H1ibkWJ5I2Ta+CSg+PYApRLfp7P8fbNvjjJ7IgKrA9IWGRVZv
         aE1ys1e9rNaeBVejCMcq5nIQe7Mnx7+5Vdn5D63FIXwoMJhcJFQc+uqRzf4eDXnCJZdU
         x08CoyvspWsP/JCqYMcKRB6LAusBsQTWraUr97LLunm9aYWK7VnUoRHuOOKpso5A+WoV
         zkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJJZjrpexsHMThQxHEodPBdzHtP2E2Uz9WGnl7A3OjkD0oQZ07jkF9vz0zjEPf8nWsu9Vk@lists.linux.dev
X-Gm-Message-State: AOJu0YxLAclgnKQPRmvb5GMvMTqYbO6jge34P1nuUW5RqA9+aHQ+TaQd
	75erYRjiHEEUGr0bpTlSD3z/pfXNa6bJN1GAu/gRQFqXP2V/JjJ/oJF0X3jVnQ==
X-Gm-Gg: ASbGncs1vPbn28YrtnoowIg72CoL0SqnaajViFw5e7Ump+WVbPryAfIyYuIws/r1De8
	tCJqufHAziqHP64aHzW3einUPcJRt0z95MeB7PbkTkgrecIIgsW+pqryHboABDFXjgZdF6vVz5U
	W3q6zxMAPEP7Ey90aHe3nCElnalE0eWDB4GvSqgZkiIzXlyVJZ2q9phyOtqntt2y3T4nJ2PgY5k
	5+yvFyRlngQUvML7OdmHmNuQDZkfT7qJWm9EBWDBqFhHZJxnKg=
X-Google-Smtp-Source: AGHT+IG2V4LdZ1+ix3UVm8fGy1Wny0zEJRa4xmmG4X0BNNqJo5+iK5Quw2/BwBAPmfvec7zGf1CJTg==
X-Received: by 2002:a05:622a:1a06:b0:466:a091:aa3f with SMTP id d75a77b69052e-46c7109f0b1mr19801741cf.51.1736305203620;
        Tue, 07 Jan 2025 19:00:03 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46b385c95edsm17454991cf.87.2025.01.07.19.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:03 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:02 -0500
Message-ID: <d7895d5cfc09a64b91721fdc4796fdb3@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH RFC v2 8/22] selinux: avoid unnecessary indirection in  struct level_datum
References: <20241216164055.96267-8-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-8-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Store the owned member of type struct mls_level directly in the parent
> struct instead of an extra heap allocation.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/mls.c      |  6 +++---
>  security/selinux/ss/policydb.c | 19 ++++++-------------
>  security/selinux/ss/policydb.h |  2 +-
>  3 files changed, 10 insertions(+), 17 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com
