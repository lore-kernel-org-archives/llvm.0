Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352328FE
	for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 13:34:53 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id c6so2380182edn.8
        for <llvm@lists.linux.dev>; Wed, 13 Apr 2022 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sQVZ7J8yQGd+tEY03Cwz/nv0IhDW8+5XIiy/oBZrZmU=;
        b=pftn6WZdVexdxPPCdRcFSdsCPyzoy4lot+T+SI383R6uVdHdlChwGKFYPIbmJ8Y5sE
         qVW5AfB9zoVhhCpAPX2b8ha348AX2gckn/7lkG215/mbpSc+apoCc/6+9XqWoZRWTJFk
         R9OztxL0zXaYjj2gr4eXUMgwyZUno7BxdmwsXJO6qTKYcnCpZM2SMHhDRppCqkZ6oant
         a5TIEfyo5D1lBd+0Hsq08H19i8z7XIGkYeh9CTG0q2q87OZwKZF9GvFrHcA1mGtwQOIm
         W9b+ohCvNg/m1Gj0a3XHzYG5XtVfqiCx1tB6PvGEjaSaoYnMq+pYs5UMZ+d5INKihIgc
         J2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sQVZ7J8yQGd+tEY03Cwz/nv0IhDW8+5XIiy/oBZrZmU=;
        b=x4S60IpcKhN+tZkyzcRdvmNeXb8vRV2OV8tvkPxf/y0ErhqRZA/4MzesLoS55Eu4+Z
         2dbXieTCsSHZFXECGp7zfSsGE9UvN3wmvtZIg26x6a9uplPE2Z8Q5Er9e5cgl6N/EF9I
         EHEetaNSrWNC3vhAKtNPmoaXQk2Eo1ajXujG5byb9VH25Y809MXPh67YGeFGXZopjouj
         iPA+p1RdPQwadn5hL1V2GzA7DW2TERN+joQzSlopjQPse/Ih2iqRbLGui5xq/SR//79T
         wgOVR8l4/LMxtGrstwYWCumXUzHFa3i/+3XKZioLZqcjQZx8Mg+f0fT90IHLgrJis7jh
         uCQg==
X-Gm-Message-State: AOAM530Jy4iCbG/IKiTD7C97Wu9eseV2A1mjRED2A2oVyPQ2zw40G2KT
	HrkkP4JUhurw1zR2lDfe098=
X-Google-Smtp-Source: ABdhPJzRmYj2t5Pc6U72h12bhsu67TqUTC5LKjjZ+V+xwsTkshlRyzRdpeoOVzWZvJFlVGRz+uhWqA==
X-Received: by 2002:aa7:da8d:0:b0:41d:71be:d8bd with SMTP id q13-20020aa7da8d000000b0041d71bed8bdmr20002478eds.71.1649856891749;
        Wed, 13 Apr 2022 06:34:51 -0700 (PDT)
Received: from pswork ([62.96.250.75])
        by smtp.gmail.com with ESMTPSA id l15-20020a170906938f00b006e8afb5a7d9sm6894ejx.33.2022.04.13.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 06:34:51 -0700 (PDT)
Date: Wed, 13 Apr 2022 15:34:50 +0200
From: Padmanabha Srinivasaiah <treasure4paddy@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v8 3/4] bootconfig: Support embedding a bootconfig file
 in kernel
Message-ID: <20220413133450.GA9228@pswork>
References: <164921224829.1090670.9700650651725930602.stgit@devnote2>
 <164921227943.1090670.14035119557571329218.stgit@devnote2>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164921227943.1090670.14035119557571329218.stgit@devnote2>
User-Agent: Mutt/1.9.4 (2018-02-28)

Hello Masami Hiramatsu,

