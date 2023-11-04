Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18AD17D5
	for <llvm@lists.linux.dev>; Sat,  4 Nov 2023 12:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qzFbh-0008Ao-64; Sat, 04 Nov 2023 13:18:29 +0100
Message-ID: <28755010-3786-4284-b8a5-488c137ffb2b@leemhuis.info>
Date: Sat, 4 Nov 2023 13:18:28 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: minimal soak time in -next leads to breakages in mainline
Content-Language: en-US, de-DE
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Nathan Chancellor <nathan@kernel.org>
References: <CAKwvOdmOpXr4=Eoeis0ngU2QPTejWTGmm99bLkFEyBPPW7TD6g@mail.gmail.com>
 <CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAHk-=wgXDTfWFbn-481=it6W_B0KTQsOhdgXL6mweVm6ewtSvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1699100318;677bf9f7;
X-HE-SMSGID: 1qzFbh-0008Ao-64

On 04.11.23 03:52, Linus Torvalds wrote:
> On Fri, 3 Nov 2023 at 12:34, Nick Desaulniers <ndesaulniers@google.com> wrote:
>>
>> What if a large feature hits -next for 1 day then gets merged into
>> mainline the next day?  2 days?  3? Where do we draw the line?
> 
> Well, the basic rule has always been that it should be a "few next
> cycles". We've neve really made it more precise than that, [...]

I could write something short up if people agree that it would be wise
to do so.

I think it would be worth it, as I see maintainers handling -next in
different ways during the merge window. I even got the impression some
assume "no new material in -next during the merge window" includes fixes
for problems introduced or found during the merge window. At least that
would explain why some maintainers seem to wait with picking up
regression fixes until after -rc1 is out, even if multiple people during
a problem during the merge window.

That "regression fixes" obviously includes fixes for build problems.
Which brings me to the main reason why I'm writing this mail. It moves
things away from Nick's "prevent problems from hitting mainline" and
into the department of "mistakes happen, deal with them".

I wonder if we should encourage maintainers more to fast-track fixes for
problems that bother CI systems or many testers, as those otherwise are
unable to do what they want to do: test things. That seems
counterproductive to me; furthermore, it makes multiple people
encounter, debug, and report problems again and again, which is wasting
resources (see [1] for an example).

But fast-tracking fixes (e.g. either Linus picking up patches straight
from the list, maintainers sending them to Linus after they passed
subsystem internal testing, or maintainers sending them after the fix
hit -next and nobody complained within 24h) obviously is exactly the
opposite of "a few next cycles". :-/ Nevertheless I think it would be
the right thing to do more often in cases where things already went wrong.

Ciao, Thorsten

[1] Take the recent bpf w/o cgroup build failure for example, a quick
search found these reports:

https://lore.kernel.org/all/202308271707.4mUjMXwL-lkp@intel.com/
https://lore.kernel.org/all/20231020132749.1398012-1-arnd@kernel.org/
https://lore.kernel.org/all/202310260528.aHWgVFqq-lkp@intel.com/
https://lore.kernel.org/all/69ab206d701874dd5ac39c45ef27affe1a67517a.camel@redhat.com/
https://lore.kernel.org/all/bf2add1f-a9e4-46ac-b1ac-5b6ad9f0ed86@roeck-us.net/
https://lore.kernel.org/all/202310310055.RDWloNPr-lkp@intel.com/
https://lore.kernel.org/all/20231031-bpf-compil-err-css-v1-1-e2244c637835@kernel.org/
https://lore.kernel.org/all/ZUNiwMLBsL52X9wa@debian/

The fix was committed on Wednesday, but is not yet mainlined, so more
people might still run into and report this (FWIW, the last link above
is from a report from Thursday). That's why I think

Ciao, Thorsten
