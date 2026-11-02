Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650321;
	b=w0BQcn4Sa0Z1QCeBAn6zbZlK0SMCGkwLJlHP/TQCfs3zKkd8KLuVOTnblJM4dWLbEIVP
	 uBaAX2myDeN/O2YI3AQT0tCVw5h2wEUF+4f16W4b/MgkiH12nCJuF3Ov0A750tbd863hP
	 214sDdH9t3opLhX+BTAXaW7u519lO4i+UjOOP2POWkHW46Ph5EX04bo/nlb57aRW+pcmG
	 fu9Ms46CtQfJthFgaamMI+X/BZ+qCFy9UW6y2Ih8wnqBVforRToQmDuxna4xuPCKkeETg
	 ZSdE3PbhRet7R/HvbCBtJqGHfrkjS536Qv6Ntc8XPOGKAkgsNkzoDnqkpNiBQRTi+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=0RcgJVqgbNsSUdU++7Y0dOlItgAQ3e32UH6pOxcRyus=;
	b=cM72E1b+9JmY6ZK2W9eEIKZ1hs55cNRFVpISTqWRhes3NdstKLc512ocLvocCTg7X6hN
	 M/50kg/q4fezTwXZ6WtgTSIJ1aSMjbK3KtfpSDjq/LjwJJcU7642ioMinM9w2nTXs/gDX
	 XpGQl+sm6Z5V3/jFQRFpILzGKSYsjayoVHlqWH3atT7ZvPdAxBREgBsl1CRVYlCb6tgZU
	 PRuTUUX1xcEP5t3YANa9H2ZoFtIgrp4y4OJQT1FHwmIaMlchJdzwEmbSPCi3+6DCu8I23
	 3W7rGHs0vXa29zhzaBS6Qqf9SDROfBoAhTAUAFQ5wauq1DfOtKjwYlIKmViOHwOiZqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PH3rlZGA;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD75606A324
	for <llvm@lists.linux.dev>; Mon,  2 Nov 2026 20:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD75606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PH3rlZGA
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso416566866b.3
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 12:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793650318; x=1794255118; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0RcgJVqgbNsSUdU++7Y0dOlItgAQ3e32UH6pOxcRyus=;
        b=PH3rlZGA0MItqEukq9AFA4NbFCf9JD+EvFZhqcsM4wDfQO4keo/u2q5SoyanBADWW6
         3mR+3nDZXSonbR9KVkwDXah7/HmHGf5ez+C/o6N7J6bc7+WsL2UeXe9q72x/JzLjCv0+
         fPNkQ91FzP9bgsHK18UoesOLvfgCZKb4L+H8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650318; x=1794255118;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0RcgJVqgbNsSUdU++7Y0dOlItgAQ3e32UH6pOxcRyus=;
        b=0BTduuilBQ3ptoL6mOZ4DD8NpTayzz567Hkaf208TR/1Xchva94SpeN2zsSqMfjVrc
         nmdrWT2EnZRQGEVheGweRS1eGt+S4cfu0a9bLwsCCQv4HyVnPRUDdJL2wvSlb5vG8/Ct
         nqlyveTeU/JQFFzK2V3XbCyF/48wZnvbu3b2KOTtltbk0p8TtXJkWsN0exprfSJ4N7ay
         zIgr7foZcOxcS1VtTDhypAh/bAlCQe9OIT10lKwA8hKHV6tWZlU77nCsMKmzBH0mWoul
         xfHMB4HJCAmCaWAxuZ9e7IhYf57Nf4veX5+SihZSa0HV3NxaQYPrrWptYTxb5zsG4sOY
         imSA==
X-Forwarded-Encrypted: i=1; AKwUvBw6YSd1Au+Fwpt3MJwWhtaeicZsd7eTIYFotrnUjn601oBa9bOjZFfRotzSiOIHYIc0Wz20@lists.linux.dev
X-Gm-Message-State: APuU4Z83P9/RrxlxM5GRzhcFY6y+od8c/JqfqGfrAfSKWz1htaY1Cq8U
	S0iTcl+0OB2oNT2+5R+9y7f7DsH+0rsqEC1kc8Xb9+AWMAPIbib6TL2IuMbtUFkRe+kz0Ru+qlS
	9T2fB55uuHQ==
