Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3997F5221
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 21:24:38 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 20so1801857pfu.13
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 13:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cwNgqi/NQkqWmtT2yM6QfKma/Y9yH7Zze7tBPVBivxk=;
        b=BUrkQTa+u/VpDQVrQM/lKNS4FTu2L3sLIIqBbnjlsemezMYlVHS8iPOKK5l8sDB8yf
         M4eQOaPKiijvKhy/SLCWzcZDVz/vrcfFQIx6305wyt+99rkBk/j46H2bPJO4NqwWUeFh
         SkY620a+ghXrYMMXDe+qWeyKu+3Dvw/iW6h4x+aAX3OuOb3gVlFRnttrZ6X5yzPnhfFV
         a4hbYsL2Asa8O8K8Flc+yw3WuHu8TpXa9t3pgAGlKDIZrPieC5OiBBQVM/ABA/0OaMpG
         9l3Kc8GBn58XMHZQT3nc6VjzrTALSMaOkN4yeTt5fG9hcT419bAO6RkFlg+/vznV8Naa
         zz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwNgqi/NQkqWmtT2yM6QfKma/Y9yH7Zze7tBPVBivxk=;
        b=qrQC9XtCf7UB4eEfcsl2LUIUt/SzItc39Wo+GvcHrF5doiqG2tytMeD98hm6XUkj8t
         aHHoa8tXU46LqedlcJC7io78n6OzzdP64XK9xwZ4Own4V9ErSWB6XRDzPueFB2r1Ree7
         a0nSr9nGWYs4aP76p9WY22lJXFSG8RbGh6/t9OLh10rrIzxgzCOKcY48UDKiMUK3d15/
         EYXAYBKTq5NQlZyJ34dgxQ7toMsVrVnk4Oooa9aBGqSRPalaETjf+0U1s+vQ0F19Fws3
         V+orZHw4G9Zitu1EmM8SZbhFF5dTWn9nD5EylK6XhsAL24//g6VkZgLK5jIiWveI4jz+
         SQsA==
X-Gm-Message-State: AFqh2kohPon/LZ5o32lAfZqOwwAgjZSnkwXTXxsuBS1kviIEbeLDd8IF
	UfF/YYM57WRsPSuVZAU/1yvi89c5kSQVB1a4JOMOiw==
X-Google-Smtp-Source: AMrXdXtIh0E/DgOM0QwEcwfy9eQgImnKUYlPyPKRHz81WoFNXLApps0jEhpEfXN0JAZZbWaOYH1ssQGCAd5Wpz9DJLc=
X-Received: by 2002:a63:4943:0:b0:478:e6cf:c24c with SMTP id
 y3-20020a634943000000b00478e6cfc24cmr5119252pgk.365.1673299477404; Mon, 09
 Jan 2023 13:24:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-5-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-5-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 13:24:26 -0800
Message-ID: <CAKwvOdkB_+Nf9zpXeeayA6V14QoAEfW0b37DBsro04q5JpjBnw@mail.gmail.com>
Subject: Re: [PATCH 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 11:54 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> points out that KBUILD_AFLAGS contains a linker flag, which will be
> used:
>
>   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>
> This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> unnecessary, as all supported versions of clang and gcc will pass '-a64'
> or '-a32' to GNU as based on the value of '-m'; the behavior of the
> latest stable release of the oldest supported major version of each
> compiler is shown below and each compiler's latest release exhibits the
> same behavior (GCC 12.2.0 and Clang 15.0.6).
>
>   $ powerpc64-linux-gcc --version | head -1
>   powerpc64-linux-gcc (GCC) 5.5.0
>
>   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
>
>   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
>
>   $ clang --version | head -1
>   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
>
> Remove this flag altogether to avoid future issues.
>
> Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index dc4cbf0a5ca9..4fd630efe39d 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -90,7 +90,7 @@ aflags-$(CONFIG_CPU_LITTLE_ENDIAN)    += -mlittle-endian
>
>  ifeq ($(HAS_BIARCH),y)
>  KBUILD_CFLAGS  += -m$(BITS)
> -KBUILD_AFLAGS  += -m$(BITS) -Wl,-a$(BITS)
> +KBUILD_AFLAGS  += -m$(BITS)
>  KBUILD_LDFLAGS += -m elf$(BITS)$(LDEMULATION)
>  endif
>
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
