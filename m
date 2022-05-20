Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39762F4A
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 18:19:41 +0000 (UTC)
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay11.hostedemail.com (Postfix) with ESMTP id 1047A819FC;
	Fri, 20 May 2022 17:24:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id 90A222F;
	Fri, 20 May 2022 17:24:41 +0000 (UTC)
Message-ID: <5be32ddf7688db38408466315a80e03e9af7ac40.camel@perches.com>
Subject: Re: [PATCH v2 4/5] clang-format: Fix empty curly braces
From: Joe Perches <joe@perches.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?ISO-8859-1?Q?Micka=EBl_Sala=FCn?=
	 <mic@digikod.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andy Whitcroft <apw@canonical.com>, 
 Brian Norris <briannorris@chromium.org>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Kees
 Cook <keescook@chromium.org>, Konstantin Meskhidze
 <konstantin.meskhidze@huawei.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
  Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Paul Moore <paul@paul-moore.com>, Tom Rix
 <trix@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev
Date: Fri, 20 May 2022 10:24:40 -0700
In-Reply-To: <CANiq72kbp3xTpj-L2BfLQ1Ecx-2Ki0W3e5YLERx8-T9bjb96=g@mail.gmail.com>
References: <20220506160106.522341-1-mic@digikod.net>
	 <20220506160106.522341-5-mic@digikod.net>
	 <CANiq72kbp3xTpj-L2BfLQ1Ecx-2Ki0W3e5YLERx8-T9bjb96=g@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 90A222F
X-Spam-Status: No, score=-1.87
X-Stat-Signature: egq551txxc3afjxpmwups4w9xq1sq7cr
X-Rspamd-Server: rspamout05
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+q3qK2ENX7TEoV39UpiiLOyeJIHyMH308=
X-HE-Tag: 1653067481-758101

On Fri, 2022-05-20 at 19:15 +0200, Miguel Ojeda wrote:
> On Fri, May 6, 2022 at 6:00 PM Mickaël Salaün <mic@digikod.net> wrote:
> > 
> > SplitEmptyFunction [1] should be false to not add a new line in an empty
> > function body.  This follows the current kernel coding style.
> 
> I don't think this is correct. Checking headers in `include/linux/`, I
> see ~70 using {} (when not in the same line as the signature), and
> ~700 in different lines. In `kernel/`, it is even more pronounced: 4
> vs. ~200.
> 
> Am I missing something?

historic vs recent uses ?

I think it's mostly a 'don't care' style.
It's not like there's a significant line count advantage.

Sometimes there is though for blocks like

#if CONFIG_FOO

void foo1(...);
void foo2(...);
...
void fooN(...);

#else

static inline void foo1(...) {}
static inline void foo2(...) {}
...
static inline void fooN(...) {}

#endif



