Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA969CB80
	for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 22:00:20 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id dr8so43480147ejc.12
        for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 14:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AS/0qup7BcnqbUG2luaOwtrCXv59oK9htcoBV4r8xhk=;
        b=CPFRjqqmsqDcbGjNXJl+hyJ3nJ1+gJwkgqLE/r9Oa0+2b/Pq6ryT+HzxwVrAjSC7tn
         l8DOfFd2ns53htL/HteSdqvDWJSbs4ZqMGhxQQAstX5yomzt9oCirNOl8cckMGt+rOuU
         ZFQnDyKFjjyiG104YyRQMcn+d8ae0PCBpFHFi3J0jcfuLupQLFmHgyyslq3XQ/AfEStI
         DuVMzlDMtJiAdjhk8VMmOf+jhYU/B4I36Ald4qYjp4WRsp3KHniadgLoSMu4ufmXe4A5
         QBBGfmU8YQEyLGp/AYn4jUl80Dja5RHhr5ZJhvoWzPqCaU/TWivqr3eZGCzX7V3zd2nZ
         Q2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS/0qup7BcnqbUG2luaOwtrCXv59oK9htcoBV4r8xhk=;
        b=XxgnwikoKv9BTZJV2dVv1y81biOJx8XyQ0vS9Mw+sytuVN3FJ1gwV+aULRzhjFgPRr
         acC41863TmCOeW2oGKBepJpOjNYy7vphk3EJXtJtBZIHkTyMeFeohoVbkAeucrkSGZ57
         nWlj6oQ3gnLwLGXApQk3R7jPflB136fGYqGt5LGnlxuelwp/bzDlFHJAX9U7dWZ5YmWX
         kniQYp7po5YvA9IAZRdv6CQb/eWkOR15e1k7nKhSGC8P3ELoYrNR7hLcfCILm0GcyiO7
         XjrNiWccqkga9iIaXJ2zFB34EKgPdQAP23L4LNjby9d3v3stLNBbikeHv6TOSIgnBvA6
         5UXQ==
X-Gm-Message-State: AO0yUKWA0PIbknt86LXnkzeYAIZDQAohkDYlhZOnA4YLGrUoM62g2l4K
	Sl1iOtoq8sXtIL3AomVru4uAb++VcqTB1CuR7SybUA==
X-Google-Smtp-Source: AK7set89M7AOPuCjBIeu+wc2JMUNVAVkDPYq97Ui/xG09ktGeDqyVQiNbMANXkSQy4uXVk9NH1q6GETMwj4pk/vF0GI=
X-Received: by 2002:a17:907:2cd2:b0:895:58be:963 with SMTP id
 hg18-20020a1709072cd200b0089558be0963mr4318ejc.3.1676412018747; Tue, 14 Feb
 2023 14:00:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230212092715.1422619-4-davemarchevsky@fb.com>
 <202302121936.t36vlAFG-lkp@intel.com> <d04d33ff-0f8f-2bbd-3a67-9b8b813a799b@meta.com>
 <CAKwvOdketskm5z25aPRY7OsBOZe2kzvXV-i9RDTbwcLpZSAT0A@mail.gmail.com>
 <CAADnVQ+qJMAugDDQXaerRbh0g4QdRygMZ_0UVmXViR2aJ4OLDQ@mail.gmail.com>
 <CABCJKucDXNeGCdD6uT7phYhpm+OgYm19EkfCNMB9AJ66k4NcvQ@mail.gmail.com> <Y+tupCQ/X38AlvY0@hirez.programming.kicks-ass.net>
In-Reply-To: <Y+tupCQ/X38AlvY0@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 14 Feb 2023 13:59:41 -0800
Message-ID: <CABCJKuc1iqHjg9ERVXMHO00rOqaNGM=d7xTvB4f6fTM4J4-nTA@mail.gmail.com>
Subject: Re: [PATCH v5 bpf-next 3/9] bpf: Add bpf_rbtree_{add,remove,first} kfuncs
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Dave Marchevsky <davemarchevsky@meta.com>, 
	kernel test robot <lkp@intel.com>, Dave Marchevsky <davemarchevsky@fb.com>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Kernel Team <kernel-team@fb.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Joao Moreira <joao@overdrivepizza.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 7:36 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> The other case, which you allude to I think, is control transfer to the
> JIT'ed code which is currently __nocfi annotated. I've only briefly
> thought about how to change this, but basically it would entail the JIT
> emitting the correct prefix bytes and setting the entry point at +16.
>
> Given the JIT will only run after we've selected kCFI/FineIBT it knows
> which form to pick from and can emit the right prefix. Then if we remove
> the __nocfi annotation from the call into JIT'ed code, everything should
> work.
>
> None of this should be exceptionally hard, but I've not had time to
> actually do much about it yet.

The dispatcher path shouldn't be terribly hard to fix, but when I
looked into this briefly half a year ago and ran BPF self-tests with
CFI enabled, I found a few more places that indirectly call jitted
code (or trampolines) using a different function pointer type:

https://github.com/ClangBuiltLinux/linux/issues/1727

For some of these, determining the correct type didn't look all that
simple, but then again, I'm not super familiar with BPF internals.

Sami