On Wed, Apr 06, 2022 at 11:31:19AM +0900, Masami Hiramatsu wrote:
> This allows kernel developer to embed a default bootconfig file in
> the kernel instead of embedding it in the initrd. This will be good
> for who are using the kernel without initrd, or who needs a default
> bootconfigs.
> This needs to set two kconfigs: CONFIG_BOOT_CONFIG_EMBED=y and set
> the file path to CONFIG_BOOT_CONFIG_EMBED_FILE.
> 
> Note that you still need 'bootconfig' command line option to load the
> embedded bootconfig. Also if you boot using an initrd with a different
> bootconfig, the kernel will use the bootconfig in the initrd, instead
> of the default bootconfig.
> 
> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
> ---
>  Changes in v8:
>   - Fix a build error in CONFIG_BLK_DEV_INITRD=n case.
>  Changes in v7:
>   - Change kconfig option name to share the common prefix so that
>     we can search it easier.
>   - Make embedded_bootconfig_data readonly.
>   - Select CONFIG_BLK_DEV_INITRD only if CONFIG_BOOT_CONFIG_EMBED=n
>   - Remove redundant default settings for new Kconfig options.
>  Changes in v6:
>   - Split out the .incbin asm part as bootconfig-data.S according to
>     Masahiro's comment.
>  Changes in v5:
>   - Fix .gitignore to be sorted alphabetically.
>   - Make default.bconf is cleaned up correctly.
>   - Allow user to specify relative path to CONFIG_EMBED_BOOT_CONFIG_FILE.
>     (Thanks Masahiro!)
>  Changes in v4:
>   - Avoid updating the default.bconf if the file is not changed.
> ---
>  MAINTAINERS                |    1 +
>  include/linux/bootconfig.h |   10 ++++++++++
>  init/Kconfig               |   21 ++++++++++++++++++++-
>  init/main.c                |   22 ++++++++++++----------
>  lib/.gitignore             |    1 +
>  lib/Makefile               |    8 ++++++++
>  lib/bootconfig-data.S      |   10 ++++++++++
>  lib/bootconfig.c           |   13 +++++++++++++
>  8 files changed, 75 insertions(+), 11 deletions(-)
>  create mode 100644 lib/bootconfig-data.S
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c10fbd13080a..88c9d62acd90 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7318,6 +7318,7 @@ S:	Maintained
>  F:	Documentation/admin-guide/bootconfig.rst
>  F:	fs/proc/bootconfig.c
>  F:	include/linux/bootconfig.h
> +F:	lib/bootconfig-data.S
>  F:	lib/bootconfig.c
>  F:	tools/bootconfig/*
>  F:	tools/bootconfig/scripts/*
> diff --git a/include/linux/bootconfig.h b/include/linux/bootconfig.h
> index a4665c7ab07c..1611f9db878e 100644
> --- a/include/linux/bootconfig.h
> +++ b/include/linux/bootconfig.h
> @@ -289,4 +289,14 @@ int __init xbc_get_info(int *node_size, size_t *data_size);
>  /* XBC cleanup data structures */
>  void __init xbc_exit(void);
>  
> +/* XBC embedded bootconfig data in kernel */
> +#ifdef CONFIG_BOOT_CONFIG_EMBED
> +const char * __init xbc_get_embedded_bootconfig(size_t *size);
> +#else
> +static inline const char *xbc_get_embedded_bootconfig(size_t *size)
> +{
> +	return NULL;
> +}
> +#endif
> +
>  #endif
> diff --git a/init/Kconfig b/init/Kconfig
> index beb5b866c318..e7c75fb7d244 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1347,7 +1347,7 @@ endif
>  
>  config BOOT_CONFIG
>  	bool "Boot config support"
> -	select BLK_DEV_INITRD
> +	select BLK_DEV_INITRD if !BOOT_CONFIG_EMBED
>  	help
>  	  Extra boot config allows system admin to pass a config file as
>  	  complemental extension of kernel cmdline when booting.
> @@ -1357,6 +1357,25 @@ config BOOT_CONFIG
>  
>  	  If unsure, say Y.
>  
> +config BOOT_CONFIG_EMBED
> +	bool "Embed bootconfig file in the kernel"
> +	depends on BOOT_CONFIG
> +	help
> +	  Embed a bootconfig file given by BOOT_CONFIG_EMBED_FILE in the
> +	  kernel. Usually, the bootconfig file is loaded with the initrd
> +	  image. But if the system doesn't support initrd, this option will
> +	  help you by embedding a bootconfig file while building the kernel.
> +
> +	  If unsure, say N.
> +
> +config BOOT_CONFIG_EMBED_FILE
> +	string "Embedded bootconfig file path"
> +	depends on BOOT_CONFIG_EMBED
> +	help
> +	  Specify a bootconfig file which will be embedded to the kernel.
> +	  This bootconfig will be used if there is no initrd or no other
> +	  bootconfig in the initrd.
> +
>  choice
>  	prompt "Compiler optimization level"
>  	default CC_OPTIMIZE_FOR_PERFORMANCE
> diff --git a/init/main.c b/init/main.c
> index 4f3ba3b84e34..d00c6f77d0e0 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -265,7 +265,7 @@ static int __init loglevel(char *str)
>  early_param("loglevel", loglevel);
>  
>  #ifdef CONFIG_BLK_DEV_INITRD
> -static void * __init get_boot_config_from_initrd(u32 *_size)
> +static void * __init get_boot_config_from_initrd(size_t *_size)
>  {
>  	u32 size, csum;
>  	char *data;
> @@ -312,7 +312,7 @@ static void * __init get_boot_config_from_initrd(u32 *_size)
>  	return data;
>  }
>  #else
> -static void * __init get_boot_config_from_initrd(u32 *_size)
> +static void * __init get_boot_config_from_initrd(size_t *_size)
>  {
>  	return NULL;
>  }
> @@ -409,14 +409,16 @@ static int __init warn_bootconfig(char *str)
>  static void __init setup_boot_config(void)
>  {
>  	static char tmp_cmdline[COMMAND_LINE_SIZE] __initdata;
> -	const char *msg;
> -	int pos;
> -	u32 size;
> -	char *data, *err;
> -	int ret;
> +	const char *msg, *data;
> +	int pos, ret;
> +	size_t size;
> +	char *err;
>  
>  	/* Cut out the bootconfig data even if we have no bootconfig option */
>  	data = get_boot_config_from_initrd(&size);
> +	/* If there is no bootconfig in initrd, try embedded one. */
> +	if (!data)
> +		data = xbc_get_embedded_bootconfig(&size);
>  
>  	strlcpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
>  	err = parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0, NULL,
> @@ -435,8 +437,8 @@ static void __init setup_boot_config(void)
>  	}
>  
>  	if (size >= XBC_DATA_MAX) {
> -		pr_err("bootconfig size %d greater than max size %d\n",
> -			size, XBC_DATA_MAX);
> +		pr_err("bootconfig size %ld greater than max size %d\n",
> +			(long)size, XBC_DATA_MAX);
>  		return;
>  	}
>  
> @@ -449,7 +451,7 @@ static void __init setup_boot_config(void)
>  				msg, pos);
>  	} else {
>  		xbc_get_info(&ret, NULL);
> -		pr_info("Load bootconfig: %d bytes %d nodes\n", size, ret);
> +		pr_info("Load bootconfig: %ld bytes %d nodes\n", (long)size, ret);
>  		/* keys starting with "kernel." are passed via cmdline */
>  		extra_command_line = xbc_make_cmdline("kernel");
>  		/* Also, "init." keys are init arguments */
> diff --git a/lib/.gitignore b/lib/.gitignore
> index e5e217b8307b..54596b634ecb 100644
> --- a/lib/.gitignore
> +++ b/lib/.gitignore
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  /crc32table.h
>  /crc64table.h
> +/default.bconf
>  /gen_crc32table
>  /gen_crc64table
>  /oid_registry_data.c
> diff --git a/lib/Makefile b/lib/Makefile
> index 4fc48543dc8f..62a103aaabd4 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -277,6 +277,14 @@ $(foreach file, $(libfdt_files), \
>  lib-$(CONFIG_LIBFDT) += $(libfdt_files)
>  
>  obj-$(CONFIG_BOOT_CONFIG) += bootconfig.o
> +obj-$(CONFIG_BOOT_CONFIG_EMBED) += bootconfig-data.o
> +
> +$(obj)/bootconfig-data.o: $(obj)/default.bconf
> +
> +targets += default.bconf
> +filechk_defbconf = cat $(or $(real-prereqs), /dev/null)
> +$(obj)/default.bconf: $(CONFIG_BOOT_CONFIG_EMBED_FILE) FORCE
> +	$(call filechk,defbconf)
>  
>  obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
>  obj-$(CONFIG_INTERVAL_TREE_TEST) += interval_tree_test.o
> diff --git a/lib/bootconfig-data.S b/lib/bootconfig-data.S
> new file mode 100644
> index 000000000000..ef85ba1a82f4
> --- /dev/null
> +++ b/lib/bootconfig-data.S
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Embed default bootconfig in the kernel.
> + */
> +	.section .init.rodata, "aw"
> +	.global embedded_bootconfig_data
> +embedded_bootconfig_data:
> +	.incbin "lib/default.bconf"
> +	.global embedded_bootconfig_data_end
> +embedded_bootconfig_data_end:
> diff --git a/lib/bootconfig.c b/lib/bootconfig.c
> index 74f3201ab8e5..c59d26068a64 100644
> --- a/lib/bootconfig.c
> +++ b/lib/bootconfig.c
> @@ -12,6 +12,19 @@
>  #include <linux/kernel.h>
>  #include <linux/memblock.h>
>  #include <linux/string.h>
> +
> +#ifdef CONFIG_BOOT_CONFIG_EMBED
> +/* embedded_bootconfig_data is defined in bootconfig-data.S */
> +extern __visible const char embedded_bootconfig_data[];
> +extern __visible const char embedded_bootconfig_data_end[];
> +
> +const char * __init xbc_get_embedded_bootconfig(size_t *size)
> +{
> +	*size = embedded_bootconfig_data_end - embedded_bootconfig_data;
> +	return (*size) ? embedded_bootconfig_data : NULL;
> +}
> +#endif
> +
>  #else /* !__KERNEL__ */
>  /*
>   * NOTE: This is only for tools/bootconfig, because tools/bootconfig will
>
Tested using llvm 15.0.0 [p1] with FULL and THIN LTO as suggested here [p2],
with full and incremental builds results are as expected and no issues
observed.

[p1] https://download.01.org/0day-ci/cross-package/clang-latest/clang-latest/clang.tar.xz
[p2] https://lore.kernel.org/lkml/20220327115526.cc4b0ff55fc53c97683c3e4d@kernel.org/

Thanks and Regards,
Padmanabha.S
