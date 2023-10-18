Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6CD3FE55
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bVbIWj/i"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-581ed744114so760760eaf.0
        for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 11:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697652863; x=1698257663; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5ifuSh3pAXhwmN6aI2xPo6Qr4r8ZyUW95PzWHa09WA=;
        b=bVbIWj/iXruO5HRrMzZaXhY7JMJP+wLDeyMlMLwSfjtD/t+1dOvaRFmO/B12mFnQ6v
         QVr93G3h8Pa6Qn10xbZGIWVNw5qBMQ0F+JxLIu/riFOf3I6c1i+s/OZDklN0vvx0t5nK
         LUq5/A2/g9LoN9mhrjgBDMB3MLFlH8/cxSQJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697652863; x=1698257663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5ifuSh3pAXhwmN6aI2xPo6Qr4r8ZyUW95PzWHa09WA=;
        b=vS3GXra3p4L0o1shU94SxxcXMry7DuaElyoacyhzmfO9ffK1TKP9Y0Z9jnyA0tH1/I
         4kW3ajCoXR4N1hnYNbLT+jLyE2GnpdN1bhg78wBWA+AHJaHewfuilOD97Qfbpdbscr86
         BAf76Cab+wjJdj0DGWsORwraL5CGAvsIIf7tA2sGNKj77X8al3sr8g81IhN1naF3TJXE
         Lr2Gdwpd5et6eZni3vN3QGqnE7Y25WhYmFAigCXuMB8+lNA4+A2KULg3VuK+1XMNmK7P
         0U4iqf2WoInVPJF3nSWO7+avWcYe141rDHf0a9lHjJkbzG9Js/UA8LkH2CQMMJIODGyt
         FL+w==
X-Gm-Message-State: AOJu0YzWk3LRpFMJETc7GIv8P7GbMSX+dcXHKZulj7Ie4tM9Ykp+3j81
	xwF9fifuP7gg2zDgRDQy+nmyIA==
X-Google-Smtp-Source: AGHT+IF8xi8GFiUQY06uOeWqByr5z7EFVgeVDoRSw3v4/DxmzcbtqXvuu1i8IZohOlGRjH61x3+iMg==
X-Received: by 2002:a05:6358:3a0f:b0:166:f348:a8b3 with SMTP id g15-20020a0563583a0f00b00166f348a8b3mr2010476rwe.28.1697652863564;
        Wed, 18 Oct 2023 11:14:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h26-20020aa796da000000b006bae6eea9d0sm3657643pfq.49.2023.10.18.11.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 11:14:23 -0700 (PDT)
Date: Wed, 18 Oct 2023 11:14:22 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] eventfs: Use ERR_CAST() in eventfs_create_events_dir()
Message-ID: <202310181114.55457CFE@keescook>
References: <20231018-ftrace-fix-clang-randstruct-v1-1-338cb214abfb@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018-ftrace-fix-clang-randstruct-v1-1-338cb214abfb@kernel.org>

On Wed, Oct 18, 2023 at 11:10:31AM -0700, Nathan Chancellor wrote:
> When building with clang and CONFIG_RANDSTRUCT_FULL=y, there is an error
> due to a cast in eventfs_create_events_dir():
> 
>   fs/tracefs/event_inode.c:734:10: error: casting from randomized structure pointer type 'struct dentry *' to 'struct eventfs_inode *'
>     734 |                 return (struct eventfs_inode *)dentry;
>         |                        ^
>   1 error generated.
> 
> Use the ERR_CAST() function to resolve the error, as it was designed for
> this exact situation (casting an error pointer to another type).
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1947
> Fixes: 5790b1fb3d67 ("eventfs: Remove eventfs_file and just use eventfs_inode")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Yes, please. That's the correct method to do such casts. Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
