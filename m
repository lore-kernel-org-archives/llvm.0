Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204510E4;
	Tue,  2 May 2023 11:58:11 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ptodz-00072b-Gd; Tue, 02 May 2023 13:58:07 +0200
Message-ID: <b61b60cb-0e8e-0a27-5f7b-71e7639e02f6@leemhuis.info>
Date: Tue, 2 May 2023 13:58:06 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
Content-Language: en-US, de-DE
To: Shreeya Patel <shreeya.patel@collabora.com>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Michal Marek <michal.lkml@markovi.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <llvm@lists.linux.dev>, Bill Wendling <morbo@google.com>,
 Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev,
 kernelci@lists.linux.dev,
 "gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>,
 Guillaume Charles Tucker <guillaume.tucker@collabora.com>,
 ricardo.canuelo@collabora.com, denys.f@collabora.com
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
 <20220919170828.3718437-1-ndesaulniers@google.com>
 <597ef55f-e7c1-ab60-b4aa-0071ff4b5e0e@collabora.com>
 <325ae81d-b3a5-71b3-39e9-96408968ab0b@leemhuis.info>
 <1209349b-9634-c1ca-d2ee-182e8dec2de5@collabora.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <1209349b-9634-c1ca-d2ee-182e8dec2de5@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683028691;b202daa3;
X-HE-SMSGID: 1ptodz-00072b-Gd

On 02.05.23 11:48, Shreeya Patel wrote:
> On 28/04/23 13:11, Thorsten Leemhuis wrote:
>> On 27.04.23 13:53, Shreeya Patel wrote:
>>> On 19/09/22 22:38, Nick Desaulniers wrote:
>>>> cc-ifversion is GCC specific. Replace it with compiler specific
>>>> variants. Update the users of cc-ifversion to use these new macros.
>>>>
>>>> Link: https://github.com/ClangBuiltLinux/linux/issues/350
>>>> Link:
>>>> https://lore.kernel.org/llvm/CAGG=3QWSAUakO42kubrCap8fp-gm1ERJJAYXTnP1iHk_wrH=BQ@mail.gmail.com/
>>>> Suggested-by: Bill Wendling <morbo@google.com>
>>>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>>>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>>> KernelCI found this patch causes a regression in the
>>> baseline.logintest on qemu_arm-virt-gicv3-uefi [1],
>>> see the bisection report for more details [2].
>>>
>>> Let me know if you have any questions.
>>>
>>> [1] https://linux.kernelci.org/test/case/id/644596a0beca2ead032e8669/
>>> [2] https://groups.io/g/kernelci-results/message/40804> [...]
>>> #regzbot introduced: 88b61e3bff93
>> How much of this text is auto generated? I ask for two reasons:
> 
> None of this text is auto generated yet but we plan to do it soon once
> we think the format of the reporting email is good enough for people to
> understand
> and look into it. Which is why your comments are really helpful here.

Thx, glad to hear that. FWIW and YMMV, but I'm not sure if fully
automating things is a good idea, as a bad report or two might be enough
to make some developers start ignoring kernelci reports; a quick human
review with small adjustments might help prevent that, as it's hard to
get that ship turned around later (that's why regzbot up to this day
doesn't send any mails automatically).

>> * You made regzbot track this, which is great, but didn't specify a
>> title. That is fine in general, if the subject round about says what the
>> regression is about. But in this case it doesn't; hence it would be
>> great if you in the future could specify one through "#regzbot title:"
>> or adjust the mail's subject (I guess the former is what developers will
>> prefer).
> 
> Noted. If I think the title is not very explanatory then I'll change it
> to reflect the problem in future.

Many thx!

> [...]
> 
> I understand that it might be more helpful to atleast put little more
> information about what is causing the regression here.
> I'll provide some more details in future for it to be easy for
> developers to look into it.

Yeah, especially a obvious "what's the actual problem (in 10 words or
less)" afaics would have been really good here.

>> To check if those were old or new problems, I tired to go back in the
>> history and on page 9 found an entry for the last succeeding test. But
>> clicking on the logs got me a 404 :-/
>>
>> Then I looked at the logs on [1] again and in the html view "Boot
>> result: FAIL". Is that the actual problem?
> 
> Unfortunately, we do have some broken links in the current KernelCI
> dashboard [...]

Happens :-D

> What I can do from my side is to attach logs of the working kernel if I
> can get them through LAVA.
> But one thing to note is that even LAVA stores limited logs and we won't
> be able to provide them always like in this case
> since the regression has been happening from a long time.

Before going down that route I'd work out with Nick why things work for
him, maybe all that isn't needed.

> Thanks for your input though, we will work on it and get a better format
> ready for reporting the regressions.

Thx for your work!

Ciao, Thorsten
