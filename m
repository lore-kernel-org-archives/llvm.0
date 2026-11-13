Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530736;
	b=HJos7re1JPWh6rLBTbZn1JVOXlegdugNxVZSS2XTxK+Xw1utPXRVksZdeRNuTjOlkYx7
	 kEONVkhEPPwU7JRcqxXvsxrMS+WA32ybwH7TgZEH6fpHwbX6X154FP2Nd0I8SoQTG6qN/
	 fOrtaU8ZyELX9SAj5urS8FLW8DVHky1wTdmzH3jOaRjhr51ik6+f3xpfkFH+uaXU/bYu8
	 9IyBiN0eobIE0cGMaV2jb4mpxe9d9L5epOSbdTLy2Ys8DA21oNKker4U2Nh1YRJIQrRpd
	 zZnVHOSSSP4qTgZxsGVOG6D/CK84whdDLjI7e+2p7/6x1CUd8FBjOWe1JFu/5jUlpcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530736;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=byQFz16WVUl5yiVMUGC0Lc1lZ6xNCBWBcgXPenWtDkE=;
	b=oTbGXLgnlEvOyicKMGzgrEXfOTLhKSsoMfwPsxZGJLyFwG2zqfzeP6nfl3KqzGOjPTOJ
	 ZYw+cWop04dXjSglkE+1i6kYAj8VhUxbEVsGv8uMigh/CsiNnNyhY3tcHcEMEWBikV/bb
	 69cglV2nzoOEa9lX+ZvM0ZsN6aydFZjbgLl239Yo6ElXNKtJkzL+RkZ6Zwe1Fuv4UtdEF
	 07bylvXFw6/NibCFFYA6uv6Xo1qEdD8EOG3Rm1gUmasXDuvLk0i9DtYatr5kVIxyZBsl+
	 sJ2zxwGxWDqX08IzgtPsZirGHzTky691pJoSfzG95Us3qpPy9hxW81r8eBMxbYO0kug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=be8MKGWW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EF1606A31C;
	Fri, 13 Nov 2026 00:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=be8MKGWW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029F81F000C4;
	Fri, 13 Nov 2026 00:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794530736;
	bh=byQFz16WVUl5yiVMUGC0Lc1lZ6xNCBWBcgXPenWtDkE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=be8MKGWWy9NEcQSfVFN/w7WK64dx/QSUMBjDHw1XimQV5qPHdvb4Q4uBo4yihdYB3
	 GUL5wP2AJHJO8KOO7RCwF+z0KOuhQfT/mjxzS4g6WqeycEYqnWBHRCjbYaAUHDEnW6
	 7CgWu80Qo3pA0+OpesC9pCC31HN0pTJhcxu0/su82wk1FJ+6DVKSssdjxydMj1oSy3
	 TYQJK9mkv2AAw+wK7jxi7AX6ADdRlmoD6G1rUbJ7dueKRpgB1pbqzn8qzZiaDDa978
	 lCJ4KOmPHpjB6dx/6z5vR7c2RkM6DjWSEEoEzpjZiyVE+NTNdIk89GesZImW0EY4fF
	 FeraAxq78f5FA==
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 01/20] coverage: move gcov and kcov under
 kernel/coverage/
From: Nathan Chancellor <nathan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Ben Segall <bsegall@google.com>, 
 Bill Wendling <morbo@google.com>, Chuck Wolber <chuck@wolber.net>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>, 
 Juri Lelli <juri.lelli@redhat.com>, Justin Stitt <justinstitt@google.com>, 
 kasan-dev@googlegroups.com, K Prateek Nayak <kprateek.nayak@amd.com>, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
 Marco Elver <elver@google.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Thomas Gleixner <tglx@kernel.org>, Valentin Schneider <vschneid@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>
In-Reply-To: <20261103015238.3780910-2-sashal@kernel.org>
References: <20261103015238.3780910-1-sashal@kernel.org>
 <20261103015238.3780910-2-sashal@kernel.org>
Date: Thu, 12 Nov 2026 17:45:18 -0700
Message-Id: <179453071828.814257.6686638707569844626.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=500; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZzcvWpryBOjS2P/e/kVW3juN01KPNSSyJL9+psGkVmw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnfYpdaHl/2+mxZ6PYgi7Vx6iEvb4S77Nw13fzE8wKmq
 009c6a4dpSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJMMxjZOh0ns/+1uaXz4S2
 WXZLi2tf+knsn9CbxV3JsYz5uZm/jgYjw4yye/1Wmgk/f1u+iJn53n5P2tG6Ba7OsvYJS+vP1l8
 /xwsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Mon, 02 Nov 2026 20:52:19 -0500, Sasha Levin <sashal@kernel.org> wrote:
> The kernel carries more than one code coverage implementation, each
> with its own directory, Kconfig menu, build plumbing and debugfs
> interface. Start consolidating them by moving the existing
> implementations next to each other:
> 
>   kernel/gcov/  -> kernel/coverage/gcov/
>   kernel/kcov.c -> kernel/coverage/kcov.c
> 
> [...]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

