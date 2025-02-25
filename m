Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A319CD0B
	for <llvm@lists.linux.dev>; Tue, 25 Feb 2025 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519492; cv=none; b=di37bt0tOXgI3PrB6tsRIlmukAX9T4rtC0pKyr1fF0pz61QVBWdl1x+bl4LZw9qvt5U+z+hjvLC52ElPjat0Lkjcyf3VcOWWDl/lghwPQ427FDW9XaochRLjhaO2p9FovnsAXpN4bPU0DU4UmM4wNLW8saGzP+a/TsOXns7mFQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519492; c=relaxed/simple;
	bh=aE8YFaAaS3yuOPewtHTX+TYTLUQYvdlxC6/LkkaX3Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfZR625+7yT0XZwyOUV/hyRzMVyEaSQTqpMj/z74Fo1Kq81b+O+MIhqNP7jbPmrmEFkHFvsrBY3jyUbSjrlRfLKlkR+/IxcdQyqhqlbtx0/8pHMQS1jo/P7JaGl15iI4nb3C8/Lsh9QltN4xX4ZigeAF4pqUnc498/OgnWkxAIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMd8rT9q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMd8rT9q"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f3486062eso5126374f8f.0
        for <llvm@lists.linux.dev>; Tue, 25 Feb 2025 13:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740519489; x=1741124289; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aE8YFaAaS3yuOPewtHTX+TYTLUQYvdlxC6/LkkaX3Es=;
        b=FMd8rT9q5TAHd1YgGHhv2VXejXkBeqO9PZGM4eOm/+830xFRAFVoZGzePwusVLK4Mf
         ApU6cyrm6S5+W0R8DJTXeaQF+aCZk0jtyVWKsCCuBDevUS6+bfUlvKHqdZ69Feh8mOlP
         EPUS5tH8yAyWxnCkS4hQChIMx4oRl4PyMvjbdPSSGNiuZw8mYcWadxwgKswSp5WpmCb0
         kQ0b+dRGjlMEcutdhSVD+uoSl9moWw5gVHe/iYNNrr3lzTklUi3+DQn55yl+sJlzQ4fx
         IX9roUwC2sjik8Qpz2BpCk1zK/3nxNIwq9U1VQUW6q01X3slhVuAfmNp/RCrPXtG0VAr
         Z2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740519489; x=1741124289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aE8YFaAaS3yuOPewtHTX+TYTLUQYvdlxC6/LkkaX3Es=;
        b=QwkuNQWvJ8PGy5/DA5qaAMdUkt2H57EUB+oNYC0iQ7jM4LPpRZMbYK0TfX4snQAVXv
         neyHhqbnK3pCOHsVsGaGM6WffjSU+Albtwj7JfxrYV5XvFM3ZjDq4KI79OnjJtgCFeNC
         VWTMjGLkPMjs9/B6doDDtqNwrcPIHUe8v7lasT+QVc0qALRQoVfR+VJYikHU4TwKEZ9r
         XsBot+HSkxAn53MziKN18jpGfz9bRYMysBhbHtlIaJHE2nzcCj7KX6rCORwXOZgAeWEZ
         coBqIoRrLPMic5M5ltq+MZGu82ViabzfZzLdmTUjags04fqFDsKasss5M1Wd3NqxkW63
         7z6g==
X-Forwarded-Encrypted: i=1; AJvYcCUQA8Lms4rF5Ar8dNJMrc0hd75gpZRSbwcIVqUZXXztlNNOOXfFGh1ZaFT03eml0ccIW4Na@lists.linux.dev
X-Gm-Message-State: AOJu0YyCgQA3wNMJKE7wEcTCwFl6GjwVupf5tJQrfGxOX9e+D78jM8Sk
	hcRgLn6xiZMBbvADWsJjeRdG8flNvuxEBFgMQrbSXtCAF7HpcvGoQ2hjA4/anIZ+GPS8io7P7/P
	ocRpW87WESJT6H+KOMqUHF+o0vE4=
