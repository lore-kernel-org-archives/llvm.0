Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC3D4428
	for <llvm@lists.linux.dev>; Tue,  9 Aug 2022 15:21:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p12-20020a7bcc8c000000b003a5360f218fso363494wma.3
        for <llvm@lists.linux.dev>; Tue, 09 Aug 2022 08:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=vD+tcaqZeKcn4ZVpEK9uVGgFnO6G13lBCWtO9h+EQ/g=;
        b=CwxDLnH4X215ms/nKAODiOifmdxrI4drSDDiQkd/NN3b1zbHgl6+S7nfvWRDASDwIu
         CTvv39YA+0cl0ZQYyk3r+e/MnXQa+gh7ZaOm140v6+hxVMjeLEBo31z0w98m4N6G9X5q
         2d17suTrO+nWCKSxwH4caI0d1v/KaPIlk5UUonbmzO5SqrS7vt8DeSw3xcZB4upKaCjZ
         FyeIcNgMrT6dW2kf6RPMMJqwE5BZIS4kS261oeIheZkjqtLNOGO4yHK1+fh2fXbDZWbQ
         mnFgbD53tmMls6sVyGDMK0RTr5oxWCx0ejsz2av51mvb8x11G4stXpU/69EvkRHxi2sa
         HJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=vD+tcaqZeKcn4ZVpEK9uVGgFnO6G13lBCWtO9h+EQ/g=;
        b=n23d8v4W6aim3yHY5dfwF9Z7+VE672TmYd2U5AKaopTXzlyegTCbTxOuiOZmEDAJub
         5MApfT8xtV3PLg+eehH7zUiA4krgu7r98T3IKLbOyEMKrAJI2UnG7dcxoVD6YIvknyrz
         4QMV5z15JgBqEwI8aNZItnst+SXBCNljmW6vUbd4w6Eln+8DZ71NxZQ7NAD4tPgS65Hy
         ieyZ7bBZvTkQiWN+E/wi33VvPnW0KzFZa7Usb86b7biy1YgOMR+w9DlqqVwBLVBGJT6r
         hBHxmR+izN6qVlYRwY3mvizTLdEe/ah8JKSD8QBxQfZPsI0c3fCmPzxIsVnOzvT710p6
         wHjg==
X-Gm-Message-State: ACgBeo3s0o37up8l9IWLOnk+Qn66Ht0PyDnfzMqT/DGVXa/aFGvM7FPj
	7FMSAw2S9e1cHOO18IGFhlJzYQ==
X-Google-Smtp-Source: AA6agR7j4Y+NYWojvBo9JAbZpEfFdgONFgHaBON1QHZInE56IWly4nKhnF9/PcB1utTyjgCAOhUA0g==
X-Received: by 2002:a05:600c:350:b0:3a5:3473:1c23 with SMTP id u16-20020a05600c035000b003a534731c23mr9907997wmd.9.1660058491245;
        Tue, 09 Aug 2022 08:21:31 -0700 (PDT)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id v8-20020a5d5908000000b0021f131de6aesm13649334wrd.34.2022.08.09.08.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 08:21:30 -0700 (PDT)
Message-ID: <692f0648-6f47-f4b7-f806-e57af59b1447@isovalent.com>
Date: Tue, 9 Aug 2022 16:21:29 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 4/4] build: Switch to new openssl API for test-libcrypto
Content-Language: en-GB
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>
Cc: Roberto Sassu <roberto.sassu@huawei.com>, ast@kernel.org,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 peterz@infradead.org, mingo@redhat.com, terrelln@fb.com, nathan@kernel.org,
 ndesaulniers@google.com, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andres Freund <andres@anarazel.de>,
 Jiri Olsa <jolsa@kernel.org>
References: <20220719170555.2576993-1-roberto.sassu@huawei.com>
 <20220719170555.2576993-4-roberto.sassu@huawei.com>
 <5f867295-10d2-0085-d1dc-051f56e7136a@iogearbox.net>
 <YvFW/kBL6YA3Tlnc@kernel.org> <YvJ6DbzBNsAgNZS4@kernel.org>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <YvJ6DbzBNsAgNZS4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/08/2022 16:15, Arnaldo Carvalho de Melo wrote:
