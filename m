Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CE63DE450
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672618; cv=pass; b=VfWAqsRlr6B3umlltxcSIBM5bo6aSefqPZEATSys5RPUDWN1BWJhH6bRyGqcTUotJvLI1ZU1ENUiFaXi3YGHq8IQXvRVhco9BXgpTuANhXxorU6jaK3CZfIr9fpLGuxXE1SX8UkQCt6qCp9U1jcLCsBe2irErMZi1RSRd6YQRGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672618; c=relaxed/simple;
	bh=M0Ti+6+2fGXFk+cKiUj9GFmw1ywuOZbs7swH9SSB+IY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPuYem638cmGwiTdZLH9KwlynqNEYolm2lXvmhD4qGUD8XoPJc8xdWVzmZ9iXb6pPtXcJQxmH9iPbyHEJiUjwg30SGYnIpZ/3gPIPaomOpcBYKVpuZJ0vpoxgZyi9ml07Sqwe8pDPFN01qzDbWxBlh7RoKatSlKseEQ1HDjFUKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l/YWDT3d; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l/YWDT3d"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68bd7ec2371so10477a12.1
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 08:16:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780672615; cv=none;
        d=google.com; s=arc-20240605;
        b=d1p7IX77ffyaKG+0LYJA0GB2SP/Tcg90leUe3udLfcOheGoIUkYAxmnyFSufha1oEo
         mWeeQAySlD5K52jZPD64Bt9Vd8+aEw+35mvMEO5TNlDxhGzXz6gVKUveCQ+/x0KEG1tp
         nlaA5AiGeOqGMShsbeDrZ7kp4NfpjV2REZrD5c2EMqh1M/ZpSG2crQinIuzi39/SXV/W
         a7C+V2zKZg/AQE19jrJLvBmo42DRKm3GPl8kXJZycGmMW04YGQ9elNnmL8FSxUh2ivSW
         nyWY8G1TiFXnzolDHJbN/Sa6GELWORy7M1ak2P3NacpEbZTldr2oa7cTr3+tKTwDnIo+
         steA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4P/dDdhLfcmxlWjGtS/G4l/JMEkA2smtkmUSE6BkJ0=;
        fh=O7bb0+anp3Lc6u/+6IoVx9zpQCudpuD9Ci3po1WOJqI=;
        b=V/RGSF4yTa9LPGz2zxKJJ36bohGMZvAilbkBVZraAZhkMEP9+W/kerhZZKZ4Jlfxlb
         iYqUCYGJwXQiL01cv1clcXBBS+lOHxiCw8hhvwtG7+7IDA5yeOk0/bicdm26+7fDiN2m
         RgMkvEL5wnc/EMkjijTo5qzylgtuhQptnDAYoaxnXQReyasrjKOI2YXtBM/PAJXQqteE
         2kGJkZMz4Z3XtV83s5yQ8a5ttTOH9iDBXIp2W7G4ioBN0y4vLsel0oqEC8MpG+PQqZbO
         RGuy5F1pcj9oRGV95PGvYB0W49fgDbMguDocnPDjKe4xeuLUtz5iR3iz5yOdiG2ylCp2
         XvBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780672615; x=1781277415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4P/dDdhLfcmxlWjGtS/G4l/JMEkA2smtkmUSE6BkJ0=;
        b=l/YWDT3dq3H8qPpOfko0qtLbgwmvDYmvyVNlpkjrDTQlZtJppwB2FWtLV/YpJmTxZp
         jhgmIOOBEPaZRe44hHPwK0/WvpwyIXvMoOOYV0ofjHRywtqPEi/mQgLxNv8Gp/9qOpKS
         ryDF3g7hMAyryutEF9sYNk5epfCFs7JiIYzNzRpG7a3THI3ZJ53WYAwGrTlN9Fe7nok+
         mkuDZMAo14n5+R+MVWIgwL71nLxuY6dM3UWK42weaAHXNRoa7rcrG0V274XDAgHiBjLm
         8wvSc5DsCyHdDQ/EYiMfkhPQobjFV9hvN2TqvammpeJrzLI10bdlwZ0h6pPhz8ufpSEh
         bLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780672615; x=1781277415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4P/dDdhLfcmxlWjGtS/G4l/JMEkA2smtkmUSE6BkJ0=;
        b=lU9gQv8s+GyqipQPva5cDjX1XWyjZRfWuJMXyNyHnJg/AKyJfOXtoF1P9VQgQwHblG
         2YGyddY9XFks/VUfCTnEvK41E36GQqnK+V9OxeAWy7ArQ+jhGu45gBX2md4Qc3fSiVkv
         9ZeUwVNxd2DNlVHKt0ftN7VZW+eoXkaFCeg/CJg5n115OXiGbw2bwEU1RDKpNVvAuMjB
         CWjE8WUbyCZuDTS1/7AUv7h0dWF8XmU+BlwTk31RCNnRP/zXotMB6kdF+jetHQG/QFWR
         EE+AC+PJdi+tVwyPr4zGWb/M1L/tAbYe9zlI5cXADjyFJstMloMOIgpKcBrpfOQVmU73
         gz4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9xEN8wQD6xcX7P5eAj1Ls1Wv7hnPnA6P5iujGBN8ysjW4uZkxnD3sLsxTNCBQF1v6egu7v@lists.linux.dev
