Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C5208D1
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727282843; cv=none; b=sMgMe+h67EIJ+yWPN4NO5HunaOUNH39vLC9BwNLjsEdGreSz3uVrDh0uk+wIZ7UY3dIeYp7P2lPPF/jPt+xMF5b52uDf4CNtniUlR34BBVfewDhxDELVbZYPEP7oQlLV/UbWTfgqXknMrN4dpCGz0ILUp8zQeSWqJnqwN19V6Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727282843; c=relaxed/simple;
	bh=/t+YSp2gvbsBW9hsAIIEsn2fOHY2XQVupxHXFI22op4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbYosGs4eAXPd8imR6hZpl4Jc/Bo/8iHFdSKhkM+UXtCMXOJAc8VlJSE4tKBcgisyMnASwu1guQaTIhQXF1EKNIUVaT3hjt+5rFCjx7M04fg3VpBvB0EaHWQsNuXcKYO9SOUULZugPK7EcC90Rj0Ye5ULqaqVtsJ8GY+/u84Rcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AmGJHCur; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AmGJHCur"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53655b9bbcdso73569e87.2
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727282839; x=1727887639; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=AmGJHCurHmrbsdoIOcS5KXSEcps57sZjaOjecushUilWVckaBU3VzpiGYiESHynSxE
         Ko+75JBRRcyljXZP120JPbHLux6xXPKTxaibQjVgPh4/Ck+CJoO5m9pW+zR8CmJNTJSV
         fqFLCDb+p+LuAfUzpAdD2gCiVwiYeMjUf3FyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727282839; x=1727887639;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=TJCZdW68VsVZ275fTU8t7JOYSJVWcYzmvKtrVpCTJYXzZsuKrR2WrhgeN3FYqqsHLN
         ywKEXM3Ij8QHPlaWGchnXoalwxlUP591m5ddTTmo/ftkmeN+0LY3YQd31flmUS4gWj1v
         TMugS+w4HBQmzgNr3jNFZGlnyxCwYkO96bQ+CrhOHI0YE8jYHqcsdKz4h8iDLxclj4uU
         /ec6YcnyxSoj4SoT9OEPeZh6f4fah2pbsi4CAnyRGlCiS8OijspE6V2CYlOpVYA84Mj9
         1NiMO9BnJ9qj1FoCNXtZH3aW5YjrmNWQCoyzkx7lF8LunUwuU3e0fyVIWHQBrLMNJsSh
         aITw==
X-Forwarded-Encrypted: i=1; AJvYcCU7cnpvnpkC7g26h7ZzaVjlXfOlVtO114Mr5O+pocfwCw7iGGAaVlgliCTnxcDCoY4UdAa7@lists.linux.dev
X-Gm-Message-State: AOJu0YwgCxayVNPJGPxYdafozstu4alRQaLpr7eXJfyO5uKrm9XMi2SS
	x5D/LGb24AiNMcWoSudPr65RSIE+KfaToUXl18k5S7xM8NKgxGpto67KYdZNUzpzR+GtwpEER55
	qzUQqKQ==
X-Google-Smtp-Source: AGHT+IFJ2oJeP82fMWQZ7Qv2zR9k9SOXnsikgFXXZY0FNyxVvCiPK+ae2t7lrbHnhA5b0VVDYmw8fw==
X-Received: by 2002:a05:6512:239a:b0:52f:df:db40 with SMTP id 2adb3069b0e04-53877566141mr2414102e87.56.1727282839218;
        Wed, 25 Sep 2024 09:47:19 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93930f7911sm233792566b.172.2024.09.25.09.47.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:47:18 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cafda818aso68434415e9.2
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 09:47:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVc2fX+yWDv33KGEWeNIws9+5ZEg/b/I2nFeX6CS8AzmpIfVcHb6AL/p6jyN/o9PHBtM+G7@lists.linux.dev
X-Received: by 2002:a17:906:f5a9:b0:a86:9d39:a2a with SMTP id
 a640c23a62f3a-a93a0330c37mr309689066b.8.1727282382886; Wed, 25 Sep 2024
 09:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-44-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-44-ardb+git@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Sep 2024 09:39:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 08:16, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> Instead of pushing an immediate absolute address, which is incompatible
> with PIE codegen or linking, use a LEA instruction to take the address
> into a register.

I don't think you can do this - it corrupts %rdi.

Yes, the code uses  %rdi later, but that's inside the SAVE_REGS_STRING
/ RESTORE_REGS_STRING area.

And we do have special calling conventions that aren't the regular
ones, so %rdi might actually be used elsewhere. For example,
__get_user_X and __put_user_X all have magical calling conventions:
they don't actually use %rdi, but part of the calling convention is
that the unused registers aren't modified.

Of course, I'm not actually sure you can probe those and trigger this
issue, but it all makes me think it's broken.

And it's entirely possible that I'm wrong for some reason, but this
just _looks_ very very wrong to me.

I think you can do this with a "pushq mem" instead, and put the
relocation into the memory location.

                 Linus
