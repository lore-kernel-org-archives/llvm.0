Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9538472
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 00:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715126967; cv=none; b=YK3wA5z7SzGQk/siZW9v0j0LkDtuwWwbE6brheLmBbRF4x+QgzcLo6pIzz2H/+tC/t8teZJ0OIR3umqKAScyK6rU+LsXf3ZR95SMzTQSJAJ7P6fOS6h+345NuuhFthZFfD6h6ZX5D81ISV1/B/MaTsj3023s7xe6CnL4VZZTgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715126967; c=relaxed/simple;
	bh=2RBkzmRwSheKgkAQe2JV3Fs7F/JeQq/TzY2YuKFXwgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOchG5t5o4rpffFVSwE+K137K4k9lV5DdHdLnGyoPdDrj7dMhpiWAT4ONYV91t8R1irKxWNwW9JgpsmP6VFD6DHYfx34Suc6qbfk6HfNohLt37WNuJVrzq6iiml0Ja78onbLIiqlBIPeGlGyVBdAxPoFGzRAMXj9rPqDK0KgHEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SYAivx6Y; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SYAivx6Y"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2b4aa87e01aso2705496a91.3
        for <llvm@lists.linux.dev>; Tue, 07 May 2024 17:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715126965; x=1715731765; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1syOJovW5eId25dp/lIC5NMYcXKMWcKV21Z0vOpfbA=;
        b=SYAivx6Y878dJIinzUSR02lUo2O9HTHTypAsR3N0AVJoIQR/esmYFsAWLRf/tRyyFl
         Y2iSfmxLgt2dZUw+UFIIjfIbZXYnMIB8qLunJfArOz1JoNambM0OgWwwFz+ggUF99eBS
         otPB2xFRao8Cpf9dyf1xF032hQsIae74Fnc4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715126965; x=1715731765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1syOJovW5eId25dp/lIC5NMYcXKMWcKV21Z0vOpfbA=;
        b=ZrHx0I3q0HQyLxwPxNdUCSP3/LgNb6jKFHpsRTeglIABdpufx9KcCcHyTBjkfufj/v
         dp0MeE/Lj34zUE6mI0EdEuCP7Svo7raF4N/HeM33jG+RTm7Q6LMONOIqwSNyXr09P/hb
         OR8b16sKFyiE4G01VY1rRaeHS9RPOlW5wgnwOapG16S0aZrT8fK/5OSnF0cpZI8OiChk
         Dz5DV6WseuDamsMm5zAtJ9y67dS8DFxwpipaAVk+TubTfpDnKOQAHJL9mmBCsVAgtiWI
         zmweVQTOlrY4Ex4+4tkASh9/DTz1ZrLUQ91htlhFrlGvymGsKCqq8gZPeBstDu79iZkC
         MLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8lkvvmSCCOcLo8lmuSZnrNyh9xXXaerDdYjW+uBcTYHNU6nEt8CBDsU+5GVBIhU3DphaIylg5RvxwjwQck8bgkq43rg==
X-Gm-Message-State: AOJu0Yypq96Y0iswsOm6bOyWrJ580ZfezNTurnD1CHfoIZM3N5T8s193
	B/KSx3weO3ii66TdXeW0OPNHVboW0b7nNG/bVAmLUYMBmZ3o7cf5T0eiNnHMOQ==
X-Google-Smtp-Source: AGHT+IG6ljKWC4/Nljh3hqVMgeNltqhDXr5URpX3VUK0fuEPsH/8i/GoTdfNLVoHrp3y4e/JzyIgVw==
X-Received: by 2002:a17:90b:4ac8:b0:2a8:1fdf:b1b0 with SMTP id 98e67ed59e1d1-2b6166bfe0bmr1137740a91.29.1715126965497;
        Tue, 07 May 2024 17:09:25 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902654c00b001ed9b384b6fsm6802901pln.23.2024.05.07.17.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 17:09:25 -0700 (PDT)
Date: Tue, 7 May 2024 17:09:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] cdrom: rearrange last_media_change check to avoid
 unintentional overflow
Message-ID: <202405071709.817AB45C0D@keescook>
References: <20240507-b4-sio-ata1-v1-1-810ffac6080a@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507-b4-sio-ata1-v1-1-810ffac6080a@google.com>

On Tue, May 07, 2024 at 04:54:04AM +0000, Justin Stitt wrote:
> When running syzkaller with the newly reintroduced signed integer wrap
> sanitizer we encounter this splat:
> 
> [  366.015950] UBSAN: signed-integer-overflow in ../drivers/cdrom/cdrom.c:2361:33
> [  366.021089] -9223372036854775808 - 346321 cannot be represented in type '__s64' (aka 'long long')
> [  366.025894] program syz-executor.4 is using a deprecated SCSI ioctl, please convert it to SG_IO
> [  366.027502] CPU: 5 PID: 28472 Comm: syz-executor.7 Not tainted 6.8.0-rc2-00035-gb3ef86b5a957 #1
> [  366.027512] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [  366.027518] Call Trace:
> [  366.027523]  <TASK>
> [  366.027533]  dump_stack_lvl+0x93/0xd0
> [  366.027899]  handle_overflow+0x171/0x1b0
> [  366.038787] ata1.00: invalid multi_count 32 ignored
> [  366.043924]  cdrom_ioctl+0x2c3f/0x2d10
> [  366.063932]  ? __pm_runtime_resume+0xe6/0x130
> [  366.071923]  sr_block_ioctl+0x15d/0x1d0
> [  366.074624]  ? __pfx_sr_block_ioctl+0x10/0x10
> [  366.077642]  blkdev_ioctl+0x419/0x500
> [  366.080231]  ? __pfx_blkdev_ioctl+0x10/0x10
> ...
> 
> Historically, the signed integer overflow sanitizer did not work in the
> kernel due to its interaction with `-fwrapv` but this has since been
> changed [1] in the newest version of Clang. It was re-enabled in the
> kernel with Commit 557f8c582a9ba8ab ("ubsan: Reintroduce signed overflow
> sanitizer").
> 
> Let's rearrange the check to not perform any arithmetic, thus not
> tripping the sanitizer.
> 
> Link: https://github.com/llvm/llvm-project/pull/82432 [1]
> Closes: https://github.com/KSPP/linux/issues/354
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Much more idiomatic. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
