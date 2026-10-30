Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793335378;
	b=kdEy2TytgBqLdi9zvkLX2QLNYMBGjJqe+Z1eHq7JMxqds6SQHT+JXiW/bzfDpFzq6ZV7
	 SfQIzknZfsvYY0NOvPnoIzQBwFFLs0T1qIWb60GS3mrwIs8gETIqmaaMISJrV2FEBNd8D
	 4l/b9t4Fy8vFa/zl78iY26IzgmCVV7hSlYDwLsu8sRr22++EggQYwd8HHpaRd4e4JSCpz
	 4upD7M/sjh+qhP6sjD0R3R1+od8iAky/SKT0l4hZDOqpSaAYwpxlFdoS+s4o4zKq8wUzS
	 Kbww76EqK9YrO8s9ZCc1MCydwpHiqOUjVnqpkKErWwtCFnc/anGf4sAEpKbO1S+cXEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793335378;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PiRijM27VfJZ6A9yzPvi6A5MclwQnlmk9KlfZ3cemEQ=;
	b=MYXbPTIiga04sskGHa1TjoG6q046POixtn5NS6eI7Ok2oFy3N7MTocq+mVL2gknZQlIX
	 z/AkVCZc8nCuNO2AykJVd45aaZSivwyCSP/Q++7F+AND6i1DLI/5Jv5VUQd/RgcHA5U1J
	 VeGpBY1RqZUXs8ap2l3ISmaq6pVVaQNz7BQbAp7wFvKLEv2LxWeDMozlt5/qrXZFnE6Xj
	 lXK02BKNIPqqTPnrPr2/RlDGvFC0tJbYOWu0wTE/Me29W+rjpu9/Bvufr1bnjkW0OQYj0
	 6+RerXYjv3gXwFVie704TEUs4XzY8Z7pTACHYauR4tgvSkiEYhuLl9wa6HrKQWFuUcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HN3is2pn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03794606A31F;
	Fri, 30 Oct 2026 04:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HN3is2pn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A0E1F000C1;
	Fri, 30 Oct 2026 04:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793335377;
	bh=PiRijM27VfJZ6A9yzPvi6A5MclwQnlmk9KlfZ3cemEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HN3is2pnAx/TSp7pLJ43rvMpVxiOGpUalEPutDA2v5hmXjtjUNGmd4P9cmBySYc2c
	 io8BT7cPyd/JRFQ5xg7x7Vt9da+weU4jzeUXh7bZA7oyDE1aI4Znz09IuP/DocjXYt
	 WTuOYf2Y/NgKAgYZec2m3QS2+Yn569/ZlTOgu8C/yGRijfQYhtPCnZGHvMEP9s3n/n
	 cMuzj1rmNyguZPSAR2GCb9okTATpvEuZY6VyRGVEBLSsdr/coFfmz3lchKLVpBpHPi
	 nUVhmVhfYsS9BaWfLEAcRMALKyufXaacMpXe/U8DYHi1bwhdl22tg+R9e3b/a2gpuY
	 jE7/C5xqX3c3A==
Date: Thu, 29 Oct 2026 21:42:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: vmlinux.o: warning: objtool: mtk_timer_probe+0x23: no-cfi
 indirect call!
Message-ID: <20261030044253.GA2699480@ax162>
References: <202610290223.iOEGeDs2-lkp@intel.com>
 <20261028202400.GA835963@ax162>
 <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAORyz2KEJ5M86-+z2zWXVTJwbNO8SY4DWjn5Y6EO_-nPhdiytw@mail.gmail.com>

On Thu, Oct 29, 2026 at 07:54:10PM +0100, Luca Leonardo Scorcia wrote:
> Being a new contributor I'm not quite sure what the process is now -
> should I send out a patch with the correction, just as I did for the
> initial contribution? Or is it going to be fixed by the maintainers
> autonomously? (Obviously adding a Suggested-by tag with the rest of
> the bots' tags).

Since the patch is already in Linus's tree, you'll need to send a follow
up fix. Not only is it good practice for learning how to follow up on
issues/feedback on your patches, it will help build trust with
maintainers in case you submit other patches in the future because you
have already shown you are willing to take ownership of them. It is
generally better to send a patch if you are able than relying on a
maintainer to handle it, not only because they don't typically have the
bandwidth but because you will get full credit for the fix.

Thanks for taking care of this!

-- 
Cheers,
Nathan
