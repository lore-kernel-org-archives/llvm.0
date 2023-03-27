Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8281DA29
	for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8DqjXeO1tc2m6wXJ4uu/hd4TZQ+nIIRzc4UwCMqvjG8=; b=eoYR6vnhQmVHVaf0Cx3ZejMm+E
	IoLUG92swHmVbyoasGep3/EHaAXqfnR7A4Vn5xqegIAyLZk84yxJreTtlxEga511ZtWcEl54MxGx5
	v9mFmGlwqg7QOxSavhHNC4J2dfU4s50L/h4SRZnDWoE4b/hrOH6cyTUchcfWi8WRXksfndBJCa7fX
	sjRo8mGUT0Cfo5Aimw9arEnsHfRD0hvllcS4nSudTC6cJzZsFtLffiFeOPRauma25Q/YpWIRDYFKW
	1OP4FS98NR3/hE/qdvCXj4HwcEzoaFy0uBYF5/rfcha+rXC5weZvvOHCJ67PXIHr47oe7GhV6x+qb
	9m2Vp8Jg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pgjBF-00695J-18;
	Mon, 27 Mar 2023 09:30:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 568E73005DB;
	Mon, 27 Mar 2023 11:30:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E8DF82014D86B; Mon, 27 Mar 2023 11:30:16 +0200 (CEST)
Date: Mon, 27 Mar 2023 11:30:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Li <ashimida.1990@gmail.com>
Cc: Aaron Tomlin <atomlin@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>,
	Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Changbin Du <changbin.du@intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>, gcc-patches@gcc.gnu.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kees Cook <keescook@chromium.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Marco Elver <elver@google.com>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Miguel Ojeda <ojeda@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Richard Sandiford <richard.sandiford@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>, Song Liu <song@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>,
	Uros Bizjak <ubizjak@gmail.com>, Will Deacon <will@kernel.org>,
	x86@kernel.org, Yuntao Wang <ytcoode@gmail.com>,
	Yu Zhao <yuzhao@google.com>, Zhen Lei <thunder.leizhen@huawei.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [RFC/RFT,V2] CFI: Add support for gcc CFI in aarch64
Message-ID: <20230327093016.GB4253@hirez.programming.kicks-ass.net>
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
 <20230325085416.95191-1-ashimida.1990@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325085416.95191-1-ashimida.1990@gmail.com>

On Sat, Mar 25, 2023 at 01:54:16AM -0700, Dan Li wrote:

> In the compiler part[4], most of the content is the same as Sami's
> implementation[3], except for some minor differences, mainly including:
> 
> 1. The function typeid is calculated differently and it is difficult
> to be consistent.

This means there is an effective ABI break between the compilers, which
is sad :-( Is there really nothing to be done about this?
