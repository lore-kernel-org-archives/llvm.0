Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA87884A2F;
	Mon, 29 Jul 2024 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239751; cv=none; b=mqrpfXq8407xVMZDwqSUFwBQ1M/CXTlNbKfO4Kd+5GqkWLXpz6tUsRJMETloPNu5L65T0AnIWJqVfRksFfCKSn0X7wQtsOjXMdu0nr9IAY9iNiq8Nf9t9R6yVYip9tltitzCTxeVXsN/UvKQjiuKdDsz0lzr1KSvltcte8wSEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239751; c=relaxed/simple;
	bh=/l0OpKKDWq7k93HJSE5CtdQA9nd+8ITjB0XjRT4IxJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDbkKvHCZSNOuvjfhdKbfIZMM4ou+pJNP7JtmovJQTOlNqhVLQ42zai1T2Xjw7fndccqltZ/szEaRyOtUeHNXepdHmrNBkJczO5eN80bKGCi5OESCKbBDIxB5+RYYqmaVYL0StsejXW9GU7/6sNTFmAfSiDllAPeMEAUS1gpRpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gpH5Y0iB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gpH5Y0iB"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc587361b6so16114535ad.2;
        Mon, 29 Jul 2024 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722239749; x=1722844549; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/l0OpKKDWq7k93HJSE5CtdQA9nd+8ITjB0XjRT4IxJ4=;
        b=gpH5Y0iBtzZtwSBonv7sGXowXVl3tfOnrAxxBLlp/dLgoc1Afhibqe7Al88lCe8bbN
         n5HA568shguST5AJyxZQDYJdDDG7fKidCQ9R0hqoBsbdUxp6BkFFygMsXDzeBJuHMuqb
         c8bYPxdsdRbrswP62zoVryiWg23iLmh1mPYMRCjMBpsoKwE+96WPi3d29+JLxX4cVyGY
         zF5AoP+wgaopWSK4c/eo9YsUkUhFOYJoF32Dn67B2b39ZqiOyn180/fY8jWwCRTiw5J3
         LZQkU6SQQvc1Svs98cs5lmVLR8vVX29AyUGcIQOeHROlYXMzKqjuUsgmghUEpEHbL4ri
         I8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722239749; x=1722844549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/l0OpKKDWq7k93HJSE5CtdQA9nd+8ITjB0XjRT4IxJ4=;
        b=DxribzGCyI2dG3sk4/SiKPxLqykoWZ0pSeAIhYgkpkyQMu2AFSmPYeWWFf+tvMVSXG
         K1DRQvH06MiwF+QUYxZ9aqGGrHseknFSbuAW6Qy50FxktbkRsd9eZhdta3AjPgRvSQO4
         QeC4Mx2z0+r2mdzWDXQHGpoYiNfHxXuEamiKfoLnFyp6fCelsPf6sdLbWVx8jswCczcD
         t+SQk0FFzTy9wNCuTLkNjSTQxNLCqeMKJqUo0611t0A5uGJH4woXJS7yIjpJJxOF6e+x
         izmmDG/Fc7TLySek7XCfWsvSRQL1fsF1owSzXs/EfKdITZLijb0NLnsrxYS83FzeIRZq
         gzHg==
X-Forwarded-Encrypted: i=1; AJvYcCWWySOJjBTvfWPzUFT9qibLYuRBfMaKP3s/UNQT4OsRRdmIHoAM+iHepKvviZrPMuODP2t8YNc/Y2h303Svliaa5s0m6LZlmoCuT5YAcXCVogUZmUMXSNAKdK2z5a0MxmAIlEQ=
X-Gm-Message-State: AOJu0Yz8MnHxoCstXETCoPGuPc4W579NA+fpiq01pAe2+o6oUmoL0IYh
	QNnxSMSsTVK1PW7SkXTjF5IyKqzoBJ6CNrI1NKC8fV4yXe16hiS7LQYeIRB6UCFCHTRXRsfnYH9
	2mp7WDVZayfStTZMWza4ZHP8TDV0=
X-Google-Smtp-Source: AGHT+IF3XngYCsyWvj2u+FJL5php5esH/7Oz8DZfDENFLQHWn11k9H/WjmtQUjbmGp8VDG+zDQUIw1fBfFyo6q9vgcQ=
X-Received: by 2002:a17:90a:8a81:b0:2c9:69cc:3a6a with SMTP id
 98e67ed59e1d1-2cf7e09cf34mr4795625a91.3.1722239749082; Mon, 29 Jul 2024
 00:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240728204104.519041-4-sagi@grimberg.me> <202407290814.7REsmaH7-lkp@intel.com>
 <aa94fd00-0a91-4924-a943-2e21e6da1df8@grimberg.me>
In-Reply-To: <aa94fd00-0a91-4924-a943-2e21e6da1df8@grimberg.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jul 2024 09:55:37 +0200
Message-ID: <CANiq72nsDdvrT_QpwD=t4euwpay9E25W=v2iPP+6LsZ0M6A7Gw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] nfsd: resolve possible conflicts of reads using
 special stateids and write delegations
To: Sagi Grimberg <sagi@grimberg.me>
Cc: kernel test robot <lkp@intel.com>, Chuck Lever <chuck.lever@oracle.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Dai Ngo <dai.ngo@oracle.com>, 
	Olga Kornievskaia <aglo@umich.edu>, Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 8:23=E2=80=AFAM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
>
> Its not clear what is the warning about here...

Yeah, it would be nice if it said from which "step" it came from, i.e.
from the docs. Or if `kernel-doc` prefixed itself there (like
`objtool` does).

`@inode` etc. are not parameters of the function but are documented in
the patch.

Cheers,
Miguel
