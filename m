Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25332DEA68;
	Thu,  4 Dec 2025 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764848837; cv=none; b=fkS+dlYtVSO0UIlqt2VfOtqhT7bFWihe3zd9EhH+/SE6AoqsPNdc4H0cw0BAlTbIvXT01hP9EWfrE/811htY0hcZVsbqsBSW3sLlMrbftYnq94r+TYSvE6iDIv/HOpTZZws51OCpsskSkHxR5wl/imPy8zjvqWUB+yXrhIP5WOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764848837; c=relaxed/simple;
	bh=RU/WFzv9G/hmGUffdDyIy3D1oRokOdlnN0/YJZWY0Lc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PKPUnlE1KdK6g56qSLjREeI5kkIVdkk7fFl+B+rN9e0GNmrtjxbZ1xbHIFLEFQ6Df78vaUsTpiI+80CWA5/OGzVC86qQWxUwZ+nvCr1ninln+46ioM+oKpd/Fg5I1WCPyUdmCPs7iwzp0CYZgtpx/SAnsg/R1u7xc9yjZqpGj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cW6S/WPI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cW6S/WPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02CEC4CEFB;
	Thu,  4 Dec 2025 11:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764848836;
	bh=RU/WFzv9G/hmGUffdDyIy3D1oRokOdlnN0/YJZWY0Lc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cW6S/WPIlZTF4qxRNQl5qWXtKIO8nYmhD6pjw6lyyPOTXWOECt1q1zZXKK2ncANCo
	 3YMJ5ciA0xASVWigP0NDgbR34kTVZe5oy66SxzRba5X0+OA4XOY/NAdLSA7hz8+7Tl
	 FMcsxDdr+5qsyGeRq9oTEtMlL72i9/J3JW/2MLCbyRFpxEKtn27ttEPOorhrYRIuc+
	 cggSFWx1L3zG8GY0rOPETLrZiRemuCSxBAC4T/siIPxUSNxBZAOaecJTstyg2r3zjE
	 lC9d1ifWaMOrznCRRAZplGk+iHD0TCZAlODKp2pBZWj3rY+lvZuwMuohx0Ek+tGpIP
	 8uVcpspfcAAsg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>, Daniel Gomez <da.gomez@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Benno Lossin <lossin@kernel.org>,
 oliver.sang@intel.com
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
In-Reply-To: <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
References: <202512020454.Tf36WHw5-lkp@intel.com>
 <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020>
Date: Thu, 04 Dec 2025 12:47:05 +0100
Message-ID: <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Oliver,

"Oliver Sang" <oliver.sang@intel.com> writes:

> hi, Daniel Gomez,
>
> On Tue, Dec 02, 2025 at 10:02:02PM +0100, Daniel Gomez wrote:
>>
>>
>> On 01/12/2025 21.20, kernel test robot wrote:
>> > Hi Andreas,
>> >
>> > FYI, the error/warning still remains.
>> >
>> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> > head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
>> > commit: 0b08fc292842a13aa496413b48c1efb83573b8c6 [4752/13171] rust: introduce module_param module
>> > config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/config)
>> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
>> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/reproduce)
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512020454.Tf36WHw5-lkp@intel.com/
>> >
>> > All errors (new ones prefixed by >>):
>> >
>> >>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::kernel_param`
>> >    --> rust/kernel/module_param.rs:78:46
>> >    |
>> >    78 |         let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
>> >    |                                              ^^^^^^^^^^^^^^^^ unknown field
>> >    |
>> >    = note: available field is: `_address`
>> >
>>
>> I can't replicate this issue either.
>>
>> I've added these patches to fix other unrelated build issues, so, I'm not sure
>> how 0day ended up skipping them? Perhaps it uses head 95cb2fd6c? + bisect?
>>
>> a74b6c0e53a6d um: Don't rename vmap to kernel_vmap
>> f74cf399e02e2 rust: debugfs: Replace the usage of Rust native atomics
>> 013f912eb5fa7 rust: sync: atomic: Implement Debug for Atomic<Debug>
>> 14e9a18b07ec4 rust: sync: atomic: Make Atomic*Ops pub(crate)
>>
>> My testing branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git/log/?h=20251202-0day-test-0b08fc292842-with-fixes
>>
>> FWIW, this is what I've tried:
>>
>> rustc --version --verbose
>> rustc 1.88.0 (6b00bc388 2025-06-23)
>> binary: rustc
>> commit-hash: 6b00bc3880198600130e1cf62b8f8a93494488cc
>> commit-date: 2025-06-23
>> host: x86_64-unknown-linux-gnu
>> release: 1.88.0
>> LLVM version: 20.1.5
>>
>> bindgen --version --verbose
>> bindgen 0.72.1
>
> sorry for false positive. we confirmed this is an issue caused by a bug in
> bindgen - https://github.com/rust-lang/rust-bindgen/issues/3264
>
> we used 0.72.0 when saw the issues. now we upgraded to 0.72.1 as you used, now
> issue disappears.

Thanks for confirming!

While we could see from the config that you were using bindgen 0.72.0,
it was not clear to us where you get this bindgen from. Obtaining
bindgen does not seem to be part of the reproducer instructions (or
maybe I am not looking in the right place?).

If I understand correctly, this issue manifested only when building
bindgen 0.72.0 with clang-22-git. Building this was next on our list in
trying to reproduce, but getting to that conclusion took a while.

Anyway, I want to ask if you can include directions for obtaining or
building bindgen in your reproducer instructions?

Best regards,
Andreas Hindborg