> Em Mon, Aug 08, 2022 at 03:33:34PM -0300, Arnaldo Carvalho de Melo escreveu:
>> Em Mon, Aug 08, 2022 at 06:14:48PM +0200, Daniel Borkmann escreveu:
>>> Hi Arnaldo,
>>>
>>> On 7/19/22 7:05 PM, Roberto Sassu wrote:
>>>> Switch to new EVP API for detecting libcrypto, as Fedora 36 returns an
>>>> error when it encounters the deprecated function MD5_Init() and the others.
>>>> The error would be interpreted as missing libcrypto, while in reality it is
>>>> not.
>>>>
>>>> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
>>>
>>> Given rest of the tooling fixes from Andres Freund went via perf tree and the
>>> below is perf related as well, I presume you'll pick this up, too?
>>
>> Sure.
>>  
>>>   [0] https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=perf/core
> 
> So I fixed up the first one, minor fuzzes, the second I had to fix
> conflicts with the patchset from Andres, ended up as below, will test
> build it then in my container kit.
> 
> - Arnaldo
> 
> commit bea955a0256e20cc18e87087e42f2a903b9a8b84
> Author: Roberto Sassu <roberto.sassu@huawei.com>
> Date:   Tue Jul 19 19:05:53 2022 +0200
> 
>     bpftool: Complete libbfd feature detection
>     
>     Commit 6e8ccb4f624a7 ("tools/bpf: properly account for libbfd variations")
>     sets the linking flags depending on which flavor of the libbfd feature was
>     detected.
>     
>     However, the flavors except libbfd cannot be detected, as they are not in
>     the feature list.
>     
>     Complete the list of features to detect by adding libbfd-liberty and
>     libbfd-liberty-z.
>     
>     Committer notes:
>     
>     Adjust conflict with with:
>     
>       1e1613f64cc8a09d ("tools bpftool: Don't display disassembler-four-args feature test")
>       600b7b26c07a070d ("tools bpftool: Fix compilation error with new binutils")
>     
>     Fixes: 6e8ccb4f624a73c5 ("tools/bpf: properly account for libbfd variations")
>     Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
>     Cc: Alexei Starovoitov <ast@kernel.org>
>     Cc: Andres Freund <andres@anarazel.de>
>     Cc: Andrii Nakryiko <andrii@kernel.org>
>     Cc: bpf@vger.kernel.org
>     Cc: Daniel Borkmann <daniel@iogearbox.net>
>     Cc: Ingo Molnar <mingo@redhat.com>
>     Cc: John Fastabend <john.fastabend@gmail.com>
>     Cc: KP Singh <kpsingh@kernel.org>
>     Cc: llvm@lists.linux.dev
>     Cc: Martin KaFai Lau <martin.lau@linux.dev>
>     Cc: Nathan Chancellor <nathan@kernel.org>
>     Cc: Nick Desaulniers <ndesaulniers@google.com>
>     Cc: Nick Terrell <terrelln@fb.com>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Quentin Monnet <quentin@isovalent.com>
>     Cc: Song Liu <song@kernel.org>
>     Cc: Stanislav Fomichev <sdf@google.com>
>     Link: https://lore.kernel.org/r/20220719170555.2576993-2-roberto.sassu@huawei.com
>     Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> index 04d733e98bffbc08..9cc132277150c534 100644
> --- a/tools/bpf/bpftool/Makefile
> +++ b/tools/bpf/bpftool/Makefile
> @@ -93,9 +93,11 @@ INSTALL ?= install
>  RM ?= rm -f
>  
>  FEATURE_USER = .bpftool
> -FEATURE_TESTS = libbfd disassembler-four-args disassembler-init-styled libcap \
> +FEATURE_TESTS = libbfd libbfd-liberty libbfd-liberty-z
> +	disassembler-four-args disassembler-init-styled libcap \
>  	clang-bpf-co-re
> -FEATURE_DISPLAY = libbfd libcap clang-bpf-co-re
> +FEATURE_DISPLAY = libbfd libbfd-liberty libbfd-liberty-z
> +	libcap clang-bpf-co-re
>  
>  check_feat := 1
>  NON_CHECK_FEAT_TARGETS := clean uninstall doc doc-clean doc-install doc-uninstall

The adjustment looks good, thanks Arnaldo!
