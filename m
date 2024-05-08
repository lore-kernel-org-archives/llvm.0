Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A2E383
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 00:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715127077; cv=none; b=hUbTFuMYLNckufmelP84mnRMPEW36QHMKMmVljkxRDKzrGfZthvohEsikzsleIM8JPaILFljppWrwJ2CK0tnRGcUyGjDWh7WlvDw0xNrguVwZAW4L8v9FuBEA9oMVKb1bHFObfoQbvtpjOILUwyuY5Ns6MCqYaR34B+Pse8WKHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715127077; c=relaxed/simple;
	bh=8EEaDJUXAyse1mHZGe32mB5qOjAH2U7utH1XD6WCh6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRitoK7HTIXCWTsUdceL2FQloIe74+sXCSj3Pi/kyN4ZShw5wCNaPor3JCnjSZ4wOt/x+qMdSnh84EI55UgY9DV7QPWC8UzzvMFM78rZDBGFLfqjSeFAYrBp7bpQQXc2fYfJWYgJat8Gh1sIosyRhTRdyle4qLafKwUMEoNUDKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yp7N07SV; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yp7N07SV"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6f0585edd8bso1536714a34.2
        for <llvm@lists.linux.dev>; Tue, 07 May 2024 17:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715127075; x=1715731875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tyQ7xybcQL7dkQ2tP9bw8EvtlpggYRp5xKvXntoLsjI=;
        b=Yp7N07SVWLrDlFJ9PjwKy0qcozhX0+LpAUXfyXk5iGhV/Llmrik53lRlmIMBpFQ37z
         l98dSUaWpDbq4u5boXwp+Nv7gt+D4MuL2oI36ryAU52TeUsw4NF6kmKoL0I++DcOliWd
         FPbY07EA7OOYlfmOfRFvupfUw41pBDLPgOerY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715127075; x=1715731875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyQ7xybcQL7dkQ2tP9bw8EvtlpggYRp5xKvXntoLsjI=;
        b=Xq3AC3JdLcq/sz1OG4dfH3QYJBiLpqe140W5C75OKoGtMwn9oLx6t6qdmYy8gDLYhJ
         IrTrCcdwFdtf1FNTJd8PH4SXB1d4iw7VH8forcVrSgMz8KYTW/I0Kelfg0YLtCRDu9sH
         lDwT5I7Jt9RZcxIhX0XItSFXob316HmSJNAoJx1SwGZZ9qNr8Juf+azU+iXRsVkLq6+C
         v6EPGQ8P2Tgf2rFhTXA/PhIViQRW92TkmWELfU2l9FZLFWXkTHVHDnnf6/QX7NdTHlL/
         vjm0hg59JFW4NTjPLiFUih3qQ9Jf5/Nhtm+vHr+VghozUHht/2J4TrOU0PXzNcfkvz17
         Vuwg==
X-Forwarded-Encrypted: i=1; AJvYcCU8rM9jAprzqvCWaKkurvVEnSGunjtx+/ZoTqYaQ2t2eNyvZPkSi78BpyVPIa7CSKKAxFZ5pT15fRnsgBIaK8LzkNXrKg==
X-Gm-Message-State: AOJu0Yyz9sKbzqG4nnq7SJe4qEYzYfChPMfpFsu7ckK4Iy2QlmJHGNrv
	bHNgx/bAunH1lWowPYN25GL81ifdF6eLTKINYrbPu0sqmX1EAUfE0nu5IjvSZA==
X-Google-Smtp-Source: AGHT+IEF0Ps1LbalzQosbUHnWCLLdAIMrWpsVYxRsKASu36AiWu2UixrPEFmFCVhW8/0m3IhK8baJg==
X-Received: by 2002:a05:6870:3912:b0:23c:f645:944f with SMTP id 586e51a60fabf-240979e1905mr1263605fac.11.1715127075218;
        Tue, 07 May 2024 17:11:15 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w24-20020a634918000000b005ffd8019f01sm10235451pga.20.2024.05.07.17.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 17:11:14 -0700 (PDT)
Date: Tue, 7 May 2024 17:11:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] fs: remove accidental overflow during wraparound check
Message-ID: <202405071710.1B6F1990@keescook>
References: <20240507-b4-sio-vfs_fallocate-v1-1-322f84b97ad5@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507-b4-sio-vfs_fallocate-v1-1-322f84b97ad5@google.com>

On Tue, May 07, 2024 at 11:17:57PM +0000, Justin Stitt wrote:
> Running syzkaller with the newly enabled signed integer overflow
> sanitizer produces this report:
> 
> [  195.401651] ------------[ cut here ]------------
> [  195.404808] UBSAN: signed-integer-overflow in ../fs/open.c:321:15
> [  195.408739] 9223372036854775807 + 562984447377399 cannot be represented in type 'loff_t' (aka 'long long')
> [  195.414683] CPU: 1 PID: 703 Comm: syz-executor.0 Not tainted 6.8.0-rc2-00039-g14de58dbe653-dirty #11
> [  195.420138] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [  195.425804] Call Trace:
> [  195.427360]  <TASK>
> [  195.428791]  dump_stack_lvl+0x93/0xd0
> [  195.431150]  handle_overflow+0x171/0x1b0
> [  195.433640]  vfs_fallocate+0x459/0x4f0
> ...
> [  195.490053] ------------[ cut here ]------------
> [  195.493146] UBSAN: signed-integer-overflow in ../fs/open.c:321:61
> [  195.497030] 9223372036854775807 + 562984447377399 cannot be represented in type 'loff_t' (aka 'long long)
> [  195.502940] CPU: 1 PID: 703 Comm: syz-executor.0 Not tainted 6.8.0-rc2-00039-g14de58dbe653-dirty #11
> [  195.508395] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [  195.514075] Call Trace:
> [  195.515636]  <TASK>
> [  195.517000]  dump_stack_lvl+0x93/0xd0
> [  195.519255]  handle_overflow+0x171/0x1b0
> [  195.521677]  vfs_fallocate+0x4cb/0x4f0
> [  195.524033]  __x64_sys_fallocate+0xb2/0xf0
> 
> Historically, the signed integer overflow sanitizer did not work in the
> kernel due to its interaction with `-fwrapv` but this has since been
> changed [1] in the newest version of Clang. It was re-enabled in the
> kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
> sanitizer").
> 
> Let's use the check_add_overflow helper to first verify the addition
> stays within the bounds of its type (long long); then we can use that
> sum for the following check.
> 
> Link: https://github.com/llvm/llvm-project/pull/82432 [1]
> Closes: https://github.com/KSPP/linux/issues/356
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

I think this makes the checking more reading too. Thanks

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
