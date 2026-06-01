Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750983546D9;
	Mon,  1 Jun 2026 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315043; cv=none; b=ehiFpOMx24Sxg9qGm6PZ1ozJVW57zpi3jXk7JT73X4GlvdNqZaJwDzkNCAs54PCdbM2oeQNCyGH3pUXWLPktCMnq8z6QV+zWm92kFfRPB/KgGKQg2ztOY2fi4vGEXAZ48gG7kV9tz0z+lszq5l6CSbcDG8E+klRQd4oNJUNQXss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315043; c=relaxed/simple;
	bh=jNmqwEn9pTW2WdbjpzNI+DGuzHrO/iaeezpsQRjQw6k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pzWyKHJ7R1zT2vzRtyD882g7oD57IyyTIcvcwQbG1fRL1XrZyjTFUjMZwniJ+V8XATcW2dsdyBLnMdV8lxG7naQQgFDxX5OJS0lbKc0lgOATQvTKJ5/6783dgoDt2sg7F8ty81uZ9C92xzsZhlkWGJ5rX5ntUifNGkVNXy8IOHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIJ8q+0j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIJ8q+0j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E984C1F00893;
	Mon,  1 Jun 2026 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780315042;
	bh=ZqshBP3Sq/jYOyu/A3YXiy/4PR+JxcIb9KcTizCSvhc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=iIJ8q+0jBaXTH3Rjf0bhlN2blL42ohXlps2PTOj1oV9nD6TwYL38JZ45Yh76+WDkY
	 q2xs0z/kp0DEhmBjmrROvRVYL6ornzYhcBOmmCVzyotlF6x4mrMvaZb3oFQzpvdix3
	 Y+6eFBl2FZ/2OY1u++XGcrkp88JvnJ7UrBW2glmDZZLyJeM0SaYto/LCGiLlhHjodj
	 ouuuMx6+QMC8puKRh4zPFtYUy/vKp+gCXkwSELK9vckK2OXzOB51wbbJNeKWL1Bj8l
	 S0UiQ2dgbJtyMxaSDbi55DLpAunluCl92ncu2LOXB/fOCVQgYesVBqulWvNCALLAX4
	 raeBj+6vTA3Sw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kernel test robot <lkp@intel.com>,  llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,
  kexec@lists.infradead.org
Subject: Re: [liveupdate:next 11/21] kernel/liveupdate/luo_session.c:344:48:
 error: too few arguments provided to function-like macro invocation
In-Reply-To: <2vxzik82h40h.fsf@kernel.org> (Pratyush Yadav's message of "Mon,
	01 Jun 2026 13:52:14 +0200")
References: <202606011344.RHiYuqso-lkp@intel.com>
	<2vxzik82h40h.fsf@kernel.org>
Date: Mon, 01 Jun 2026 13:57:19 +0200
Message-ID: <2vxzcxyah3s0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 01 2026, Pratyush Yadav wrote:

> On Mon, Jun 01 2026, kernel test robot wrote:
>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git next
>> head:   f4b4f5fe58a55a4212a263d9d44416778ca6e7a7
>> commit: 74cab0be9a5d9d91471c4dee7311dcdfc1c0a6f4 [11/21] liveupdate: validate session type before performing operation
>> config: x86_64-buildonly-randconfig-003-20260601 (https://download.01.org/0day-ci/archive/20260601/202606011344.RHiYuqso-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011344.RHiYuqso-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202606011344.RHiYuqso-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> kernel/liveupdate/luo_session.c:344:48: error: too few arguments provided to function-like macro invocation
>>      344 |                  struct liveupdate_session_retrieve_fd, token),
>>          |                                                              ^
>>    kernel/liveupdate/luo_session.c:327:9: note: macro 'IOCTL_OP' defined here
>>      327 | #define IOCTL_OP(_ioctl, _fn, _struct, _last, _type)                           \
>>          |         ^
>>>> kernel/liveupdate/luo_session.c:343:2: error: use of undeclared identifier 'IOCTL_OP'
>>      343 |         IOCTL_OP(LIVEUPDATE_SESSION_RETRIEVE_FD, luo_session_retrieve_fd,
>>          |         ^
>>>> kernel/liveupdate/luo_session.c:378:6: error: invalid application of 'sizeof' to an incomplete type 'const struct luo_ioctl_op[]'
>>      378 |             ARRAY_SIZE(luo_session_ioctl_ops)) {
>>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
>>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>>          |                                ^~~~~
>>    3 errors generated.
>
> This happens because the patch got moved from the fixes branch to next,
> and next has a new ioctl. Will send a fixup soon.

Nevermind. Seems like this is already fixed (thanks to Mike I think?).

-- 
Regards,
Pratyush Yadav
