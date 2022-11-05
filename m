Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BBB2591
	for <llvm@lists.linux.dev>; Sat,  5 Nov 2022 16:20:36 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v27so11683892eda.1
        for <llvm@lists.linux.dev>; Sat, 05 Nov 2022 09:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=srQ3lTh3ov/uW1CynRa0KjN77ReKbgwHiOujQ3nMVGI=;
        b=P0kLwQwYClIZzoWMQF0niGOEZY4ILluvbFpoIzNEfGSiaBf5YEbKrtilG8yOZt23rS
         A9Vn4TNmkIG8F/Z4HcJKJDpzol0995YgFK9jc/y9B+yZZWZv3sE6Q+tDvgndaqqA8tUa
         GBpk7naq0m1IqFdv0pbGxcfdRsz4I9XaPo0zt2YVWaQFjQ16FTBxaHdpFw/y0izCcaEf
         oSaYqWxONukSWy28TM0SRTQyooBPLQeQKL1DxvUuvEI00eHM33jFhETT2xm6tzTXGmwY
         O1RaLVhp/FW7yx2zx0x9KAWRtwguiW83/3ZEaOUVaVPx4HoKCop39fY8BUTvITaxccsp
         st1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srQ3lTh3ov/uW1CynRa0KjN77ReKbgwHiOujQ3nMVGI=;
        b=skvpbEK4LX7ikC4Kc53DEpjGvhYKOIRSpJxI7cZcMs2IBazud8LmfFbQDlak6zqJB0
         qnxgPwSWOB6YRT8PvZrfhwQhjg4fA5FTB+De2Vsixd4hnvCwnwfdRSYwpd+Ybi9DkjGb
         4RuTXrqtaRKRMqC1RMExY4dxT8YbLZ8sfdLcMvX9tc4HhbIngoabq7DleKwIhNNA7ukG
         38H/KJcnFlJzEpM2RlqzBABrurEQzVGvJSPijw/mm5IPfnDKcONLULDJ4M7oh4ZbyFJW
         kkJP2PCPjROh6DKZG0S57IT8huYfhllycrYN3wbW49Em2CxzlcINmgF1xzFKWAbTkdid
         jkCg==
X-Gm-Message-State: ACrzQf0Glqz6CApScRrfwGDpRqnt8pGA2XCiC45BqqYAPZrkbrNSeCFw
	EBlwT8jjMU+8Ka9lb46QDLJYno5xZ6cRD//oopU=
X-Google-Smtp-Source: AMsMyM7zSz2xzkf30t95QCMUe/+35Au5IQDfWUWwp1tGv7KynUmdAkPytr6E2YTxR4NYApaYSEmfEf0uMjZO7JpmzeE=
X-Received: by 2002:a05:6402:5406:b0:452:1560:f9d4 with SMTP id
 ev6-20020a056402540600b004521560f9d4mr41547613edb.333.1667665234700; Sat, 05
 Nov 2022 09:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221105025146.238209-1-horenchuang@bytedance.com>
In-Reply-To: <20221105025146.238209-1-horenchuang@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 5 Nov 2022 09:20:23 -0700
Message-ID: <CAADnVQK5t0YWGgdWmjiWX6vA0SjANrnf5x=yzu7PtDKpoK6cJQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 0/4] Add BPF htab map's used size for monitoring
To: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Jiri Olsa <olsajiri@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, 
	Quentin Monnet <quentin@isovalent.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Kui-Feng Lee <kuifeng@fb.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Maxim Mikityanskiy <maximmi@nvidia.com>, 
	Hao Xiang <hao.xiang@bytedance.com>, Punit Agrawal <punit.agrawal@bytedance.com>, 
	Yifei Ma <yifeima@bytedance.com>, Xiaoning Ding <xiaoning.ding@bytedance.com>, 
	bpf <bpf@vger.kernel.org>, Ho-Ren Chuang <horenc@vt.edu>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 4, 2022 at 7:52 PM Ho-Ren (Jack) Chuang
<horenchuang@bytedance.com> wrote:
>
> Hello everyone,
>
> We have prepared patches to address an issue from a previous discussion.
> The previous discussion email thread is here: https://lore.kernel.org/all/CAADnVQLBt0snxv4bKwg1WKQ9wDFbaDCtZ03v1-LjOTYtsKPckQ@mail.gmail.com/

Rephrasing what was said earlier.
We're not keeping the count of elements in a preallocated hash map
and we are not going to add one.
The bpf prog needs to do the accounting on its own if it needs
this kind of statistics.
Keeping the count for non-prealloc is already significant performance
overhead. We don't trade performance for stats.
