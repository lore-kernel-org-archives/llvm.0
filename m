Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43E3C585A
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604802; cv=none; b=t3uYFuofO9Ej+Lt/sk7scxXtGe1qppZhFT/6wB8+G3wvJnBZ9g60k4mFAF4ha05/XL38f+XWC4uBp0rfyVTQfDb7wLKihg6L4Kd8vbyYUOl7YgpV/16wdkNGGqrZSFckXVGPIb1Gx4LVT3lqXJdMlarlBkRvOUBrMGYYFmAuDig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604802; c=relaxed/simple;
	bh=n6YqyFjOV2k/BlMKcyl+qVfbz76XL/KUqt3hMlw5D4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h9cvVZki7kkOEC4Nf+Mlq3GyhBUEsy9z8TGlXLkr+G2U/Arr8a+Zc/PMuZYnSlfptQ1PHdpb+ojIdlKLysduxK0n8r9BEcXBTrrbm6SUbon8VM3TqwY8gjUtdlZTn/PuQaFkdCN68q8eCr9QI3+HewFcgj/yRE9bnYqWq2eCyOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6Qbz9R8; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6Qbz9R8"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b7f937ef44so33095736d6.0
        for <llvm@lists.linux.dev>; Tue, 12 May 2026 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778604800; x=1779209600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dq4LCZrUHOBpWDtuS+ZDVNUh4OO0Y+T0F6gJsifopzA=;
        b=C6Qbz9R8okV4kYPrHLNPsS/iymx8Pn/ONK1ExqGa5bkOsdVqBOGnabB4Bxpvt7ioQg
         TZ9ky8w4ehulqXB8YbUmBybV3sbI6JW5yLYGRMjlPD3IWhBF13bIqbCsozlqOFdbQKSh
         JPYEOXVFgrMmUkuzQFHAllU5M64FnSudbtMVdAwuaKNT6jotNu9XEKkvTP9EO4Qz5zdx
         8x//9JdxGpdtyzJBMzX/djjTNYfpP2HkdViI0uNFUVo0DluTgzWA/pI83I7MekBLwHlJ
         nBZ2hwjwCt1jueIw3XaroHSctDyRe1z6G0nTTU+2DuQg41RKfz/ZnpBp0hbpzSO9q6pg
         QBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778604800; x=1779209600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dq4LCZrUHOBpWDtuS+ZDVNUh4OO0Y+T0F6gJsifopzA=;
        b=rau+b2SKkDCIhmnNvxSAGrAhWcRR9f4B7UwL+FgMWFSWW7BditAKouLSmjiBZ/5DRi
         LMJWQ9Tf2nXYA1LFsnBiMidc1YRgw1N2+79joNXF/NfL7TUImDwQWv371V5WBpY355f1
         ZZQxErvUNW5USnOaZhj2yL/G3ATQJrodyKhyNPvjEAq5W9+FtCDlop9OG6SXjJIfB53L
         75tIkGqAAXz6DJmytCtFNoZbFgZiE1yD9gnGw9WA+Wev1V0o12s5Ya6GWrot34zlhEk+
         gaNKiO9cCAVG+lcDe9l+htLx0f2yQPYbM0lT3sZm38DUQBQPHkJbtyxcyIs+9TZBAYEX
         qV2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/dxmEfwK0fGP8KeujFBR366aE/2lo0mhnEn6tBTa5zLGIYk0Rn1MBpp4Z3Jh1SK1dNsu8h@lists.linux.dev
X-Gm-Message-State: AOJu0YyKdrSpdPm+vtab45TdRf/+snzI/wv/KjElbglWcDbXbyoGDsLc
	9YWtOCsLnG8Hx58pvVkcTlhfE0v4ezOHt1ZS4uv/TZCuzpTDeI2GEKk4
X-Gm-Gg: Acq92OFteiT0Ed+AcgUx1aB3xeXYyhCwYAAaLDVeAIH6yW2VnBfPlqtSZticFvN3HH9
	TUvdih6I+k66VKHoLFOPVt5U2CRHkpRMJ5oMSzMt9EzQmdDjpTWR6Zk+SWkJ9dTeUC2ncDKzMT6
	sbvav8Qlj420Awd3LjlhmrtyNAdvNwEcRX49ynt5PxH1NddqOfM9pfsQYrc//DZv8x2Cqjkt732
	67kp452HzT/40eBPo4sMnGTiULrcDv4YX83N0pWL7oOU92B02CRMqrDjwe2AjO7utNnYWnBZHXg
	nrfK/FQUz86DPdZnL5Fz9/Rlc2N6kCdAKlwVGYRos56Af+QBnlvDKwcjDblSL4nZWGYXbTRxpaD
	bNQOyRdukWlryXvVhbxgqtF7Kwd8EHKxnNQuStcxBPmHkLVK0hikH2HNejudXcg26C8sBOzV4pL
	lga4ktxGuQIi0WY3K2BipKr15IGIaT5++nzB9XbRrQZ74jikXW7dUlmzhj3trMzZTgc++uvG8Hc
	jElUNdcbAdgnIQaBWgahxpklHreaxblskXW6Wr3V6XfrRA=
X-Received: by 2002:a05:6214:4c48:b0:8a7:1498:5f67 with SMTP id 6a1803df08f44-8bc42f5313cmr414441406d6.18.1778604800418;
        Tue, 12 May 2026 09:53:20 -0700 (PDT)
Received: from mighty.tail79ce1c.ts.net (nat-130-245-192-1.resnet.stonybrook.edu. [130.245.192.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e032sm129797216d6.32.2026.05.12.09.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:53:20 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: nathan@kernel.org
Cc: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	bavishimithil@gmail.com,
	kees@kernel.org,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	rogerq@kernel.org,
	samitolvanen@google.com,
	tony@atomide.com
Subject: Re: [PATCH] ARM: OMAP2+: Make OMAP4 finish_suspend callback CFI-safe
Date: Tue, 12 May 2026 12:53:18 -0400
Message-ID: <20260512165318.442-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512135757.GB570003@ax162>
References: <20260512135757.GB570003@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I don't think we have any formal documentation for SYM_TYPED_FUNC_START
> (it should probably be documented via kernel-doc?) but you can read the
> commit message of the change that added it for more information:
>
>  e84e008e7b02 ("cfi: Add type helper macros")

Thanks, I had a look at it and other similar commits like

c50d328 ("arm64: Add types to indirect called assembly functions")

I was not aware of SYM_TYPED_FUNC_START before hence the logical approach
was just to wrap the function. But now with this I'll send a v2 with the
ENTRY and ENDPROC changed to SYM_TYPED_FUNC_START and SYM_FUNC_END.

Best,
Mithil
