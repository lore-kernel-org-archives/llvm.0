Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A2BA38
	for <llvm@lists.linux.dev>; Mon, 13 Feb 2023 23:31:59 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id s11so7392386edd.10
        for <llvm@lists.linux.dev>; Mon, 13 Feb 2023 15:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AdtOWowEtcNb0fBYdv2IT4vsABesICSFaMSOMAEIWRA=;
        b=cMkCqggcOpdERZkrVimIABE58AgahEXS7SwagsUDcIRe0tNifo2rJfrWITLM84bj3K
         VT5r6oGAIGSGGDmoZBcOwmMPCOvD3aq/FKOf9TwOedY7huCgbqUgCnQ6+X86crrWF7SZ
         5VDY9yc3NpyZDyY9eqTyFXhi4MAyC4IRGt3fF3EF9LXiwuNUfJ7Vh1EP7wzHIAz+zeMk
         LQNPZ+j+qikdWWBHXQ/JyifmHUPvaLcYGRYJaNsjunDi4EJQuNa/aJ+GqU2VMkfOvLMC
         I1o6GsFdF+x/Zfx8Yi9iQHJMlpt4NzVFNMbxqcXxBCVg5Tpwb4V8B8nM7pNf0K89hzOU
         M+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdtOWowEtcNb0fBYdv2IT4vsABesICSFaMSOMAEIWRA=;
        b=wpGRbfkXC3S+Qq56LTOa7YnzYfKNG6oUSymjmlfu53mpO8VqTgXXXxSI5rJOjzcMUv
         zsyuIVq5cvY4FQdWdZC3Qd7ut8Z9DxBHnaFB6pjEc+UJ50Ca3FemPHhVfcecdjkWBQxK
         oWj7Gah/v6Bc1C8iwfh+2FDB6SsD8UYPvDyQUPPWyE6xyt5BTdy6yQqT42wc49Yd6w0n
         XCSafOmCxuKZo4HBwnSWF5rl59rkeNYs+W/mPygro0tmf6gZBpIPoF3MOkE1QWREiKru
         JKNJYsRNqIE9aZqEc9hvdWtF5kVbQvM34q+c9xRoEb/DB56yrhH9VSn7hTcJ23T+/vTv
         jBkw==
X-Gm-Message-State: AO0yUKWwZG13UQ6TeTx8qOUD2EUncymZja8pwFefvzE7NfEFJPjVo0xr
	VbP1mNm//WieiUWHOmsFROfMhxKIl3oqpsDvAlNApQ==
X-Google-Smtp-Source: AK7set+4DODG3YNHkQGmaxQz8GUJTeGHYRXYvtMPa+YrS0XW+8xHHLnTrKDEV48T4miR6kX7dk0P0b0Y8J5TeDE8q/A=
X-Received: by 2002:a50:d513:0:b0:4ac:c720:207c with SMTP id
 u19-20020a50d513000000b004acc720207cmr198637edi.5.1676331117332; Mon, 13 Feb
 2023 15:31:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230212092715.1422619-4-davemarchevsky@fb.com>
 <202302121936.t36vlAFG-lkp@intel.com> <d04d33ff-0f8f-2bbd-3a67-9b8b813a799b@meta.com>
 <CAKwvOdketskm5z25aPRY7OsBOZe2kzvXV-i9RDTbwcLpZSAT0A@mail.gmail.com> <CAADnVQ+qJMAugDDQXaerRbh0g4QdRygMZ_0UVmXViR2aJ4OLDQ@mail.gmail.com>
In-Reply-To: <CAADnVQ+qJMAugDDQXaerRbh0g4QdRygMZ_0UVmXViR2aJ4OLDQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 13 Feb 2023 15:31:21 -0800
Message-ID: <CABCJKucDXNeGCdD6uT7phYhpm+OgYm19EkfCNMB9AJ66k4NcvQ@mail.gmail.com>
Subject: Re: [PATCH v5 bpf-next 3/9] bpf: Add bpf_rbtree_{add,remove,first} kfuncs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Dave Marchevsky <davemarchevsky@meta.com>, 
	kernel test robot <lkp@intel.com>, Dave Marchevsky <davemarchevsky@fb.com>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Kernel Team <kernel-team@fb.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Peter Zijlstra <peterz@infradead.org>, Joao Moreira <joao@overdrivepizza.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 13, 2023 at 2:17 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Feb 13, 2023 at 12:49 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > I haven't looked at the series in question, but note that this compile
> > time warning is meant to help us catch Control Flow Integrity runtime
> > violations, which may result in a panic.

Here's the tracking issue for the other warnings of this type in the
kernel, nearly all the warnings are in one driver:

https://github.com/ClangBuiltLinux/linux/issues/1724

> It's a transition from kernel to bpf prog.
> If CFI trips on it it will trip on all transitions.
> All calls from kernel into bpf are more or less the same.
> Not sure what it means for other archs, but on x86 JIT emits 'endbr'
> insn to make IBT/CFI happy.

While IBT allows indirect calls to any function that starts with
endbr, CFI is more fine-grained and requires the function pointer type
to match the function type, which further limits possible call
targets. To actually enforce this, the compiler emits a type hash
prefix for each function, and a check before each indirect call to
ensure the call target has the expected prefix. The commit message
here has an example of the code the compiler generates:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3c516f89e17e56b4738f05588e51267e295b5e63

As calling a JIT compiled function would obviously trip CFI, indirect
call checking is currently disabled in BPF dispatcher functions (using
the __nocfi attribute). However, BPF trampolines still have the same
problem, I believe. I wouldn't mind coming up with a solution for
CFI+BPF JIT compatibility, but I haven't had much time to look into
this. Basically, in places where we currently emit an endbr
instruction, we should also emit a type hash prefix.

Generating type prefixes for functions called through a dispatcher
shouldn't be that hard because the function type is always the same,
but figuring out the correct type for indirect calls that don't go
through a dispatcher might not be entirely trivial, although I'm sure
the BPF verifier/compiler must have this information. FineIBT also
complicates matters a bit here as the actual prefix format differs
from the basic KCFI prefix.

I'm not sure if Peter or Joao have had time to look at this, but I
would be happy to hear any suggestions you might have.

Sami
