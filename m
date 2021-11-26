Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB1268
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 20:36:36 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id b192so6710206vkf.3
        for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 12:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TFS0HFFa3DF2mBq7mbNDhAUEHsq6tdnEc4bL+Qa6DAo=;
        b=sB677R+7siP73YQaUzij/Y16nHFk7kDMyLTPn2sUE/p+yn0lxsmOGgtqIlrWLPXq5l
         E4SgtZ3lo7QEwSeqOZHXKiAefJFBZQMqOvzuCvlN7hdiLKne+ndjPfaeKqN+MjzS0x2t
         wIkL6xSw+IMzVDyitDUWMmwt+dhKN4wxIAKEN26Zu3+n5ekdAijvZZRuLquOJlXCad9K
         YbOu5oRYMn9BZ9R/ObE7VX3prABrTeUZPV7VEjsBA6unQeA57vqnRJTqaw6JnhSYFBP0
         sJuQ1NkDaeUeEvxmxKPTx7AMo9Xy+vK0WuxnyuAcGeN65Wem+sQ43SHEJfu09qLcVmRm
         lKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TFS0HFFa3DF2mBq7mbNDhAUEHsq6tdnEc4bL+Qa6DAo=;
        b=oa97UjfrZqs0Pad2+BKJ8TAzEV/So+yd2dJSxc3eoaL8g9sNiyFqaJZ0YzP83Zs03M
         iNqLO3aXe/KcIDw4JjjCyLDMUAXbQCCBLV7fULc0gfIstT3ekEtduu0otKAUQNTempQ/
         3p1KW+WtIqBU3IIK9JjxTkP+EIdFA8ospw/U5h89r8DyPKJdYRPII63Yu3xcz0mTtxxS
         EIc9cCPKrxNDbwA92yHx5YseJS1Ka+1xPfZIf8Pge0U9oCAVUNIZJTPJpPSgbeT7hmRC
         ew9S31IeKU+ljdXEQ3FpWtAhxjxfrHbKyrLjfbEC5e3yAIAA13I6QEQlAWUP0C+WRrNx
         D4kQ==
X-Gm-Message-State: AOAM5326dBBbs/2sw2zHqOdoY8wIbnTF4oA9O7mBWuz0OlS2qJoP9wvY
	/QV5KRBq3w6mJcpjUicwO6KsGnU9pWzz7lr3otfxwg==
X-Google-Smtp-Source: ABdhPJy1Ry9bvIoqLWKjyr7uxvRb9zSPZNweFHhl21DQUT21sbAa6ndli5VfyOGAXaIGih4UMJ0aEvqRdsVvHvKGdvQ=
X-Received: by 2002:a05:6122:1813:: with SMTP id ay19mr22170144vkb.24.1637958995634;
 Fri, 26 Nov 2021 12:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122192019.1277299-1-jean-philippe@linaro.org>
In-Reply-To: <20211122192019.1277299-1-jean-philippe@linaro.org>
From: Quentin Monnet <quentin@isovalent.com>
Date: Fri, 26 Nov 2021 20:36:24 +0000
Message-ID: <CACdoK4JWJRH0VuStA2N+xziTsC5d_ewuWpQEO2aHhVbsWuAq0g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/6] tools/bpf: Enable cross-building with clang
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Shuah Khan <shuah@kernel.org>, nathan@kernel.org, 
	ndesaulniers@google.com, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Nov 2021 at 19:23, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> Add support for cross-building BPF tools and selftests with clang, by
> passing LLVM=1 or CC=clang to make, as well as CROSS_COMPILE. A single
> clang toolchain can generate binaries for multiple architectures, so
> instead of having prefixes such as aarch64-linux-gnu-gcc, clang uses the
> -target parameter: `clang -target aarch64-linux-gnu'.
>
> Patch 1 adds the parameter in Makefile.include so tools can easily
> support this. Patch 2 prepares for the libbpf change from patch 3 (keep
> building resolve_btfids's libbpf in the host arch, when cross-building
> the kernel with clang). Patches 3-6 enable cross-building BPF tools with
> clang.

The set looks good to me. I checked that the tools are still building
(without cross-compiling). I currently have issues building the
selftests on my setup, but they don't appear to be related to this
patchset.

Acked-by: Quentin Monnet <quentin@isovalent.com>

Note that on bpf-next, patch 5 (runqslower) has a conflict with
be79505caf3f ("tools/runqslower: Install libbpf headers when
building").

Did you consider enabling cross-compiling for the BPF samples too? I'm
asking because the build system is pretty similar to the BPF tools.

Thanks,
Quentin
