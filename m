Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C214A60F;
	Mon,  1 Jun 2026 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314738; cv=none; b=fLE7SEf+Zy0gATztx+0DK9dXYAnOzjJdRDrFZQh9A8ymLfLat53jtOoomRekhDOuRvcUK2PTfPuvuIGkZUgOyJ0JusFRsKb72xkIM8cEhgZpTWwbtedRJhh0pGWKrx8f89/KlD7JA3jng10SWwZZPoUGg8c98uGqnoyG4I41fts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314738; c=relaxed/simple;
	bh=UMHgVcNco5iJH8XhMFY8AbFvSxjkaarGOUuxfvK2AJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bPP8ZQc+81kqzD9crzLY11STzpSAo/yICPWDTI+o6pjn8kkMaRroSIScs5AFCbeGtq+GukQiawLqSSbyV8s2334BtnfHYAkWxvfzFEwiGS/bV5ywNzeXUZDCMpaCZnxWmYlSbHDqboCvJ0WnVXyKbtIOrnMhbfoZ92Tse5sqGyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkzLhhQN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkzLhhQN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA361F00893;
	Mon,  1 Jun 2026 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780314737;
	bh=uAqI8V8BwYx0K8lEnRpUN9xzhYsWnniiljD6fuX/n+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZkzLhhQNs3Owop3abUEvzsKOXHOg6ohqExZIyUzxQh6gI/qBV42TSp1Di9WYX3dmg
	 LlUq9GDF2b4DW45BnbTqnHj5cMk6XwkZC2uZx1k5/C+CeMOqoTUuIZskHCZSF3zFaA
	 Hrtgf6XhbKjaytGSp+v1ltYsfLKl0ff574i2jdTamJkb5ii3HbijF+KrY6BW0oSsQT
	 zKVOf8lXhCPnC9yocgRx6g/oaIwMay90rlT4gjX/ndBh5LzW0B07oJL/Ikh1aKh5BW
	 /Rgmqrjdg1U6LTRk5kAWI9Bj+S+2wPZm36F7hDadZFff/HxTXskitc6OTwqHkeSXMR
	 vqeieUkSsMZlw==
From: Pratyush Yadav <pratyush@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Pratyush Yadav (Google)" <pratyush@kernel.org>,  llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,
  kexec@lists.infradead.org
Subject: Re: [liveupdate:next 11/21] kernel/liveupdate/luo_session.c:344:48:
 error: too few arguments provided to function-like macro invocation
In-Reply-To: <202606011344.RHiYuqso-lkp@intel.com> (kernel test robot's
	message of "Mon, 01 Jun 2026 13:25:29 +0800")
References: <202606011344.RHiYuqso-lkp@intel.com>
Date: Mon, 01 Jun 2026 13:52:14 +0200
Message-ID: <2vxzik82h40h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 01 2026, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git next
> head:   f4b4f5fe58a55a4212a263d9d44416778ca6e7a7
> commit: 74cab0be9a5d9d91471c4dee7311dcdfc1c0a6f4 [11/21] liveupdate: validate session type before performing operation
> config: x86_64-buildonly-randconfig-003-20260601 (https://download.01.org/0day-ci/archive/20260601/202606011344.RHiYuqso-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011344.RHiYuqso-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606011344.RHiYuqso-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>>> kernel/liveupdate/luo_session.c:344:48: error: too few arguments provided to function-like macro invocation
>      344 |                  struct liveupdate_session_retrieve_fd, token),
>          |                                                              ^
>    kernel/liveupdate/luo_session.c:327:9: note: macro 'IOCTL_OP' defined here
>      327 | #define IOCTL_OP(_ioctl, _fn, _struct, _last, _type)                           \
>          |         ^
>>> kernel/liveupdate/luo_session.c:343:2: error: use of undeclared identifier 'IOCTL_OP'
>      343 |         IOCTL_OP(LIVEUPDATE_SESSION_RETRIEVE_FD, luo_session_retrieve_fd,
>          |         ^
>>> kernel/liveupdate/luo_session.c:378:6: error: invalid application of 'sizeof' to an incomplete type 'const struct luo_ioctl_op[]'
>      378 |             ARRAY_SIZE(luo_session_ioctl_ops)) {
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                ^~~~~
>    3 errors generated.

This happens because the patch got moved from the fixes branch to next,
and next has a new ioctl. Will send a fixup soon.

[...]

-- 
Regards,
Pratyush Yadav