X-Gm-Gg: AYBFou0JgMVxQPshEL3G2fVyNDEAOjWbbQ9vtaB1HhXp5l3uzt+fYyIMFI4RD5tWMkV
	jKXlq3SNOuJT6EEmHU86YiZTi+N6QkLKOVvzZ7Tpxv+yEEjnHtvPc/rXhxbUuS1OgHb9ZqAXyud
	Aai9ONy0ZmRCfRrjr1YGu/4iZvgR91uBTwUX4/u6sm/jqWh3WYVl3hJ4E/1AVivH/6t3jwtp54a
	E97YwYqWWZdL56ejMimFeZPoNJTIdKXgVtM0SUQX+RJu3N693hwGnxkKcKDiDpYvGpKd0yVCLr5
	INae1+kBTYfG2J5Lvl1qp7/6XZrdT1m8JT49H0SDn54nAGV6xnq8WXkdop8TkeyvZKN89Nn0xhz
	hOLsKooyUW7G3gg5cphsCarTbmUJYOpFAi9Ynw9oiIZVx2O8nHPqJfJz1iwtOGPIy2SYQt+rRAo
	enuW7pQJOui5ZdMhQxoCFIadf5xCuIDxqO6KHP47Y3AM2A1wwXxrZgPk0jNUmIqOaNFX4uaCvzk
	fWMTE2lpIUA7ucETsqP6nxGQ2pi9IzlnfXbYcE5kEG339mbj8TjFY6ZlFbOzYlInZvfyEZoZoAd
	iwxu3JXz8Ve6IA5Ec18DHB+Xlgd+qtOdAKR1Zx3NR3yZV/O+8FywHJ2nyrlVoGU02sRfYyG/2Mz
	7YQ==
X-Received: by 2002:a17:906:f84:b0:c4c:ddd1:d006 with SMTP id a640c23a62f3a-c4cddd1d259mr214397066b.38.1793650317971;
        Mon, 02 Nov 2026 12:11:57 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cec15c806sm19589566b.74.2026.11.02.12.11.56
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:11:57 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e8c710847so480458066b.0
        for <llvm@lists.linux.dev>; Mon, 02 Nov 2026 12:11:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxNCW++tmGRahkvOw5PAM0+P3tKen7v7dceLQ5KoQm2yZc3BVxkWyQLANksFx4HiFAH/PXS@lists.linux.dev
X-Received: by 2002:a17:907:6092:b0:c46:7fa4:9224 with SMTP id
 a640c23a62f3a-c4ca7a42014mr847532666b.8.1793650316483; Mon, 02 Nov 2026
 12:11:56 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
 <86f2f603-c1a7-4715-ad43-ac9c90f6a837@citrix.com>
In-Reply-To: <86f2f603-c1a7-4715-ad43-ac9c90f6a837@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 12:11:38 -0800
X-Gmail-Original-Message-ID: <CAHk-=wibsAfLX4H0pcxDrh3JZoKgFfdkZfLfQbKYUqMyLtKKvw@mail.gmail.com>
X-Gm-Features: AclHuK-O_PpDvelbVnnFVPJ5B2qswxBRCgv27xvFqM-TqSK8PWwNWy-2a0ehb7U
Message-ID: <CAHk-=wibsAfLX4H0pcxDrh3JZoKgFfdkZfLfQbKYUqMyLtKKvw@mail.gmail.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when Spectre
 v2 and BHI are off
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	jpoimboe@kernel.org, justinstitt@google.com, kernel-team@meta.com, 
	leitao@debian.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	luto@kernel.org, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, pawan.kumar.gupta@linux.intel.com, 
	peterz@infradead.org, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 12:06, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> This doesn't buy you anything, except a larger code footprint and more
> branch predictor pressure.

Very possible. At some point in history, computed branches were
cheaper than table lookups, but that may simply not be true any more.

               Linus
