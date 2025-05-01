Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D795224253
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142126; cv=none; b=HLqhX/5K+pktzmBGnzUt50j323ILmk5/rHqxOjrByajDyniTK4dFZAWZ390U6gW9iYLmwJVCo3GAy+55VskZPOV2URowurPyVqdtvCu3SYVcZyph4Po5zQ50mP7eeh3VIrqii3flWhdFbZvOwt2Ujnv5BQ6YPXqVYl7CY4704KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142126; c=relaxed/simple;
	bh=TVZv1wE6IMiopn+lPutQ2XmVSkz9PSPheYWfp32DhNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaMfvTg4904FWRwvQkn6Db1xkPa6XZpjYMRblJpjiHdZtDuJhGe2+A4VKHv4xQfpuOCFTPFId4395s1K+7wQiQxWa/VHfuXESV2SaofSfywMZEx3v/1kChcAiytHNc7HlxXc850nX9B1jAzuXbXeB+hf9fZ+1b3EO/TxjeNOJFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YLGtSOFN; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YLGtSOFN"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso2605459a12.3
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 16:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746142122; x=1746746922; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xLQxE0ZAajilS9LJlCgVNxjKesNL8CM31Y1I/hwFDe0=;
        b=YLGtSOFNFsBB5bDzYNOu6RvbPERxVgDWj3KNwBW3zyWtKUfSLcv8+xdNIPCjm4IEjD
         gBWVitpA/V595QP9kpzieMN7ryC+Ims/YtLjjcwpDisiEtJ7JUUGPa8td4BkXWLCgpVx
         qc2bvOj4ii5SrqMuJGnj4RBZUtMZus+pHnJnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142122; x=1746746922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLQxE0ZAajilS9LJlCgVNxjKesNL8CM31Y1I/hwFDe0=;
        b=VdI7RDA3hSOPJYXtt51gQNA5pNZGe7nprdm8hNPB6xvqXej5wr6h0F48yVKEiw38V6
         CPKeK0F2OTxd39UIgDg+AoI9jDOtbrPq36Qp6cviv+1wU7T5YGZ5mdbxcWVnM/LXe75z
         RLmo7igcCK+vMLTHjsf0u9M4g96E03tEIt5SCNeUEGSuWCYhAX2FbLPoDnZvymgdMK5I
         IHmlsClKVZ7Rwty4WOyJ3wa7X/TcQtRz4GCyHryYImBaUXPiA27/6LjbSztTB85V7C9K
         K9NhTpyJLUSwcwiZUGxNc1AFltvqUwzugo1CRaJJ8dpycS8FAECm3lDkNbCUVnf0720S
         bRvg==
X-Forwarded-Encrypted: i=1; AJvYcCVMPBhh/W2C8/XzfzrsV7RMw7CeK1UmB4BEhBNspVSMhBgqZeNp4tC0Q2ukwF4t7RFrDpmD@lists.linux.dev
X-Gm-Message-State: AOJu0YyA9Sn7cQMltkiHeZceXbglJkhpsnn7SuNEZveqXVpBVuvXxl8h
	K6FxkBOS6I/ZK5DM1QgBHhe0y4Xn/j5bvw8cQLdbbHoeHCjgO2HIdQcQCjHpaA67zWlqf5Wv5EE
	ISJo=
X-Gm-Gg: ASbGncuIclXq5Fosz7PpA9kip+UuoNGMT4XG8ExKo64Y4pJS/3PGEUgu27cnbJKJ9oi
	UDEPl6DMwZM0+bjD+bhXNeOEoFrkFIzs65nVy0dc7MpogVRfhY1Dizc4okjtnBHAveOfKhAxLKj
	lNHlW/Yxl2+4VHLAudBkkBbzrAWFG9JCU03BweDXlXwJ1w6pzmnpoQSLln6/NSDsWdNJ09ZYVyS
	428DwXiUdTNoQ2eKIF/bY8bhqQk9Hu6eoI0fCIks5k0m6LyttaxmMohAqhRZ/8dwHtGFkF/HQb7
	Rqu5wT81xWfc2DQ3Y6A0WleS2z+h87Bfa2SAcBaJ3CQ3k+ROFQTNKXkldM7G6m7QFW58h/7mRAQ
	svblQf+6TFmBrurY=
X-Google-Smtp-Source: AGHT+IEPpM/Vd1w1XMwLT85L0/WzDCx3nd+4AxmP6c042B6sMCelpLmrXAw4Dn0RjFJYuNOk1r9dGQ==
X-Received: by 2002:a17:907:7e8f:b0:ace:d21e:e82 with SMTP id a640c23a62f3a-ad17ad769d0mr84550266b.20.1746142122316;
        Thu, 01 May 2025 16:28:42 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0c70d393fsm110035566b.26.2025.05.01.16.28.41
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:28:41 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso307215466b.0
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 16:28:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUDNCXkYwJQnrc+x5FUj3x3b4Tg/8T4vdLXe1gUDXNyjqkf/ntesyno6x64mlAm2Br+YmJG@lists.linux.dev
X-Received: by 2002:a17:907:86ab:b0:ac1:df32:ac27 with SMTP id
 a640c23a62f3a-ad17afb8ab0mr88710966b.53.1746142121345; Thu, 01 May 2025
 16:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org> <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
In-Reply-To: <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 1 May 2025 16:28:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
X-Gm-Features: ATxdqUGTUyHgnV_iTiKt6DDkeUKklvk9V4X7Te2h_qX7brrmy-_kNjuWcrlAGLY
Message-ID: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
	stable@vger.kernel.org, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Marcus Seyfarth <m.seyfarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 16:00, Nathan Chancellor <nathan@kernel.org> wrote:
>
> +({     type __dummy = {}; \
> +       typeof(x) __dummy2 = {}; \

I'm actually surprised that this doesn't cause warnings in itself.

The types in question are not necessarily compound types, and can be
simple types like 'int'.

The fact that you can write

       int x = {};

without the compiler screaming bloody murder about that insanity blows
my mind, but it does seem to be valid C (*).

How long has that been valid? Because this is certainly new to the
kernel, and sparse does complain about this initializer.

So honestly, this will just cause endless sparse warnings instead. I
think disabling this warning for now is likely the right thing to do.

                Linus

(*) Yes, the empty initializer is new in C23, but we've used that in
the kernel for non-scalar objects for a long time.
