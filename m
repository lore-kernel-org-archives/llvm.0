Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79737128364
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707935313; cv=none; b=OTKy3aCQIthsPi3iEN/G40Ci1eheNibGEbgh8ecUPPR0k84t4CLnDMOZGPAAhvC0ei5NWwycgJ8lYgYzUv7YVFfXj7WoqBqdw4zrtx6F8J7wjMOMJnWR1eXFxVSV9jq6Rl73veh6bSKRrJkB05s6+NWRa9sUjlCSISH6Xi3E/vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707935313; c=relaxed/simple;
	bh=L1cQy5vPjEPPvGhy+Pjr6Faj2fP17lsqUJrqsKN8S9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jciRoVQhFBxruvtzI6bvRqxCcaYLmbSupAR0DjJhzDKH0gk9RYYH/d1/GMOn0XvjfL3aUxbZ2rtQPsE8JQIsGoc2bWkUwHD24VpXpEmye58V43VOhqyHzuyL3t3hpUI+bdhjesjzfdemqABxDiypFskfjvg7Gb9QoUgfKcpkg+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vTv4hPxD; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vTv4hPxD"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7c029beb8c9so98639f.0
        for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 10:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707935310; x=1708540110; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXG7T3GS6T6xydEvB7aK25Z8yMzmDQXeLDbtiaZDxqs=;
        b=vTv4hPxDNgKIytyAzR1kaBzWYIXRx4Ky6LPC6B53bCEe2oHXDTEEQ5gcb8EqtnYasG
         cbG9OvDmXeq+R1yl05xlPLfYCrMRgFPcSb9zzuEJLursCpwQzRIzoILQDPygBqSD3BkA
         AEM6rroC9Jdni8hp//XBNVFqwE1iGd2mQRs7eKt221D/Z/ZgRwdNSDiUCycIu9RoOMLS
         1AMKIGrfFWzA9oiJGXee386jrDYU2Mnzms2SLZggHS9uYc2bWubf8Ki1Lh35zKGK22V6
         2x7/gDQ5mWNDszU9emhmUaG+lW7f5AWk53gDF+c0nQxBk0Xg99nszJ7tPHq5FuXFPqeE
         kWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707935310; x=1708540110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXG7T3GS6T6xydEvB7aK25Z8yMzmDQXeLDbtiaZDxqs=;
        b=Mdtz1umpz8fg81bbQPFwm7TU0hGnOREUJ+6Hk5pBZPs+kyNZeQH4DZTYQk0dIerzVr
         5yGyQKT/8oxQt1CNqqO646bR5bbuGwpEuYUKXGcDoQD3hphNfDyF+iTZCEsbFz3d4hd1
         zA3mK5QR74BwOGJzOqeHUarK9S0KZdA9fN5HQAylWNUXIrgXQJW8jZGXrF5E5pPZQBc2
         o5tp3NIXWjv5mwA0ufOMiW1pJ+T+d3TiH4NXFWmOTSGLmxv52T9Z1GT/qlRr/bV5CJML
         zHkYnQ7ocL4sEQ3G7Fyb03zThdlX/JFTP8QP8NK/npAvamBMajiO/p8TCL5EF80Yibgn
         zznQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ODbSNes52e5rJeVLSyjEIKA1al8AvwJXhHnJzfTucO81QWDPXy1Uc7yPEZ63d5aSG2I+ZXkRbdf47WcNCr2aQYT6gQ==
X-Gm-Message-State: AOJu0YxN5sIdVBN0GOg6V9DEIpf3muEXA8GuI1XK7kwfP59cgzwry2Xs
	LfavL+XYjNmdflcU6TdX74JMQcc0aqqdqsigI0+uAAq9pcupqQJOA2D5oBgU6Q==
X-Google-Smtp-Source: AGHT+IEiKlUZY2svl3CmYmFiwFlC+HtEN+d+i2JVJ8GIWshr6QOje2I94cpJFsJpFiYgYD/MtRPDGg==
X-Received: by 2002:a6b:6610:0:b0:7c4:3b9e:f766 with SMTP id a16-20020a6b6610000000b007c43b9ef766mr3533717ioc.20.1707935310529;
        Wed, 14 Feb 2024 10:28:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULDYdhHx0Tim9oaW2CeKEN3+wa2WE1J8k3qfIEDy1/Ves/fXZMA/ZWBlP5PgV1w0P8rIpJB1y6ffKeoDGwOZVUZd9CsF7FksR3Zxw3fhk4pPv7TxK25e1Mk0DB0fS0HcVRLqaAr9SfKgSAmZk5XVSXqECQnkBQf5U3Hgwvm7q+lIwy/QzTP4MK7A2h21mI+orjPXohcdbsIBwaRnqRmCoouz0GN7jHTnNnpvFj8fpoHQn7UL1ZT2xO0oOum7GXMFfQWpSYx8RxdpIycXZB0bB0ieQNAqcrYK4rdsIrlF6+fhJ9/CgR1KgpH2qSLp0PoZ3Ddwn6+n96sw9CDNWWUcBD7igadr0WKJliD2kf2Zf4EfbKxPk=
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id a22-20020a6b6d16000000b007c45ab3dc34sm2131730iod.29.2024.02.14.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:28:29 -0800 (PST)
Date: Wed, 14 Feb 2024 18:28:25 +0000
From: Justin Stitt <justinstitt@google.com>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	masahiroy@kernel.org, morbo@google.com, nathan@kernel.org,
	ndesaulniers@google.com, nicolas@fjasle.eu,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3 1/1] gen_compile_commands: fix invalid escape sequence
 warning
Message-ID: <20240214182825.ghe2rqux4mdkgh2f@google.com>
References: <CAFhGd8pvhzehMGh1XEHBct7CGEQuF0CZeneMH3D6cKSRj5UdHQ@mail.gmail.com>
 <20240214012439.879134-1-andrewjballance@gmail.com>
 <20240214012439.879134-2-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214012439.879134-2-andrewjballance@gmail.com>

Hi,

On Tue, Feb 13, 2024 at 07:23:05PM -0600, Andrew Ballance wrote:
> with python 3.12.1 '\#' results in this warning
>     SyntaxWarning: invalid escape sequence '\#'
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>

You probably don't need to send a patch series (with a cover letter) if
you're only sending a single patch to the list.

Really, though, who cares!

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 5dea4479240b..e4fb686dfaa9 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
>      # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
>      # kernel version). The compile_commands.json file is not interepreted
>      # by Make, so this code replaces the escaped version with '#'.
> -    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
> +    prefix = command_prefix.replace(r'\#', '#').replace('$(pound)', '#')
>
>      # Return the canonical path, eliminating any symbolic links encountered in the path.
>      abs_path = os.path.realpath(os.path.join(root_directory, file_path))
> --
> 2.43.0
>

Thanks
Justin
