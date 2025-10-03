Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE31D54D8
	for <llvm@lists.linux.dev>; Fri,  3 Oct 2025 05:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759469366; cv=none; b=ZVnvcubrErT+4m4iQWDcs1Yc9HJvWvJZpNDWtlbB+UFYpS4PFfsQi9tD6Jm69KJU+y7gLeb05NWCu8SMutnJp0Pn6OzCAb2rd0hLR9EwnYIiupSThdvZ/5N05zTADlagl6N3TqLy59jmSP7LDcqeZHtH1FeYHXjAgsdbP4yR0w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759469366; c=relaxed/simple;
	bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nR62ZwCO/X0Rr/xQvg7MYUVwf5CnyLn2Po50kc//vl8R451HuT7hrS/E9JxsHgnwtXaxM8+3djER96kf6/GRHmU+k2VCEigZeXHZ4qdpRqX1U4MeZpvQc6NNPXb4/BR142KnPKRcMRWvCEt1d9+Xg8cJAGYVSxK5DcrIWWLr/40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKxjYhJX; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKxjYhJX"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-26e81c17d60so2829535ad.0
        for <llvm@lists.linux.dev>; Thu, 02 Oct 2025 22:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759469364; x=1760074164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
        b=gKxjYhJXo8tYG38qEwJPtYKckIq30ivrj9I44L4qBzyQfYqvA3JWcyw/B/piXFdf9B
         vcM33Fu5zuGbhKeGGU792A5XU/gLYRf5uPMSZSERYfQoDxy2SAq99Mc9INYqSuN3ElDi
         g3uVxLs+GZEcUwLbBf7/sX3aRicWNLGMc2OrZqsw6paq20u6cafU9wMYs8sQt4+9Ym5D
         z4H0aw/AysoJ9RcL+7GDu8rBr9Nf4NAEcnrlwo8aVuDdgedKajIU7UQgi+3p7Gtr4X8I
         yRM9I4YtKAHAg0453pQT1VugDcYk+owWy8MeQebRE3ZA0xfyl1OmXm6Qvn7bgGWjtScj
         eQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759469364; x=1760074164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAecbVfIu/2KfpMJLz5+NVIRF8lakTzCsR7c7STt1QQ=;
        b=IecuC+bBTlZ6DEtz9Sa3J2uqyFTA+IW0N5XVrmLPLpmBpgaNfoepFuqri5sJBZ5+3z
         99cl44CaxWFY5KkToMUF7i00YbauVT6INhV5AzJscjPOqRvKCEiu8xtbI1IjNkJYz/9Q
         /TRiFBcgNxkTYpGnz1WR2vlVizXLClN4GAGJyunAcHt87HsrMSHDEDEEQy4TE9tNaUdR
         AfPFa0XeX9jXw4GEAb77wJj9FS0tp24exU7UqTMG1P4TfG5eHu/mQO4Ji9TOcWMCyFJZ
         qshwXMIR3lpMmN3vpvkeSgJZD0bJMedtY5hjjs3hmNeHGEyIW+y50nhO+1hCjpCfe6n8
         uaKA==
X-Forwarded-Encrypted: i=1; AJvYcCXOBq5mDRZtavfH9NZ6gV7BI9o4bl8oTGdvadzcDRSJucQDF1KLlKx2MqYpy5OJGJYqoq0h@lists.linux.dev
X-Gm-Message-State: AOJu0YxYktV8rPm+U+wUkiALyQ4m4wawUeslRXaXturTi5ZRgO1UGru6
	1CESbvClbvQp+tpMYQmjA5D4C6MONIgqAim4aJcPaI2wypinf1hfRT7B
X-Gm-Gg: ASbGnctD9/2FOQEnJobqkXGFaJNEs1QnlMtFtlCG2Ejiob5Vy1bKGBo6hC6f0Kq6kKl
	iXOUkzW4d4XEfbA6om3QzrgxsEXRqrtDOb9XFXASC1gGzt4UIkx8UUblo4wEtTuzLb22TmUCwR6
	9pAoqjiDUR7NtFobfGQE5cNqorQqe/xHsLIMOGp2UHQadvemQMypaICaB7Bd0o5DqIvisKccvnZ
	mvcbpuC+HOXM4kc4K3W1R4Cl505bw4OJLov8AiW/iyuBhDlIn46i8Tyvpwwflr8C0ZC98kC7EMG
	svnoHnpVEWR5d7/15qcqWYy0YqSA3JwO43GQKe/Q1zvRl5zuQ01TDu1Ne+wSf5ZSnfndTJsTbC3
	QbuNoe+VBfGLS7x8fCVIWdTGVp0J9EXKL+x47PfLg7ZE=
X-Google-Smtp-Source: AGHT+IEsmDDtxcH34zrU6yCLvoUnpVNeQpXjkmSiB1AE5fWsJSBu1loqYdfz+O0NGkUT3RQ1Vtyeiw==
X-Received: by 2002:a17:902:c403:b0:27e:f02a:b280 with SMTP id d9443c01a7336-28e9a65bd1cmr12557885ad.5.1759469363957;
        Thu, 02 Oct 2025 22:29:23 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1108b8sm37676925ad.26.2025.10.02.22.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 22:29:23 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: seakeel@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	alexs@kernel.org,
	aliceryhl@google.com,
	benx.guo@gmail.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dzm91@hust.edu.cn,
	gary@garyguo.net,
	hust-os-kernel-patches@googlegroups.com,
	justinstitt@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	si.yanteng@linux.dev,
	tmgross@umich.edu
Subject: Re: [PATCH] docs/zh_CN: Add translation of rust/testing.rst
Date: Fri,  3 Oct 2025 05:18:49 +0000
Message-ID: <20251003052826.454550-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJy-Am=pC07CAWgRSTJ6WLaBdYeg8LQbVDCJp4PYoHaikFJ4Bw@mail.gmail.com>
References: <CAJy-Am=pC07CAWgRSTJ6WLaBdYeg8LQbVDCJp4PYoHaikFJ4Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2 Oct 2025 21:33:59 +0800, Alex Shi <seakeel@gmail.com> wrote:
> I can't apply it after your previous rust patch. Could you rebase this
> patch on my tree?
> https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/

> Thanks

Thanks for the feedback.
I will rebase the patch on your tree and resend as v2.

Thanks,
Ben Guo
