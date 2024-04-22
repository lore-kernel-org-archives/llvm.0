Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6D18EA1
	for <llvm@lists.linux.dev>; Mon, 22 Apr 2024 21:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713821269; cv=none; b=MkFt6AQEHmtOWFkyQQluTKZC3gU8ifJp/5QudTLzcD6yECP1fbnKpLlL1H0JGUblnqg87ePFss4a9DnbxNQq5IeiuuHRO+IqLY3g3pvz3ejgTuq5ryv17UmLBKEZuSJR7gD1WmiIsZGF4VA7243/HQU5NDx6dvO9ePgaoWS94sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713821269; c=relaxed/simple;
	bh=M3+rei1AzY+z26b3Inyt2HMgeBsifg6Xeykaubbc9GA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LO49DVN18t0HfFD4voUtwzrmTfF++M3V1law+DCVB+141qHCjLHWn71EF4PdAQ/o4OMs0jy2C6sUgKiXK1ucImvVUHVZDx/NUfE69V/g4SNodhfPHlcgZZqb4Synfyy4ylUy1vHyZ0gsLAc+oXZCN7HryeNDzQI4+kjUJMSZj4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tO89xG7v; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tO89xG7v"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c74fd6fb92so2000860b6e.3
        for <llvm@lists.linux.dev>; Mon, 22 Apr 2024 14:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713821267; x=1714426067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3+rei1AzY+z26b3Inyt2HMgeBsifg6Xeykaubbc9GA=;
        b=tO89xG7vRPYwqfw24zj0t0r93GoflKBZ7QHx584UxwJKbxxXQ5fsB6mlIKB2BSet7B
         MZgSKQhvAvYN17WNo1FLoowh/0yAtou19FKd6Hd65PRf+AA+sDlqlGG+TMq3DyGFYHQ9
         7wZnPAvoXqShxH7wjbXlws2uQxl4ieLwas0GQMbVN6rYFCWzO4ZwzH2CjxX1zrU4denJ
         EfKmoHRXs8FTMKHtk6d3FJEojPUDlQuukhPW6YuSC84cXoeVzCd36SBOoQvYrE02bPN7
         eL2tk78BXRhKICqxGKAtNxMgimOi2LCbJW/Pjla7YJwy3TXiE8U6YfXlrnuS8Pth++o0
         Zwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713821267; x=1714426067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3+rei1AzY+z26b3Inyt2HMgeBsifg6Xeykaubbc9GA=;
        b=XNEroend4nWcj3Jd8oss6DT3Lui1HId8GCdI2QAaYP0E2XGHQZdRWQWJ/Vqn3ds9CL
         kPGBjdHjEC1OlZDKq3qNRcD/WMV1SPVM0RIvMXJFDDCqCx5EM0zPl6z7WkmTnPyzi2vL
         Fo6ZSuqgGCkXAYgV+SfWfVovtjIqX2BxATlmAGAP+LO4kO8Q3Nyb9cJ/mTh2mtWYc4cC
         DCcGjQCT9WiAt53juqFeizw5+V2LNibECB2jhEGjfKoocJ/6dkP65bwF9wMrHlnr6b3w
         pzf2yUcPOJWecp1GcEUCwWOn35vtp0EXGPeEhQgDqtod1zyxzgfE/vk4kPbGnVErAGjj
         3P4w==
X-Forwarded-Encrypted: i=1; AJvYcCU6iQmAEqbgt3EADwZQf4zU2vZXIePe87gCuJCCRLJzTObZWFbx6hLDTdXYzHqHxDYaQQauEitM1xDdR+hKdyhN/Btbcw==
X-Gm-Message-State: AOJu0YwhlgWmuq9vezP85NgE1uUJBtJ4zowM5+zckMcHpkyrO/hc4G/v
	RPxcRqQ1PC4Jwi+S6Jh3GXMnd3JeX7/Jk3Ywe3zT6YKY4RdrVJehToDJRDF3qdCwOtJaTBBiCt9
	WucJipLiTD7+qGd/94rGbUrPZfpNqPYZWp+M2
X-Google-Smtp-Source: AGHT+IHpG6wvCoLC2BfjLYY8/rqsuVDdVNYBEme+pI86ep9YOp30yP6YBJILYKGbCkmVYX6nHDz9wW90cFCr3J/Q95s=
X-Received: by 2002:aca:f04:0:b0:3c3:d47b:e4cf with SMTP id
 4-20020aca0f04000000b003c3d47be4cfmr13235406oip.39.1713821266756; Mon, 22 Apr
 2024 14:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240421-arm32-cfi-v7-0-6e132a948cc8@linaro.org> <20240421-arm32-cfi-v7-1-6e132a948cc8@linaro.org>
In-Reply-To: <20240421-arm32-cfi-v7-1-6e132a948cc8@linaro.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 22 Apr 2024 14:27:07 -0700
Message-ID: <CABCJKueRm2gCwOQEf3LG+qqGi3JkyGsEX55nHmMMp0tD10i4Og@mail.gmail.com>
Subject: Re: [PATCH v7 01/11] ARM: bugs: Check in the vtable instead of
 defined aliases
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 21, 2024 at 11:28=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
>
> Instead of checking if cpu_check_bugs() exist, check for this
> callback directly in the CPU vtable: this is better because the
> function is just a define to the vtable entry and this is why
> the code works. But we want to be able to specify a proper
> function for cpu_check_bugs() so look into the vtable instead.
>
> In bugs.c assign PROC_VTABLE(switch_mm) instead of
> assigning cpu_do_switch_mm where again this is just a define
> into the vtable: this makes it possible to make
> cpu_do_switch_mm() into a real function.

Is this patch still needed? None of the remaining patches in this
series define these as functions anymore.

Sami
