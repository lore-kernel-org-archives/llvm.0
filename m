Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9847E161
	for <llvm@lists.linux.dev>; Sun, 28 Jul 2024 02:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722133442; cv=none; b=gQIbgke0W90jXFA15Uwgaf8NjlGh5GbjVZNqAnJi1LYcBI/UmRigRs0A8dWbyjKPxkbmME5gfMtD1dkUJ/6GSH+al4rln7T/Ij8rgoM0BhVCvuCPs3F9EiRG6yibCTZM3T6TvaCovuYT/+HE9Dy5H3V7QP/8qBom+UX7pKZQKjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722133442; c=relaxed/simple;
	bh=1dEFsQlY+4vl8jp39r5uy2Ph6lojgCgMyFxpYlWjZsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEnj63ULCEMVEoif0h2p5gPSO9fPXuvZwURCeMxGXJm3ld/JyoJzrotOL3mvDuVe17KRR2vWVM5Qi37eZ3oLAFU5PE97CS99uWSXkjJZaH6HcOoxVHYP0NI+iWZx+qZLpRpdauoBabEVYEkrXY063PKgyymNu81lLeoVWzLWnAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgDPwlxg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgDPwlxg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb57e25387so1730563a91.3
        for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 19:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722133440; x=1722738240; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03KrJauELnCqn3OXhsRWxMpJ9KPdl1LCMT2XKA6LW2E=;
        b=MgDPwlxgCXV4J9PUUDuL7+qdOztBzgWTXWaYHtK0PTJaYvpnWtNsKI0kj6/NTaNSvv
         gkptdyVDPTgrzesLRmDVua81+Grpdo3+flrIVbPmpqUr8/+HecJvrzdG5FXUaHLXdjRx
         jhr3qr6vkvUxW+/EvEOQjY2zOc6NVHNFUWLdeNHb5QQvWW6UY/fCS1+d8xHx7d5Loq4T
         jgdWPbFsPnI4PY9xEdWK0mLLnmcD0VfDSeSPOlBuY5Agho1TQlQWnPUceAS95iL7HV1E
         JLWJNt4UErnF0iMgg6CBAGuPYoTSG+UAjFnzpKI5XGN1cOOfi+nTExkPEIatZAwcNdAY
         YbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722133440; x=1722738240;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03KrJauELnCqn3OXhsRWxMpJ9KPdl1LCMT2XKA6LW2E=;
        b=AaH3+XfpQkYZ61iaNfIxz/YubgZKllrruRYO9EC0/3GIEwLyZ79403DAPDhTX2KB9Z
         fe06SDCsEYqZPp+d1/7FLGkA5qym2iBuhi39o4gLzH7sqHjVxCDS3LNSmqNBZAhcGOBE
         oBbuh6HU4CBUAY/cjzrbyUb9JQR4PvSkwsrbWkjPM5bUgJXlx+RKme7ve78iJRs9bcAE
         9xsb8PFI9gk52H5cyT3vTblW+0r/8qitJklmM4Jky02YLoH806sUrmkBjIJyQwYOg8P+
         V150wH8OyqzpkrsJ7LG99eq7RaD61JkvzPVlorFhw1vsIf3IF6OsygNyn1MhftHWkBQO
         ytXg==
X-Forwarded-Encrypted: i=1; AJvYcCXmTOCZNABvk0YPFSINYp6z9aWGar9g+Ac/BXVL4OP+X2vA2c/1njHlNxz8gPClIiMValVgRys4X1lWY2r2kM8mP/PbIQ==
X-Gm-Message-State: AOJu0Yx/JCSwA6KOQoYgqAWMYjKM8g+yWj9sfBb0W2Y3J2fdVlLSuFPt
	CigHS2aLdfihgbP4SHNfsDl7YK1E/ojiRT8LlCqt4FYofuWEptqz
X-Google-Smtp-Source: AGHT+IGjIj4UC0mBovjZRdel01Wu7l/UPkkgIZLEqMzc2jcYaauxrVQUctnhOcAey2OuEB1LbvQrkw==
X-Received: by 2002:a17:90b:4c10:b0:2ca:8b71:21f4 with SMTP id 98e67ed59e1d1-2cf7e1ec893mr4674920a91.18.1722133439697;
        Sat, 27 Jul 2024 19:23:59 -0700 (PDT)