X-Gm-Gg: ASbGncsY+nn28oSmCRtDAQxJJ6Ua/cgBrzxgv9iUD5Y2fSmMiAgRJKh19PZ2qyYU31a
	fjQTlIKF12WC6hw8xWmYCkKwZSltu/0AEx0l+yIKdEFJn+Wl5f5yPS9hX5vQLQVnQHxPqhepvub
	jNHDsYz5Ol
X-Google-Smtp-Source: AGHT+IGzBmIP4aWCt5zFr/sHd8kjuZRvXKRM0LrcV6ko0BFjnKWL3knShVuZ19Ay8ztNZBUEIkHfc1Iw5Vfb6Xxj3AE=
X-Received: by 2002:a05:6000:c2:b0:38f:2401:a6a6 with SMTP id
 ffacd0b85a97d-390d4f3cb3cmr437434f8f.12.1740519489416; Tue, 25 Feb 2025
 13:38:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <168f775c4587f3a1338271390204a9fe16b150dd.1739866028.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcVSwUAC9_xtVAHvO6+RWDzt6wOzWN623m=dT-3G=NnTQ@mail.gmail.com>
 <cik7z3nwspdabtw5n2sfoyrq5nqfhuqcsnm42iet5azibsf4rs@jx3qkqwhf6z2>
 <CA+fCnZd6O0_fc1U-D_i2shcF4Td-6389F3Q=fDkdYYXQupX1NA@mail.gmail.com> <uup72ceniis544hgfaojy5omctzf7gs4qlydyv2szkr5hqia32@t6fgaxcaw2oi>
In-Reply-To: <uup72ceniis544hgfaojy5omctzf7gs4qlydyv2szkr5hqia32@t6fgaxcaw2oi>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 25 Feb 2025 22:37:58 +0100
X-Gm-Features: AWEUYZnS8GVd3ERRXhXkc6hjvKnRC5lEIY-bHuz7PF3TjilwVr_-TxB6baR4YG8
Message-ID: <CA+fCnZfb_cF1gbASZsi6Th_zDwXqu4KMtRUDxbsyfnyCfyUGfQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, 
	will@kernel.org, ardb@kernel.org, jason.andryuk@amd.com, 
	dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, mark.rutland@arm.com, 
	broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, rppt@kernel.org, 
	kaleshsingh@google.com, richard.weiyang@gmail.com, luto@kernel.org, 
	glider@google.com, pankaj.gupta@amd.com, pawan.kumar.gupta@linux.intel.com, 
	kuan-ying.lee@canonical.com, tony.luck@intel.com, tj@kernel.org, 
	jgross@suse.com, dvyukov@google.com, baohua@kernel.org, 
	samuel.holland@sifive.com, dennis@kernel.org, akpm@linux-foundation.org, 
	thomas.weissschuh@linutronix.de, surenb@google.com, kbingham@kernel.org, 
	ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, xin@zytor.com, 
	rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, cl@linux.com, 
	jhubbard@nvidia.com, hpa@zytor.com, scott@os.amperecomputing.com, 
	david@redhat.com, jan.kiszka@siemens.com, vincenzo.frascino@arm.com, 
	corbet@lwn.net, maz@kernel.org, mingo@redhat.com, arnd@arndb.de, 
	ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 6:21=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >> I wanted to have the shadow memory boundries aligned properly, to not =
waste page
> >> table entries, so the memory map is more straight forward. This patch =
helps with
> >> that, I don't think it would have worked without it.
> >
> >Ok, I see - let's add this info into the commit message then.
>
> Sure, but if you like the 0xffeffc0000000000 offset I'll just drop this p=
art.

Sure, assuming it works, I like this address :) But to be fair, I like
any fixed address better than using a runtime const, just to avoid the
complexity.
