Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EAA7A
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4eot77bxTYfFsa6JPgcrLHeFlPFSY4n2Z2cBmuOXQns=; b=coqrHFq90Y4xMg9udRxTGACC6s
	CLcSsJNedFL8rf0lUtAGh2YcIrYDbnpQ9B2shr3FpvvnYYFmV0GGGxJS9sYlm9N7jYacj+rTmwpvb
	CBYXsxotZ3DhzMHeUB54LdMzlNE9zAAUW2euMQIhun7dcGnIjPgRf4tiXwsVOd5tZjgf+vdKtvWCe
	sJtHOw7IRB/aaIykUyOYIq4hYs8O7F2+xiSHKNkdfkQNjOh3UeT1GBvx+GiB1HqiI4803bDnts2Sa
	Yhbkzqbt4VbIj7e82/gHEiyhQFMbez4NZNSF01Ibqj40CTOUIDHkRv42vZ2u4zOPAZVTnde4W71Pa
	DZ2LBbig==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nffzy-005laB-SZ; Sat, 16 Apr 2022 10:49:51 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3FCF19861A3; Sat, 16 Apr 2022 12:49:49 +0200 (CEST)
Date: Sat, 16 Apr 2022 12:49:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org,
	hjl.tools@gmail.com, mbenes@suse.cz, rostedt@goodmis.org,
	linux-toolchains@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>,
	Fangrui Song <maskray@google.com>,
	Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: The trouble with __weak and objtool got worse
Message-ID: <20220416104949.GD2731@worktop.programming.kicks-ass.net>
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net>
 <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
 <20220415182130.iltk2uxnubeaa4nk@treble>
 <CAKwvOdkn-JMRzYhgEP=sQK9oqL7SJmdo_Dp+-5ZthQv6m1=jcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkn-JMRzYhgEP=sQK9oqL7SJmdo_Dp+-5ZthQv6m1=jcA@mail.gmail.com>

On Fri, Apr 15, 2022 at 01:36:12PM -0700, Nick Desaulniers wrote:
> FWIW, I found this note that retaining STT_SECTION will have adverse
> binary size effects for LTO.
> https://reviews.llvm.org/D93783#2470728
> Perhaps food for thought here.

LTO doesn't suffer this problem since then we run objtool after linking
and it never sees the weak stuff to get confused about.
