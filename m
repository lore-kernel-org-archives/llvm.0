Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078C716423
	for <llvm@lists.linux.dev>; Thu, 21 Sep 2023 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lBQ9L3RlB45kZvbJWfiQxiFwc8HMdP6/NHhfMJr5W7Q=; b=V2bR9vdUKJ2S0HUMIe7i8sl+Sy
	1Z4nxvZYME70drFBH69pCo7Si+S0O+nKOB98tJj0+mcj+m7GITUSU1Ikejy7tomtgIQTp1wtpesLV
	75aq7j5UERmvZyusm7Eusz9XMIk/7p7lZDj+18gT7qhaNDuZLogE9hxE9Xrov+A8kAc+CHSjb6RRs
	Uxq7BVdNQTzrfVFLAiJtqNMmdTGgJPYN1EfoU38yNIz2gxIwHR8tfX8ZrwU3D8HBcghe5e/AizEK8
	l7INCahuqJJncAxAplEPh7vyb4VX3NhnN8h26J0KBKE7oV5zjtZl/CNVwADQdJrMSkLWN7M1/szZy
	+/SRhv9w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPGG-00FaZz-27;
	Thu, 21 Sep 2023 19:22:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A86C53002F1; Thu, 21 Sep 2023 21:22:53 +0200 (CEST)
Date: Thu, 21 Sep 2023 21:22:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fangrui Song <maskray@google.com>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] x86/speculation, objtool: Use absolute relocations for
 annotations
Message-ID: <20230921192253.GA39480@noisy.programming.kicks-ass.net>
References: <20230920001728.1439947-1-maskray@google.com>
 <20230921072655.GA14803@noisy.programming.kicks-ass.net>
 <CAFP8O3+_8H+fetuoqwwcfqJLNtYmpsWZhY2arD7HMuPmcN+X_g@mail.gmail.com>
 <20230921153537.GG14803@noisy.programming.kicks-ass.net>
 <CAFP8O3K6Lgxe=Res9d2GKipRYdXqzv3wa_0PLtDcyn7g7H=z5w@mail.gmail.com>
 <20230921171900.GB29413@noisy.programming.kicks-ass.net>
 <CAFP8O3JpkWTXnxYxa45uANNMQ34g2VUPnfj7-oWn3oq9egUb-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFP8O3JpkWTXnxYxa45uANNMQ34g2VUPnfj7-oWn3oq9egUb-A@mail.gmail.com>

On Thu, Sep 21, 2023 at 10:36:27AM -0700, Fangrui Song wrote:

> Well, only if the clever assembler doesn't support 32-bit absolute
> relocation for a 64-bit architecture.
> I don't know such an architecture. In addition, as long as the
> architecture intends to support DWARF32, it has to support 32-bit
> absolute relocations for a 64-bit architecture.

Ooh... my bad. For some reason I thought that absolute meant native word
size. But you already mentioned R_X86_64_32 (and I failed to check) and
that is indeed an absolute (S+A) relocation of 32bit (dword) size.

And apparently we also have R_X64_64_16 and R_X86_64_8, which would even
allow something like:

#define OBJTOOL_ANNOTATE(type)				\
	"999:\n\t"					\
	".pushsection .discard.objtool_annotate\n\t"	\
	".byte 999b\n\t"				\
	".byte " __stringify(type) "\n\t"		\
	".popsection\n\t"

And since we only read the relocation and don't care for the actual
result that would actually work just fine.

Anyway, thanks for bearing with me.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
