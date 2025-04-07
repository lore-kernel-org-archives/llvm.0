Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0331EB5CE
	for <llvm@lists.linux.dev>; Mon,  7 Apr 2025 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039046; cv=none; b=W/0TrjRj4beNWcxitL8r3Wr2kaJdixjqNGfTPquqbWbD+2aTtEpnaRPeFwFLUc4ruDQQfzNRNuyKvhgmUcvqIY0OWGMsQOzekPeA5Z1di58I8FahmyDk2O5QdXhDRCc7Wn0h0NzQl+yymASTR8PipOXug2rrJOvfAzB4pVOXjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039046; c=relaxed/simple;
	bh=GaZNzpjk/uSgd7Vcok7kqgIyRmErrAqGopWkMjs6OpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CP6VEuAuPBNjkJy75NQ9uO4+6bJ59l0bGdP0FfDpQ+c6/kbjlxeJSdIMVA3sHc6yvZc+zM6BLFLNxZ8Idaf8DgDGqrs9ZxGM8C5iXxfVbDrfPQcGhSIOBczjQMrmyQ/UhufcxEIekL9Xl3HDlL6TK3AB6kDBtn/c1S5M9nWF4hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=abiCn+a0; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="abiCn+a0"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1424273e0c.0
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 08:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039044; x=1744643844; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KryXeeMhvo1fW/6I9/fSFEwrg48LYI4766MWfuI9U48=;
        b=abiCn+a0gPDfqzL/x7dE6lFtLrfDOGzE9BxYdn2+VD1zsAGueKb/8A/+ly0DCBdGSa
         8SOZ53NPfnQjBB26McwdtmV9DhMp0YYRab/rlyWUzjd71trHroIYZG7SqJsA5EZYkLs+
         QJdh3Z8+lsiEvnM9emI0tZcyY2zLeIKeqSczk1ZhdwayJ6yhN6TGFIBSrjoCc/gkL846
         7F2g5hZdNVDxNGZROW9g7F9gyfGiU2TcNuRtfSY/rU7bm9/PH96TJw4LKWOI1nfu2q+L
         K3UwMHzxEwWbifLhGOSm1JltnWCbGoGMNc+mNrzhCi5I5JfhDtkYKX55b5WrClLlj8po
         khtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039044; x=1744643844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KryXeeMhvo1fW/6I9/fSFEwrg48LYI4766MWfuI9U48=;
        b=iBn+3CZKZx1QC9Y36NVZGLZDozrki0hm+XnkChtBHsHOvA/1AXhdDOAnMrXou5RWqh
         ozTCtE92a8SWEkW5lJshTdRPmrehH13K/+X8MSlrb9Rp3+86EmiEWCaAxusUFR5WhJV/
         CgJdmjUEUYuDsv1w9qs/fmEH9xtWSLbIzjjZk0GDeTGnD0PsQuJQ9TY5ZWcdu6oTPmd6
         wAXANVrZjJNKOzIdXcqDMWFmEy0JjvXnqCgwnBKGCNRwx+nh4FQ8TrLd4eUjb/8uFOQZ
         niMi36YMUw+fjkJH6eoK/zMP3EMHTn3Q63mbZ4qabn/vIRKwafIeitYXnk6soAw5cM1x
         GetQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt6qMs4QCNMTnlVRaSMPnCkFsRnPE152F0tiEIwReVdkfdSrsFzMpfmqlYO89dMW8Uvjux@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2z5bKBncdLEKC1qwCvbRbBEH9BxzyxFETpID84Zmz1dQRs05x
	BNTwIAJXzEIm22NQSN2/mNhN8txtl0wvPvDNrgyZzqDU6bsKAetVjfjNxaMRNlIQx3fX2HWhuwv
	TRMNBZdUeHPbnw5rOHU3Oli04sGas4rGjKT4p6Q==
X-Gm-Gg: ASbGncum7sEXCJHg0PKXzrF37pNc8BDEqMsaMrR4I9IqTuhg3KbClWG1U+EBkx3vtek
	1K/JjHth4lYePV1U1Cj3psGPwM+RLv5tx5+bBzQlx/e1jH6ZsjZ5YWy65XTuT20WogKcwAlpoQU
	yiNzQtC9oUvhXkDVkV2GndwsbeiSk621lKeZQVmwdkUMPumKTw1S9DqqQjX0cDs6nzDdgAVQ==
X-Google-Smtp-Source: AGHT+IH206FpiM+rgrTfBvzV0b82SkEbcn4bNrTAoNzAs2SHWJTBE9HK0oB8k1t4NMwGB0Ykc0SphwFI8gTwN3tKzBE=
X-Received: by 2002:a05:6122:888:b0:50a:c70b:9453 with SMTP id
 71dfb90a1353d-5276459e61cmr8027565e0c.10.1744039044078; Mon, 07 Apr 2025
 08:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
In-Reply-To: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Apr 2025 20:47:12 +0530
X-Gm-Features: ATxdqUE5kxlj_8OqC8jsSD6w0dhR5AxZd7mod0ynt5NdSzSdKupNdtTOZT5YBTE
Message-ID: <CA+G9fYtNcnAEVs70eH2yP5UxRBsfrN2B1nKNcggGQ7FNMAJMmg@mail.gmail.com>
Subject: Re: next-20250407: qemu_x86_64 clang-20, clang-nightly no console log
 but gcc-13 boot pass
To: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, dwmw@amazon.co.uk, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 17:15, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions on qemu-x86_64 with clang-20 and clang-nightly on the
> Linux next-20250407 and no console output.
>
> The gcc-13 builds boot pass on qemu-x86_64.
>
> First seen on the next-20250407.
> Bad: next-20250407
> Good:next-20250404
>
> * qemu-x86_64, boot
>  - boot/clang-20-lkftconfig
>  - boot/clang-20-lkftconfig-compat
>  - boot/clang-nightly-lkftconfig
>
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
>
> Boot regression: qemu_x86_64 clang-20, clang-nightly no console log
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this and found,
# first bad commit:
   [cc34e658c6db493c1524077e95b42d478de58f2b]
   x86/boot: Move the early GDT/IDT setup code into startup/

Lore report link,
 - https://lore.kernel.org/all/CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com/

- Naresh
