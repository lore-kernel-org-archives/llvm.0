Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D413C8E8
	for <llvm@lists.linux.dev>; Thu,  1 Aug 2024 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722534341; cv=none; b=EnoThM3Pgx1cBinFsFgDMWIIBic0PZHELLB2WmKNYBk4RgboZQCOgezknpbaFZjwhXo+qc0DllhsVTE3sRJgu46yMjBq3WTVjV64X+hquh66n9efnlW2RHGr2qTjdKLgWQkU6qBQuAQBuKYFILLPjnSVT2N8CDW588FMMOT8mgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722534341; c=relaxed/simple;
	bh=Md+tCugX0T6DBlJwjfQAImnL31p6sihip5oruYd0jwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpwHn7A7Fzi/9cfHod4i/Ih/J/gZIY+CGnATup2PNBGKr7ehHCHQ5itUvOYUxaI0ojSaQvOJJSlWziwwit3PtAxcnn6MaiKcGi6AV7eBInnarXCXe26l4bJ5KoM0EKqdRa1FnlEQlnHETMIGSpzwOurPbuYGxfodsE6B++yWWRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bzzwxQ89; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bzzwxQ89"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6b7b23793c1so40715696d6.0
        for <llvm@lists.linux.dev>; Thu, 01 Aug 2024 10:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722534339; x=1723139139; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Md+tCugX0T6DBlJwjfQAImnL31p6sihip5oruYd0jwI=;
        b=bzzwxQ894eWXjo0c0ge+eXoa5rhPNCSv0u3SuIjrTZRd37bgq6EiK5BUGiQY34KOcE
         rNX/8H8mTzJa7mJ9xrXjZKhRjOApFkyUD24c1fiaIrIRWLgsX5KSsktdEqfNBhlOoIiB
         osEK1JbY1cPn7mNt/E6WizYox52g6xjVwTNWZ3Kkf5reaoZz1wargw0kwoZ7wIn8CGfH
         hvM9M9vSsndxNsHi65ZuDL6MH0wzvw/naBCXBChw1TJG1VwrEazjzjp+/FY697608QlM
         9nfQrrpxp7fVDSTrVzS2+OmM5qGyHFKnx97lP3gvWwh4T2tCH8PaVo+/vq/8RGj2RUfG
         w7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722534339; x=1723139139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Md+tCugX0T6DBlJwjfQAImnL31p6sihip5oruYd0jwI=;
        b=sQvotmqXBbdYWf1aJ4iv0gELMiOjLbQDq+ALMZ+0mr11DK2xd4rgLDEF/tk4QfmWgD
         CRMJYWPJZPkUaCuydltlRhld1bSrnJjqI8MRxGkCg4DjvpQ2KUI4dfgehqGHbMyKgTPL
         p7XEVbtKgreZC6tDqYp8zTFSD92AKMbaJ6Z9bWllT3E9mhiL3iJeKqlmQH5k6idxFxtN
         K59k9B4+PhhlQFwOJ4qZEVQ/Q+LwcWCiH2GWTqW/v/DKF5Wf1OcloxQJvdV5fGgotXEe
         Sc7sCH3dgbYrsGQuXo2msSz50WD0Ku33+RwM41W4ehaWZnYoitNmOOXi/LPKiUJB1wyF
         EQGg==
X-Forwarded-Encrypted: i=1; AJvYcCVznjF4g/W4baRdJtRHEYGCOoGi/xfaZmEB89xAdUePY4UzkxZnpajjF40TBZLW7eekmpYTlTliTkNVe9EgslZz6MYUgQ==
X-Gm-Message-State: AOJu0YzO/e3RmjpVc9S7IvWgTB90NMDneoq2XXi5SdwJk6KHGROA7f8p
	ohA5bKWEt0yqFCLkwxEPgagP74tKIlhxO8xJdZUIGa5MyQiC77p//JbOUvVwXIySCYBC6mVwkeD
	+LQHjHkB6v2Bu+64tgO6qvFDQKhCa4O+l8jM7
X-Google-Smtp-Source: AGHT+IHxqFWXrBnwwKA5uii4m8WRktVKp0ck40g4Sz01mi9eFCVRKd2tDwa3fcr6zENHmZS+RQTGRB9qTrhExEKmqA8=
X-Received: by 2002:a05:6214:5b85:b0:6b5:e3ba:5251 with SMTP id
 6a1803df08f44-6bb98332800mr13418176d6.8.1722534338642; Thu, 01 Aug 2024
 10:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240730142802.1082627-1-arnd@kernel.org> <20240801010953.GA1835661@google.com>
In-Reply-To: <20240801010953.GA1835661@google.com>
From: Richard Fung <richardfung@google.com>
Date: Thu, 1 Aug 2024 10:45:01 -0700
Message-ID: <CAGndiTNdCGuHRmnp+G-=_PzTaLXnUZpuXAT8dK-wdoG7Mpwt4A@mail.gmail.com>
Subject: Re: [PATCH] fuse: fs-verity: aoid out-of-range comparison
To: Eric Biggers <ebiggers@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> I think this was just defensive coding to ensure that the assignment to iov_len can't overflow regardless of the type of digest_size

I agree with this. Removing it sounds good to me
