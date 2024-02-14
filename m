Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6307465
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 00:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707871234; cv=none; b=OD7ocj523borYHeUDh+KzeBSzu4fh7l5idSkoYDtL1b8bhqYZ/JqsNMV4crNT4IDlTKvVnijP/smP+mjPBlN/2mFKqKM0ICiFjXC+DokEfD948NrCMzGjN6hh6Io7lNa9+O9h84jozHH0EyzsVkSomgM01wgplXaLEWaMVLs3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707871234; c=relaxed/simple;
	bh=732+Z96bjl+fssXUyJzSLJfOmRgK7uvzPvL/AgukfWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGgXApiAmLi6vY7hrralLWZ/V3R+CwKerJvuWxdUhXCntzUm1UsQdGNiLzbbxlEBHs82APC0taV96Plp3IcBv5RjseYf7LlmRcRtcEr/vmXS5nHZdEwVu4RCuqVSkelESrJ/UPnwEx8oBNVAumlTa+VfEa2h+4EqF48Rimokh4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Im/0d5UA; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Im/0d5UA"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d0e521de4eso45381051fa.2
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707871230; x=1708476030; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odl7g7SmrflKYLXiwuyOjEG83lRHDsTab35r8GfTGWQ=;
        b=Im/0d5UANn0uWUKG9H/4kGeTP0GTM+DeS0Wfh5/gW6e1sm4D9R8LRwRfiz/054uqNh
         +ON3WKK0QgLuIMFB1afQuY2xnwQM6kHzt/bk8FMcEdx2eyr1xFFi90O3Lcg7pPPrVRyu
         uGWwpFIPnngQN2q3eqdNtfYWuFsuXwnzJsJM/s6ld2hCv5DjuXTV/IvgXPv5V3/RejVU
         8wpE02dhfufMOWbKFVDMyi0OLmUWxl4QeA+wS6+1OjkWAta15kv0Rycej49lZcvcDtir
         PIsbqEfyiSseUm+wb2MZhFeoxGdB0SoMiqg6WmCl+VzKammi7iiN+vT9D9gJnXDIOACJ
         nCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707871230; x=1708476030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odl7g7SmrflKYLXiwuyOjEG83lRHDsTab35r8GfTGWQ=;
        b=fQOjqi76tTau77Ku7boc9Vfn8AFgFtaS+2g8QZsV5WobDzfc/3v3A/Jd2eFxxr4zFs
         xiGq510LWqC5oJtGi9Z1iS38k/2bFzbEQ++WquYxn9o9u8aPEsOkvGNAtW5JMeysdea8
         Nf5Mk3qkM6Y99i5bsLrjekGzj5k/eEWkXuDwm1WiyuR7C6mQwKQ1Ufi8eVkcYkR0qQBC
         KjrEwtQt/Bo6QGLHf69/m39/BwOgziHHdZhL+fVt25UqZr0tBI0AUVYFC3VS829aRKim
         FbOYKV3TKEb+tyGv4KBEomyjgAAh5F/E/Swva/VacyNmL0Xp7SSCNrviXoUJkNW+lMRW
         j02Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5mlz3xJTqdYlTdpDY5EUj/ftsVDgxR2BpK7D4ENqUs8n0zTXfHuq8x0sZEqS4gbygWgZuexKbfXQpFdiNldAvSI2plg==
X-Gm-Message-State: AOJu0YyJPIeIcUoL+AhlJqkxykVg1T2GbSWx6AuqLaJyLCdGw+0gkdpq
	s5x+rg2udlBWR5MQG2JpUWH3cizmIwgStxyuNGWTCiY7mVwYNSY/GfE+UM9Q4+4b4UWHyYYVal+
	qWur/ls5UC9MLyWseGY+wEuAvUUlcpjq2AM4a
X-Google-Smtp-Source: AGHT+IHaUEkMIsoH9jlZggCVr/lZg/wX9gXvgpogBKJNvdQOntkz1p+0QQQ+q3X5bOtAgqrr5xeujEeC8XfnyLaucL8=
X-Received: by 2002:a2e:7c06:0:b0:2d0:e36a:6424 with SMTP id
 x6-20020a2e7c06000000b002d0e36a6424mr956016ljc.35.1707871230071; Tue, 13 Feb
 2024 16:40:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNARaW1V5X79BFW5_YTKY+n+OSp+_ACpRxpiw+VOJ+2hf=g@mail.gmail.com>
 <20240213022552.754830-1-andrewjballance@gmail.com>
In-Reply-To: <20240213022552.754830-1-andrewjballance@gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 13 Feb 2024 16:40:17 -0800
Message-ID: <CAFhGd8o10KWEX=H56kUN0hjY=fowijov0bn+j_kOmv6BPwJ-yw@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: fix invalid escape sequence warning
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 12, 2024 at 6:28=E2=80=AFPM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> with python 12.1 '\#' results in this warning
>     SyntaxWarning: invalid escape sequence '\#'

Yes, since Python 3.12 escaping invalid characters will result in a
SyntaxWarning.

The complete table of supported escape codes is available here [1].

>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 5dea4479240b..93f64095fda9 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file=
_path):
>      # escape the pound sign '#', either as '\#' or '$(pound)' (depending=
 on the
>      # kernel version). The compile_commands.json file is not intereprete=
d
>      # by Make, so this code replaces the escaped version with '#'.
> -    prefix =3D command_prefix.replace('\#', '#').replace('$(pound)', '#'=
)
> +    prefix =3D command_prefix.replace('\\#', '#').replace('$(pound)', '#=
')

I'd personally prefer using a raw string:
-    prefix =3D command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix =3D command_prefix.replace(r'\#', '#').replace('$(pound)', '#')

This makes it clear that a literal backslash followed by a literal
pound sign will be replaced.

>
>      # Return the canonical path, eliminating any symbolic links encounte=
red in the path.
>      abs_path =3D os.path.realpath(os.path.join(root_directory, file_path=
))
> --
> 2.43.0
>

[1]: https://docs.python.org/3/reference/lexical_analysis.html#index-23

Thanks
Justin
