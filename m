Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAE65A86C
	for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 17:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o6e0M8qv"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-425c1d7d72eso592881cf.1
        for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 09:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702919169; x=1703523969; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x29irrX3xXEqtqEYM+OJ0BBAXCsgyxR+RF6i+7rkCJM=;
        b=o6e0M8qvnkYkdRNMRiZlgFUiopRyQ38evIwRtidplWN9PBi4hBYDvjySFcGZJXYgkw
         EuBKJ5evG8wmmfCBht5Y720Ycgbn3Pfeq2Q2hWP65uqBywD38rbftqv211pf+3SZ3Qmi
         O/l+TBntkccoW8FxmKYCP8jdbGYqKHzA1NfhvFJEubWX1OZwqRNtqxKFuYijwRupmV/A
         4WD7rTlFwECICIiw8X2H7V6ygKq84XmUGBdmcDE+x6tgj7lajVfT6UOmphKmnoXZ1Z3U
         qSM7i5SNB3TtOhA1OPxGWrRyqGiokMiJRVW7Jierv0kYG3EoIIuE7gXe7tdInFACjM/g
         Cakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919169; x=1703523969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x29irrX3xXEqtqEYM+OJ0BBAXCsgyxR+RF6i+7rkCJM=;
        b=tse6jYCQpMtfSceHiIZMmLZwFwhsfGpLKXR+59wG/WyOfZpngk5f5Ul4Mc+2KQhsvm
         7DIz/lVplWTgthI6V0ir2bJpHBXXcooVjWZzOhggOp8/5o6WUZD64EbpvU+KtcpB50/o
         9Cli26Dt0tRG/701aIjd5kPexDLUJI3f5FNiK+YReV/BWMBr+o/M0sKUfwNfuYxU7dWQ
         ISNGOg26PSpm/zXT6QrF18XM8mYKuPnGhv6g69xCOmty6Mts/oLj/VnogkzuBstH7AnZ
         Nb9WOrmuDJDMVLwU/oGbHQCQZBoely3WmZpwTt/d6kkw2jOqaaqI2TMqDRLP2HKwhAIs
         1IoQ==
X-Gm-Message-State: AOJu0Yw9qV3KIV6w3cY7WJ9LL7FAAR4rcwUv8DIAHzAn0k7bEX48y2sU
	gXSNLGsXh2g5dZMRI2z7MsHph3jTcaxl+RN/aOL/CwME1f3s
X-Google-Smtp-Source: AGHT+IHDcKVJi48DWxUiRF0cSlxxE9luXr2JxmQw2R42ge6ILA0VXUS7myKPno4BTplV6A8qHqw1BOYXjCT3w8L6d/E=
X-Received: by 2002:ac8:570e:0:b0:423:8dd5:338 with SMTP id
 14-20020ac8570e000000b004238dd50338mr451777qtw.14.1702919168821; Mon, 18 Dec
 2023 09:06:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231214-libstringheader-v2-0-0f195dcff204@google.com>
 <20231214-libstringheader-v2-1-0f195dcff204@google.com> <ZXx5DyidpHFhRevy@smile.fi.intel.com>
 <CAE-cH4p5VJ_A91BAkURBN67ACA0_u7T8UhApUYLQDWeeRY6FWA@mail.gmail.com>
 <CAHp75Vdo=g7ZBAuk79PtLOYs-YHo5sCTp1WVFESHA0xN0zGEmQ@mail.gmail.com> <CAKwvOdmMqJacYRfwohY-DXBbmNmz_M4EKUL1KuTv=tT2dO_p1g@mail.gmail.com>
In-Reply-To: <CAKwvOdmMqJacYRfwohY-DXBbmNmz_M4EKUL1KuTv=tT2dO_p1g@mail.gmail.com>
From: Tanzir Hasan <tanzirh@google.com>
Date: Mon, 18 Dec 2023 09:05:56 -0800
Message-ID: <CAE-cH4oQ+nM6G897PaUwd8zaaAvqq3QL77=4739sZovVgkG9XA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sh: Added kernel.h to word-at-a-time
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick DeSaulniers <nnn@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

> While REPEAT_BYTE has a manageable number of users, upper_* and
> lower_* have significantly more; I worry about moving those causing
> regressions.  We can move them, but such changes would need
> significantly more soak time than this series IMO.  Tanzir is also
> working on statistical analysis; I suspect if he analyzes
> include/linux/kernel.h, he can comment on whether the usage of
> REPEAT_BYTE is correlated with the usage of upper_* and lower_* in
> order to inform whether they should be grouped together or not.

Removing REPEAT_BYTE is manageable and I have already moved it. I will
be pushing a patch that moves just that into another file called wordpart.h.
There are too many instances of the other functions for it to make sense to
remove them all in this patch.

Best,
Tanzir
