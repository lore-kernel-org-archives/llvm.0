Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C41B3925
	for <llvm@lists.linux.dev>; Mon, 12 Jan 2026 01:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182412; cv=none; b=lZY+6aXzxH6syq+VOQOWI9zoum0LQhD21+bfiartYeAhIugoNJxBVHQDNSQyTX0hcO6bw/UwEY73igZqZltZoL6n3vGHRC5gWzhdVsKYfw2Js8uIbEYgDpTA0wnpwLfavgoAarCEXK/05zjTlRIDQPIwZ9DxlG2Z2VXxndL3Ibo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182412; c=relaxed/simple;
	bh=nEbS/u2RQQcYbrbJKPWfQ5L+q5LiXJAFL1FpwJCPoC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=hlSQDz9Vt0oK/eFFr4gplTtItzjwvkNOCchkw0E/JVvyuKO1lAGdNYosjhxGt7AhteA+GYzPABHwIO8/T4JLjoMupA+onaembZFCbnxoQIR0KZlC2BYxgy6zaimJSHN36aJTBcsH11TkTGZg5wf50cP0IWmzslmKjH+lqYwVW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pb6WIrGa; arc=none smtp.client-ip=209.85.208.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pb6WIrGa"
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-382fa0dc9f4so48427741fa.3
        for <llvm@lists.linux.dev>; Sun, 11 Jan 2026 17:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768182410; x=1768787210; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEbS/u2RQQcYbrbJKPWfQ5L+q5LiXJAFL1FpwJCPoC8=;
        b=Pb6WIrGabHkwv8H+1ZyzeqDDyTscjg2QazrhnWqB3d5PBdAMEkVWI3/cUKg75qee0T
         qh34Nz7eLhoeq5nfOHLTAzZVXpq6smRXt6J3zHk/zAR/GC+t8cD08RpLrKAbo88s6Yay
         bhVdBzTfLAbMPbkmzsgTta4c6mOb5wgfE9v5A+YvlJrUuJiCbO1iQ8tpBCr1LwYpZHOr
         D6fC92dtjWCdMfKKCYNRo+ndWZ9R4uqVTwe70j3gvNJykzn3bJmmHAqSt3Zcjva4xj7L
         A8llPEUHdGoSwXXy1bF0oGi1B/er3ncTMq6nmxFEsK9EG967gw5i5qAQ38wCTJ7qx4nA
         lolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768182410; x=1768787210;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEbS/u2RQQcYbrbJKPWfQ5L+q5LiXJAFL1FpwJCPoC8=;
        b=UDQzvDT/U81ctzmipJWi8WM9IwgVhF9wR66UjSCNo/RbjmMb0eyV6DqCRliAuV3WPW
         KzJJFOyvv54PrdRqWX9CGydRbkt3ILr5ILy/g4Q2w0ZCDrNKstEU2gZu/xA/nwGakmJo
         9i41pzXsaTl2jpL2lySmMWAFcas/hgXFWDQMJgG+zRAboEj0Tm5ajhgnHNk0uHSvBTMX
         vzrfLKC/CSSCVz4sWiJiDw5J5ZV64OPFEgD5uct6QXLXH1ka7QFXVTdg8vNBaCFI4eQx
         XfgPZcWWUlJj/XXYH2UjlG3qAMPi3njG0sANnvBnj6r59HV2ib7Gsld0qGTTlAZSL6/o
         zisg==
X-Forwarded-Encrypted: i=1; AJvYcCUAfIknTFiSXQ7e8AYxiQlkNRb0j1lAct2VS7KJU4ugztdPD3e4j9MOwta/sG1Ccz2g3uBO@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3pLIeKRuhQeY/eUY0R9QGmAGeTa5pwIzCJHllzU3B/nKubC+b
	qHPE7wmSiEe0aDGKX+8Sdz8Ji34c9Es1Lan1cs3BKxJUFapoE2tHzCIqqmEq4fi6Fg0wpfKgXM2
	XybdVa0GCR5O61CN9nDC51jSlwXbJYkw=
X-Gm-Gg: AY/fxX4Hkb4wLBK4lgNle+kIr6pgxP3fVGKP4HpyMHC9pED5S12MdlT6lkQHDh5w4CE
	Uj8lb0LLFYPPkYvyqAexY9cTRU00HdVFjeTDSmU7QPbhD1soUQ7SMu2JmXDbyq+zTwLx42bgKXp
	lRZG/tucee09c+ubPasbvlvtgz6ydWpk0AgxJSPIaFnwu9+NefGxbWKsaflwVvP5fMoyGuGFYND
	Q+eNTBkrfpTjok0zo4xjYSBFyByUazM1sFZ1Kpv0LIwCeDauMqsicsw0Yvv0DirdoXQU3afc/kY
	aA5J8o0=
X-Google-Smtp-Source: AGHT+IFFpwzTXrZRWWTS4SqiF2TooCPfdND7LQbcPh92LwGsCcyKVlkAaUkkFBv7cb0PtOc7uKfEgzgNAyHXbkUFUVQ=
X-Received: by 2002:a05:651c:2103:b0:383:46e:4b50 with SMTP id
 38308e7fff4ca-383046e4dcamr54169621fa.40.1768182409357; Sun, 11 Jan 2026
 17:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223084337.3789-1-hupu.gm@gmail.com> <20251223084337.3789-3-hupu.gm@gmail.com>
In-Reply-To: <20251223084337.3789-3-hupu.gm@gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Mon, 12 Jan 2026 09:46:37 +0800
X-Gm-Features: AZwV_Qh31RHE-ZoDZTo_QRvvWB2SkShFywUC-YhkU2L6OpiFx26tkfkIuGOSbSI
Message-ID: <CADHxFxQkffVfxfjkX5+F5Dg4ewibB41aXSo6f5icVwD8fghjog@mail.gmail.com>
Subject: Re: [RFC 2/2] perf build: Prefer kernel source headers for BPF skeletons
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, hupu.gm@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Maintainers,

Sorry for the noise.

This patch was sent nearly three weeks ago, but I have not received
any feedback yet.
I am resending this email as a gentle reminder in case it was missed.

Thank you very much for your time and review.

Best regards,
hupu
