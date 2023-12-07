Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12475731B
	for <llvm@lists.linux.dev>; Thu,  7 Dec 2023 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXI30UQz"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7b701b75f36so30796139f.0
        for <llvm@lists.linux.dev>; Thu, 07 Dec 2023 14:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701989655; x=1702594455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8z/n7oVJrLI7AapO66ABR3Mg7MdK3FEalI7JxmyKlx0=;
        b=dXI30UQzrXiY8zduDdtmnSyJ6+ZGkwxSsNGOgJJ5q0PGx3e7ngzWUOdbWqMnUCodLK
         7kkViV1RwM8YKyXfWQ2TrX9oburECrS4EXyWkOnP0Ee0T/Ao9fwJSkMxArE3phsQcLU8
         V5muHI/h5T4wryFUuF3Mdx7tltu0kaRlVdby0DxWwytvpUz5WzruZ8cEqzLflFzuD+ZV
         dHUo+feaghBHulN0U2djwTH+mQPzhPesJoEjnbPWKjJfpQpV1nT9uUh+lscxZn1MGAzk
         FIaRbbmfStB/gDWlu7Kslb2BlQxlZzUIMnREZPdVcXXpFFllC2cYQDctFde3bzoV8hXb
         ZBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701989655; x=1702594455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z/n7oVJrLI7AapO66ABR3Mg7MdK3FEalI7JxmyKlx0=;
        b=NfWw0HDW6+C573rDicbH9sBySzW0ubaJIzMsP9epF1echDOzglGjz9VJw3P3RXvqa4
         6WWaeNoWYJujlczYZhMIGhoM8nxjdj3tbvQmLN9XlGLE+Eef88sUfwAeK25lFLoKJLCx
         vCN2bBN9iWRGMei2uCPi+qJuZLiyx56LmiZtYgIBI23UQEitm1BQpXyRDfMsDNb5vLwg
         KEnt1XVVhaa8uZjHrZ321X4L3PbL4KKsx/+aq4bqLuAPe2hTDsM9KRxmWkrDNxUefz8/
         +Xy+Vth7fNKFXCYLEOowcZpHyvOrw8iMU8RFUJ1K3b0Zsx/wEsOZ8SjhSqFOQwIdQd4E
         JELg==
X-Gm-Message-State: AOJu0YxlEZrk0ZR7khoI6H7nFwLROgX8H0euGUW3UAKfknna6l1crILj
	nVUkbCespFvJj/5k5GG2K1526A==
X-Google-Smtp-Source: AGHT+IG+tMLAPQMs0kJxW/IS3KFdRdsft6Gda4jPxtMmDl2cn6omxOmWAnKPtSQSHnM2EVZDhqe2JQ==
X-Received: by 2002:a05:6e02:12ec:b0:35d:59a2:331d with SMTP id l12-20020a056e0212ec00b0035d59a2331dmr4773035iln.33.1701989654689;
        Thu, 07 Dec 2023 14:54:14 -0800 (PST)
Received: from google.com (20.10.132.34.bc.googleusercontent.com. [34.132.10.20])
        by smtp.gmail.com with ESMTPSA id h6-20020a92c086000000b0035d5935e19bsm168963ile.65.2023.12.07.14.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 14:54:14 -0800 (PST)
Date: Thu, 7 Dec 2023 22:54:11 +0000
From: Justin Stitt <justinstitt@google.com>
To: Jialu Xu <xujialu@vimux.org>
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	masahiroy@kernel.org, morbo@google.com, ndesaulniers@google.com
Subject: Re: [PATCH v4] gen_compile_commands.py: fix path resolve with
 symlinks in it
Message-ID: <20231207225411.his46ofov6kswkmi@google.com>
References: <20231205165648.GA391810@dev-arch.thelio-3990X>
 <20231206012441.840082-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206012441.840082-1-xujialu@vimux.org>

Hi,

On Wed, Dec 06, 2023 at 09:24:42AM +0800, Jialu Xu wrote:
> When a path contains relative symbolic links, os.path.abspath() might
> not follow the symlinks and instead return the absolute path with just
> the relative paths resolved, resulting in an incorrect path.
>
> 1. Say "drivers/hdf/" has some symlinks:
>
>     # ls -l drivers/hdf/
>     total 364
>     drwxrwxr-x 2 ...   4096 ... evdev
>     lrwxrwxrwx 1 ...     44 ... framework -> ../../../../../../drivers/hdf_core/framework
>     -rw-rw-r-- 1 ... 359010 ... hdf_macro_test.h
>     lrwxrwxrwx 1 ...     55 ... inner_api -> ../../../../../../drivers/hdf_core/interfaces/inner_api
>     lrwxrwxrwx 1 ...     53 ... khdf -> ../../../../../../drivers/hdf_core/adapter/khdf/linux
>     -rw-r--r-- 1 ...     74 ... Makefile
>     drwxrwxr-x 3 ...   4096 ... wifi
>
> 2. One .cmd file records that:
>
>     # head -1 ./framework/core/manager/src/.devmgr_service.o.cmd
>     cmd_drivers/hdf/khdf/manager/../../../../framework/core/manager/src/devmgr_service.o := ... \
>     /path/to/out/drivers/hdf/khdf/manager/../../../../framework/core/manager/src/devmgr_service.c
>
> 3. os.path.abspath returns "/path/to/out/framework/core/manager/src/devmgr_service.c", not correct:
>
>     # ./scripts/clang-tools/gen_compile_commands.py
>     INFO: Could not add line from ./framework/core/manager/src/.devmgr_service.o.cmd: File \
>         /path/to/out/framework/core/manager/src/devmgr_service.c not found
>
> Use pathlib.Path.resolve(), which resolves the symlinks and normalizes
> the paths correctly.
>
>     # cat compile_commands.json
>     ...
>     {
>       "command": ...
>       "directory": ...
>       "file": "/path/to/blabla/drivers/hdf_core/framework/core/manager/src/devmgr_service.c"
>     },
>     ...
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Jialu Xu <xujialu@vimux.org>
> ---

This looks good to me. I prefer using pathlib over anything in os
module, even if the behavior was the same. In this case, the pathlib
behavior is better -- which is a bonus.

Reviewed-by: Justin Stitt <justinstitt@google.com>
>  scripts/clang-tools/gen_compile_commands.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 180952fb91c1b..99e28b7152c19 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -11,6 +11,7 @@ import argparse
>  import json
>  import logging
>  import os
> +from pathlib import Path
>  import re
>  import subprocess
>  import sys
> @@ -172,8 +173,9 @@ def process_line(root_directory, command_prefix, file_path):
>      # by Make, so this code replaces the escaped version with '#'.
>      prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
>
> -    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
> -    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
> +    # Make the path absolute, resolving all symlinks on the way and also normalizing it.
> +    # Convert Path object to a string because 'PosixPath' is not JSON serializable.
> +    abs_path = str(Path(root_directory, file_path).resolve())
>      if not os.path.exists(abs_path):
>          raise ValueError('File %s not found' % abs_path)
>      return {
> --
> 2.39.2
>
