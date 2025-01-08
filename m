Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D806A1993B7
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305208; cv=none; b=axPJtRa9pej4frjryHVEGi1LNenpmJqdEv/7CPZLnGNA9EzEX4+Wwka9U8d+/qd942M0r9LQbJ7nmyO9IY6G0JeopLFyiO2mMf49PR6UWUE96IiSezLBoAvhG+kgLRrl8wbTOmaMYN4GvLQ2zyUvriZ8S2fDa79CT8mjWsk0RjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305208; c=relaxed/simple;
	bh=ExCh1nW1vjHnY03XeHvG1hcHRK5deovSc3rDD8hL9yE=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=S+YnIzq3LtofH1Q9WZhokhr+RgnmwA5DO5FU/D0AWRgts2iAjJIs5UnyLs73HNofRnq+x4kwsbV/fZR28y54fFT1KF53ZP+zUGTx7IsKWpe1I3GhI7U10WLFnVWd9GQoStCHoYIFdow6s2rD0oNr7QUj0l0HWk+oJnoEevSANxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=TFwK2lsZ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="TFwK2lsZ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6eeff1fdfso1217883485a.2
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305205; x=1736910005; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+kAHNksMe/kXkxGmFNXBeqM4K/UZtDC/SfkjYB1G8w=;
        b=TFwK2lsZsBH1Qp7MWYi2zaqkTBuMararRJvd0ifDdVqrIxpbccWghPxGMVkNYs87Ls
         ZeWMVEDb12jOWAO7VCmSK/gF/g2jkg3v1NbLNZJ3fFalh5QmU4hoTHBYgRvXG5ADs/8l
         TMRsbhQ8A67crkLxqv7G25AsXCHF+c9zEuKNKGjq9CMVXy7bdAbKoDdsZ76/G7fTB2Yk
         HeA1CnuFu8V1L7eo8a8VXvvjde1gMr8oQAQ2AIunrii6txdRAcuEO320k5uSEl19Xr2x
         bLoarAlyfy3gkOxezCh6h/fnLWReFp/UXpxJA2zKt6zsmx5pk7qLDr35aNRJxkij+in5
         nkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305205; x=1736910005;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1+kAHNksMe/kXkxGmFNXBeqM4K/UZtDC/SfkjYB1G8w=;
        b=GG2uxib8rlOO0/ZvYqnkwYo5wnvC+vBUNRRzBK8e7Jmr4DWIG0ZMMrkntv+1MsXAOh
         JSClGOphmNfRmDBiLHIIAN3VhSjEyNuvbKKpSkIgztZym5WTU1vAZOqBu0WWD4otTdro
         53CjOFjRfOdcqGvvEgbLXT0OpymtIyI9n4mU3lKD/ZDhjGzpqvHDyuuZK6LNcgupW7f1
         w8htp2y8aajefxTlwYFM55oypr8plxtNhXq8GBQPmTgf8i12S11YszMBbiWtGWHOA04h
         kYsB6qCEh1PCjAzOnZesXVHBFC55EuRNsxoTItLx/d8Bia/QzdAzOQTRlMxJpBhEjylq
         16Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWhBkay3tRJLYAYGZpo7C0FfXuI1nKw4e7tSk5xIzcNGt2dVM+Eoh70LNu1S2zuPkDCIotQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxHm4+noDxF6LYUteE2ByoH7VwFarbYt0tWo7M9IQyfkKoNuQqA
	TlGyuWK5mduotUw39qg+AgOX9RV0SEslNpgi+OcKdMHjunSntc4CMiBIt8uRvA==
X-Gm-Gg: ASbGncvF2aMFGaHf+sBGEnidJV9X5GosISk9LNgpepZ4nZ2X5wobTqC1s1GDozBj/kP
	wWiJbJhCjRtLel4e2bEV49+csh1qyt9mvvAKVLLTGUAMDWjXvBzMXVCuJ3rvshKfEJpJMwGt6tm
	N3CRcRVIGxkTJhYTI4eeCG0DuOl2nvldAq5iq3q4Bqh1VmBMarG7JpnxlrhdiNaPRZa20ah1v8j
	DtFSppwOaYwzDpuZDUhwDpO8D3YJVYfVwV9+OPMNYxxpEpmAsg=
X-Google-Smtp-Source: AGHT+IGfAS0/RTOdLo9YLsVI7/BHEdDVcLTaguEmOzcDE4oMwhb/+83B+6j4YkXqvkM2pCaNyADC+w==
X-Received: by 2002:a05:620a:c50:b0:7b6:ee6d:fc23 with SMTP id af79cd13be357-7bcd97bfc72mr154389685a.49.1736305204786;
        Tue, 07 Jan 2025 19:00:04 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ee8easm1648074685a.125.2025.01.07.19.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:04 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:03 -0500
Message-ID: <b4c09c8466ebd880ad8e3b370a1fc37e@paul-moore.com>
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
Subject: Re: [PATCH RFC v2 9/22] selinux: make use of str_read()
References: <20241216164055.96267-9-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-9-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Simplify the call sites, and enable future string validation in a single
> place.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/conditional.c | 10 ++--------
>  security/selinux/ss/policydb.c    | 22 ++++++++--------------
>  security/selinux/ss/policydb.h    |  2 ++
>  3 files changed, 12 insertions(+), 22 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com