X-Gm-Message-State: AOJu0YzlsigIoQJ3pIDgSuQkvU5C7fnmNg4qmnFr6bGeZei3F+IFKO6e
	9mc0cWSzJ4c3yqoeTyYs+TZRcrYW3jnIb8meVc2rgeQXwo+4/0IX1Ff1EqBp3OPOE6SaJvFMXIA
	tDNkPZBKuqXLrEGObbFBP1fIk9ks1ivwLEwAGZ77DUr4kLwKfR34gVrCq
X-Gm-Gg: Acq92OFdbOF4iDBgU5s6zyBWEsXBMhmeCInphVYCyPEB6yM8ETq+FgYoamvSR2ZKq7p
	adEk6qWPpHkM+H1Y2oc55Jlwn2IKYw4/Rd9+nNAfMNOpcW3a/VxXEWtH2v/v0WeKTV+L2l+G8Fo
	mRuIRfF07NmTB0pAtiTD5u8b/9rkHz97Pmtas1fpjW8cR92DGnkGW8at8cEL4+U6r0GgzHrRmm4
	Y9Vt08Blk3/7PvgZyOwclroxexPLEabknZUzwIzVzRkhOCvi+fDcPapAULBLpHHNdRI9qsGL8Ap
	FSIvXzXxp+Rc+Vk=
X-Received: by 2002:aa7:c413:0:b0:68f:d41d:ca5f with SMTP id
 4fb4d7f45d1cf-68fe927fc75mr43411a12.13.1780672614649; Fri, 05 Jun 2026
 08:16:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-tracing-fix-cfi-h-build-error-v1-1-b27015390901@kernel.org>
In-Reply-To: <20260604-tracing-fix-cfi-h-build-error-v1-1-b27015390901@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 5 Jun 2026 08:16:17 -0700
X-Gm-Features: AVVi8CeQw3smwcST71LMGAGTwkM2lHTSl-GXkozY0EakrBxGEKMpmYz8YpNBi-g
Message-ID: <CABCJKud4OxJJVt5eTaNqpGqLrKbF2teAd3FERoeg+sG-G2Yiag@mail.gmail.com>
Subject: Re: [PATCH] cfi: Include uaccess.h for get_kernel_nofault()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>, 
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>, Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 5:33=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> After commit 0652a3daa787 ("tracing: Fix CFI violation in probestub
> being called by tprobes"), there are many build errors when building
> ARCH=3Darm multi_v7_defconfig + CONFIG_CFI=3Dy like:
>
>   In file included from drivers/base/devres.c:17:
>   In file included from drivers/base/trace.h:16:
>   In file included from include/linux/tracepoint.h:23:
>   include/linux/cfi.h:44:6: error: call to undeclared function 'get_kerne=
l_nofault'; ISO C99 and later do not support implicit function declarations=
 [-Wimplicit-function-declaration]
>      44 |         if (get_kernel_nofault(hash, func - cfi_get_offset()))
>         |             ^
>   1 error generated.
>
> get_kernel_nofault() is called in the generic version of
> cfi_get_func_hash() but nothing ensures uaccess.h is always included for
> a proper expansion and prototype. Include uaccess.h in cfi.h to clear up
> the errors.
>
> Cc: stable@vger.kernel.org
> Fixes: 0652a3daa787 ("tracing: Fix CFI violation in probestub being calle=
d by tprobes")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
