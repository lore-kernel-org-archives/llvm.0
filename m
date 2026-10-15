Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34893E3D9E
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078414; cv=pass; b=M5a2AbPuj9uRKffJ193QEeO79td1hyTJ5rw1O3af4YDNddkTb1trvhqEq6PQqYHcjWWR/e3FsxDDEbO+F3jk+bppSAlMG6EMSnTT2e+2NJpAn3twHBjHp4i7KL+CnTGcib4wiJ2LzGEg/lFeIhXG8sB/zKtD223UlIxKWnlJFp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078414; c=relaxed/simple;
	bh=EwFBEjpzx+AogMUYstrZjzWsEBgz1yLeWchGZwFuIWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=av6JrllD3g3OWgGimsO2BbUQ70HdfVSFkd0AjqkbS0DEajUdVwetlz1n5Yj6TuNt4iGWXNPWL8NesKHrEB1GaGrpgnUKuyG0FQf8DvSPIZCAQKuUVoaxTFkao2yagxdDBqIXj/rgKKmc5r62w6z2IMR4+w3e54cPYH0AsT8IAL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=etiFatJJ; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="etiFatJJ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df8fe8513so563498f8f.0
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 08:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792078404; cv=none;
        d=google.com; s=arc-20260327;
        b=H3PuHxLGVe/BwqahmCyVP/ecpR2zxXiEPe79U8JyI1AVTRVgGs7O0sGAYv1RJ+PcBd
         dAPlqoVud7KVzI2RPvVVMKiVTR4jRBRx5KDjh8C/UPVu0urwlZiUX9QwQt7IzDnK56M7
         5bAtPjl4PQ0E86Ow1PFkytM4yp6oZ3bw/gOxMEes8npWKVR/jmPGs+ghJHQDB7pYpBRI
         +4mqYLWdHGxkT3gg7Y9jgTbCgHF+i2P1t0VextcsMWQVE2F4KqEQTjW/mw0jmArVgcv2
         8yuouDfNsBavpbZ2iCoG4sXR1O7wRqIVPNNrNgs1dvyHNrfxQprPYFGzRFI/oMEg+9XM
         2V+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        fh=Sj8tmXzorFXF17VNDmv3S9n4iOgPKdEGBufqk7xO1eQ=;
        b=jnmURNCrptKZbeyG+E8IN4wVmZWWt5mMD+XdVAEK9W4lSxuYvBR60HBSywME4kJTPn
         8vo9owImF2J3sgyohUBoGvbtB6NmdjKmuyW49mDjzaOW2jskCs9WpYyeZJ2slyFcbqpf
         pvVO00JvTyWnaolKW1MfjzqJCFdmqbMAfDHEbCnoNOFF+AeJUKBST9+dLJT36oEVjhKd
         /BzBaqzKZAJHt81SJnSPet3p/ZSee/8NQSLfado/afU3wgMlOUxOxq1FAQeXkOBxUeyH
         JnDmipwJv4x7V2U56H+8cLLd1tP5jJmpz9B2qL/hkgL9rFJESHsCUFcYk/6+Bfs7BQhJ
         6mMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792078404; x=1792683204; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        b=etiFatJJqUYhd9eqZRm+2KsWqS2Ja7Kr9cRRGTC8qkH7d/N3GKAVBLGnDbSGPcKF+n
         Yc9H0PytLJZgzlHqDbFzpbNci3PWgPb5p6f39mV+/c0XiAgiIH2ANQRi3DwbWzvQkaU2
         Eu6EFjF+qtaTDZjFxn++PQmCgHqTKHyHnba1ssb+II6skApjdTmF+q/6VAcBH651a8zy
         FjPHP1U1Fu8W44MIJ/z4FpfOcwUwoIHE0ZraoWHqSvHQBYPxTU2+O5fp0ECJHW60iOw+
         LkcE6i4EpRYMKlJIpI5AEQR3EcGigJCUXKd34GSq002VWoymi+QJ9ojTgLQPxHZ3WQIn
         1x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078404; x=1792683204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RnXdeLR8uLxWAp/EGqtkD57zfy4KroVSjFqtijIOcj4=;
        b=iIstK7cabtAIEeJuCI+GniCFO6AKHMjOM3BYP0j8B5oF7KDZuElenntpUJsQNuMMmr
         YCPbsQkFueVtZXGTyHrxxlTD91iqs27r8U2qSjW/pyrLN7HD91wTskM0DavR8tsSC4qx
         /kUEfO7Rccn1xTC3AIOR7MicGt1EuvDP+fdPTeA6Tg6Ash6A8PWaZ32dvX6slzjPM2e8
         7F1y+PRbZUyiYuBpKufjO2bz1QXRdtFhDfZntbOAJ0N8jO+ftTMYv9KV/Jkfm8CKXLgt
         qtUUhJ+iUqgtabZxhBiFY8r9P8VnU4WDSL6/1sdNz/6/XQpnvb8XSqC+V3fJYlH5m6Iy
         Yrvw==