Received: from [192.168.255.10] (23.105.223.42.16clouds.com. [23.105.223.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb7389fafsm8048254a91.1.2024.07.27.19.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jul 2024 19:23:59 -0700 (PDT)
Message-ID: <d5e63e2a-c203-4c55-bbfe-537f5dd0b494@gmail.com>
Date: Sun, 28 Jul 2024 10:23:54 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: add the translation of
 kbuild/headers_install.rst
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20240726145754.2598197-1-dzm91@hust.edu.cn>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <20240726145754.2598197-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


LGTM,
Reviewed-by: Alex Shi <alexs@kernel.org>

On 7/26/24 10:57 PM, Dongliang Mu wrote:
> Finish the translation of kbuild/headers_install.rst and
> kbuild/index.rst, then add kbuild into zh_CN/index.rst.
> 
> Update to commit 5b67fbfc32b5 ("Merge tag 'kbuild-v5.7' of
> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  .../zh_CN/kbuild/headers_install.rst          | 39 +++++++++++++++++++
>  .../translations/zh_CN/kbuild/index.rst       | 35 +++++++++++++++++
>  3 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/kbuild/headers_install.rst
>  create mode 100644 Documentation/translations/zh_CN/kbuild/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 20b9d4270d1f..7574e1673180 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -89,10 +89,10 @@ TODOList:
>     admin-guide/index
>     admin-guide/reporting-issues.rst
>     userspace-api/index
> +   内核构建系统 <kbuild/index>
>  
>  TODOList:
>  
> -* 内核构建系统 <kbuild/index>
>  * 用户空间工具 <tools/index>
>  
>  也可参考独立于内核文档的 `Linux 手册页 <https://www.kernel.org/doc/man-pages/>`_ 。
> diff --git a/Documentation/translations/zh_CN/kbuild/headers_install.rst b/Documentation/translations/zh_CN/kbuild/headers_install.rst
> new file mode 100644
> index 000000000000..50ab819a7f96
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/kbuild/headers_install.rst
> @@ -0,0 +1,39 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/kbuild/headers_install.rst
> +:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> +
> +============================
> +导出内核头文件供用户空间使用
> +============================
> +
> +"make headers_install" 命令以适合于用户空间程序的形式导出内核头文件。
> +
> +Linux 内核导出的头文件描述了用户空间程序尝试使用内核服务的 API。这些内核
> +头文件被系统的 C 库（例如 glibc 和 uClibc）用于定义可用的系统调用，以及
> +与这些系统调用一起使用的常量和结构。C 库的头文件包括来自 linux 子目录的
> +内核头文件。系统的 libc 头文件通常被安装在默认位置 /usr/include，而内核
> +头文件在该位置的子目录中（主要是 /usr/include/linux 和 /usr/include/asm）。
> +
> +内核头文件向后兼容，但不向前兼容。这意味着使用旧内核头文件的 C 库构建的程序
> +可以在新内核上运行（尽管它可能无法访问新特性），但使用新内核头文件构建的程序
> +可能无法在旧内核上运行。
> +
> +"make headers_install" 命令可以在内核源代码的顶层目录中运行（或使用标准
> +的树外构建）。它接受两个可选参数::
> +
> +  make headers_install ARCH=i386 INSTALL_HDR_PATH=/usr
> +
> +ARCH 表明为其生成头文件的架构，默认为当前架构。导出内核头文件的 linux/asm
> +目录是基于特定平台的，要查看支持架构的完整列表，使用以下命令::
> +
> +  ls -d include/asm-* | sed 's/.*-//'
> +
> +INSTALL_HDR_PATH 表明头文件的安装位置，默认为 "./usr"。
> +
> +该命令会在 INSTALL_HDR_PATH 中自动创建创建一个 'include' 目录，而头文件
> +会被安装在 INSTALL_HDR_PATH/include 中。
> +
> +内核头文件导出的基础设施由 David Woodhouse <dwmw2@infradead.org> 维护。
> \ No newline at end of file
> diff --git a/Documentation/translations/zh_CN/kbuild/index.rst b/Documentation/translations/zh_CN/kbuild/index.rst
> new file mode 100644
> index 000000000000..b9feb56b846a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/kbuild/index.rst
> @@ -0,0 +1,35 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/kbuild/index
> +:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
> +
> +============
> +内核编译系统
> +============
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +    headers_install
> +
> +TODO:
> +
> +- kconfig-language
> +- kconfig-macro-language
> +- kbuild
> +- kconfig
> +- makefiles
> +- modules
> +- issues
> +- reproducible-builds
> +- gcc-plugins
> +- llvm
> +
> +.. only::  subproject and html
> +
> +   目录
> +   =====
> +
> +   * :ref:`genindex`
