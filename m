Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D101946B1
	for <llvm@lists.linux.dev>; Thu,  6 Mar 2025 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741232375; cv=none; b=HSU6t5ESVbo0G5hInzwWdAcYMc7DAnI93E0VeQ8EvJXn6ipCpjT2vDQ/Evmg49K/afnKCX6IVjwSD1+bt/yyLWfRonMt93mjmNgsLwWHxcSOn2iUC7lx5hzbRO8nxnVM3XsqKu3ris2PdiQsx6ZS0Ru7pV4udf8JwH5VSlAOhzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741232375; c=relaxed/simple;
	bh=f/eEcM0NHe7IojjfcsfekX/bHp43CZXGZ50QyLmEDFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLhF4GF+7R8mFRWC3aI/kG77eS61YnokII1REd9EGIcSm9tNEO/yMX5gOBju6cmq/PzQMwMmDwDARA/9TjYR9H3uecx/OCw/CN3X6ZX55vDsw8pVXJ1yfOYDKYls10EYcFxEMMlwQaDpDitsrq0aNXO1JM/cT++GFk71qgj4K7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9KwymSK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9KwymSK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so72648f8f.2
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 19:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741232372; x=1741837172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/eEcM0NHe7IojjfcsfekX/bHp43CZXGZ50QyLmEDFY=;
        b=B9KwymSKszfXfYcwWIFCE+wXo4fD56io6tygu1hzqAfjJxHkYAL7AH1ciPMBDB26fq
         4lSq1Je6NS6APkCBWAQGcXC806ErZvNB++3WPpUZLZhCWqVQ2QSoJrp2Whnab43eNTW1
         HprVFilxDRr9jHlpAyxlqFeEkyTDJAonSxyKvWuWBIMgC2XWNU3QRF8r6NyixWWABn0H
         1FeoE0qIyeQrY8tWfycLdyxKxqAlDIqkxDq5dEKTKBB1zRphWFOXxP2rlupuR9QGttfM
         qZqvjkAwTVUXviC/QHfDBF3oqnH++gWEpUIz3eZ6Y9CjI52XB0FatjJQ7XDsExt3c7Qy
         KCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741232372; x=1741837172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/eEcM0NHe7IojjfcsfekX/bHp43CZXGZ50QyLmEDFY=;
        b=nBK3NmtVsbshNXkJ99amInFSXUxk2iWeGE+HKqMZyusS4foC/icAkr1pI581nC65Kj
         OcjcWi/zCCPgxjzoNi83POBiUWGKTsgAXmGrgwuewkDAjHIOjSZc1qplhjQrnA2n1nP6
         z7m8yTYBhNwo+cl6JhPEeLfOUyvdvMVdE4I8ZdKJsYKBZcVDHc15KCqJ4InEm1f6M3zL
         q63nhzwDbGpU7ITEIKe5zC0RROvbPrUQqOVkvJj3CMGiAu0yOWnyg/vy/5pmBT52ffac
         zhYGAepmSZfsnqwqYGRgNG7VFku6aLhLSB80TGjCJA1jgatd/eRfjPYlogJaCHVNlXFV
         D4Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXXQHtDWUWWEYzg44KJms2WSOCrcEIxz9zAb31W8/GMX/iCEksB/RO+MTMwCOxJ5YBwIOSB@lists.linux.dev
X-Gm-Message-State: AOJu0YyuU5PB55DyZWb0G1Nk+o1u2Itc6YzybA7WhZllSOiRvNEGVJuV
	6kgJc3SUqaz9Eb5CyOxetC+W9IQwHiPCMlaXLFFqPWjHfb9bFlmi0/9uDSlVfWdRGzFMvfFZRm4
	UaUC6iPoWuX9CkE6ZrKFQtqjq0LE=
X-Gm-Gg: ASbGncusi1n027psrowaMhB8iQ8KzYnwXOXHn4Rh9Idr5TydB37iSZlE9eAEUuBDCKO
	UOYBJKDhHu9yNH/tMO4SvGg+a+pRUZNUQLfzGI8qpuCFjgArdLejsyWXM2E0qibMdDd3N6W9TLT
	0GXHRfJ7H35UtClbW0iEymnHZK3xNyo3Ob4YdASaT6Aw==
X-Google-Smtp-Source: AGHT+IH27dDGyBt7hd/VD86i6Z5HrEQ87tPCL5LhwJp6YDp6zkaw2KXN1sF3oSjJz4rUkFgqQ7BDSNeVdPcCH+k+1EA=
X-Received: by 2002:a5d:59ab:0:b0:391:1139:2653 with SMTP id
 ffacd0b85a97d-3911f7d2142mr4539340f8f.52.1741232372007; Wed, 05 Mar 2025
 19:39:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
 <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
 <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com>
 <20250305100306.4685333a@gandalf.local.home> <CADxym3ZB_eQny=-aO4AwrHiwT264NXitdKwjRUYrnGJ2tH=Qwg@mail.gmail.com>
In-Reply-To: <CADxym3ZB_eQny=-aO4AwrHiwT264NXitdKwjRUYrnGJ2tH=Qwg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 5 Mar 2025 19:39:20 -0800
X-Gm-Features: AQ5f1JrlMjvbkNliJ-RM0--naYFcbVQdQvx8bndtQJGQK7ImHRvWRfp852lYwK0
Message-ID: <CAADnVQJ0_+Hij=kf9eVPX_ZND=2=uDHaYPWvv1x-WmR5sZRSmA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, dongml2@chinatelecom.cn, 
	Andrew Morton <akpm@linux-foundation.org>, Rik van Riel <riel@surriel.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 6:59=E2=80=AFPM Menglong Dong <menglong8.dong@gmail.=
com> wrote:
>
> I'm not sure if it works. However, indirect call is also used
> in function graph, so we still have better performance. Isn't it?
>
> Let me have a look at the code of the function graph first :/

Menglong,

Function graph infra isn't going to help.
"call foo" isn't a problem either.

But we have to step back.
per-function metadata is an optimization and feels like
we're doing a premature optimization here without collecting
performance numbers first.

Let's implement multi-fentry with generic get_metadata_by_ip() first.
get_metadata_by_ip() will be a hashtable in such a case and
then we can compare its performance when it's implemented as
a direct lookup from ip-4 (this patch) vs hash table
(that does 'ip' to 'metadata' lookup).

If/when we decide to do this per-function metadata we can also
punt to generic hashtable for cfi, IBT, FineIBT, etc configs.
When mitigations are enabled the performance suffers anyway,
so hashtable lookup vs direct ip-4 lookup won't make much difference.
So we can enable per-function metadata only on non-mitigation configs
when FUNCTION_ALIGNMENT=3D16.
There will be some number of bytes available before every function
and if we can tell gcc/llvm to leave at least 5 bytes there
the growth of vmlinux .text will be within a noise.

So let's figure out the design of multi-fenty first with a hashtable
for metadata and decide next steps afterwards.