X-Forwarded-Encrypted: i=1; AKwUvBwLsltYtLxChTx7/y0ivKQ9WLITaBkQdE2uOOIKY2szcdWuOPhuRStOIu4bWetZwbrykZDn@lists.linux.dev
X-Gm-Message-State: AFq9FYKnqj+dIouUawTmE/47Pbxs+xsNlL3OK8P+u/bcxp5dsRLQ/f/T
	VK+MBBnEh7zG9DpmDWfgLQguESY2zeUct7qtDsy4s+Dm9Z42RXrgYFHeu3+cbPsyeUZD5UxuoQO
	YXYes++OccTW1VQMLBK/2JuIIQPzoJImbei+AI7Oy
X-Gm-Gg: AYBFou2o7QaGSUMA9ZArxQSyhxVejxEkGBTXmrwxHsC5042xF+Oezh2Hy5cDt32Z/2Q
	gSc1cG6AEsvy0PC+U1l5APYYcTsAzcW3lOdDJofkD78nGhHLv4jMvaq+Vi4J+bkPHsC6YRXtAr2
	n/U8hX1ZwSaeQwGupA7xq+q0mbsFGRCi5ThQIvJ0cDDh71NtbHTzCpm/8huWci8NUZyS8jo569n
	VeNm2I5nuxBdGigpX0RmLt4JmeNHIXqMVHxz/wi0wMhuK1AJQpHfJjH14kiu3Lb9UP43p4ltPGG
	QJD1EGsqFtAvWYVGFRh/uMvNkWBoCXr3uCRXaCdbUZSFqsWVHg8xEe7TPdzOP4p7M9HBpF3zkm/
	ONjkgnil27B/H5qlU/nMy0MEbZFvFCNKlTGZly0Lvfnjn7wdWr0nA7d08iu/c3CPC8Zw0INRozJ
	MPabUdAim8+UXoB/XKurdOue8zWhtyizrXw9vrHON/lQCFcFagCzVh
X-Received: by 2002:a5d:5d0e:0:b0:48b:1147:3d75 with SMTP id
 ffacd0b85a97d-48dbace44ebmr35131681f8f.45.1792078403051; Thu, 15 Oct 2026
 08:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015135752.17028-1-vngocvan@gmail.com>
In-Reply-To: <20261015135752.17028-1-vngocvan@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 15 Oct 2026 08:33:11 -0700
X-Gm-Features: AclHuK9_V3VROI7C5QHxcUZo9gsmpWA-9dqcNZ_FnjWuoNsZd9_ENKv7AbFgjHQ
Message-ID: <CAKwvOdnkS7AnuJkQr=5-TO6eRL+joSNUKGfqK-mbim9_y0NW=A@mail.gmail.com>
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for modules
To: vngocvan <vngocvan@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, morbo@google.com, 
	justinstitt@google.com, masahiroy@kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 6:58=E2=80=AFAM vngocvan <vngocvan@gmail.com> wrote=
:
>
> When invoked from outside the build tree with -d and a modules.order
> argument, the script opens .mod files relative to the current directory
> instead of the specified build directory. This can fail with
> FileNotFoundError or collect commands from unrelated artifacts in the
> current directory.
>
> Pass the build directory to cmdfiles_for_modorder() and resolve both
> the .mod files and their associated .cmd files relative to it. Absolute
> paths continue to work, and the output location is unchanged.
>
> Fixes: ecca4fea1ede ("gen_compile_commands: support *.o, *.a, modules.ord=
er in positional argument")
> Signed-off-by: vngocvan <vngocvan@gmail.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index 8d14b81efd73..149135f85f19 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -124,7 +124,7 @@ def cmdfiles_for_a(archive, ar):
>          yield to_cmdfile(obj)
>
>
> -def cmdfiles_for_modorder(modorder):
> +def cmdfiles_for_modorder(modorder, root_directory):
>      """Generate the iterator of .cmd files associated with the modules.o=
rder.
>
>      Parse the given modules.order, and yield every .cmd file used to bui=
ld the
> @@ -132,6 +132,7 @@ def cmdfiles_for_modorder(modorder):
>
>      Args:
>          modorder: The modules.order file to parse
> +        root_directory: The directory where the objects were built
>
>      Yields:
>          The path to every .cmd file found
> @@ -142,11 +143,11 @@ def cmdfiles_for_modorder(modorder):
>              base, ext =3D os.path.splitext(obj)
>              if ext !=3D '.o':
>                  sys.exit('{}: module path must end with .o'.format(obj))
> -            mod =3D base + '.mod'
> +            mod =3D os.path.join(root_directory, base + '.mod')
>              # Read from *.mod, to get a list of objects that compose the=
 module.
>              with open(mod) as m:
>                  for mod_line in m:
> -                    yield to_cmdfile(mod_line.rstrip())
> +                    yield os.path.join(root_directory, to_cmdfile(mod_li=
ne.rstrip()))

Thanks for the patch. Can we avoid os.path in favor of Path from
Pathlib? Here and throughout.

>
>
>  def process_line(root_directory, command_prefix, file_path):
> @@ -206,7 +207,7 @@ def main():
>          elif path.endswith('.a'):
>              cmdfiles =3D cmdfiles_for_a(path, ar)
>          elif path.endswith('modules.order'):
> -            cmdfiles =3D cmdfiles_for_modorder(path)
> +            cmdfiles =3D cmdfiles_for_modorder(path, directory)
>          else:
>              sys.exit('{}: unknown file type'.format(path))
>
>
> base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
