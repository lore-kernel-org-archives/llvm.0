Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787B2CA7
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 20:58:55 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id z4so3973969lft.3
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 12:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r2prFBbbw0SgUku+cL74yN0HGsK8dFLCLYw+Q+rSPog=;
        b=JlRXCmva986BLaiT3mgvHu10ajULbDiNMTZ1fCrwIw0eCIXJcYaCtvLLAGZSPxvhy+
         T4dPe30xC4XNt7SWPCz+V/3V35FCYXW5/8ej2uqrmEZw94dcQ5KqBnicCGeiXxjtg7FO
         GTUfCwGaFxwLHrLUjWJrFcedQePTbD/HZpEf7BEN2Iv1R09eiF5mK31fkRXX0XZujQ6a
         XWHwJIlvkmN0xfssAdN/ZFpXLi5qktiKA3L2NlizY2MvbW84kNgVWTOwnhoVGQYmrYNM
         yq82aDqeM6roU46b2f50ux0UzOgrBCpuMjhgwA1Wh2szfIGVNx6a0WtZPQpAyrCjjJMl
         cOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r2prFBbbw0SgUku+cL74yN0HGsK8dFLCLYw+Q+rSPog=;
        b=AcTNI0TR3ofluB2l5zZjI5cQk9R5e9DUg/oSMIMMzUP8DT/v0BROBev2428amSTg+z
         jBFMPpUyMnE4rw2JvgrRJxERYBia1pT1yvZlsf9khROGwSd3E//ubNc5ZM8AlzfnwNm1
         zJZa40cMsCLpmtl62qRNge4r9md29VuKInSYaMpIdSshxD+KJrzmuz1zaBssw3bbwHgn
         97xQMSsP555JJNIGODOUmORm3eUxCXE+YVsb1WS41oAJ+u69KUcKCQ5Jx5T2z5Qj3vda
         v6ej0uUPfCSd/BK6Zv0EIav08PQhvTdLF/cRjCnAF8JB03Zfdjqh12Sxk3g0omdIdd5h
         Poww==
X-Gm-Message-State: AOAM531ic2clV8H2NPhsswuSb2VjX41KvpEosMuBqVFfIQVuX6PjtwDB
	xA2ARVt6Q9ztCM1zsg4fZb69y/WtFm8CUhl0c8OSFA==
X-Google-Smtp-Source: ABdhPJz1yO7V+tfQwwGwfaFHu0v/fkcvwyR9W0P6Tul/3jLKGLWt3XWYt+xUaDiu8cedwyfho3DTCbvdnM6zW2R0Gxg=
X-Received: by 2002:a05:6512:3c8e:: with SMTP id h14mr8998574lfv.489.1643144333118;
 Tue, 25 Jan 2022 12:58:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7dab5a16-01fa-496f-b9c7-8111b9404541n@googlegroups.com>
In-Reply-To: <7dab5a16-01fa-496f-b9c7-8111b9404541n@googlegroups.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 25 Jan 2022 12:58:40 -0800
Message-ID: <CAKwvOdnHPCt5CEu4JHQ_zSmotuzW4TvexrVuKkJAO8yfCbYf=A@mail.gmail.com>
Subject: Re: whole kernel bitcode
To: Akshith Gunasekaran <akshith.573@gmail.com>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

(minus the old list, plus the new one)

On Mon, Jan 24, 2022 at 9:38 PM Akshith Gunasekaran
<akshith.573@gmail.com> wrote:
>
> Hi All,
>
> There have been attempts at producing llvm whole program bitcode for the Linux kernel. But this was prior to Linux being fully compatible with the LLVM toolchain.
>
> Given the current LLMV toolchain can successfully compile the Linux kernel, can someone advice me/point me to resources on how to produce whole program bitcode for the kernel?
>
> And can I produce a bootable kernel binary from this whole kernel bitcode?

When you say kernel bitcode, do you mean LLVM .bc bitcode files?  We
compile the entire kernel to LLVM bitcode as part of LTO
(LTO_CLANG_FULL and LTO_CLANG_THIN).

$ make LLVM=1 -j$(nproc) defconfig
$ ./scripts/config -e CONFIG_LTO_CLANG_THIN -d CONFIG_LTO_NONE
$ make LLVM=1 -j$(nproc)
$ file lib/string.o
lib/string.o: LLVM IR bitcode

-- 
Thanks,
~Nick Desaulniers
