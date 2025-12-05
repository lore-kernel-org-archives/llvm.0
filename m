Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0B314B94;
	Fri,  5 Dec 2025 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931414; cv=none; b=Hvhf3hBVqO9qcN36RzjuiaJJzf7s7pnOAczr9SdWmxZy8B2AbYxlMLq6x0Y2/CNRzh3rGU3xZvxcz0uhk+aG0NIA3k1pmTY4lnR2XIkWiyq+oPv9IRztd0z+la8Zfr+m+CJes+6iMCjO2ejVe2uEcg2Am2IoCWIHQcXf8Uco15c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931414; c=relaxed/simple;
	bh=+hg8bBBecEhPSH6e6ao4YrpMhbUMTAcKd45O1DQZdgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LaygNpjuBrXffKOqB4by3FQT2WnI4k3Oc8lzYKHDcoRbYPsOq65tKhDl8znvLMgEGBBh02B3BhyZjo8dKY2yXSaerRZbty9oUwn1xZzjgrcSMi51gm1btmHRabp2vHXOt83bcuDnDBpA+NfV84wKH1T75H8USvdwsRYqTLxeE1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7VMu9Ur; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7VMu9Ur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B524C4CEF1;
	Fri,  5 Dec 2025 10:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764931412;
	bh=+hg8bBBecEhPSH6e6ao4YrpMhbUMTAcKd45O1DQZdgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=t7VMu9UrUqEAdr3zFCJy357yNQyiEy10K4swo4WmCileB72Cc4/6SURKIslYfJbTX
	 aKh626xNRLc+/z5dC+8aKwOZnPCy5MF+aFwJQSpc0+bdYvaeS2hAJsR6XrSPAouYd8
	 k8wVc+T2qaL4Ohsl3wZY09+o0mzlX80Z/Ah4vqjGMhHVcJcN9ShW7KpUahfbppc8RF
	 jj2pbVYv+5M8qeV1r+XOxQCa1U7fkD9uZKfKveDYCjN2pGZQwmBo8gChgWfuaMy+BA
	 74W+amIkEauzLbGXfEW744WyzhP4D7k7bWr8tS0+3UVPvxx4N/jkcjd+qhWOy7Tfwe
	 CWiDqPVpMLu9A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Philip Li <philip.li@intel.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, Oliver Sang <oliver.sang@intel.com>,
 kernel
 test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Benno Lossin <lossin@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
In-Reply-To: <aTIuMwbnGHRWrS9X@rli9-mobl>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
 <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
 <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
 <CANiq72mNQDN5cAi9XEo5X48ZNMjDoe3xkAeskFPcSjuhBCXwvg@mail.gmail.com>
 <pSndtrQS0CVdjpKHPwropf0h0SLk9DiwQwWu6pGGj7MEQZpbLkBctjfbcbmdn7tk4IyZWZUE1UgrktBDmJrPHQ==@protonmail.internalid>
 <aTIuMwbnGHRWrS9X@rli9-mobl>
Date: Fri, 05 Dec 2025 11:43:21 +0100
Message-ID: <87cy4tw6nq.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Philip Li" <philip.li@intel.com> writes:

> On Thu, Dec 04, 2025 at 01:24:03PM +0100, Miguel Ojeda wrote:
>> On Thu, Dec 4, 2025 at 12:59=E2=80=AFPM Daniel Gomez <da.gomez@kernel.or=
g> wrote:
>> >
>> > + Any reason to use an unreleased clang version for this reports? Sinc=
e clang-22
>> > is not officially released yet, issues seen with it seem lower priorit=
y than
>> > those reproduced with stable, released versions. Does it make sense to=
 act
>> > on these kind of "bleeding edge" reports, or should we wait until they=
're
>> > confirmed on a stable release? Does 0day test both?
>>
>> Some people in the kernel regularly test with unreleased compilers
>> (all GCC, Clang and Rust) in order to fix issues before those
>> compilers get actually released, e.g. ClangBuiltLinux for LLVM, I do
>> it for `rustc`, several people for GCC, etc.
>>
>> So I guess the idea is similar for kernel test robot? There is value
>> on doing that, and whether one should act depends -- if it is close to
>> the release of the compiler, then it makes sense to try to figure out
>> what is breaking so that the compiler has a chance to fix it.
>> Otherwise, if nobody tries, we would get quite broken compilers (for
>> the kernel use case at least).
>
> thanks, the bot tests multiple versions of compiler for both gcc and clan=
g.
> For clang, low confidence ones will only be sent to llvm mailing list for
> check firstly, and for other issues, we will cc llvm mailing list who also
> monitor this closely and help check in case there's issue in latest compi=
ler.
>
>>
>> It is also why I think having at least a basic kernel build on the
>> upstream CIs of the compilers is a good idea (it already showed value
>> in upstream Rust and perhaps we should talk about it again in LPC for
>> Clang).
>>
>> But, yeah, the reports can be confusing and reacting to them properly
>> does take time and effort (e.g. I need sometimes to bisect the
>> compiler etc.).
>>
>> Does LKP try the bleeding edge versions only if a stable compiler
>> built successfully? That could perhaps help.
>
> For bleeding edge, the bot regularly builds and use latest code now.
>
>>
>> Andreas also suggested yesterday in our meeting to have such bleeding
>> edge reports perhaps more clearly marked or similar.
>
> Probably we can mark rust issue as low confidence when it occurs on non
> released compiler, so it will not be directly sent to developer before it
> is further checked?

Would it be possible to still send the report, but to inject a line to
the report stating it is marked as low confidence due to X and Y
(unreleased compiler etc.)?

I think it is still valuable to get the reports, but it would be nice to
know we don't need to scramble all hands on deck immediately.

I guess one could also just read the report more carefully to learn
that an unreleased compiler was used. But seeing this at a glance would
be great.


Best regards,
Andreas Hindborg


