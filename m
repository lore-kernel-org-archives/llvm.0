Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C33334C0B;
	Thu,  4 Dec 2025 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849545; cv=none; b=BU30tBUwwD8wk92ZPLERP2s+MK/gc19+szTjikfiZzkbprJITYIntfUw6hBDpJswu43CJRyfjKEN/wdWcNyFpcuLF9KBi2c43lb7XY2czEUR/Xi3/b7kIdfQQQyJvkdZ+DOpt5Op2KP8BSByOf5vPXkIlUTUUZCcLS/EKVPY6jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849545; c=relaxed/simple;
	bh=Dd/ZFEPGIKQwUgWEhpisD8jjKkyeAWkoX23AKXJOfn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDbmpa1f4NAra+Epg3qUUZREkb9oiwuaEhmxbHLrPQ8BttE/fbvDw6XKu/Tel+ovuZhQQxHTsM+hSI7rQ2yipWqdOvqzn9Kbc9BuENGM/E9/BzjCplP/yXhVYx4Y2g+Y2pFRuMwgQ1SdqzLcsBGcqA/I9Um2yrgQosdUAfCqcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTFsxkpn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTFsxkpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E44C4CEFB;
	Thu,  4 Dec 2025 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764849544;
	bh=Dd/ZFEPGIKQwUgWEhpisD8jjKkyeAWkoX23AKXJOfn4=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lTFsxkpnsEJ8rY8O07zCLjLF68zfXNnDzclvwXrFmmvv8tXHMmKYu1i6tt8zlV9MO
	 3pu5rrubTk/DuV/0qbUmVPHyp3tuhjrk8la/cOUuoesq8QvJQ+3gCv3OxQCd3e9z7m
	 e+am4Z5wwaX+9xksrCVMoFWwLmPRJQLJKWkka/yJ5sheifvTcoLyGM7K/eCnDlwj6X
	 cAMaDJCrpGSW+Eq5GJZDiXHXf65uOC94uLcqvb30FXZRzxEN/r8z82SYdiTZdNH/4l
	 X4uNJ2fhduCOW1EgCyc+qxHhW5lkSIYcZvJOk7yiMAZ7BtFRjrbYZtY/L00GZC3PA9
	 9texjoakTk2+g==
Message-ID: <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
Date: Thu, 4 Dec 2025 12:59:02 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
To: Andreas Hindborg <a.hindborg@kernel.org>,
 Oliver Sang <oliver.sang@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Benno Lossin <lossin@kernel.org>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
 <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/12/2025 12.47, Andreas Hindborg wrote:
> Hi Oliver,
> 
> "Oliver Sang" <oliver.sang@intel.com> writes:
> 
>> hi, Daniel Gomez,
>>
>> On Tue, Dec 02, 2025 at 10:02:02PM +0100, Daniel Gomez wrote:
>>>
>>>
>>> On 01/12/2025 21.20, kernel test robot wrote:
>>>> Hi Andreas,
>>>>
>>>> FYI, the error/warning still remains.
>>>>
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>> head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
>>>> commit: 0b08fc292842a13aa496413b48c1efb83573b8c6 [4752/13171] rust: introduce module_param module
>>>> config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/config)
>>>> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
>>>> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202512020454.Tf36WHw5-lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::kernel_param`
>>>>    --> rust/kernel/module_param.rs:78:46
>>>>    |
>>>>    78 |         let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
>>>>    |                                              ^^^^^^^^^^^^^^^^ unknown field
>>>>    |
>>>>    = note: available field is: `_address`
>>>>
>>>
>>> I can't replicate this issue either.
>>>
>>> I've added these patches to fix other unrelated build issues, so, I'm not sure
>>> how 0day ended up skipping them? Perhaps it uses head 95cb2fd6c? + bisect?
>>>
>>> a74b6c0e53a6d um: Don't rename vmap to kernel_vmap
>>> f74cf399e02e2 rust: debugfs: Replace the usage of Rust native atomics
>>> 013f912eb5fa7 rust: sync: atomic: Implement Debug for Atomic<Debug>
>>> 14e9a18b07ec4 rust: sync: atomic: Make Atomic*Ops pub(crate)
>>>
>>> My testing branch:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git/log/?h=20251202-0day-test-0b08fc292842-with-fixes
>>>
>>> FWIW, this is what I've tried:
>>>
>>> rustc --version --verbose
>>> rustc 1.88.0 (6b00bc388 2025-06-23)
>>> binary: rustc
>>> commit-hash: 6b00bc3880198600130e1cf62b8f8a93494488cc
>>> commit-date: 2025-06-23
>>> host: x86_64-unknown-linux-gnu
>>> release: 1.88.0
>>> LLVM version: 20.1.5
>>>
>>> bindgen --version --verbose
>>> bindgen 0.72.1
>>
>> sorry for false positive. we confirmed this is an issue caused by a bug in
>> bindgen - https://github.com/rust-lang/rust-bindgen/issues/3264
>>
>> we used 0.72.0 when saw the issues. now we upgraded to 0.72.1 as you used, now
>> issue disappears.
> 
> Thanks for confirming!

Thanks Oliver!

> 
> While we could see from the config that you were using bindgen 0.72.0,
> it was not clear to us where you get this bindgen from. Obtaining
> bindgen does not seem to be part of the reproducer instructions (or
> maybe I am not looking in the right place?).
> 
> If I understand correctly, this issue manifested only when building
> bindgen 0.72.0 with clang-22-git. Building this was next on our list in
> trying to reproduce, but getting to that conclusion took a while.
> 
> Anyway, I want to ask if you can include directions for obtaining or
> building bindgen in your reproducer instructions?

+ Any reason to use an unreleased clang version for this reports? Since clang-22
is not officially released yet, issues seen with it seem lower priority than
those reproduced with stable, released versions. Does it make sense to act
on these kind of "bleeding edge" reports, or should we wait until they're
confirmed on a stable release? Does 0day test both?

> 
> Best regards,
> Andreas Hindborg
> 
